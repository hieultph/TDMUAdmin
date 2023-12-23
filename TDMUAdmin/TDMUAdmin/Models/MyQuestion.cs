using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TDMUAdmin.Models
{
    public class MyQuestion
    {
        public string IDCauHoi { get; set; }
        public string TieuDe { get; set; }
        public string NoiDung { get; set; }
        public string IDChuDe { get; set; }
        public string ChuDe { get; set; }
        public string NguoiDang { get; set; }
        public string AnhNguoiDang { get; set; }
        public DateTime? NgayDang { get; set; }
        public int? LuotThich 
        {
            get
            {
                var liker = (from ch in DataProvider.Instance.DB.CauHois
                             join ch_ndg in DataProvider.Instance.DB.CauHoi_NguoiDanhGias on ch.ID equals ch_ndg.IDCauHoi
                             where ch.ID == IDCauHoi && ch_ndg.HuuIch == 1 
                             select ch).ToList();
                return liker.Count();
            }
        }
        public int? LuotKhongThich
        {
            get
            {
                var liker = (from ch in DataProvider.Instance.DB.CauHois
                             join ch_ndg in DataProvider.Instance.DB.CauHoi_NguoiDanhGias on ch.ID equals ch_ndg.IDCauHoi
                             where ch.ID == IDCauHoi && ch_ndg.HuuIch == 0
                             select ch).ToList();
                return liker.Count();
            }
        }
        public int? LuotTraLoi
        {
            get
            {
                var answers = (from ch in DataProvider.Instance.DB.CauHois
                             join ch_ntl in DataProvider.Instance.DB.CauHoi_NguoiTraLois on ch.ID equals ch_ntl.IDCauHoi
                             where ch.ID == IDCauHoi
                             select ch_ntl).ToList();

                if (answers.Count > 0)
                {
                    var childs = (from ch_ntl in DataProvider.Instance.DB.CauHoi_NguoiTraLois
                                  join ch_ntl_ntl in DataProvider.Instance.DB.CauHoi_NguoiTraLoi_NguoiTraLois on ch_ntl.ID equals ch_ntl_ntl.IDCauHoi_NguoiTraLoi
                                  where ch_ntl.ID == answers.FirstOrDefault().ID
                                  select ch_ntl_ntl).ToList();

                    return answers.Count() + childs.Count();
                }

                return answers.Count();
            }
        }

        public int? DuocDuyet { get; set; }
        public string GhiChu { get; set; }
    }
}