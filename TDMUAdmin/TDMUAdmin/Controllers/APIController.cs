using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;
using TDMUAdmin.Models;

namespace TDMUAdmin.Controllers
{
    public class APIController : Controller
    {
        // GET: API

        DataClasses1DataContext db = DataProvider.Instance.DB;

        public ActionResult Index()
        {
            return View();
        }

        public static string GetMD5(string str)
        {
            MD5 md5 = new MD5CryptoServiceProvider();
            byte[] fromData = Encoding.UTF8.GetBytes(str);
            byte[] targetData = md5.ComputeHash(fromData);
            string byte2String = null;

            for (int i = 0; i < targetData.Length; i++)
            {
                byte2String += targetData[i].ToString("x2");
            }
            return byte2String;
        }

        [HttpGet]
        public ActionResult LoginAPI(string userName, string password)
        {
            var sTenDN = userName;
            var sMatKhau = password;

            try
            {
                TaiKhoan tk = DataProvider.Instance.DB.TaiKhoans.SingleOrDefault(c => c.TenTaiKhoan == sTenDN && c.MatKhau == GetMD5(sMatKhau));

                if (tk != null)
                {
                    var acc = (from tttk in DataProvider.Instance.DB.TaiKhoans
                               where tttk.TenTaiKhoan == sTenDN && tttk.MatKhau == GetMD5(sMatKhau)
                               select new
                               {
                                   ID = tk.ID,
                                   IDThoiKhoaBieu = tk.IDThoiKhoaBieu,
                                   IDLop = tk.IDLop,
                                   HoTen = tk.HoTen,
                                   NgaySinh = tk.NgaySinh,
                                   Email = tk.Email,
                                   SDT = tk.SDT,
                                   DiaChi = tk.DiaChi,
                                   GioiTinh = tk.GioiTinh,
                                   CCCD = tk.CCCD,
                                   ChucVu = tk.ChucVu,
                                   IDQuyenTruyCap = tk.IDQuyenTruyCap,
                                   TenTaiKhoan = tk.TenTaiKhoan,
                                   ImagePath = tk.ImagePath,
                                   GhiChu = tk.GhiChu
                               }).ToList();

                    return Json(new { code = 200, acc = acc, msg = "gotthem " }, JsonRequestBehavior.AllowGet);
                }
                else
                {
                    return Json(new { code = 500, msg = "Your account cannot be found" }, JsonRequestBehavior.AllowGet);
                }
            }
            catch (Exception ex)
            {
                return Json(new { code = 500, msg = "Api got a hiccup: " + ex.Message }, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpGet]
        public ActionResult L_Evt()
        {
            try
            {
                var Evt = (
                        from bv in DataProvider.Instance.DB.BaiViets
                        join tlbv in DataProvider.Instance.DB.TLBaiViets on bv.IDTLBaiViet equals tlbv.ID
                        join bvncs in DataProvider.Instance.DB.BaiViet_NguoiChinhSuas on bv.ID equals bvncs.IDBaiViet
                        join tk in DataProvider.Instance.DB.TaiKhoans on bvncs.IDNguoiChinhSua equals tk.ID
                        join m in DataProvider.Instance.DB.TaiKhoans on bvncs.IDNguoiChinhSua equals m.ID into tkGroup
                        from m in tkGroup.DefaultIfEmpty()
                        join tl in DataProvider.Instance.DB.TLBaiViets on bv.IDTLBaiViet equals tl.ID into tlGroup
                        from tl in tlGroup.DefaultIfEmpty()
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

                return Json(new { code = 200, Evt = Evt, msg = "gotthem " }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { code = 500, msg = "Api got a hiccup: " + ex.Message }, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpGet]
        public ActionResult L_Notif()
        {
            try
            {
                var notif = (from tb in DataProvider.Instance.DB.ThongBaos
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

                return Json(new { code = 200, notif = notif, msg = "gotthem " }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { code = 500, msg = "Api got a hiccup: " + ex.Message }, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpGet]
        public ActionResult notifDetail(string id)
        {
            try
            {
                var notif = (from tb in DataProvider.Instance.DB.ThongBaos
                              join ltb in DataProvider.Instance.DB.LoaiThongBaos on tb.IDLoaiThongBao equals ltb.ID
                              join tbncs in DataProvider.Instance.DB.ThongBao_NguoiChinhSuas on tb.ID equals tbncs.IDThongBao
                              join tk in DataProvider.Instance.DB.TaiKhoans on tbncs.IDNguoiChinhSua equals tk.ID
                              where tb.ID == id
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

                return Json(new { code = 200, notif = notif, msg = "gotthem " }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { code = 500, msg = "Api got a hiccup: " + ex.Message }, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpGet]
        public ActionResult EvtDetail(string id)
        {
            try
            {
                var notif = (
                        from bv in DataProvider.Instance.DB.BaiViets
                        join tlbv in DataProvider.Instance.DB.TLBaiViets on bv.IDTLBaiViet equals tlbv.ID
                        join bvncs in DataProvider.Instance.DB.BaiViet_NguoiChinhSuas on bv.ID equals bvncs.IDBaiViet
                        join tk in DataProvider.Instance.DB.TaiKhoans on bvncs.IDNguoiChinhSua equals tk.ID
                        join m in DataProvider.Instance.DB.TaiKhoans on bvncs.IDNguoiChinhSua equals m.ID into tkGroup
                        from m in tkGroup.DefaultIfEmpty()
                        join tl in DataProvider.Instance.DB.TLBaiViets on bv.IDTLBaiViet equals tl.ID into tlGroup
                        from tl in tlGroup.DefaultIfEmpty()
                        where bv.ID == id
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

                return Json(new { code = 200, notif = notif, msg = "gotthem " }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { code = 500, msg = "Api got a hiccup: " + ex.Message }, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult addinDS(string joineeID, string IDBaiViet)
        {
            BaiViet_NguoiThamGia BvNTG = new BaiViet_NguoiThamGia();
            BvNTG.IDNguoiThamGia = joineeID;
            BvNTG.IDBaiViet = IDBaiViet;
            BvNTG.NgayDangKy = DateTime.Now;
            BvNTG.GhiChu = "";
            try
            {
                db.BaiViet_NguoiThamGias.InsertOnSubmit(BvNTG);
                db.SubmitChanges();
                return Json(new { code = 200, msg = "gotit" }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex) { return Json(new { code = 500, msg = "wut" + ex.Message + "-*-" + ex.HelpLink }, JsonRequestBehavior.AllowGet); }
        }

        [HttpGet]
        public ActionResult TKB(string id, string year = null, string month = null)
        {
            string selectedYear = string.IsNullOrEmpty(year) ? DateTime.Now.Year.ToString() : year;
            string selectedMonth = string.IsNullOrEmpty(month) ? DateTime.Now.Month.ToString() : month;

            try
            {
                var session = (from tkb in DataProvider.Instance.DB.ThoiKhoaBieus
                               join tkb_bh in DataProvider.Instance.DB.ThoiKhoaBieu_BuoiHocs on tkb.ID equals tkb_bh.IDThoiKhoaBieu
                               join bh in DataProvider.Instance.DB.BuoiHocs on tkb_bh.IDBuoiHoc equals bh.ID
                               join nmh_bh in DataProvider.Instance.DB.NhomMonHoc_BuoiHocs on bh.ID equals nmh_bh.IDBuoiHoc
                               join nmh in DataProvider.Instance.DB.NhomMonHocs on nmh_bh.IDNhomMonHoc equals nmh.ID
                               join gv in DataProvider.Instance.DB.TaiKhoans on nmh.IDGiangVien equals gv.ID
                               join mh in DataProvider.Instance.DB.MonHocs on nmh.IDMonHoc equals mh.ID
                               where id == tkb.IDTaiKhoan && bh.NgayDienRa.Value.Year == int.Parse(selectedYear) && bh.NgayDienRa.Value.Month == int.Parse(selectedMonth)
                               select new MySession
                               {
                                   IDBuoiHoc = bh.ID,
                                   NgayDienRa = bh.NgayDienRa,
                                   NgayKetThuc = bh.NgayKetThuc,
                                   Phong = bh.Phong,
                                   IDMonHoc = mh.ID,
                                   TenMonHoc = mh.Ten,
                                   IDNhomMonHoc = nmh.ID,
                                   IDGiangVien = nmh.IDGiangVien,
                                   TenGiangVien = gv.HoTen,
                               }).ToList();

                return Json(new { code = 200, data = session, msg = "gotthem " }, JsonRequestBehavior.AllowGet);

            }
            catch (Exception ex)
            {
                return Json(new { code = 500, msg = "wut" + ex.Message + "-*-" + ex.HelpLink }, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpGet]
        public ActionResult GetParticipantList(string id)
        {
            try
            {
                var participant = (from bv in DataProvider.Instance.DB.BaiViets
                                   join bvntg in DataProvider.Instance.DB.BaiViet_NguoiThamGias on bv.ID equals bvntg.IDBaiViet
                                   join tk in DataProvider.Instance.DB.TaiKhoans on bvntg.IDNguoiThamGia equals tk.ID
                                   join l in DataProvider.Instance.DB.Lops on tk.IDLop equals l.ID
                                   join nn in DataProvider.Instance.DB.NhomNganhs on l.IDNhomNganh equals nn.ID
                                   join k in DataProvider.Instance.DB.Khoas on nn.IDKhoa equals k.ID
                                   where bv.ID == id
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

                return Json(new { code = 200, data = participant, msg = "gotthem " }, JsonRequestBehavior.AllowGet);

            }
            catch (Exception ex)
            {
                return Json(new { code = 500, msg = "wut" + ex.Message + "-*-" + ex.HelpLink }, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpGet]
        public ActionResult GetClassList ()
        {
            try
            {
                var lstClass = (from l in DataProvider.Instance.DB.Lops
                                join nn in DataProvider.Instance.DB.NhomNganhs on l.IDNhomNganh equals nn.ID
                                join k in DataProvider.Instance.DB.Khoas on nn.IDKhoa equals k.ID
                                select new MyClass
                                {
                                    ID = l.ID,
                                    IDGiangVien = l.IDGiangVien,
                                    IDNhomNganh = nn.ID,
                                    IDKhoaVien = k.ID,
                                    NhomNganh = nn.Ten,
                                    KhoaVien = k.Ten,
                                    GhiChu = l.GhiChu,
                                }).Select(p => p);

                return Json(new { code = 200, data = lstClass, msg = "successful" }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { code = 500, msg = "Fail, " + ex.Message + "-*-" + ex.HelpLink }, JsonRequestBehavior.AllowGet);
            }
        }

        [HttpGet]
        public ActionResult GetGradeTableBySemester (string mssv = null, string maHK = null, string maNH = null)
        {
            try
            {
                var subject = (from bd in DataProvider.Instance.DB.BangDiems
                               join mh in DataProvider.Instance.DB.MonHocs on bd.IDMonHoc equals mh.ID
                               join hk in DataProvider.Instance.DB.HocKies on mh.IDHocKy equals hk.ID
                               join nh in DataProvider.Instance.DB.NamHocs on mh.IDNamHoc equals nh.ID
                               join tk in DataProvider.Instance.DB.TaiKhoans on bd.IDSinhVien equals tk.ID
                               where tk.ID == mssv && mh.IDHocKy == maHK && mh.IDNamHoc == maNH
                               select new MySubject
                               {
                                   ID = mh.ID,
                                   IDHocKy = mh.IDHocKy,
                                   HocKy = hk.Ten,
                                   IDNamHoc = mh.IDNamHoc,
                                   NamHoc = nh.Ten,
                                   Ten = mh.Ten,
                                   DGK = bd.DiemGiuaKy,
                                   DCK = bd.DiemCuoiKy,
                                   SoTC = mh.SoTC,
                               }).Select(p => p);

                double? sumOfGrade = 0;
                int? sumOfCredit = 0;
                int i = 0;
                foreach (var item in subject)
                {
                    sumOfGrade += item.DTB;
                    sumOfCredit += item.SoTC;
                    i++;
                }

                var pointTraining = (from tk in DataProvider.Instance.DB.TaiKhoans
                                     join drl in DataProvider.Instance.DB.DiemRenLuyens on tk.ID equals drl.IDSinhVien
                                     where tk.ID == mssv && drl.IDHocKy == maHK && drl.IDNamHoc == maNH
                                     select new
                                     {
                                         Hoten = tk.HoTen,
                                         DRL = drl.TongDiem,
                                     }).FirstOrDefault();

                double? DTK = (double)sumOfGrade / i; // Diem tong ket
                int? soTC = sumOfCredit;
                int? DRL = pointTraining?.DRL ?? 0;

                return Json(new { code = 200, subject = subject, dtk = DTK, sotc = soTC, drl =DRL, msg = "successful" }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { code = 500, msg = "Fail, " + ex.Message + "-*-" + ex.HelpLink }, JsonRequestBehavior.AllowGet);
            }
        }
    }
}