using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _2018_12_13.Views.Customer
{
    public partial class pageImageNewFolder : System.Web.UI.Page
    {
        public static string _CustomerID { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            var cus = Request.QueryString["CustomerID"];

            if (cus != null)
            {
                _CustomerID = cus.ToString();
            }
            else
            {
                _CustomerID = null;
                Response.Redirect("~/Error/index.html");
            }
        }
        [System.Web.Services.WebMethod]
        public static string ExcuteData(string data)
        {
            try
            {
                FolderName DataMain = JsonConvert.DeserializeObject<FolderName>(data);
                if(Comon.Comon.CheckDirectoryFTP(_CustomerID ,DataMain.Content))
                {
                    return "1";
                }
                else return "0";
            }
            catch (Exception ex)
            {
                return "0";
            }


        }
    }
    public class FolderName
    {
        public string Content { get; set; }


    }
}