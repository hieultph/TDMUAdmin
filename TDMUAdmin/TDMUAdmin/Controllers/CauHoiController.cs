using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls.Expressions;
using TDMUAdmin.Models;

namespace TDMUAdmin.Areas.User.Controllers
{
    public class CauHoiController : Controller
    {

        DataClasses1DataContext db =new DataClasses1DataContext();
        // GET: User/CauHoi
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]

        public ActionResult Create()
        {
            if (Session["User"] == null || Session["User"].ToString() == "")
            {
                return RedirectToAction("Login", "Login");
            }
            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(CauHoi cauhoi, FormCollection f)
        {
            cauhoi.IDNguoiGui = f["nMssv"];
            cauhoi.TieuDe = f["sTieuDe"];
            cauhoi.NoiDung = f["sNoiDung"];
            cauhoi.NgayGui = Convert.ToDateTime(f["dNgayGui"]);
            cauhoi.GhiChu = f["sGhiChu"];
            db.CauHois.InsertOnSubmit(cauhoi);
            db.SubmitChanges();
            return RedirectToAction("Index", "Home");
        }
        

    }
}