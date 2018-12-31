using _2018_12_13.Comon;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _2018_12_13.Views.User
{
    public partial class pageLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.SetCurrentUser(new UserLogin()
            {
                UserName = "1",
                Password = "1"
            });
            Response.Redirect("~/Views/Customer/MainCustomer.aspx?CustomerID=1");
        }
    }
}