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
    public partial class pageTicketList : System.Web.UI.Page
    {

        public static string _DataComboStatus { get; set; }
        public static string _DataComboSource { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            InitializeCombo();
        }
        private void InitializeCombo()
        {
            _DataComboStatus = "";
            _DataComboSource = "";

            DataTable dt = new DataTable();
            dt.Columns.Add("ID");
            dt.Columns.Add("Name");
            DataRow dr = dt.NewRow(); dr[0] = 0; dr[1] = "All";
            DataRow dr1 = dt.NewRow(); dr1[0] = 1; dr1[1] = "Chưa Xử Lý";
            DataRow dr2 = dt.NewRow(); dr2[0] = 2; dr2[1] = "Đã Xử Lý";
            dt.Rows.Add(dr); dt.Rows.Add(dr1); dt.Rows.Add(dr2);
            DataTable dt1 = new DataTable();
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                dt1 = confunc.LoadPara("SourceCustomer");
                DataRow dr3 = dt1.NewRow();
                dr3[0] = 0; dr3[1] = "All";
                dt1.Rows.InsertAt(dr3, 0);
            }


            _DataComboStatus = JsonConvert.SerializeObject(dt);
            _DataComboSource = JsonConvert.SerializeObject(dt1);

        }



        [System.Web.Services.WebMethod]
        public static string LoadTicketList(string dateFrom, string dateTo, string statusID, string sourceID)
        {

            DataTable dt = new DataTable();
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                dt = confunc.ExecuteDataTable("[YYY_sp_Ticket_TicketList_Load]", CommandType.StoredProcedure,
                  "@UserID", SqlDbType.Int, Comon.Global.sys_userid
                  , "@dateFrom", SqlDbType.DateTime, Convert.ToDateTime(dateFrom)
                  , "@dateTo", SqlDbType.DateTime, Convert.ToDateTime(dateTo)
                  , "@statusID", SqlDbType.Int, Convert.ToInt32(statusID)
                  , "@sourceID", SqlDbType.Int, Convert.ToInt32(sourceID));
            }
            if (dt != null)
            {
                int status = Convert.ToInt32(statusID);
                int source = Convert.ToInt32(sourceID);
                try
                {
                    if (status != 0)
                    {
                        if (status == 1)
                            dt = dt.Select("isExecute=0").CopyToDataTable();
                        else
                            dt = dt.Select("isExecute=1").CopyToDataTable();
                    }
                    if (source != 0)
                    {
                        dt = dt.Select("SourceID=" + source.ToString() + "").CopyToDataTable();
                    }
                    return JsonConvert.SerializeObject(dt);
                }
                catch (Exception) // No datarow
                {
                    return "";
                }
            }
            else
            {
                return "";
            }
        }

       

    }
}