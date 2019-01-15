using _2018_12_13.Comon;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _2018_12_13.Views.Marketing
{
    public partial class pageTicketAction : WebPageBase
    {


        public static string _CustomerID { get; set; }
        public static string _DataMain { get; set; }
        public static string _TicketID { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.QueryString["TicketID"] !=null)
            {
                var v = Request.QueryString["CustomerID"];
                var ticketID = Request.QueryString["TicketID"];
                _CustomerID =v == null ? "0" : v.ToString();
                _TicketID = ticketID == null ? "0" : ticketID.ToString();
                Loadata(_TicketID);
            }
            else
            {
                _TicketID = "0";
                _CustomerID = "0";
                _DataMain = null;
            }
        }
        public void Loadata(string TicketID)
        {
            DataTable dt = new DataTable();
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                dt = confunc.ExecuteDataTable("[YYY_sp_Ticket_GetInfo]", CommandType.StoredProcedure,
                  "@Ticket", SqlDbType.Int, Convert.ToInt32(TicketID));
            }
            if (dt != null)
            {
                _CustomerID = dt.Rows[0]["CustomerID"].ToString();
               _DataMain = JsonConvert.SerializeObject(dt);
               
            }
            else
            {
                _DataMain = "";
            }

        }
        [System.Web.Services.WebMethod]
        public static string LoadataCustomerCareList()
        {
            DataTable dt = new DataTable();
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                dt = confunc.ExecuteDataTable("[YYY_sp_Ticket_LoadHistoryCare]", CommandType.StoredProcedure,
                  "@Customer_ID", SqlDbType.Int, Convert.ToInt32(_CustomerID), "@Ticket", SqlDbType.Int, Convert.ToInt32(_TicketID));
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
        public static string AddnewCustomer()
        {
            DataTable dt = new DataTable();
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                dt = confunc.ExecuteDataTable("[YYY_sp_Ticket_Customer_Insert]", CommandType.StoredProcedure,
                  "@TicketID", SqlDbType.Int, Convert.ToInt32(Convert.ToInt32(_TicketID)),
                  "@Created_By", SqlDbType.Int, Comon.Global.sys_userid,
                  "@Created", SqlDbType.DateTime, Comon.Comon.GetDateTimeNow());
            }
            if (dt != null && dt.Rows.Count>0)
            {
                return dt.Rows[0][0].ToString();
            }
            else
            {
                return "0";
            }
        }

    }
}