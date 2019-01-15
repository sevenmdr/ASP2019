using _2018_12_13.Comon;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _2018_12_13.Views.Account
{
    public partial class pageInvoiceDetail :WebPageBase
    {
        public static string _CurrentID { get; set; }
        public static string _DataComboReceiptype{ get; set; }
        public static string _DataComboMethod { get; set; }

        public static string _AccountMainDetail { get; set; }

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
                _AccountMainDetail = null;
            }

        }
        private void InitializeComboType()
        {
            _DataComboReceiptype = "";
            _DataComboMethod = "";

            DataTable dt = new DataTable();
            using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
            {
                dt = connFunc.LoadPara("ReceiptType");
            }
            DataTable dt1 = new DataTable();
            using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
            {
                dt1 = connFunc.LoadPara("Method");
            }

            _DataComboReceiptype = JsonConvert.SerializeObject(dt);
            _DataComboMethod = JsonConvert.SerializeObject(dt1);

        }
        private void Loadata(int id)
        {
            try
            {
                DataTable dt = new DataTable();
                using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
                {
                    dt = confunc.ExecuteDataTable("[YYY_sp_Account_LoadDetail]", CommandType.StoredProcedure,
                      "@Current", SqlDbType.Int, Convert.ToInt32(id == 0 ? 0 : id));
                }
                _AccountMainDetail = JsonConvert.SerializeObject(dt);
            }
            catch (Exception)
            {
                _AccountMainDetail = "";
            }


        }
        [System.Web.Services.WebMethod]
        public static string ExcuteData(string data)
        {

            try
            {
                AccountDetail DataMain = JsonConvert.DeserializeObject<AccountDetail>(data);
                if (_CurrentID.ToString() == "0")
                {
                    using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                    {
                        var dt = connFunc.ExecuteDataTable("[YYY_sp_Account_Insert]", CommandType.StoredProcedure,
                     "@ReceiptsDate", SqlDbType.NVarChar, Comon.Comon.GetDateTimeNow(),
                     "@ReceiptsType", SqlDbType.Int, DataMain.ReceiptsType,
                     "@Recipient", SqlDbType.NVarChar, DataMain.Recipient.Replace("'", "").Trim(),
                     "@ReceiptsContent", SqlDbType.NVarChar, DataMain.ReceiptsContent.Replace("'", "").Trim(),
                     "@Amount", SqlDbType.Decimal, DataMain.Amount,
                     "@Transfer_Type", SqlDbType.Int, DataMain.Transfer_Type,
                      "@Branch_ID", SqlDbType.Int, Comon.Global.sys_branchID,
                     "@Created_By", SqlDbType.Int, Comon.Global.sys_userid,
                        "@Created", SqlDbType.DateTime, Comon.Comon.GetDateTimeNow()
                   );
                    }
                }
                else
                {
                    using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                    {
                        connFunc.ExecuteDataTable("[YYY_sp_Account_Update]", CommandType.StoredProcedure,
                      "@ReceiptsType", SqlDbType.Int, DataMain.ReceiptsType,
                      "@Recipient", SqlDbType.NVarChar, DataMain.Recipient.Replace("'", "").Trim(),
                      "@ReceiptsContent", SqlDbType.NVarChar, DataMain.ReceiptsContent.Replace("'", "").Trim(),
                      "@Transfer_Type", SqlDbType.Int, DataMain.Transfer_Type,
                      "@amount", SqlDbType.Decimal, DataMain.Amount,
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
    public class AccountDetail
    {
        public string Amount { get; set; }
        public string Recipient { get; set; }
        public string ReceiptsContent { get; set; }
        public int ReceiptsType { get; set; }
        public int Transfer_Type { get; set; }
    }
}