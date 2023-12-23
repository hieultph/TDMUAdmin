using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TDMUAdmin.Models
{
    public class MyParticipantOfArticle
    {
        public string ID { get; set; }
        public string TieuDe { get; set; }
        public string IDNguoiThamGia { get; set; }
        public string TenNguoiThamGia { get; set; }
        public string IDKhoa { get; set; }
        public string TenKhoa { get; set; }
        public string IDLop {  get; set; }
        public string TenLop { get; set; }
        public DateTime? NgayDangKy { get; set; }
    }
}