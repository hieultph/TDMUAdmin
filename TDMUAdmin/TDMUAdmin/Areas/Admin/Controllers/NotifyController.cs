using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TDMUAdmin.Models;

using PagedList;
using PagedList.Mvc;
using System.IO;
using System.Security.Cryptography.X509Certificates;
using System.Web.UI;
using System.Linq.Dynamic;
using System.Linq.Expressions;
using TDMUWebsite.Models;

using System.Dynamic;
using System.Net.Mail;
using System.Net;
using System.Reflection;

using System.Net.Mime;

namespace TDMUAdmin.Areas.Admin.Controllers
{
    public class NotifyController : Controller
    {
        // GET: Notify
        public ActionResult Index(int? page)
        {
            // Check the user has login or not
            if (Session["taikhoan"] == null || Session["taikhoan"].ToString() == "")
            {
                return RedirectToAction("login", "user", new { url = Request.Url.ToString() });
            }

            // Check the level permition
            var acc_log = (TaiKhoan)Session["TaiKhoan"];
            ViewBag.AccessLevel = DataProvider.Instance.DB.QuyenTruyCaps.Where(item => item.ID == acc_log.IDQuyenTruyCap).FirstOrDefault().CapDo;

            int iPageNum = (page ?? 1);
            int iPageSize = 3;

            var lstNotify = (from tb in DataProvider.Instance.DB.ThongBaos
                             join ltb in DataProvider.Instance.DB.LoaiThongBaos on tb.IDLoaiThongBao equals ltb.ID
                             join tbncs in DataProvider.Instance.DB.ThongBao_NguoiChinhSuas on tb.ID equals tbncs.IDThongBao
                             join tk in DataProvider.Instance.DB.TaiKhoans on tbncs.IDNguoiChinhSua equals tk.ID
                             group new { tb, ltb, tbncs, tk } by tb.ID into g
                             select new MyNotify
                             {
                                 ID = g.First().tb.ID,
                                 IDNguoiGui = g.OrderBy(item => item.tbncs.NgayChinhSua).First().tbncs.IDNguoiChinhSua,
                                 TenNguoiGui = g.OrderBy(item => item.tbncs.NgayChinhSua).First().tk.HoTen,
                                 NgayGui = g.Min(item => item.tbncs.NgayChinhSua),
                                 IDNguoiChinhSua = g.OrderByDescending(item => item.tbncs.NgayChinhSua).First().tbncs.IDNguoiChinhSua,
                                 TenNguoiChinhSua = g.OrderByDescending(item => item.tbncs.NgayChinhSua).First().tk.HoTen,
                                 NgayChinhSua = g.Max(item => item.tbncs.NgayChinhSua),
                                 IDLoaiThongBao = g.First().tb.IDLoaiThongBao,
                                 TenLoaiThongBao = g.First().ltb.Ten,
                                 CapDo = g.First().ltb.CapDo,
                                 TieuDe = g.First().tb.TieuDe,
                                 NoiDung = g.First().tb.NoiDung,
                             }).Select(p => p);

            return View(lstNotify.OrderBy(n => n.ID).ToPagedList(iPageNum, iPageSize));
        }

        [HttpGet]
        public ActionResult Create()
        {
            // Check the user has login or not
            if (Session["taikhoan"] == null || Session["taikhoan"].ToString() == "")
            {
                return RedirectToAction("login", "user", new { url = Request.Url.ToString() });
            }

            // Check the level permition
            var acc_log = (TaiKhoan)Session["TaiKhoan"];
            ViewBag.AccessLevel = DataProvider.Instance.DB.QuyenTruyCaps.Where(item => item.ID == acc_log.IDQuyenTruyCap).FirstOrDefault().CapDo;

            ViewBag.MaLTB = new SelectList(DataProvider.Instance.DB.LoaiThongBaos.ToList().OrderBy(item => item.Ten), "ID", "Ten");
            ViewBag.MaKhoa = new SelectList(DataProvider.Instance.DB.Khoas.ToList().OrderBy(item => item.Ten), "ID", "Ten");

            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(FormCollection f)
        {
            var tk = (TaiKhoan)Session["TaiKhoan"];

            var notify = new ThongBao();
            var notify_acc = new ThongBao_NguoiChinhSua();

            if (ModelState.IsValid)
            {
                notify.ID = GenerateNextIDForNotify();
                notify.IDLoaiThongBao = f["MaLTB"];
                notify.TieuDe = f["sTieuDe"];
                notify.NoiDung = f["sNoiDung"];
                notify.GhiChu = f["sGhiChu"];

                DataProvider.Instance.DB.ThongBaos.InsertOnSubmit(notify);
                DataProvider.Instance.DB.SubmitChanges();

                var latestNotify = DataProvider.Instance.DB.ThongBaos.OrderByDescending(a => a.ID).FirstOrDefault();

                if (latestNotify != null)
                {
                    notify_acc.IDThongBao = latestNotify.ID;
                    notify_acc.IDNguoiChinhSua = tk.ID;
                    notify_acc.NgayChinhSua = DateTime.Now;
                    notify_acc.GhiChu = f["sGhiChu"];

                    DataProvider.Instance.DB.ThongBao_NguoiChinhSuas.InsertOnSubmit(notify_acc);
                    DataProvider.Instance.DB.SubmitChanges();

                    var lstReceiver = (from l in DataProvider.Instance.DB.Lops
                                       join nn in DataProvider.Instance.DB.NhomNganhs on l.IDNhomNganh equals nn.ID
                                       join acc in DataProvider.Instance.DB.TaiKhoans on l.ID equals acc.IDLop
                                       where nn.IDKhoa == f["MaKhoa"]
                                       select new
                                       {
                                           IDThongBao = latestNotify.ID,
                                           IDNguoiNhan = acc.ID,
                                           Thu = tk.Email,
                                           NgayNhan = DateTime.Now,
                                           GhiChu = f["sGhiChu"]
                                       }).ToList();

                    var emailList = lstReceiver.Select(x => x.Thu).ToList();

                    //var mail = new SmtpClient("smtp.gmail.com", 587)
                    //{
                    //    Credentials = new NetworkCredential("lehieutester@gmail.com", "vwryaqpxmheigpga"),
                    //    EnableSsl = true
                    //};

                    foreach (var item in lstReceiver)
                    {
                        var notify_rec = new ThongBao_NguoiNhan
                        {
                            ID = GenerateNextIDForNotifyReceiver(),
                            IDThongBao = item.IDThongBao,
                            IDNguoiNhan = item.IDNguoiNhan,
                            NgayNhan = item.NgayNhan,
                            GhiChu = item.GhiChu
                        };
                        DataProvider.Instance.DB.ThongBao_NguoiNhans.InsertOnSubmit(notify_rec);
                        DataProvider.Instance.DB.SubmitChanges();
                    }

                    // Send mail
                    Mail mail = new Mail
                    {
                        From = "lehieutester@gmail.com",
                        To = string.Join(",", emailList), // Join all email addresses
                        Subject = f["sTieuDe"],
                        Notes = f["sNoiDung"]
                    };

                    SendEmail(mail);

                    return RedirectToAction("Index");
                }
            }

            return View();
        }

        [HttpGet]
        public ActionResult Edit (string maTB)
        {
            // Check the user has login or not
            if (Session["taikhoan"] == null || Session["taikhoan"].ToString() == "")
            {
                return RedirectToAction("login", "user", new { url = Request.Url.ToString() });
            }

            // Check the level permition
            var acc_log = (TaiKhoan)Session["TaiKhoan"];
            ViewBag.AccessLevel = DataProvider.Instance.DB.QuyenTruyCaps.Where(item => item.ID == acc_log.IDQuyenTruyCap).FirstOrDefault().CapDo;

            var notify = (from tb in DataProvider.Instance.DB.ThongBaos
                          join ltb in DataProvider.Instance.DB.LoaiThongBaos on tb.IDLoaiThongBao equals ltb.ID
                          join tbncs in DataProvider.Instance.DB.ThongBao_NguoiChinhSuas on tb.ID equals tbncs.IDThongBao
                          join tk in DataProvider.Instance.DB.TaiKhoans on tbncs.IDNguoiChinhSua equals tk.ID
                          where tb.ID == maTB
                          group new { tb, ltb, tbncs, tk } by tb.ID into g
                          select new MyNotify
                          {
                              ID = g.First().tb.ID,
                              IDNguoiGui = g.OrderBy(item => item.tbncs.NgayChinhSua).First().tbncs.IDNguoiChinhSua,
                              TenNguoiGui = g.OrderBy(item => item.tbncs.NgayChinhSua).First().tk.HoTen,
                              NgayGui = g.Min(item => item.tbncs.NgayChinhSua),
                              IDNguoiChinhSua = g.OrderByDescending(item => item.tbncs.NgayChinhSua).First().tbncs.IDNguoiChinhSua,
                              TenNguoiChinhSua = g.OrderByDescending(item => item.tbncs.NgayChinhSua).First().tk.HoTen,
                              NgayChinhSua = g.Max(item => item.tbncs.NgayChinhSua),
                              IDLoaiThongBao = g.First().tb.IDLoaiThongBao,
                              TenLoaiThongBao = g.First().ltb.Ten,
                              CapDo = g.First().ltb.CapDo,
                              TieuDe = g.First().tb.TieuDe,
                              NoiDung = g.First().tb.NoiDung,
                          }).FirstOrDefault();

            if (notify == null)
            {
                Response.StatusCode = 404;
                return null;
            }

            ViewBag.MaLTB = new SelectList(DataProvider.Instance.DB.LoaiThongBaos.ToList().OrderBy(item => item.Ten), "ID", "Ten", notify.IDLoaiThongBao);

            return View(notify);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit (FormCollection f)
        {
            var tk = (TaiKhoan)Session["TaiKhoan"];

            var notify = DataProvider.Instance.DB.ThongBaos.SingleOrDefault(item => item.ID == f["sMaTB"]);
            var notify_acc = new ThongBao_NguoiChinhSua();

            if (ModelState.IsValid)
            {
                notify.IDLoaiThongBao = f["MaLTB"];
                notify.TieuDe = f["sTieuDe"];
                notify.NoiDung = f["sNoiDung"];
                notify.GhiChu = f["sGhiChu"];

                notify_acc.IDThongBao = f["sMaTB"];
                notify_acc.IDNguoiChinhSua = tk.ID;
                notify_acc.NgayChinhSua = DateTime.Now;
                DataProvider.Instance.DB.ThongBao_NguoiChinhSuas.InsertOnSubmit(notify_acc);

                DataProvider.Instance.DB.SubmitChanges();

                return RedirectToAction("Index");
            }

            return View(notify);
        }

        [HttpGet]
        public ActionResult Details (string maTB)
        {
            // Check the user has login or not
            if (Session["taikhoan"] == null || Session["taikhoan"].ToString() == "")
            {
                return RedirectToAction("login", "user", new { url = Request.Url.ToString() });
            }

            // Check the level permition
            var acc_log = (TaiKhoan)Session["TaiKhoan"];
            ViewBag.AccessLevel = DataProvider.Instance.DB.QuyenTruyCaps.Where(item => item.ID == acc_log.IDQuyenTruyCap).FirstOrDefault().CapDo;

            var notify = (from tb in DataProvider.Instance.DB.ThongBaos
                          join ltb in DataProvider.Instance.DB.LoaiThongBaos on tb.IDLoaiThongBao equals ltb.ID
                          join tbncs in DataProvider.Instance.DB.ThongBao_NguoiChinhSuas on tb.ID equals tbncs.IDThongBao
                          join tk in DataProvider.Instance.DB.TaiKhoans on tbncs.IDNguoiChinhSua equals tk.ID
                          where tb.ID == maTB
                          group new { tb, ltb, tbncs, tk } by tb.ID into g
                          select new MyNotify
                          {
                              ID = g.First().tb.ID,
                              IDNguoiGui = g.OrderBy(item => item.tbncs.NgayChinhSua).First().tbncs.IDNguoiChinhSua,
                              TenNguoiGui = g.OrderBy(item => item.tbncs.NgayChinhSua).First().tk.HoTen,
                              NgayGui = g.Min(item => item.tbncs.NgayChinhSua),
                              IDNguoiChinhSua = g.OrderByDescending(item => item.tbncs.NgayChinhSua).First().tbncs.IDNguoiChinhSua,
                              TenNguoiChinhSua = g.OrderByDescending(item => item.tbncs.NgayChinhSua).First().tk.HoTen,
                              NgayChinhSua = g.Max(item => item.tbncs.NgayChinhSua),
                              IDLoaiThongBao = g.First().tb.IDLoaiThongBao,
                              TenLoaiThongBao = g.First().ltb.Ten,
                              CapDo = g.First().ltb.CapDo,
                              TieuDe = g.First().tb.TieuDe,
                              NoiDung = g.First().tb.NoiDung,
                          }).FirstOrDefault();

            return View(notify);
        }

        [HttpGet]
        public ActionResult Delete(string maTB)
        {
            // Check the user has login or not
            if (Session["taikhoan"] == null || Session["taikhoan"].ToString() == "")
            {
                return RedirectToAction("login", "user", new { url = Request.Url.ToString() });
            }

            // Check the level permition
            var acc_log = (TaiKhoan)Session["TaiKhoan"];
            ViewBag.AccessLevel = DataProvider.Instance.DB.QuyenTruyCaps.Where(item => item.ID == acc_log.IDQuyenTruyCap).FirstOrDefault().CapDo;

            var notify = (from tb in DataProvider.Instance.DB.ThongBaos
                          join ltb in DataProvider.Instance.DB.LoaiThongBaos on tb.IDLoaiThongBao equals ltb.ID
                          join tbncs in DataProvider.Instance.DB.ThongBao_NguoiChinhSuas on tb.ID equals tbncs.IDThongBao
                          join tk in DataProvider.Instance.DB.TaiKhoans on tbncs.IDNguoiChinhSua equals tk.ID
                          where tb.ID == maTB
                          group new { tb, ltb, tbncs, tk } by tb.ID into g
                          select new MyNotify
                          {
                              ID = g.First().tb.ID,
                              IDNguoiGui = g.OrderBy(item => item.tbncs.NgayChinhSua).First().tbncs.IDNguoiChinhSua,
                              TenNguoiGui = g.OrderBy(item => item.tbncs.NgayChinhSua).First().tk.HoTen,
                              NgayGui = g.Min(item => item.tbncs.NgayChinhSua),
                              IDNguoiChinhSua = g.OrderByDescending(item => item.tbncs.NgayChinhSua).First().tbncs.IDNguoiChinhSua,
                              TenNguoiChinhSua = g.OrderByDescending(item => item.tbncs.NgayChinhSua).First().tk.HoTen,
                              NgayChinhSua = g.Max(item => item.tbncs.NgayChinhSua),
                              IDLoaiThongBao = g.First().tb.IDLoaiThongBao,
                              TenLoaiThongBao = g.First().ltb.Ten,
                              CapDo = g.First().ltb.CapDo,
                              TieuDe = g.First().tb.TieuDe,
                              NoiDung = g.First().tb.NoiDung,
                          }).FirstOrDefault();

            if (notify == null)
            {
                Response.StatusCode = 404;
                return null;
            }

            return View(notify);
        }

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteComfirm(string maTB, FormCollection f)
        {
            // Check the user has login or not
            if (Session["taikhoan"] == null || Session["taikhoan"].ToString() == "")
            {
                return RedirectToAction("login", "user", new { url = Request.Url.ToString() });
            }

            // Check the level permition
            var acc_log = (TaiKhoan)Session["TaiKhoan"];
            ViewBag.AccessLevel = DataProvider.Instance.DB.QuyenTruyCaps.Where(item => item.ID == acc_log.IDQuyenTruyCap).FirstOrDefault().CapDo;

            var notify = DataProvider.Instance.DB.ThongBaos.FirstOrDefault(item => item.ID == maTB);

            if (notify == null)
            {
                Response.StatusCode = 404;
                return null;
            }

            var notify_acc = DataProvider.Instance.DB.ThongBao_NguoiChinhSuas.Where(item => item.IDThongBao == maTB).ToList();
            foreach (var item in notify_acc )
            {
                DataProvider.Instance.DB.ThongBao_NguoiChinhSuas.DeleteOnSubmit(item);
                DataProvider.Instance.DB.SubmitChanges();
            }

            var notify_receive = DataProvider.Instance.DB.ThongBao_NguoiNhans.Where(item => item.IDThongBao == maTB).ToList();
            foreach (var item in notify_receive)
            {
                DataProvider.Instance.DB.ThongBao_NguoiNhans.DeleteOnSubmit(item);
                DataProvider.Instance.DB.SubmitChanges();
            }

            DataProvider.Instance.DB.ThongBaos.DeleteOnSubmit(notify);
            DataProvider.Instance.DB.SubmitChanges();

            return RedirectToAction("Index");
        }

        public string GenerateNextIDForNotifyReceiver()
        {
            var notify_rec = DataProvider.Instance.DB.ThongBao_NguoiNhans.OrderByDescending(item => item.ID).FirstOrDefault();
            string numericPart = notify_rec.ID.Substring(6); // Extract the numeric part, from position sixth
            int numericValue = int.Parse(numericPart); // Convert the numeric part to an integer
            numericValue++; // Increment the value
            string nextNumericPart = numericValue.ToString("D10"); // Format it back to a string with leading zeros

            // Generate the next ID by combining the prefix and the new numeric part
            string nextID = $"TB_NN{nextNumericPart}";

            return nextID;
        }

        public string GenerateNextIDForNotify()
        {
            var notify = DataProvider.Instance.DB.ThongBaos.OrderByDescending(item => item.ID).FirstOrDefault();
            string numericPart = notify.ID.Substring(3); // Extract the numeric part, from position sixth
            int numericValue = int.Parse(numericPart); // Convert the numeric part to an integer
            numericValue++; // Increment the value
            string nextNumericPart = numericValue.ToString("D10"); // Format it back to a string with leading zeros

            // Generate the next ID by combining the prefix and the new numeric part
            string nextID = $"TB{nextNumericPart}";

            return nextID;
        }

        [HttpGet]
        public ActionResult SendEmail()
        {
            return View();
        }

        [HttpPost]
        public ActionResult SendEmail(Mail model)
        {
            MailMessage mm = new MailMessage("lehieutester@gmail.com", model.To);
            mm.Subject = model.Subject;
            mm.Body = model.Notes;
            mm.IsBodyHtml = false;

            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.EnableSsl = true;

            NetworkCredential nc = new NetworkCredential("lehieutester@gmail.com", "vwryaqpxmheigpga");
            smtp.UseDefaultCredentials = true;
            smtp.Credentials = nc;
            smtp.Send(mm);
            return View("SendEmail");
        }
    }
}