using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace _2018_12_13.Comon
{
    public static class Global
    {
        public static int sys_userid { get; set; }
        public static int sys_branchID { get; set; }
        public static int sys_employeeid { get; set; }
        public static string sys_ServerImageFolder = @"ftp://118.69.76.165/ImageJarim/";
        public static string sys_ServerImageUserName = "thong";
        public static string sys_ServerImagePassword = "Abc@123456";
        public static string sys_HTTPImageRoot = @"http://118.69.76.165:8015/Image/";
        public static string sys_branchCode = "JAM";
        public static string sys_CompanyName = "Viện thẩm mỹ Jarim";
        public static string sys_CompanyAddress = " 6B Phạm Đình Toái - Phường 6 - Quận 3 - HCM";
        public static string sys_hotline = "19002162";
        public static string sys_CodePayment = "PT";
        public static string sys_SMSRemind { get; set; }
        public static void Initalize()
        {
            sys_userid = 1;
            sys_employeeid = 1;
            sys_branchID = 1;
            sys_SMSRemind = "JaRim kính chào quý khách {0}";
        }



    }
}