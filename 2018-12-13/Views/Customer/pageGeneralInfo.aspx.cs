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
    public partial class pageGeneralInfo : WebPageBase
    {
        protected string CustomerID { get; set; }
        protected string dataMainCustomer { get; set; }
        protected string dataSchedule { get; set; }
        protected string dataHistory { get; set; }

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
            DataSet ds = new DataSet();
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                ds = confunc.ExecuteDataSet("[YYY_sp_Customer_LoadInfo]", CommandType.StoredProcedure,
                  "@CurrentID", SqlDbType.Int, Convert.ToInt32(CustomerID == 0 ? 0 : CustomerID));
            }
            if (ds != null)
            {
                dataMainCustomer = JsonConvert.SerializeObject(ds.Tables["Table"], Formatting.Indented) ;
                dataSchedule = JsonConvert.SerializeObject(ds.Tables["Table3"], Formatting.Indented);
                dataHistory = JsonConvert.SerializeObject(ds.Tables["Table1"], Formatting.Indented);
            }
            else
            {
                dataMainCustomer = "";
                dataSchedule = "";
                dataHistory = "";
            }

        }
        [System.Web.Services.WebMethod]
        public static string ChangeStatus(string data)
        {
            try
            {
                ChangeStatus DataMain = JsonConvert.DeserializeObject<ChangeStatus>(data);
                if (DataMain.id != 0)
                {
                    using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                    {
                        connFunc.ExecuteDataTable("YYY_sp_Customer_Appointment_ChangeStatus", CommandType.StoredProcedure,
                            "@Status", SqlDbType.Int, DataMain.status,
                            "@App_ID", SqlDbType.Int, DataMain.id,
                            "@Employee_ID", SqlDbType.NVarChar, Comon.Global.sys_employeeid,
                            "@Branch_ID", SqlDbType.Int, Comon.Global.sys_branchID,
                            "@Created", SqlDbType.DateTime, Comon.Comon.GetDateTimeNow(),
                            "@Created_By", SqlDbType.Int, Comon.Global.sys_userid
                        );
                    }
                }
                return "1";
            }
            catch (Exception ex)
            {
                return "0";
            }
        }
    }
    public class ChangeStatus
    {
        public int id { get; set; }
        public int status { get; set; }

    }

}