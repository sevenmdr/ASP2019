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
    public partial class pageScheduleList : WebPageBase
    {
        protected static string CustomerID { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            var v = Request.QueryString["CustomerID"];
            if (v != null)
            {
                CustomerID = v.ToString();
            }
            else
            {
                Response.Redirect("~/Error/index.html");
            }
        }

        [System.Web.Services.WebMethod]
        public static string Loadata()
        {
            DataTable dt = new DataTable();
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                dt = confunc.ExecuteDataTable("[YYY_sp_Customer_Schedule_LoadList]", CommandType.StoredProcedure,
                  "@Customer_ID", SqlDbType.Int, CustomerID, "@UserId", SqlDbType.Int, 0);
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
        [System.Web.Services.WebMethod]
        public static string DeleteItem(int id)
        {
            using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
            {
                connFunc.ExecuteDataTable("[YYY_sp_Customer_Schedule_Delete]", CommandType.StoredProcedure,
                    "@CurrentID", SqlDbType.Int, id,
                     "@Datenow", SqlDbType.DateTime, Comon.Comon.GetDateTimeNow(),
                        "@userID", SqlDbType.Int, Comon.Global.sys_userid
                );
            }
            return "";
        }
    }
}