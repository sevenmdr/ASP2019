using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace _2018_12_13.Comon
{
    public partial class WebPageBase : System.Web.UI.Page
    {
        protected override void OnInit(EventArgs e)
        {
            if (Session.GetCurrentUser() == null)
            {
                Response.Redirect("~/Views/Login/Login.aspx");
            }
            base.OnInit(e);
        }
    }
}