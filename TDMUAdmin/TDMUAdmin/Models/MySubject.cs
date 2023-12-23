using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TDMUAdmin.Models
{
    public class MySubject
    {
        public string ID { get; set; }
        public string IDHocKy { get; set; }
        public string HocKy { get; set; }
        public string IDNamHoc { get; set; }
        public string NamHoc { get; set; }
        public string Ten { get; set; }
        public double? DGK { get; set; }
        public double? DCK { get; set; }
        public double? DTB
        {
            get { return (DGK + DCK) / 2; }
        }
        public int? SoTC { get; set; }
    }
}