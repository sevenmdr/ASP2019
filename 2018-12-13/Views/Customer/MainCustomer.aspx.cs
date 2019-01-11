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
        protected string CustomerID { get; set; }
        protected string CustName { get; set; }
        protected string CustCode { get; set; }
        protected string Phone { get; set; }
        protected string Avatar { get; set; }
        protected string defaultAvatar { get; set; }

        protected string facebookurl { get; set; }
        protected string instgramurl { get; set; }


        protected string totalmoneyRaise { get; set; }

        protected string totalmoneyPaid { get; set; }

        protected string totalmoneyLeft { get; set; }

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
                totalmoneyLeft =(Convert.ToDecimal(totalmoneyRaise) -Convert.ToDecimal(totalmoneyPaid)).ToString();
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