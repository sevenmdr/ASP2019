﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _2018_12_13.Master
{
    public partial class _1_LeftNar : System.Web.UI.MasterPage
    {
        public static string _circleAvatar { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            Comon.Global.Initalize();
            if (Comon.Global.sys_userAvatar == "")
                _circleAvatar = Comon.Global.sys_DefaultAvatar;
            else
                _circleAvatar = Comon.Global.sys_userAvatar;
        }
    }
}