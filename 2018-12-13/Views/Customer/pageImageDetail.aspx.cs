using _2018_12_13.Comon;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _2018_12_13.Views.Customer
{
    public partial class pageImageDetail : WebPageBase
    {
        public static string _urlImage { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            var urlImg = Request.QueryString["urlImage"];

            if (urlImg != null)
            {
                _urlImage = urlImg.ToString();              
            }
            else
            {
                _urlImage = null;
                Response.Redirect("~/Error/index.html");
            }
        }

       
    }
}