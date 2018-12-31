using _2018_12_13.Comon;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _2018_12_13.Views.Searching
{
    public partial class Searching : WebPageBase
    {
        protected static string _SeachingText { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            var v = Request.QueryString["SeachingText"];
            if (v != null)
            {
                _SeachingText = v.ToString();
            }
            else
            {
                Response.Redirect("~/Error/index.html");
            }
        }
        [System.Web.Services.WebMethod]
        public static string LoadataDataCustomer(string keyword)
        {
            DataTable dt = new DataTable();
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                dt = confunc.ExecuteDataTable("[YYY_sp_Searching_List]", CommandType.StoredProcedure,
             "@searchText", SqlDbType.NVarChar, keyword);
            }
            if (dt != null)
            {
                return JsonConvert.SerializeObject(dt);
            }
            else
            {
                return "";
            }
        }
    }
}