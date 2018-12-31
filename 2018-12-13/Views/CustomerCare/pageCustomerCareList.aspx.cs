using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _2018_12_13.Views.CustomerCare
{
    public partial class pageCustomerCareList : System.Web.UI.Page
    {


        protected static int CustomerID { get; set; }
        protected  int Type_Care { get; set; }
        protected object DataMain { get; set; }
        protected int AppID { get; set; }
        protected int MasterID { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.QueryString["CustomerID"]!=null)
            {
                var v = Request.QueryString["CustomerID"];
                var u = Request.QueryString["Type"];
                var appid = Request.QueryString["AppID"];
                var masterid = Request.QueryString["MasterID"];
                CustomerID = Convert.ToInt32(v == null ? "0" : v.ToString());
                Type_Care = Convert.ToInt32(u == null ? "6" : u.ToString());
                DataMain = Loadata(CustomerID).ToString();
                AppID = Convert.ToInt32(appid == null ? "0" : appid.ToString());
                MasterID = Convert.ToInt32(masterid == null ? "0" : masterid.ToString());
            }
        }
        public string Loadata(int CustomerID)
        {
            DataSet ds = new DataSet();
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {

                ds = confunc.ExecuteDataSet("[YYY_sp_CustomerCare_GetInfo]", CommandType.StoredProcedure,
                  "@Customer_ID", SqlDbType.Int, Convert.ToInt32(CustomerID == 0 ? 0 : CustomerID));
            }
            if (ds != null)
            {
                return JsonConvert.SerializeObject(ds, Formatting.Indented);
            }
            else
            {
                return "";
            }

        }
        [System.Web.Services.WebMethod]
        public static string LoadataCustomerCareList(int type)
        {
            DataTable dt = new DataTable();
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                dt = confunc.ExecuteDataTable("[YYY_sp_CustomerCare_LoadHistoryCare]", CommandType.StoredProcedure,
                  "@Customer_ID", SqlDbType.Int, CustomerID, "@Type", SqlDbType.Int, type);
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