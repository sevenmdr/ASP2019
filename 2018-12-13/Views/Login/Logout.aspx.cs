using _2018_12_13.Comon;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _2018_12_13.Views.Login
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.SetCurrentUser(null);
            Response.Redirect("~/Views/Login/Login.aspx");
        }
    }
}