﻿using _2018_12_13.Comon;
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
    public partial class pageReportOldNewCustomer : WebPageBase
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
            //Ke toan   STT,ReceiptName,Amount,Date,CreatedName
            //import  STT,Date,CreatedName,Amount
            //payment  STT,CustomerName,Date,Amount,CreatedName,SourceName
            // Total ketoan, toal import, toal payment, totalmain
            DataSet ds = new DataSet();
            //DataTable dt = new DataTable();
            //dt.Columns.Add("Month"); dt.Columns.Add("Amount"); dt.Columns.Add("Target"); dt.Columns.Add("UpDown");
            //DataRow dr = dt.NewRow();
            //dr[0] = "06-2019"; dr[1] = "4000000"; dr[2] = "06-2019"; dr[3] = "<a class='ui blue mini basic label'>Up</a>";
            //DataRow dr1 = dt.NewRow();
            //dr1[0] = "07-2019"; dr1[1] = "7000000"; dr1[2] = "07-2019"; dr1[3] = "<a class='ui red mini basic label'>Down</a>";
            //dt.Rows.Add(dr); dt.Rows.Add(dr1);
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                ds = confunc.ExecuteDataSet("[YYY_sp_Report_CustomerNewOld]", CommandType.StoredProcedure,
                   "@dateFrom", SqlDbType.DateTime, Convert.ToDateTime(dateFrom)
                  , "@dateTo", SqlDbType.DateTime, Convert.ToDateTime(dateTo)
                  , "@branchID", SqlDbType.Int, Convert.ToInt32(branchID));
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
    }
}