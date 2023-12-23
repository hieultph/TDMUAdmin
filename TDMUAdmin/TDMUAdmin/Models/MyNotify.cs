using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TDMUAdmin.Models
{
    public class MyNotify
    {
        public string ID { get; set; }
        public string IDNguoiGui { get; set; }
        public string TenNguoiGui { get; set; }
        public DateTime? NgayGui { get; set; }
        public string IDNguoiChinhSua { get; set; }
        public string TenNguoiChinhSua { get; set; }
        public DateTime? NgayChinhSua { get; set; }
        public string IDNguoiNhan { get; set; }
        public string TenNguoiNhan { get; set; }
        public string IDLoaiThongBao { get; set; }
        public string TenLoaiThongBao { get; set; }
        public int? CapDo { get; set; }
        public string TieuDe { get; set; }
        public string NoiDung { get; set; }
        public string GhiChu { get; set; }
    }
}