using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Permissions;
using System.Web;
using System.Web.Mvc;
using TDMUAdmin.Models;
using TDMUWebsite.Models;

namespace TDMUAdmin.Areas.Admin.Controllers
{
    public class ScheduleController : Controller
    {
        // GET: Schedule
        public ActionResult Index(string year = null, string month = null)
        {
            // Check the user has login or not
            if (Session["taikhoan"] == null || Session["taikhoan"].ToString() == "")
            {
                return RedirectToAction("login", "user", new { url = Request.Url.ToString() });
            }

            // Check the level permition
            var acc_log = (TaiKhoan)Session["TaiKhoan"];
            ViewBag.AccessLevel = DataProvider.Instance.DB.QuyenTruyCaps.Where(item => item.ID == acc_log.IDQuyenTruyCap).FirstOrDefault().CapDo;

            string selectedYear = string.IsNullOrEmpty(year) ? DateTime.Now.Year.ToString() : year;
            string selectedMonth = string.IsNullOrEmpty(month) ? DateTime.Now.Month.ToString() : month;

            ViewBag.YearList = GetYearList().Select(item => new SelectListItem
            {
                Text = item.Text,
                Value = item.Value,
                Selected = item.Value == selectedYear // Set the selected value
            }).ToList();

            ViewBag.MonthList = GetMonthList().Select(item => new SelectListItem
            {
                Text = item.Text,
                Value = item.Value,
                Selected = item.Value == selectedMonth // Set the selected value
            }).ToList();

            DateTime currentDate = new DateTime(int.Parse(selectedYear), int.Parse(selectedMonth), 1);
            var firstDayOfMonth = new DateTime(currentDate.Year, currentDate.Month, 1);
            var dayOfWeek = firstDayOfMonth.DayOfWeek;
            ViewBag.DayOfMonth = System.DateTime.DaysInMonth(currentDate.Year, currentDate.Month);

            switch (dayOfWeek)
            {
                case DayOfWeek.Sunday:
                    ViewBag.DayOfWeek = 8;
                    break;
                case DayOfWeek.Monday:
                    ViewBag.DayOfWeek = 2;
                    break;
                case DayOfWeek.Tuesday:
                    ViewBag.DayOfWeek = 3;
                    break;
                case DayOfWeek.Wednesday:
                    ViewBag.DayOfWeek = 4;
                    break;
                case DayOfWeek.Thursday:
                    ViewBag.DayOfWeek = 8;
                    break;
                case DayOfWeek.Friday:
                    ViewBag.DayOfWeek = 6;
                    break;
                case DayOfWeek.Saturday:
                    ViewBag.DayOfWeek = 7;
                    break;
                default:
                    ViewBag.DayOfWeek = null;
                    break;
            }

            var session = (from tkb in DataProvider.Instance.DB.ThoiKhoaBieus
                           join tkb_bh in DataProvider.Instance.DB.ThoiKhoaBieu_BuoiHocs on tkb.ID equals tkb_bh.IDThoiKhoaBieu
                           join bh in DataProvider.Instance.DB.BuoiHocs on tkb_bh.IDBuoiHoc equals bh.ID
                           join nmh_bh in DataProvider.Instance.DB.NhomMonHoc_BuoiHocs on bh.ID equals nmh_bh.IDBuoiHoc
                           join nmh in DataProvider.Instance.DB.NhomMonHocs on nmh_bh.IDNhomMonHoc equals nmh.ID
                           join gv in DataProvider.Instance.DB.TaiKhoans on nmh.IDGiangVien equals gv.ID
                           join mh in DataProvider.Instance.DB.MonHocs on nmh.IDMonHoc equals mh.ID
                           where acc_log.ID == tkb.IDTaiKhoan && bh.NgayDienRa.Value.Year == int.Parse(selectedYear) && bh.NgayDienRa.Value.Month == int.Parse(selectedMonth)
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

            return View(session);
        }

        public List<SelectListItem> GetYearList()
        {
            var list = new List<SelectListItem>();

            int startYear = DateTime.Now.Year - 10; // e.g., 10 years ago
            int endYear = DateTime.Now.Year + 10;   // e.g., 10 years in the future

            // Populate the dropdown list with years
            for (int year = startYear; year <= endYear; year++)
            {
                list.Add(new SelectListItem { Value = year.ToString(), Text = year.ToString() });
            }

            return list;
        }
        public List<SelectListItem> GetMonthList()
        {
            var list = new List<SelectListItem>();

            for(int i = 1; i <= 12; i++)
            {
                list.Add(new SelectListItem { Value = i.ToString(), Text = i.ToString() });
            }

            return list;
        }
    }
}