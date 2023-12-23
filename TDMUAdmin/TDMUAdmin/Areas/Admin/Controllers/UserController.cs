using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.Mvc;
using TDMUWebsite.Models;

using GoogleAuthentication.Services;
using System.Threading.Tasks;
using System.Security.Principal;
using Newtonsoft.Json;
using System.Security.Policy;
using TDMUAdmin.Models;

namespace TDMUAdmin.Areas.Admin.Controllers
{
    public class UserController : Controller
    {
        // GET: User
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
        public ActionResult Login(string url)
        {
            var clientID = "720885104135-760587o9oqjvfhpovdjkbh4kas3gtf26.apps.googleusercontent.com";
            var urlGoogle = "https://localhost:44328/Admin/User/GoogleLoginCallBack";
            var response = GoogleAuth.GetAuthUrl(clientID, urlGoogle);
            ViewBag.Response = response;
            ViewBag.url = url;
            return View();
        }

        [HttpPost]
        public ActionResult Login(FormCollection collection)
        {
            var sTenDN = collection["TenDN"];
            var sMatKhau = collection["MatKhau"];
            var url = collection["url"];
            if (string.IsNullOrEmpty(url))
            {
                url = "~/TDMUAdmin/Index";
            }
            else if (String.IsNullOrEmpty(sTenDN))
            {
                ViewData["Err1"] = "Bạn chưa nhập tên đăng nhập";
            }
            else if (String.IsNullOrEmpty(sMatKhau))
            {
                ViewData["Err2"] = "Phải nhập mật khẩu";
            }
            else
            {
                TaiKhoan kh = DataProvider.Instance.DB.TaiKhoans.SingleOrDefault(c => c.TenTaiKhoan == sTenDN && c.MatKhau == GetMD5(sMatKhau));

                if (kh != null)
                {
                    ViewBag.ThongBao = "Chúc mừng đăng nhập thành công";
                    Session["TaiKhoan"] = kh;
                    if (collection["remember"].Contains("true"))
                    {
                        Response.Cookies["TenDN"].Value = sTenDN;
                        Response.Cookies["MatKhau"].Value = sMatKhau;
                        Response.Cookies["TenDN"].Expires = DateTime.Now.AddDays(1);
                        Response.Cookies["MatKhau"].Expires = DateTime.Now.AddDays(1);
                    }
                    else
                    {
                        Response.Cookies["TenDN"].Expires = DateTime.Now.AddDays(-1);
                        Response.Cookies["MatKhau"].Expires = DateTime.Now.AddDays(-1);
                    }
                    return Redirect(url);
                }
                else
                {
                    ViewBag.ThongBao = "Tên đăng nhập hoặc mật khẩu không đúng";
                }
            }
            return this.Login(url);
        }

        public ActionResult Logout()
        {
            Session["TaiKhoan"] = null;
            return RedirectToAction("Login");
        }

        public ActionResult GoogleLogin()
        {
            return View();
        }

        public async Task<ActionResult> GoogleLoginCallBack(string code)
        {
            var clientID = "720885104135-760587o9oqjvfhpovdjkbh4kas3gtf26.apps.googleusercontent.com";
            var urlGoogle = "https://localhost:44328/Admin/User/GoogleLoginCallBack";
            var clientSecret = "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";
            var token = await GoogleAuth.GetAuthAccessToken(code, clientID, clientSecret, urlGoogle);

            // Assuming you have a UserProfile class
            var userProfileJson = await GoogleAuth.GetProfileResponseAsync(token.AccessToken.ToString());
            var userProfile = JsonConvert.DeserializeObject<UserProfileGoogle>(userProfileJson);

            // Now you can access the email and verified_email properties
            var userEmail = userProfile.email;
            var isEmailVerified = userProfile.verified_email;

            if (isEmailVerified)
            {
                TaiKhoan kh = DataProvider.Instance.DB.TaiKhoans.SingleOrDefault(c => c.Email == userEmail);

                if (kh != null)
                {
                    ViewBag.ThongBao = "Chúc mừng đăng nhập thành công";
                    Session["TaiKhoan"] = kh;

                    return RedirectToAction("Index", "TDMUAdmin");
                }
                else
                {
                    return RedirectToAction("ErrorPage");
                }
            }

            return RedirectToAction("ErrorPage");
        }

        public ActionResult ErrorPage()
        {
            return View();
        }
    }
}