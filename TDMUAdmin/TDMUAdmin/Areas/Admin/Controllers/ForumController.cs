using PayPal.Api;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Mvc;
using TDMUWebsite.Models;

using PagedList;
using PagedList.Mvc;
using System.Web.UI;
using TDMUAdmin.Models;

namespace TDMUAdmin.Areas.Admin.Controllers
{
    public class ForumController : Controller
    {
        // GET: Forum
        public ActionResult Index(int? page, string topic = null, string filter = null)
        {
            // Init parameters for PageList
            int iSize = 4;
            int iPageNumber = (page ?? 1);

            // Check the user has login or not
            if (Session["taikhoan"] == null || Session["taikhoan"].ToString() == "")
            {
                return RedirectToAction("login", "user", new { url = Request.Url.ToString() });
            }

            // Check the level permition
            var acc_log = (TaiKhoan)Session["TaiKhoan"];
            ViewBag.AccessLevel = DataProvider.Instance.DB.QuyenTruyCaps.Where(item => item.ID == acc_log.IDQuyenTruyCap).FirstOrDefault().CapDo;

            var selectedTopic = string.IsNullOrEmpty(topic) ? "TatCa" : topic;
            var selectedFilter = string.IsNullOrEmpty(filter) ? "TatCa" : filter;

            var questions = (from ch in DataProvider.Instance.DB.CauHois
                             join tk in DataProvider.Instance.DB.TaiKhoans on ch.IDNguoiGui equals tk.ID
                             join ch_cdch in DataProvider.Instance.DB.CauHoi_ChuDeCauHois on ch.ID equals ch_cdch.IDCauHoi
                             join cdch in DataProvider.Instance.DB.ChuDeCauHois on ch_cdch.IDChuDeCauHoi equals cdch.ID
                             where ch.DuocDuyet == 1
                             select new MyQuestion
                             {
                                 IDCauHoi = ch.ID,
                                 TieuDe = ch.TieuDe,
                                 NoiDung = ch.NoiDung,
                                 IDChuDe = cdch.ID,
                                 ChuDe = cdch.Ten,
                                 NguoiDang = tk.HoTen,
                                 NgayDang = ch.NgayGui,
                             }).ToList();

            // Filter part for topic and filter, according to the parameters
            if (selectedTopic != "TatCa")
            {
                questions = questions.Where(item => item.IDChuDe == selectedTopic).ToList();
            }

            if (selectedFilter != "TatCa")
            {
                switch (selectedFilter)
                {
                    case "LuotThich":
                        questions = questions.OrderByDescending(item => item.LuotThich).ToList();
                        break;
                    case "LuotKhongThich":
                        questions = questions.OrderByDescending(item => item.LuotKhongThich).ToList();
                        break;
                    case "LuotTraLoi":
                        questions = questions.OrderByDescending(item => item.LuotTraLoi).ToList();
                        break;
                        // Add more cases for other filters if needed
                }
            }

            // Create a dropdown list for topics
            var topicList = new List<SelectListItem>();
            foreach(var item in DataProvider.Instance.DB.ChuDeCauHois)
            {
                topicList.Add(new SelectListItem { Value = item.ID, Text = item.Ten });
            }
            topicList.Add(new SelectListItem { Value = "TatCa", Text = "Tất cả" });

            // Create a dropdown list for filter
            var filterList = new List<SelectListItem>()
            {
                new SelectListItem { Value = "LuotThich", Text = "Lượt thích" },
                new SelectListItem { Value = "LuotKhongThich", Text = "Lượt không thích" },
                new SelectListItem { Value = "LuotTraLoi", Text = "Lượt trả lời" },
                new SelectListItem { Value = "TatCa", Text = "Tất cả" },
            };

            // Using ViewBag to bring our dropdown list into view
            ViewBag.FilterList = filterList.Select(item => new SelectListItem
            {
                Text = item.Text,
                Value = item.Value,
                Selected = item.Value == selectedFilter // Set the selected value
            }).ToList();

            ViewBag.TopicList = topicList.Select(item => new SelectListItem
            {
                Text = item.Text,
                Value = item.Value,
                Selected = item.Value == selectedTopic // Set the selected value
            }).ToList();

            return View(questions.ToPagedList( iPageNumber, iSize ));
        }

        public ActionResult Sidebar(int? accessLevel)
        {
            var questions = (from ch in DataProvider.Instance.DB.CauHois
                             join tk in DataProvider.Instance.DB.TaiKhoans on ch.IDNguoiGui equals tk.ID
                             join ch_cdch in DataProvider.Instance.DB.CauHoi_ChuDeCauHois on ch.ID equals ch_cdch.IDCauHoi
                             join cdch in DataProvider.Instance.DB.ChuDeCauHois on ch_cdch.IDChuDeCauHoi equals cdch.ID
                             where ch.DuocDuyet == 1
                             select new MyQuestion
                             {
                                 IDCauHoi = ch.ID,
                                 TieuDe = ch.TieuDe,
                                 NoiDung = ch.NoiDung,
                                 ChuDe = cdch.Ten,
                                 NguoiDang = tk.HoTen,
                                 NgayDang = ch.NgayGui,
                             }).OrderByDescending(item => item.NgayDang).ToList().Take(4);

            ViewBag.Topics = DataProvider.Instance.DB.ChuDeCauHois.Count();
            ViewBag.Posts = DataProvider.Instance.DB.CauHois.Where(item => item.DuocDuyet == 1).Count();
            ViewBag.Members = DataProvider.Instance.DB.TaiKhoans.Count();
            ViewBag.AccessLevel = accessLevel;

            return PartialView(questions);
        }

        [HttpGet]
        public ActionResult Create()
        {
            // Check the user has login or not
            if (Session["taikhoan"] == null || Session["taikhoan"].ToString() == "")
            {
                return RedirectToAction("login", "user", new { url = Request.Url.ToString() });
            }

            // Check the level permition
            var acc_log = (TaiKhoan)Session["TaiKhoan"];
            ViewBag.AccessLevel = DataProvider.Instance.DB.QuyenTruyCaps.Where(item => item.ID == acc_log.IDQuyenTruyCap).FirstOrDefault().CapDo;

            ViewBag.MaCDCH = new SelectList(DataProvider.Instance.DB.ChuDeCauHois, "ID", "Ten");
            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Create(FormCollection f)
        {
            var tk = (TaiKhoan)Session["TaiKhoan"];

            var question = new CauHoi();
            var topic_question = new CauHoi_ChuDeCauHoi();

            if (ModelState.IsValid)
            {
                question.ID = GenerateNextIDForQuestion();
                question.IDNguoiGui = tk.ID;
                question.TieuDe = f["sTieuDe"];
                question.NoiDung = f["sNoiDung"];
                question.GhiChu = f["sGhiChu"];
                question.NgayGui = DateTime.Now;
                question.DuocDuyet = 0;

                DataProvider.Instance.DB.CauHois.InsertOnSubmit(question);
                DataProvider.Instance.DB.SubmitChanges();

                var latestQuestion = DataProvider.Instance.DB.CauHois.OrderByDescending(x => x.ID).FirstOrDefault();

                if (latestQuestion != null)
                {
                    topic_question.ID = GenerateNextIDForTopicQuestion();
                    topic_question.IDCauHoi = latestQuestion.ID;
                    topic_question.IDChuDeCauHoi = f["MaCDCH"];

                    DataProvider.Instance.DB.CauHoi_ChuDeCauHois.InsertOnSubmit(topic_question);
                    DataProvider.Instance.DB.SubmitChanges();

                    return RedirectToAction("Index");
                }
            }

            return View();
        }

        [HttpGet]
        public ActionResult Details(string maCH = null)
        {
            // Check the user has login or not
            if (Session["taikhoan"] == null || Session["taikhoan"].ToString() == "")
            {
                return RedirectToAction("login", "user", new { url = Request.Url.ToString() });
            }

            // Check the level permition
            var acc_log = (TaiKhoan)Session["TaiKhoan"];
            ViewBag.AccessLevel = DataProvider.Instance.DB.QuyenTruyCaps.Where(item => item.ID == acc_log.IDQuyenTruyCap).FirstOrDefault().CapDo;

            var question = (from ch in DataProvider.Instance.DB.CauHois
                            join tk in DataProvider.Instance.DB.TaiKhoans on ch.IDNguoiGui equals tk.ID
                            join ch_cdch in DataProvider.Instance.DB.CauHoi_ChuDeCauHois on ch.ID equals ch_cdch.IDCauHoi
                            join cdch in DataProvider.Instance.DB.ChuDeCauHois on ch_cdch.IDChuDeCauHoi equals cdch.ID
                            where ch.ID == maCH
                            select new MyQuestion
                            {
                                IDCauHoi = ch.ID,
                                TieuDe = ch.TieuDe,
                                NoiDung = ch.NoiDung,
                                GhiChu = ch.GhiChu,
                                NguoiDang = tk.HoTen,
                                NgayDang = ch.NgayGui,
                                ChuDe = cdch.Ten,
                                AnhNguoiDang = tk.ImagePath,
                            }).FirstOrDefault();

            return View(question);
        }

        public ActionResult ApprovalForQuestion(int? page, string topic = null, string filter = null)
        {
            // Check the user has login or not
            if (Session["taikhoan"] == null || Session["taikhoan"].ToString() == "")
            {
                return RedirectToAction("login", "user", new { url = Request.Url.ToString() });
            }

            // Check the level permition
            var acc_log = (TaiKhoan)Session["TaiKhoan"];
            ViewBag.AccessLevel = DataProvider.Instance.DB.QuyenTruyCaps.Where(item => item.ID == acc_log.IDQuyenTruyCap).FirstOrDefault().CapDo;

            // Init parameters for PageList
            int iSize = 4;
            int iPageNumber = (page ?? 1);

            var selectedTopic = string.IsNullOrEmpty(topic) ? "TatCa" : topic;
            var selectedFilter = string.IsNullOrEmpty(filter) ? "TatCa" : filter;

            var questions = (from ch in DataProvider.Instance.DB.CauHois
                             join tk in DataProvider.Instance.DB.TaiKhoans on ch.IDNguoiGui equals tk.ID
                             join ch_cdch in DataProvider.Instance.DB.CauHoi_ChuDeCauHois on ch.ID equals ch_cdch.IDCauHoi
                             join cdch in DataProvider.Instance.DB.ChuDeCauHois on ch_cdch.IDChuDeCauHoi equals cdch.ID
                             where ch.DuocDuyet == 0
                             select new MyQuestion
                             {
                                 IDCauHoi = ch.ID,
                                 TieuDe = ch.TieuDe,
                                 NoiDung = ch.NoiDung,
                                 IDChuDe = cdch.ID,
                                 ChuDe = cdch.Ten,
                                 NguoiDang = tk.HoTen,
                                 NgayDang = ch.NgayGui,
                             }).ToList();

            // Filter part for topic and filter, according to the parameters
            if (selectedTopic != "TatCa")
            {
                questions = questions.Where(item => item.IDChuDe == selectedTopic).ToList();
            }

            if (selectedFilter != "TatCa")
            {
                switch (selectedFilter)
                {
                    case "LuotThich":
                        questions = questions.OrderByDescending(item => item.LuotThich).ToList();
                        break;
                    case "LuotKhongThich":
                        questions = questions.OrderByDescending(item => item.LuotKhongThich).ToList();
                        break;
                    case "LuotTraLoi":
                        questions = questions.OrderByDescending(item => item.LuotTraLoi).ToList();
                        break;
                        // Add more cases for other filters if needed
                }
            }

            // Create a dropdown list for topics
            var topicList = new List<SelectListItem>();
            foreach (var item in DataProvider.Instance.DB.ChuDeCauHois)
            {
                topicList.Add(new SelectListItem { Value = item.ID, Text = item.Ten });
            }
            topicList.Add(new SelectListItem { Value = "TatCa", Text = "Tất cả" });

            // Create a dropdown list for filter
            var filterList = new List<SelectListItem>()
            {
                new SelectListItem { Value = "LuotThich", Text = "Lượt thích" },
                new SelectListItem { Value = "LuotKhongThich", Text = "Lượt không thích" },
                new SelectListItem { Value = "LuotTraLoi", Text = "Lượt trả lời" },
                new SelectListItem { Value = "TatCa", Text = "Tất cả" },
            };

            // Using ViewBag to bring our dropdown list into view
            ViewBag.FilterList = filterList.Select(item => new SelectListItem
            {
                Text = item.Text,
                Value = item.Value,
                Selected = item.Value == selectedFilter // Set the selected value
            }).ToList();

            ViewBag.TopicList = topicList.Select(item => new SelectListItem
            {
                Text = item.Text,
                Value = item.Value,
                Selected = item.Value == selectedTopic // Set the selected value
            }).ToList();

            return View(questions.ToPagedList( iPageNumber, iSize ) );
        }

        [HttpPost]
        public ActionResult ApproveQuestion(string maCH)
        {
            try
            {
                var question = DataProvider.Instance.DB.CauHois.Where(item => item.ID == maCH).FirstOrDefault();
                if (question != null)
                {
                    question.DuocDuyet = 1;
                    DataProvider.Instance.DB.SubmitChanges();

                    // You can return something if necessary
                    return Json(new { code = 200, msg = "Phê duyệt câu hỏi thành công." }, JsonRequestBehavior.AllowGet);
                }

                return Json(new { code = 500, msg = "Phê duyệt câu hỏi thất bại." }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { code = 500, msg = "Phê duyệt câu hỏi thất bại. Lỗi " + ex.Message }, JsonRequestBehavior.AllowGet);
            }
            
        }

        [HttpPost]
        public ActionResult DenyQuestion(string maCH)
        {
            try
            {
                // Delete foreign key in other table first
                var topic_question = DataProvider.Instance.DB.CauHoi_ChuDeCauHois.Where(item => item.IDCauHoi == maCH).ToList();
                if (topic_question != null)
                {
                    DataProvider.Instance.DB.CauHoi_ChuDeCauHois.DeleteAllOnSubmit(topic_question);
                    DataProvider.Instance.DB.SubmitChanges();

                    // Delete the main table
                    var question = DataProvider.Instance.DB.CauHois.Where(item => item.ID == maCH).FirstOrDefault();
                    if (question != null)
                    {
                        DataProvider.Instance.DB.CauHois.DeleteOnSubmit(question);
                        DataProvider.Instance.DB.SubmitChanges();
                        return Json(new { code = 200, msg = "Xóa câu hỏi thành công." }, JsonRequestBehavior.AllowGet);
                    }
                }

                return Json(new { code = 500, msg = "Xóa câu hỏi thất bại." }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                return Json(new { code = 500, msg = "Xóa câu hỏi thất bại. Lỗi " + ex.Message }, JsonRequestBehavior.AllowGet);
            }

        }


        [HttpGet]
        public ActionResult CommentPartial(string maCH)
        {
            ViewBag.MaCH = maCH;
            return PartialView();
        }

        [HttpPost]
        public ActionResult CommentPartial(FormCollection f)
        {
            var tk = (TaiKhoan)Session["TaiKhoan"];

            var response = new CauHoi_NguoiTraLoi();

            if (ModelState.IsValid)
            {
                response.IDCauHoi = f["sMaCH"];
                response.IDNguoiTraLoi = tk.ID;
                response.NoiDung = f["sBinhLuan"];
                response.NgayTraLoi = DateTime.Now;

                DataProvider.Instance.DB.CauHoi_NguoiTraLois.InsertOnSubmit(response);
                DataProvider.Instance.DB.SubmitChanges();

                return RedirectToAction("Details", "Forum", new { maCH = f["sMaCH"] });
            }

            return PartialView();
        }

        public ActionResult LoadComment(string maCH = null)
        {
            var comments = (from ch in DataProvider.Instance.DB.CauHois
                            join ch_ntl in DataProvider.Instance.DB.CauHoi_NguoiTraLois on ch.ID equals ch_ntl.IDCauHoi
                            join tk in DataProvider.Instance.DB.TaiKhoans on ch_ntl.IDNguoiTraLoi equals tk.ID
                            where ch.ID == maCH
                            select new MyComment
                            {
                                IDCauHoi = ch.ID,
                                ID = ch_ntl.ID,
                                NoiDung = ch_ntl.NoiDung,
                                NgayTraLoi = ch_ntl.NgayTraLoi,
                                TenNguoiTraLoi = tk.HoTen,
                                AnhNguoiTraLoi = tk.ImagePath,
                            }).ToList();

            return PartialView(comments);
        }

        public ActionResult LoadChildComment(string maCH_NTL = null)
        {
            var childs = (from ch_ntl in DataProvider.Instance.DB.CauHoi_NguoiTraLois
                          join ch_ntl_ntl in DataProvider.Instance.DB.CauHoi_NguoiTraLoi_NguoiTraLois on ch_ntl.ID equals ch_ntl_ntl.IDCauHoi_NguoiTraLoi
                          join tk in DataProvider.Instance.DB.TaiKhoans on ch_ntl_ntl.IDNguoiTraLoi equals tk.ID
                          where ch_ntl.ID == maCH_NTL
                          select new MyChildComment
                          {
                              ID = ch_ntl_ntl.ID,
                              IDCauHoi_NguoiTraLoi = ch_ntl.ID,
                              NoiDung = ch_ntl_ntl.NoiDung,
                              NgayTraLoi = ch_ntl_ntl.NgayTraLoi,
                              TenNguoiTraLoi = tk.HoTen,
                              AnhNguoiTraLoi = tk.ImagePath,
                          }).ToList();

            return PartialView(childs);
        }

        public string GenerateNextIDForQuestion()
        {
            var question = DataProvider.Instance.DB.CauHois.OrderByDescending(item => item.ID).FirstOrDefault();
            string numericPart = question.ID.Substring(3); // Extract the numeric part, from position thirth
            int numericValue = int.Parse(numericPart); // Convert the numeric part to an integer
            numericValue++; // Increment the value
            string nextNumericPart = numericValue.ToString("D10"); // Format it back to a string with leading zeros

            // Generate the next ID by combining the prefix and the new numeric part
            string nextID = $"CH{nextNumericPart}";

            return nextID;
        }

        public string GenerateNextIDForTopicQuestion()
        {
            var topic_question = DataProvider.Instance.DB.CauHoi_ChuDeCauHois.OrderByDescending(item => item.ID).FirstOrDefault();
            string numericPart = topic_question.ID.Substring(8); // Extract the numeric part, from position thirth
            int numericValue = int.Parse(numericPart); // Convert the numeric part to an integer
            numericValue++; // Increment the value
            string nextNumericPart = numericValue.ToString("D10"); // Format it back to a string with leading zeros

            // Generate the next ID by combining the prefix and the new numeric part
            string nextID = $"CH_CDCH{nextNumericPart}";

            return nextID;
        }
    }
}