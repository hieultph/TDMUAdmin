using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TDMUAdmin.Models;

namespace TDMUAdmin.Areas.Admin.Controllers
{
    public class TextingController : Controller
    {
        // GET: Admin/Texting
        public ActionResult Index()
        {
            // Check the user has login or not
            if (Session["taikhoan"] == null || Session["taikhoan"].ToString() == "")
            {
                return RedirectToAction("login", "user", new { url = Request.Url.ToString() });
            }

            // Check the level permition
            var acc_log = (TaiKhoan)Session["TaiKhoan"];
            ViewBag.AccessLevel = DataProvider.Instance.DB.QuyenTruyCaps.Where(item => item.ID == acc_log.IDQuyenTruyCap).FirstOrDefault().CapDo;

            var status = "all";

            var lstMessage = (from tk in DataProvider.Instance.DB.TaiKhoans
                              join tn in DataProvider.Instance.DB.TinNhans on tk.ID equals tn.IDTaiKhoan
                              join tngd in DataProvider.Instance.DB.TinNhan_GuiDens on tn.ID equals tngd.IDTinNhan into g
                              from m in g.DefaultIfEmpty()
                              where m.IDNguoiNhan == acc_log.ID
                              let nguoiGui = tn.IDTaiKhoan
                              let tenNG = tk.HoTen
                              let ngayGui = tn.NgayGui
                              let daXem = m.DaXem
                              let noiDung = tn.NoiDung
                              let imagePath = tk.ImagePath
                              select new MyMessage
                              {
                                  ID = tn.ID,
                                  TenNG = tenNG,
                                  IDNguoiGui = nguoiGui,
                                  IDNguoiNhan = m.IDNguoiNhan,
                                  IDNhomNhan = m.IDNhomNhan,
                                  NoiDung = noiDung,
                                  NgayGui = ngayGui,
                                  DaXem = daXem,
                                  ImagePath = imagePath
                              })
                              .GroupBy(x => x.IDNguoiGui)  // Group by sender's ID
                              .Select(group => new MyMessage
                              {
                                  ID = group.First().ID,
                                  TenNG = group.First().TenNG,
                                  IDNguoiGui = group.Key,  // Sender's ID
                                  IDNguoiNhan = group.First().IDNguoiNhan,
                                  IDNhomNhan = group.First().IDNhomNhan,
                                  NoiDung = group.First().NoiDung,  // Latest message's content
                                  NgayGui = group.First().NgayGui,  // Latest message's date
                                  DaXem = group.First().DaXem,
                                  SoLuong = group.Count(),  // Count of messages sent by the sender
                                  ImagePath = group.First().ImagePath,
                              })
                              .OrderByDescending(x => x.NgayGui)
                              .ToList();

            if (status == "notseen")
            {
                lstMessage.Where(m => m.DaXem == 0);
            }
            else if (status == "seen")
            {
                lstMessage.Where(m => m.DaXem == 1);
            }

            return View(lstMessage);
        }

        public ActionResult LoadChildMessageBody(string maTK, string maNG)
        {
            var lstMessage = (from tk in DataProvider.Instance.DB.TaiKhoans
                              join tn in DataProvider.Instance.DB.TinNhans on tk.ID equals tn.IDTaiKhoan
                              join tngd in DataProvider.Instance.DB.TinNhan_GuiDens on tn.ID equals tngd.IDTinNhan into g
                              from m in g.DefaultIfEmpty()
                              where (m.IDNguoiNhan == maTK && tn.IDTaiKhoan == maNG) || (m.IDNguoiNhan == maNG && tn.IDTaiKhoan == maTK)
                              let nguoiGui = tn.IDTaiKhoan
                              let tenNG = tk.HoTen
                              let ngayGui = tn.NgayGui
                              let daXem = m.DaXem
                              let noiDung = tn.NoiDung
                              let imagePath = tk.ImagePath
                              select new MyMessage
                              {
                                  ID = tn.ID,
                                  TenNG = tenNG,
                                  IDNguoiGui = nguoiGui,
                                  IDNguoiNhan = m.IDNguoiNhan,
                                  IDNhomNhan = m.IDNhomNhan,
                                  NoiDung = noiDung,
                                  NgayGui = ngayGui,
                                  DaXem = daXem,
                                  ImagePath = imagePath
                              }).OrderBy(x => x.NgayGui).ToList();

            return PartialView(lstMessage);
        }
    }
}