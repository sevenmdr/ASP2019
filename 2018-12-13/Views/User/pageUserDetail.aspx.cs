﻿using _2018_12_13.Comon;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _2018_12_13.Views.User
{
    public partial class pageUserDetail : WebPageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var v = Request.QueryString["id"];
            if (v != null)
            {
                ClientScript.RegisterStartupScript(GetType(), "hwa", "LoadDataUpdate()", true);
            }
        }
    }
}