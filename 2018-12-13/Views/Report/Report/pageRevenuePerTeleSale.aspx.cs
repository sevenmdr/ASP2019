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
    public partial class pageRevenuePerTeleSale : System.Web.UI.Page
    {
        public static string _DataComboBranch { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            InitializeCombo();
        }
        private void InitializeCombo()
        {
            _DataComboBranch = "";
            DataTable dt = new DataTable();
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                dt = confunc.ExecuteDataTable("YYY_sp_Branch_Load", CommandType.StoredProcedure);
            }
            _DataComboBranch = JsonConvert.SerializeObject(dt);
        }

        [System.Web.Services.WebMethod]
        public static string LoadData(string dateFrom, string dateTo, string branchID)
        {
            // STT,EmployeeName,NumTicketCreated,NumTicketExecute,NumAppCreated,NumAppChecked

            DataTable dt = new DataTable();
          
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