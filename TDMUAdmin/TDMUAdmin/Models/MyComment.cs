using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TDMUAdmin.Models
{
    public class MyComment
    {
        public string ID { get; set; }
        public string IDCauHoi { get; set; }
        public string NoiDung { get; set; }
        public DateTime? NgayTraLoi { get; set; }
        public string TenNguoiTraLoi { get; set; }
        public string AnhNguoiTraLoi { get; set; }
    }
}