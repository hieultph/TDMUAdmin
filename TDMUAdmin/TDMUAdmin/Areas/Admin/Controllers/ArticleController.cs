using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using PagedList;
using PagedList.Mvc;
using System.IO;
using System.Security.Cryptography.X509Certificates;
using System.Web.UI;
using System.Linq.Dynamic;
using System.Linq.Expressions;
using TDMUWebsite.Models;
using TDMUAdmin.Models;

namespace TDMUAdmin.Areas.Admin.Controllers
{
    public class ArticleController : Controller
    {
        // GET: Article
        public ActionResult Index(int ? page)
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

            var result = (
                        from bv in DataProvider.Instance.DB.BaiViets
                        join tlbv in DataProvider.Instance.DB.TLBaiViets on bv.IDTLBaiViet equals tlbv.ID
                        join bvncs in DataProvider.Instance.DB.BaiViet_NguoiChinhSuas on bv.ID equals bvncs.IDBaiViet
                        join tk in DataProvider.Instance.DB.TaiKhoans on bvncs.IDNguoiChinhSua equals tk.ID
                        join m in DataProvider.Instance.DB.TaiKhoans on bvncs.IDNguoiChinhSua equals m.ID into tkGroup
                        from m in tkGroup.DefaultIfEmpty()
                        join tl in DataProvider.Instance.DB.TLBaiViets on bv.IDTLBaiViet equals tl.ID into tlGroup
                        from tl in tlGroup.DefaultIfEmpty()
                        where tk.QuyenTruyCap.CapDo <= 5
                        group new { bv, bvncs, tk, m, tl } by bv.ID into g
                        select new MyArticle
                        {
                            ID = g.Key,
                            IDTLBaiViet = g.First().bv.IDTLBaiViet,
                            IDNguoiDang = g.OrderBy(item => item.bvncs.NgayChinhSua).First().bvncs.IDNguoiChinhSua,
                            NguoiDang = g.OrderBy(item => item.bvncs.NgayChinhSua).First().m.HoTen,
                            IDNguoiChinhSua = g.OrderByDescending(item => item.bvncs.NgayChinhSua).First().bvncs.IDNguoiChinhSua,
                            NguoiChinhSua = g.OrderByDescending(item => item.bvncs.NgayChinhSua).First().m.HoTen,
                            TenTheLoai = g.First().tl.Ten,
                            TieuDe = g.First().bv.TieuDe,
                            NoiDung = g.First().bv.NoiDung,
                            GhiChu = g.First().bv.GhiChu,
                            NgayDang = g.Min(item => item.bvncs.NgayChinhSua),
                            NgayChinhSua = g.Max(item => item.bvncs.NgayChinhSua)
                        }).ToList();

            return View(result.OrderBy(n => n.ID).ToPagedList(iPageNum, iPageSize));
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

            ViewBag.MaTL = new SelectList(DataProvider.Instance.DB.TLBaiViets.ToList().OrderBy(item => item.Ten), "ID", "Ten");

            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create (FormCollection f)
        {
            var tk = (TaiKhoan)Session["TaiKhoan"];

            var article = new BaiViet();
            var article_acc = new BaiViet_NguoiChinhSua();

            if (ModelState.IsValid)
            {
                article.IDTLBaiViet = f["MaTL"];
                article.TieuDe = f["sTieuDe"];
                article.NoiDung = f["sNoiDung"];
                article.GhiChu = f["sGhiChu"];

                // SubmitChanges to get the generated ID for article
                DataProvider.Instance.DB.BaiViets.InsertOnSubmit(article);
                DataProvider.Instance.DB.SubmitChanges();

                var latestArticle = DataProvider.Instance.DB.BaiViets.OrderByDescending(a => a.ID).FirstOrDefault();

                if (latestArticle != null)
                {
                    article_acc.IDBaiViet = latestArticle.ID;
                    article_acc.IDNguoiChinhSua = tk.ID;
                    article_acc.NgayChinhSua = DateTime.Now;
                    article_acc.GhiChu = f["sGhiChu"];

                    DataProvider.Instance.DB.BaiViet_NguoiChinhSuas.InsertOnSubmit(article_acc);
                    DataProvider.Instance.DB.SubmitChanges();

                    return RedirectToAction("Index");
                }
            }

            return View();
        }

        [HttpGet]
        public ActionResult Edit (string MaBV)
        {
            // Check the user has login or not
            if (Session["taikhoan"] == null || Session["taikhoan"].ToString() == "")
            {
                return RedirectToAction("login", "user", new { url = Request.Url.ToString() });
            }

            // Check the level permition
            var acc_log = (TaiKhoan)Session["TaiKhoan"];
            ViewBag.AccessLevel = DataProvider.Instance.DB.QuyenTruyCaps.Where(item => item.ID == acc_log.IDQuyenTruyCap).FirstOrDefault().CapDo;

            var article = DataProvider.Instance.DB.BaiViets.Where(a => a.ID == MaBV).FirstOrDefault();

            if (article == null)
            {
                Response.StatusCode = 404;
                return null;
            }

            ViewBag.MaTL = new SelectList(DataProvider.Instance.DB.TLBaiViets.ToList().OrderBy(tl => tl.Ten), "ID", "Ten", article.IDTLBaiViet);

            return View(article);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Edit (FormCollection f)
        {
            var tk = (TaiKhoan)Session["TaiKhoan"];

            var article = DataProvider.Instance.DB.BaiViets.SingleOrDefault(a => a.ID == f["sMaBV"]);
            var article_acc = new BaiViet_NguoiChinhSua();

            //ViewBag.MaTL = new SelectList(DataProvider.Instance.DB.TLBaiViets.ToList().OrderBy(tl => tl.Ten), "ID", "Ten", article.IDTLBaiViet);

            if (ModelState.IsValid)
            {
                article.ID = f["sMaBV"];
                article.IDTLBaiViet = f["MaTL"];
                article.TieuDe = f["sTieuDe"];
                article.NoiDung = f["sNoiDung"];
                article.GhiChu = f["sGhiChu"];
                DataProvider.Instance.DB.SubmitChanges();
                
                article_acc.IDBaiViet = f["sMaBV"];
                article_acc.IDNguoiChinhSua = tk.ID;
                article_acc.NgayChinhSua = DateTime.Now;
                article_acc.GhiChu = "note";
                DataProvider.Instance.DB.BaiViet_NguoiChinhSuas.InsertOnSubmit(article_acc);
                DataProvider.Instance.DB.SubmitChanges();

                return RedirectToAction("Index");
            }

            return View(article);
        }

        [HttpGet]
        public ActionResult Details (string MaBV)
        {
            // Check the user has login or not
            if (Session["taikhoan"] == null || Session["taikhoan"].ToString() == "")
            {
                return RedirectToAction("login", "user", new { url = Request.Url.ToString() });
            }

            // Check the level permition
            var acc_log = (TaiKhoan)Session["TaiKhoan"];
            ViewBag.AccessLevel = DataProvider.Instance.DB.QuyenTruyCaps.Where(item => item.ID == acc_log.IDQuyenTruyCap).FirstOrDefault().CapDo;

            var result = (
                        from bv in DataProvider.Instance.DB.BaiViets
                        join tlbv in DataProvider.Instance.DB.TLBaiViets on bv.IDTLBaiViet equals tlbv.ID
                        join bvncs in DataProvider.Instance.DB.BaiViet_NguoiChinhSuas on bv.ID equals bvncs.IDBaiViet
                        join tk in DataProvider.Instance.DB.TaiKhoans on bvncs.IDNguoiChinhSua equals tk.ID
                        join m in DataProvider.Instance.DB.TaiKhoans on bvncs.IDNguoiChinhSua equals m.ID into tkGroup
                        from m in tkGroup.DefaultIfEmpty()
                        join tl in DataProvider.Instance.DB.TLBaiViets on bv.IDTLBaiViet equals tl.ID into tlGroup
                        from tl in tlGroup.DefaultIfEmpty()
                        where bv.ID == MaBV
                        group new { bv, bvncs, tk, m, tl } by bv.ID into g
                        select new MyArticle
                        {
                            ID = g.Key,
                            IDTLBaiViet = g.First().bv.IDTLBaiViet,
                            IDNguoiDang = g.OrderBy(item => item.bvncs.NgayChinhSua).First().bvncs.IDNguoiChinhSua,
                            NguoiDang = g.OrderBy(item => item.bvncs.NgayChinhSua).First().m.HoTen,
                            IDNguoiChinhSua = g.OrderByDescending(item => item.bvncs.NgayChinhSua).First().bvncs.IDNguoiChinhSua,
                            NguoiChinhSua = g.OrderByDescending(item => item.bvncs.NgayChinhSua).First().m.HoTen,
                            TenTheLoai = g.First().tl.Ten,
                            TieuDe = g.First().bv.TieuDe,
                            NoiDung = g.First().bv.NoiDung,
                            GhiChu = g.First().bv.GhiChu,
                            NgayDang = g.Min(item => item.bvncs.NgayChinhSua),
                            NgayChinhSua = g.Max(item => item.bvncs.NgayChinhSua)
                        }).FirstOrDefault();

            return View(result);
        }

        public ActionResult Delete(string MaBV)
        {
            // Check the user has login or not
            if (Session["taikhoan"] == null || Session["taikhoan"].ToString() == "")
            {
                return RedirectToAction("login", "user", new { url = Request.Url.ToString() });
            }

            // Check the level permition
            var acc_log = (TaiKhoan)Session["TaiKhoan"];
            ViewBag.AccessLevel = DataProvider.Instance.DB.QuyenTruyCaps.Where(item => item.ID == acc_log.IDQuyenTruyCap).FirstOrDefault().CapDo;

            var result = (
                        from bv in DataProvider.Instance.DB.BaiViets
                        join tlbv in DataProvider.Instance.DB.TLBaiViets on bv.IDTLBaiViet equals tlbv.ID
                        join bvncs in DataProvider.Instance.DB.BaiViet_NguoiChinhSuas on bv.ID equals bvncs.IDBaiViet
                        join tk in DataProvider.Instance.DB.TaiKhoans on bvncs.IDNguoiChinhSua equals tk.ID
                        join m in DataProvider.Instance.DB.TaiKhoans on bvncs.IDNguoiChinhSua equals m.ID into tkGroup
                        from m in tkGroup.DefaultIfEmpty()
                        join tl in DataProvider.Instance.DB.TLBaiViets on bv.IDTLBaiViet equals tl.ID into tlGroup
                        from tl in tlGroup.DefaultIfEmpty()
                        where bv.ID == MaBV
                        group new { bv, bvncs, tk, m, tl } by bv.ID into g
                        select new MyArticle
                        {
                            ID = g.Key,
                            IDTLBaiViet = g.First().bv.IDTLBaiViet,
                            IDNguoiDang = g.OrderBy(item => item.bvncs.NgayChinhSua).First().bvncs.IDNguoiChinhSua,
                            NguoiDang = g.OrderBy(item => item.bvncs.NgayChinhSua).First().m.HoTen,
                            IDNguoiChinhSua = g.OrderByDescending(item => item.bvncs.NgayChinhSua).First().bvncs.IDNguoiChinhSua,
                            NguoiChinhSua = g.OrderByDescending(item => item.bvncs.NgayChinhSua).First().m.HoTen,
                            TenTheLoai = g.First().tl.Ten,
                            TieuDe = g.First().bv.TieuDe,
                            NoiDung = g.First().bv.NoiDung,
                            GhiChu = g.First().bv.GhiChu,
                            NgayDang = g.Min(item => item.bvncs.NgayChinhSua),
                            NgayChinhSua = g.Max(item => item.bvncs.NgayChinhSua)
                        }).FirstOrDefault();

            if (result == null)
            {
                Response.StatusCode = 404;
                return null;
            }

            return View(result);
        }

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirm(string MaBV, FormCollection f)
        {
            // Check the user has login or not
            if (Session["taikhoan"] == null || Session["taikhoan"].ToString() == "")
            {
                return RedirectToAction("login", "user", new { url = Request.Url.ToString() });
            }

            // Check the level permition
            var acc_log = (TaiKhoan)Session["TaiKhoan"];
            ViewBag.AccessLevel = DataProvider.Instance.DB.QuyenTruyCaps.Where(item => item.ID == acc_log.IDQuyenTruyCap).FirstOrDefault().CapDo;

            var article = DataProvider.Instance.DB.BaiViets.SingleOrDefault(n => n.ID == MaBV);

            if (article == null)
            {
                Response.StatusCode = 404;
                return null;
            }

            var article_acc = DataProvider.Instance.DB.BaiViet_NguoiChinhSuas.Where(n => n.ID == MaBV).ToList();
            foreach (var item in article_acc)
            {
                DataProvider.Instance.DB.BaiViet_NguoiChinhSuas.DeleteOnSubmit(item);
                DataProvider.Instance.DB.SubmitChanges();
            }

            var article_par = DataProvider.Instance.DB.BaiViet_NguoiThamGias.Where(n => n.ID == MaBV).ToList();
            foreach (var item in article_par)
            {
                DataProvider.Instance.DB.BaiViet_NguoiThamGias.DeleteOnSubmit(item);
                DataProvider.Instance.DB.SubmitChanges();
            }

            // Xoa sach
            DataProvider.Instance.DB.BaiViets.DeleteOnSubmit(article);
            DataProvider.Instance.DB.SubmitChanges();

            return RedirectToAction("Index");
        }

        public ActionResult Participant(string strSearch = null, string MaBV = null, string maLop = null, string maKhoa = null)
        {
            // Check the user has login or not
            if (Session["taikhoan"] == null || Session["taikhoan"].ToString() == "")
            {
                return RedirectToAction("login", "user", new { url = Request.Url.ToString() });
            }

            // Check the level permition
            var acc_log = (TaiKhoan)Session["TaiKhoan"];
            ViewBag.AccessLevel = DataProvider.Instance.DB.QuyenTruyCaps.Where(item => item.ID == acc_log.IDQuyenTruyCap).FirstOrDefault().CapDo;

            var participant = (from bv in DataProvider.Instance.DB.BaiViets
                               join bvntg in DataProvider.Instance.DB.BaiViet_NguoiThamGias on bv.ID equals bvntg.IDBaiViet
                               join tk in DataProvider.Instance.DB.TaiKhoans on bvntg.IDNguoiThamGia equals tk.ID
                               join l in DataProvider.Instance.DB.Lops on tk.IDLop equals l.ID
                               join nn in DataProvider.Instance.DB.NhomNganhs on l.IDNhomNganh equals nn.ID
                               join k in DataProvider.Instance.DB.Khoas on nn.IDKhoa equals k.ID
                               where bv.ID == MaBV
                               select new MyParticipantOfArticle
                               {
                                   ID = bv.ID,
                                   TieuDe = bv.TieuDe,
                                   IDNguoiThamGia = bvntg.IDNguoiThamGia,
                                   TenNguoiThamGia = tk.HoTen,
                                   IDKhoa = k.ID,
                                   TenKhoa = k.Ten,
                                   IDLop = tk.IDLop,
                                   TenLop = nn.Ten,
                                   NgayDangKy = bvntg.NgayDangKy
                               }).Select(p => p);
            // Lưu từ khóa tìm kiếm
            ViewBag.Search = strSearch;

            // Tìm kiếm theo searchString
            if (!String.IsNullOrEmpty(strSearch))
                participant = participant.Where(p => p.TenNguoiThamGia.Contains(strSearch));

            //5. Tạo danh sách danh mục để hiển thị ở giao diện View thông qua DropDownList
            ViewBag.MaBV = new SelectList(DataProvider.Instance.DB.BaiViets, "ID", "ID"); // danh sách Chủ đề

            // Tìm kiếm theo MaCD
            if (maLop != null)
            {
                participant = participant.Where(p => p.IDLop == maLop);
            }
            //5. Tạo danh sách danh mục để hiển thị ở giao diện View thông qua DropDownList
            ViewBag.MaLop = new SelectList(DataProvider.Instance.DB.Lops, "ID", "ID"); // danh sách Chủ đề
            //ViewBag.cd = db.CHUDEs.ToList();

            if (maKhoa != null)
            {
                participant = participant.Where(p => p.IDKhoa == maKhoa);
            }
            ViewBag.MaKhoa = new SelectList(DataProvider.Instance.DB.Khoas, "ID", "Ten");

            return View(participant.ToList());
        }
    }
}