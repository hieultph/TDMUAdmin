using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using TDMUAdmin.Models;

namespace TDMUAdmin.Models
{
    public class DataProvider
    {
        private static DataProvider _instance;
        public static DataProvider Instance
        {
            get
            {
                if (_instance == null) _instance = new DataProvider();
                return _instance;
            }
            set { _instance = value; }
        }
        public DataClasses1DataContext DB { get; set; }

        private DataProvider()
        {
            DB = new DataClasses1DataContext();

        }
    }
}