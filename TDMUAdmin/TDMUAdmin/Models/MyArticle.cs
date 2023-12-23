using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TDMUAdmin.Models
{
    public class MyArticle
    {
        public string ID { get; set; }
        public string IDTLBaiViet { get; set; }
        public string IDNguoiDang {  get; set; }
        public string NguoiDang { get; set; }
        public string IDNguoiChinhSua { get; set; }
        public string NguoiChinhSua { get; set; }
        public string TenTheLoai {  get; set; }
        public string TieuDe { get; set; }
        public string NoiDung { get; set; } 
        public string GhiChu { get; set; }
        public DateTime? NgayDang { get; set; }
        public DateTime? NgayChinhSua { get; set; }

    }
}