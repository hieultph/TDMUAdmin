using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TDMUAdmin.Models
{
    public class MySession
    {
        public string IDBuoiHoc { get; set; }
        public DateTime? NgayDienRa {  get; set; }
        public DateTime? NgayKetThuc {  get; set; }
        public int NgayThu 
        {
            get 
            {
                var dayOfWeek = NgayDienRa.Value.DayOfWeek;

                switch (dayOfWeek)
                {
                    case DayOfWeek.Sunday:
                        return 8;
                    case DayOfWeek.Monday:
                        return 2;
                    case DayOfWeek.Tuesday:
                        return 3;
                    case DayOfWeek.Wednesday:
                        return 4;
                    case DayOfWeek.Thursday:
                        return 5;
                    case DayOfWeek.Friday:
                        return 6;
                    case DayOfWeek.Saturday:
                        return 7;
                    default:
                        return 0;
                }
            }
        }
        public string Phong { get; set; }
        public string IDMonHoc { get; set; }
        public string TenMonHoc { get; set; }
        public string IDNhomMonHoc { get; set; }
        public string IDGiangVien { get; set; }
        public string TenGiangVien { get; set; }
    }
}