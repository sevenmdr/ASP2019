using _2018_12_13.Comon;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;
using Newtonsoft.Json.Linq;

namespace _2018_12_13.Views.Marketing
{

    public partial class pageTicketDetail : WebPageBase
    {
        public static string _CurrentID { get; set; }
        public static string _DataComboGender { get; set; }
        public static string _DataTicketSource { get; set; }
      
        public static string _TicketMainDetail { get; set; }
        
        protected void Page_Load(object sender, EventArgs e)
        {
            var curr = Request.QueryString["CurrentID"];
            InitializeComboType();
            if (curr != null)
            {
                _CurrentID = curr.ToString();
                Loadata(Convert.ToInt32(_CurrentID));
            }
            else
            {
                _CurrentID = "0";
                _TicketMainDetail = null;
            }

        }
        private void InitializeComboType()
        {
            _DataComboGender = "";
            _DataTicketSource = "";

            DataTable dt = new DataTable();
            using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
            {
                dt = connFunc.LoadPara("SourceCustomer");
            }
            DataTable dt1 = new DataTable();
            using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
            {
                dt1 = connFunc.LoadPara("Gender");
            }

            _DataTicketSource = JsonConvert.SerializeObject(dt);
            _DataComboGender = JsonConvert.SerializeObject(dt1);

        }
        private void Loadata(int id)
        {
            try
            {
                DataTable dt = new DataTable();
                using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
                {
                    //dt = confunc.ExecuteDataSet("[YYY_sp_Product_Reciept_LoadDetail]", CommandType.StoredProcedure,
                    //  "@ID", SqlDbType.Int, Convert.ToInt32(id == 0 ? 0 : id));
                }
                _TicketMainDetail = JsonConvert.SerializeObject(dt);
            }
            catch(Exception)
            {
                _TicketMainDetail = "";
            }


        }

        [System.Web.Services.WebMethod]
        public static string ExcuteData(string data)
        {

            try
            {
                TicketDetail DataMain = JsonConvert.DeserializeObject<TicketDetail>(data);
                if (_CurrentID.ToString() == "0")
                {
                    using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                    {
                        var dt = connFunc.ExecuteDataTable("[YYY_sp_Ticket_Insert]", CommandType.StoredProcedure,
                     "@Email1", SqlDbType.NVarChar, DataMain.Email.Replace("'", "").Trim(),
                     "@Phone1", SqlDbType.NVarChar, DataMain.Phone.Replace("'", "").Trim(),
                     "@Name", SqlDbType.NVarChar, DataMain.Name.Replace("'", "").Trim(),
                     "@Content", SqlDbType.NVarChar, DataMain.Content.Replace("'", "").Trim(),
                     "@Gender_ID", SqlDbType.Int, DataMain.Gender,
                     "@Source", SqlDbType.Int, DataMain.Source,
                     "@Created_By", SqlDbType.Int, Comon.Global.sys_userid,
                        "@Created", SqlDbType.DateTime, Comon.Comon.GetDateTimeNow()
                   );
                    }
                }
                else
                {
                    using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                    {
                        connFunc.ExecuteDataTable("[YYY_sp_Customer_Ticket]", CommandType.StoredProcedure,
                      "@Content", SqlDbType.NVarChar, DataMain.Content.Replace("'", "").Trim(),
                      "@Email1", SqlDbType.NVarChar, DataMain.Email.Replace("'", "").Trim(),
                      "@Phone1", SqlDbType.NVarChar, DataMain.Phone.Replace("'", "").Trim(),
                      "@Name", SqlDbType.NVarChar, DataMain.Name.Replace("'", "").Trim(),
                      "@Gender_ID", SqlDbType.Int, DataMain.Gender,
                      "@Source", SqlDbType.Int, DataMain.Source,
                      "@Modified_By", SqlDbType.Int, Comon.Global.sys_userid,
                         "@Modified", SqlDbType.DateTime, Comon.Comon.GetDateTimeNow(),
                         "@CurrentID", SqlDbType.Int, _CurrentID
                    );
                    }
                }
                return "1";
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
                return "0";
            }


        }
    }
    public class TicketDetail
    {
        public string Email { get; set; }
        public string Content { get; set; }
        public string Phone { get; set; }
        public string Name { get; set; }
        public int Gender { get; set; }
        public int Source { get; set; }
    }
}
