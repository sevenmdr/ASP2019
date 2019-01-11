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
    public partial class pageTicketListRecover : System.Web.UI.Page
    {


        public static string _DataComboSource { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            InitializeCombo();
        }
        private void InitializeCombo()
        {

            _DataComboSource = "";

            DataTable dt1 = new DataTable();
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                dt1 = confunc.LoadPara("SourceCustomer");
                DataRow dr3 = dt1.NewRow();
                dr3[0] = 0; dr3[1] = "All";
                dt1.Rows.InsertAt(dr3, 0);
            }
            _DataComboSource = JsonConvert.SerializeObject(dt1);

        }



        [System.Web.Services.WebMethod]
        public static string LoadTicketList(string dateFrom, string dateTo, string sourceID)
        {

            DataTable dt = new DataTable();
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                dt = confunc.ExecuteDataTable("[YYY_sp_Ticket_TicketRecoverList_Load]", CommandType.StoredProcedure,
                  "@UserID", SqlDbType.Int, Comon.Global.sys_userid
                  , "@dateFrom", SqlDbType.DateTime, Convert.ToDateTime(dateFrom)
                  , "@dateTo", SqlDbType.DateTime, Convert.ToDateTime(dateTo));
            }
            if (dt != null)
            {

                int source = Convert.ToInt32(sourceID);
                try
                {
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

        [System.Web.Services.WebMethod]
        public static string Recover(int id)
        {
            try
            {
                using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                {
                    connFunc.ExecuteDataTable("[YYY_sp_ticket_Recover]", CommandType.StoredProcedure,
                        "@CurrentID", SqlDbType.Int, id,
                        "@Datenow", SqlDbType.DateTime, Comon.Comon.GetDateTimeNow(),
                        "@userID", SqlDbType.Int, Comon.Global.sys_userid
                    );
                }
                return "1";
            }
            catch (Exception ex)
            {
                return "0";
            }

        }

    }
}