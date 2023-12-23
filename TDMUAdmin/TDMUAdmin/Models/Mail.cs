using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TDMUAdmin.Models
{
    public class Mail
    {
        public string From { get; set; }
        public string To { get; set; }
        public string Subject { get; set; }
        public string Notes { get; set; }
        public string Atttachment { get; set; }

        public Mail() { }
    }
}