using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TDMUAdmin.Models;

namespace TDMUAdmin.Controllers
{
    public class TDMUWebsiteController : Controller
    {
        // GET: TDMUWebsite
        DataClasses1DataContext db = new DataClasses1DataContext();
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult LienHe()
        {
            return View();
        }

        public ActionResult Calendar()
        {
            return View();
        }

        public ActionResult timetable()
        {
            return View();
        }
    }
}