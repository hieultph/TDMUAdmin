using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TDMUAdmin.Models
{
    public class MyMessage
    {
        public string ID { get; set; }
        public string TenNG { get; set; }
        public string IDNguoiGui { get; set; }
        public string IDNguoiNhan { get; set; }
        public string IDNhomNhan { get; set; }
        public string NoiDung { get; set; }
        public DateTime? NgayGui { get; set; }
        public int? DaXem { get; set; }
        public int? SoLuong { get; set; }
        public string ImagePath { get; set; }
    }
}