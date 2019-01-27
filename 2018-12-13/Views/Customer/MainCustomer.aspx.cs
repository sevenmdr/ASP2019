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
    public partial class MainCustomer : WebPageBase
    {
        public static string CustomerID { get; set; }
        public static string CustName { get; set; }
        public static string CustCode { get; set; }
        public static string Phone { get; set; }
        public static string Avatar { get; set; }
        public static string defaultAvatar { get; set; }

        public static string facebookurl { get; set; }
        public static string instgramurl { get; set; }


        public static string totalmoneyRaise { get; set; }

        public static string totalmoneyPaid { get; set; }

        public static string totalmoneyLeft { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            var v = Request.QueryString["CustomerID"];
            if (v != null)
            {
                CustomerID = v.ToString();
                Loadata(Convert.ToInt32(CustomerID));
            }
            else
            {
                Response.Redirect("~/Error/index.html");
            }
        }
        private void Loadata(int CustomerID)
        {
            defaultAvatar = Comon.Global.sys_DefaultAvatar;
            DataSet ds = new DataSet();
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                ds = confunc.ExecuteDataSet("[YYY_sp_Customer_LoadInfo]", CommandType.StoredProcedure,
                  "@CurrentID", SqlDbType.Int, Convert.ToInt32(CustomerID == 0 ? 0 : CustomerID));
            }
            if (ds != null)
            {
                CustName = ds.Tables["Table"].Rows[0]["Name"].ToString();
                CustCode = ds.Tables["Table"].Rows[0]["Cust_Code"].ToString();
                Phone = ds.Tables["Table"].Rows[0]["Phone1"].ToString();
                Avatar = ds.Tables["Table"].Rows[0]["Avatar"].ToString();
                facebookurl = ds.Tables["Table"].Rows[0]["facebookurl"].ToString();
                instgramurl = ds.Tables["Table"].Rows[0]["instgramurl"].ToString();
                totalmoneyRaise = ds.Tables["Table"].Rows[0]["TOTALPRICE"].ToString();
                totalmoneyPaid = ds.Tables["Table"].Rows[0]["TOTALPAID"].ToString();
                totalmoneyLeft = ds.Tables["Table"].Rows[0]["Rest"].ToString();
            }
            else
            {
                CustName = "";
                CustCode = "";
                Phone = ""; Avatar = ""; instgramurl = ""; facebookurl = "";
                totalmoneyRaise = ""; totalmoneyPaid = ""; totalmoneyLeft = "";
            }

        }
    }
}