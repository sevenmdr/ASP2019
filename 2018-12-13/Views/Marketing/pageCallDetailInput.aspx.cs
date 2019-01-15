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
    public partial class pageCallDetailInput : WebPageBase
    {
        public static int TicketID { get; set; }
        public static string _DataComboTypeinput { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            InitializeCombo();
            if (Request.QueryString["TicketID"] != null)
            {
                var ticketID = Request.QueryString["TicketID"];

                TicketID = Convert.ToInt32(ticketID == null ? "0" : ticketID.ToString());

            }
        }
        private void InitializeCombo()
        {
            _DataComboTypeinput = "";

            DataTable dt1 = new DataTable();
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                dt1 = confunc.LoadPara("TypeIntput");
            }
            _DataComboTypeinput = JsonConvert.SerializeObject(dt1);

        }
        [System.Web.Services.WebMethod]
        public static string ExcuteData(string data)
        {
            try
            {
                TicketInput DataMain = JsonConvert.DeserializeObject<TicketInput>(data);
                using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                {
                    connFunc.ExecuteDataTable("[YYY_sp_Ticket_Input_Insert]", CommandType.StoredProcedure,
                        "@Ticket", SqlDbType.Int, TicketID,
                        "@Typeinput", SqlDbType.Int, DataMain.Typeinput,
                        "@Created_By", SqlDbType.Int, Comon.Global.sys_userid,
                        "@TimeCallBack", SqlDbType.DateTime,Convert.ToDateTime(DataMain.TimeCallBack),
                        "@Created", SqlDbType.DateTime, DateTime.Now,
                        "@Content", SqlDbType.NVarChar, DataMain.Content.Replace("'", "").Trim()

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
    public class TicketInput
    {
        public int Typeinput { get; set; }
        public string TimeCallBack { get; set; }

        public string Content { get; set; }

    }

}

