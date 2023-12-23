using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TDMUAdmin.Models
{
    public class MyChildComment
    {
        public string ID { get; set; }
        public string IDCauHoi_NguoiTraLoi { get; set; }
        public string TenNguoiTraLoi { get; set; }
        public DateTime? NgayTraLoi { get; set; }
        public string NoiDung { get; set; }
        public string AnhNguoiTraLoi { get; set; }
    }
}