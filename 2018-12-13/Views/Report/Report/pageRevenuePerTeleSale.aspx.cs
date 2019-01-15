using _2018_12_13.Comon;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _2018_12_13.Views.Report.Report
{
    public partial class pageRevenuePerTeleSale : WebPageBase
    {
        public static string _DataComboBranch { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }


        [System.Web.Services.WebMethod]
        public static string LoadData(string dateFrom, string dateTo)
        {
            // STT,EmployeeName,NumTicketCreated,NumTicketExecute,NumAppCreated,NumAppChecked
            DataTable dt = new DataTable();
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                dt = confunc.ExecuteDataTable("[YYY_sp_Report_PerTeleSale]", CommandType.StoredProcedure
                  , "@dateFrom", SqlDbType.DateTime, Convert.ToDateTime(dateFrom)
                  , "@dateTo", SqlDbType.DateTime, Convert.ToDateTime(dateTo));
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