using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using TDMUAdmin.Models;
using TDMUWebsite.Models;

namespace TDMUAdmin.Areas.Admin.Controllers
{
    public class ClassController : Controller
    {
        // GET: Class
        public ActionResult Index(string strSearch = null, string maKhoa = null, string maNganh = null)
        {
            // Check the user has login or not
            if (Session["taikhoan"] == null || Session["taikhoan"].ToString() == "")
            {
                return RedirectToAction("login", "user", new { url = Request.Url.ToString() });
            }

            // Check the level permition
            var acc_log = (TaiKhoan)Session["TaiKhoan"];
            ViewBag.AccessLevel = DataProvider.Instance.DB.QuyenTruyCaps.Where(item => item.ID == acc_log.IDQuyenTruyCap).FirstOrDefault().CapDo;

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

            ViewBag.Search = strSearch;
            if (!String.IsNullOrEmpty(strSearch))
            {
                lstClass = lstClass.Where(item => item.ID.Contains(strSearch));
            }

            if (maKhoa != null)
            {
                lstClass = lstClass.Where(item => item.IDKhoaVien == maKhoa);
            }
            ViewBag.MaKhoa = new SelectList(DataProvider.Instance.DB.Khoas, "ID", "Ten");

            if (maNganh != null)
            {
                lstClass = lstClass.Where(item => item.IDNhomNganh == maNganh);
            }
            ViewBag.MaNganh = new SelectList(DataProvider.Instance.DB.NhomNganhs, "ID", "Ten");

            return View(lstClass);
        }

        public ActionResult ManageClass(string maLop = null, string strSearch = null, string gender = null)
        {
            // Check the user has login or not
            if (Session["taikhoan"] == null || Session["taikhoan"].ToString() == "")
            {
                return RedirectToAction("login", "user", new { url = Request.Url.ToString() });
            }

            // Check the level permition
            var acc_log = (TaiKhoan)Session["TaiKhoan"];
            ViewBag.AccessLevel = DataProvider.Instance.DB.QuyenTruyCaps.Where(item => item.ID == acc_log.IDQuyenTruyCap).FirstOrDefault().CapDo;

            var genderList = new List<SelectListItem>
            {
                new SelectListItem { Value = "Nam", Text = "Nam" },
                new SelectListItem { Value = "Nữ", Text = "Nữ" },
            };

            var myClass = (from tk in DataProvider.Instance.DB.TaiKhoans
                           join l in DataProvider.Instance.DB.Lops on tk.IDLop equals l.ID
                           join nn in DataProvider.Instance.DB.NhomNganhs on l.IDNhomNganh equals nn.ID
                           join k in DataProvider.Instance.DB.Khoas on nn.IDKhoa equals k.ID
                           where tk.IDLop == maLop && tk.ChucVu == "Sinh Viên"
                           select new MyStudent
                           {
                               ID = tk.ID,
                               HoTen = tk.HoTen,
                               NgaySinh = tk.NgaySinh,
                               SDT = tk.SDT,
                               DiaChi = tk.DiaChi,
                               GioiTinh = tk.GioiTinh,
                               CCCD = tk.CCCD,
                               ImagePath = tk.ImagePath,
                               Institute = k.Ten,
                           }).Select(p => p);

            ViewBag.Search = strSearch;
            if (!String.IsNullOrEmpty(strSearch))
            {
                myClass.Where(item => item.HoTen.Contains(strSearch));
            }

            if (gender != null)
            {
                myClass.Where(item => item.GioiTinh == gender);
            }
            ViewBag.GenderList = new SelectList(genderList, "Value", "Text");
            ViewBag.MaNH = "NH0000000001";

            return View(myClass.ToList());
        }

        public ActionResult GradeTable(string mssv = null, string maNH = "NH0000000001")
        {
            // Check the user has login or not
            if (Session["taikhoan"] == null || Session["taikhoan"].ToString() == "")
            {
                return RedirectToAction("login", "user", new { url = Request.Url.ToString() });
            }

            // Check the level permition
            var acc_log = (TaiKhoan)Session["TaiKhoan"];
            ViewBag.AccessLevel = DataProvider.Instance.DB.QuyenTruyCaps.Where(item => item.ID == acc_log.IDQuyenTruyCap).FirstOrDefault().CapDo;

            ViewBag.MaNH = new SelectList(DataProvider.Instance.DB.NamHocs, "ID", "Ten", maNH);

            var student = DataProvider.Instance.DB.TaiKhoans.Where(item => item.ID == mssv).FirstOrDefault();
            return View(student);
        }

        public ActionResult LoadChildSemester(string mssv = null, string maHK = null, string maNH = null)
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

            ViewBag.DTK = (double) sumOfGrade / i;
            ViewBag.SoTC = sumOfCredit;
            ViewBag.DRL = pointTraining?.DRL ?? 0;

            return PartialView(subject);
        }

        private double? TrainModel(List<MyTranscriptData> transcriptData)
        {
            List<double?> xData = new List<double?>();
            List<double?> yData = new List<double?>();
            
            foreach (var item in transcriptData)
            {
                if (item.DGK == null || item.DCK == null) continue;
                xData.Add(item.DGK);
                yData.Add(item.DCK);
            }

            double? w = 1.0;

            double? Forward(double? x) => x * w;

            double? Loss(double? x, double? y)
            {
                double? yPred = Forward(x);
                return (yPred - y) * (yPred - y);
            }

            double? Gradient(double? x, double? y) => 2 * x * (x * w - y);

            for (int epoch = 0; epoch < 100; epoch++)
            {
                for (int i = 0; i < xData.Count; i++)
                {
                    double? xVal = xData[i];
                    double? yVal = yData[i];
                    double? grad = Gradient(xVal, yVal);
                    w = w - 0.01 * grad;
                }
            }

            return w;
        }

        public ActionResult IncreasePredict(string mssv = null, string maHK = null, string maNH = null)
        {
            // Check the user has login or not
            if (Session["taikhoan"] == null || Session["taikhoan"].ToString() == "")
            {
                return RedirectToAction("login", "user", new { url = Request.Url.ToString() });
            }

            // Check the level permition
            var acc_log = (TaiKhoan)Session["TaiKhoan"];
            ViewBag.AccessLevel = DataProvider.Instance.DB.QuyenTruyCaps.Where(item => item.ID == acc_log.IDQuyenTruyCap).FirstOrDefault().CapDo;

            var transcriptData = (from bd in DataProvider.Instance.DB.BangDiems
                           join mh in DataProvider.Instance.DB.MonHocs on bd.IDMonHoc equals mh.ID
                           join tk in DataProvider.Instance.DB.TaiKhoans on bd.IDSinhVien equals tk.ID
                           where tk.ID == mssv
                           select new MyTranscriptData
                           {
                               IDSinhVien = tk.ID,
                               IDMonHoc = mh.ID,
                               DGK = bd.DiemGiuaKy,
                               DCK = bd.DiemCuoiKy,
                           }).ToList();

            double? w = TrainModel(transcriptData);

            ViewBag.W = w;

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
                               DCK = (bd.DiemGiuaKy * w) > 10 ? 10 : bd.DiemGiuaKy * w,
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

            ViewBag.DTK = (double)sumOfGrade / i;
            ViewBag.SoTC = sumOfCredit;
            ViewBag.DRL = pointTraining?.DRL ?? 0;

            return View(subject);

        }

        public ActionResult DecreasePredict(string mssv = null, string maHK = null, string maNH = null)
        {
            // Check the user has login or not
            if (Session["taikhoan"] == null || Session["taikhoan"].ToString() == "")
            {
                return RedirectToAction("login", "user", new { url = Request.Url.ToString() });
            }

            // Check the level permition
            var acc_log = (TaiKhoan)Session["TaiKhoan"];
            ViewBag.AccessLevel = DataProvider.Instance.DB.QuyenTruyCaps.Where(item => item.ID == acc_log.IDQuyenTruyCap).FirstOrDefault().CapDo;

            var transcriptData = (from bd in DataProvider.Instance.DB.BangDiems
                                  join mh in DataProvider.Instance.DB.MonHocs on bd.IDMonHoc equals mh.ID
                                  join tk in DataProvider.Instance.DB.TaiKhoans on bd.IDSinhVien equals tk.ID
                                  where tk.ID == mssv && bd.DiemGiuaKy > bd.DiemCuoiKy
                                  select new MyTranscriptData
                                  {
                                      IDSinhVien = tk.ID,
                                      IDMonHoc = mh.ID,
                                      DGK = bd.DiemGiuaKy,
                                      DCK = bd.DiemCuoiKy,
                                  }).ToList();

            double? w = TrainModel(transcriptData);

            ViewBag.W = w;

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
                               DCK = (bd.DiemGiuaKy * w) > 10 ? 10 : bd.DiemGiuaKy * w,
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

            ViewBag.DTK = (double)sumOfGrade / i;
            ViewBag.SoTC = sumOfCredit;
            ViewBag.DRL = pointTraining?.DRL ?? 0;

            return View(subject);

        }
    }
}