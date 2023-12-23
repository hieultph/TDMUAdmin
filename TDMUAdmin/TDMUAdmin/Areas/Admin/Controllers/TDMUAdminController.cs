using PayPal.Api;
using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Web;
using System.Web.Compilation;
using System.Web.Mvc;
using System.Web.Services.Description;
using System.Web.UI.WebControls;
using TDMUAdmin.Models;
using TDMUWebsite.Models;

namespace TDMUAdmin.Areas.Admin.Controllers
{
    public class TDMUAdminController : Controller
    {
        // GET: TDMUAdmin
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

            return View();
        }

        public ActionResult NavPartial()
        {
            return PartialView();
        }

        public ActionResult SideBarPartial()
        {
            return PartialView();
        }

        public ActionResult FooterPartial()
        {
            return PartialView();
        }

        [ChildActionOnly]
        public ActionResult LoadChildMessage(string id)
        {
            var lstMessage = (from tk in DataProvider.Instance.DB.TaiKhoans
                              join tn in DataProvider.Instance.DB.TinNhans on tk.ID equals tn.IDTaiKhoan
                              join tngd in DataProvider.Instance.DB.TinNhan_GuiDens on tn.ID equals tngd.IDTinNhan into g
                              from m in g.DefaultIfEmpty()
                              where m.IDNguoiNhan == id
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
                              }).OrderByDescending(x => x.NgayGui).Take(4).ToList();

            return PartialView("LoadChildMessage", lstMessage);
        }

        [ChildActionOnly]
        public ActionResult LoadChildNotify(string id)
        {
            var lstNotify = (from tb in DataProvider.Instance.DB.ThongBaos
                             join ltb in DataProvider.Instance.DB.LoaiThongBaos on tb.IDLoaiThongBao equals ltb.ID
                             join tbncs in DataProvider.Instance.DB.ThongBao_NguoiChinhSuas on tb.ID equals tbncs.IDThongBao
                             join tbnn in DataProvider.Instance.DB.ThongBao_NguoiNhans on tb.ID equals tbnn.IDThongBao
                             join tk in DataProvider.Instance.DB.TaiKhoans on tbnn.IDNguoiNhan equals tk.ID
                             where tbnn.IDNguoiNhan == id
                             group new { tb, ltb, tbncs, tbnn, tk } by tb.ID into g
                             select new MyNotify
                             {
                                 ID = g.First().tb.ID,
                                 IDNguoiGui = g.OrderBy(item => item.tbncs.NgayChinhSua).First().tbncs.IDNguoiChinhSua,
                                 TenNguoiGui = g.OrderBy(item => item.tbncs.NgayChinhSua).First().tk.HoTen,
                                 IDNguoiNhan = g.First().tbnn.IDNguoiNhan,
                                 NgayGui = g.OrderBy(item => item.tbncs.NgayChinhSua).First().tbncs.NgayChinhSua,
                                 IDLoaiThongBao = g.First().tb.IDLoaiThongBao,
                                 TenLoaiThongBao = g.First().ltb.Ten,
                                 CapDo = g.First().ltb.CapDo,
                                 TieuDe = g.First().tb.TieuDe,
                                 NoiDung = g.First().tb.NoiDung,
                             }).OrderByDescending(d => d.NgayGui).Take(4).ToList();

            return PartialView(lstNotify);
        }

        public ActionResult FailureView()
        {
            return View();
        }

        public ActionResult SuccessView()
        {
            return View();
        }

        public ActionResult PaymentWithPaypal(string Cancel = null)
        {
            //getting the apiContext  
            APIContext apiContext = PaypalConfiguration.GetAPIContext();
            try
            {
                //A resource representing a Payer that funds a payment Payment Method as paypal  
                //Payer Id will be returned when payment proceeds or click to pay  
                string payerId = Request.Params["PayerID"];
                if (string.IsNullOrEmpty(payerId))
                {
                    //this section will be executed first because PayerID doesn't exist  
                    //it is returned by the create function call of the payment class  
                    // Creating a payment  
                    // baseURL is the url on which paypal sendsback the data.  
                    string baseURI = Request.Url.Scheme + "://" + Request.Url.Authority + "/Admin/TDMUAdmin/PaymentWithPayPal?";
                    //here we are generating guid for storing the paymentID received in session  
                    //which will be used in the payment execution  
                    var guid = Convert.ToString((new Random()).Next(100000));
                    //CreatePayment function gives us the payment approval url  
                    //on which payer is redirected for paypal account payment  
                    var createdPayment = this.CreatePayment(apiContext, baseURI + "guid=" + guid);
                    //get links returned from paypal in response to Create function call  
                    var links = createdPayment.links.GetEnumerator();
                    string paypalRedirectUrl = null;
                    while (links.MoveNext())
                    {
                        Links lnk = links.Current;
                        if (lnk.rel.ToLower().Trim().Equals("approval_url"))
                        {
                            //saving the payapalredirect URL to which user will be redirected for payment  
                            paypalRedirectUrl = lnk.href;
                        }
                    }
                    // saving the paymentID in the key guid  
                    Session.Add(guid, createdPayment.id);
                    return Redirect(paypalRedirectUrl);
                }
                else
                {
                    // This function exectues after receving all parameters for the payment  
                    var guid = Request.Params["guid"];
                    var executedPayment = ExecutePayment(apiContext, payerId, Session[guid] as string);
                    //If executed payment failed then we will show payment failure message to user  
                    if (executedPayment.state.ToLower() != "approved")
                    {
                        return View("FailureView");
                    }
                }
            }
            catch (Exception ex)
            {
                return View("FailureView");
            }
            //on successful payment, show success page to user.  
            return View("SuccessView");
        }
        private PayPal.Api.Payment payment;
        private Payment ExecutePayment(APIContext apiContext, string payerId, string paymentId)
        {
            var paymentExecution = new PaymentExecution()
            {
                payer_id = payerId
            };
            this.payment = new Payment()
            {
                id = paymentId
            };
            return this.payment.Execute(apiContext, paymentExecution);
        }
        private Payment CreatePayment(APIContext apiContext, string redirectUrl)
        {
            //create itemlist and add item objects to it  
            //var itemlist = new itemlist()
            //{
            //    items = new list<item>()
            //};

            //Adding Item Details like name, currency, price etc  
            //itemList.items.Add(new Item()
            //{
            //    name = "Item Name comes here",
            //    currency = "USD",
            //    price = "1",
            //    quantity = "1",
            //    sku = "sku"
            //});

            var payer = new Payer()
            {
                payment_method = "paypal"
            };
            // Configure Redirect Urls here with RedirectUrls object  
            var redirUrls = new RedirectUrls()
            {
                cancel_url = redirectUrl + "&Cancel=true",
                return_url = redirectUrl
            };

            // Adding Tax, shipping and Subtotal details  
            var details = new Details()
            {
                tax = "1",
                shipping = "1",
                subtotal = "1"
            };

            //Final amount with details  
            var amount = new Amount()
            {
                currency = "USD",
                total = "3", // Total must be equal to sum of tax, shipping and subtotal.  
                details = details
            };

            var transactionList = new List<Transaction>();
            // Adding description about the transaction  
            var paypalOrderId = DateTime.Now.Ticks;

            transactionList.Add(new Transaction()
            {
                description = $"Invoice #{paypalOrderId}",
                invoice_number = paypalOrderId.ToString(), //Generate an Invoice No    
                amount = amount,
                //item_list = itemList
            });

            this.payment = new Payment()
            {
                intent = "sale",
                payer = payer,
                transactions = transactionList,
                redirect_urls = redirUrls
            };
            // Create a payment using a APIContext  
            return this.payment.Create(apiContext);
        }

    }
}