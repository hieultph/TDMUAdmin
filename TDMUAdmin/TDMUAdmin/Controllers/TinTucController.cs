using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.WebPages;
using TDMUAdmin.Models;

namespace TDMUAdmin.Areas.User.Controllers
{
    public class TinTucController : Controller
    {
        DataClasses1DataContext db = new DataClasses1DataContext();

        private List<BaiViet> Lay(string count)
        {
            return db.BaiViets.OrderByDescending(a => a.ID).Take(Convert.ToInt32(count)).ToList();
        }


        public ActionResult Index()
        {
            //var listBaiViet = Lay(Convert.ToString(4));
            return View();
        }

        public ActionResult TinTuc()
        {
            var listBaiViet = Lay(Convert.ToString(4));
            return View(listBaiViet);
        }

        public ActionResult ChiTiet(string id)
        {
            var tt = from s in db.BaiViets where s.ID == id select s;
            return View(tt.Single());
        }
    }
}