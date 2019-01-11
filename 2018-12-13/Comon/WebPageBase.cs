using System;
using System.Collections.Generic;
using System.IO;
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
            string pageName = Path.GetFileNameWithoutExtension(Page.AppRelativeVirtualPath);


            base.OnInit(e);
        }
    }

    
}