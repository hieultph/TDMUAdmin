using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Mvc;
using TDMUAdmin.Models;

namespace TDMUAdmin.Areas.User.Controllers
{
    public class LoginController : Controller
    {
        DataClasses1DataContext db = new DataClasses1DataContext();
        // GET: User/Login
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
        public ActionResult Login() 
        { 
            return View();
        }

        [HttpPost]
        public ActionResult Login(FormCollection f)
        {
            var sTenDN = f["UserName"];
            var sMatKhau = f["Password"];
            TaiKhoan ad = db.TaiKhoans.SingleOrDefault(n => n.TenTaiKhoan == sTenDN && n.MatKhau
            == GetMD5(sMatKhau));
            if (ad != null)
            {
                Session["User"] = ad;
                return RedirectToAction("Index", "TDMUWebsite");
            }
            else
            {
                ViewBag.ThongBao = "Tên đăng nhập hoặc mật khẩu không đúng";
            }
            return View();
        }
        public ActionResult Dangxuat()
        {
            Session.Clear();
            return RedirectToAction("Index", "TDMUWebsite");
        }
    }
}