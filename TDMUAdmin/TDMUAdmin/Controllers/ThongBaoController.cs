using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TDMUAdmin.Models;

namespace TDMUAdmin.Areas.User.Controllers
{
    public class ThongBaoController : Controller
    {
        DataClasses1DataContext db = new DataClasses1DataContext();

        private List<ThongBao> Lay(string count)
        {
            return db.ThongBaos.OrderByDescending(a => a.ID).Take(Convert.ToInt32(count)).ToList();
        }


        // GET: User/ThongBao
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult ThongBao()
        {
            var listBaiViet = Lay(Convert.ToString(5));
            return View(listBaiViet);
        }

        public ActionResult ChiTiet(string id)
        {
            var tt = from s in db.ThongBaos where s.ID == id select s;
            return View(tt.Single());
        }
    }
}