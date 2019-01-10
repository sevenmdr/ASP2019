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
                _CurrentID = null;
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
                
                if (_CurrentID == null)
                {
                    //using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                    //{
                    //    connFunc.ExecuteDataTable("YYY_sp_Product_Receipt_Insert", CommandType.StoredProcedure,
                    //        "@date", SqlDbType.DateTime,Convert.ToDateTime( DataMain.DateInput),
                    //        "@Amount", SqlDbType.Decimal, DataMain.TotalAmount,
                    //        "@Created_By", SqlDbType.Int, Comon.Global.sys_userid,
                    //        "@Created", SqlDbType.DateTime, Comon.Comon.GetDateTimeNow(),
                    //        "@Ware_ID", SqlDbType.Int, DataMain.Ware,
                    //        "@Note", SqlDbType.Int, DataMain.Content.Replace("'", "").Trim(),
                    //        "@table_data", SqlDbType.Structured, DataProductDetail.Rows.Count > 0 ? DataProductDetail : null
                    //    );
                    //}
                }
                else
                {
                    //using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                    //{
                    //    connFunc.ExecuteDataTable("YYY_sp_Product_Receipt_Update", CommandType.StoredProcedure,
                    //        "@date", SqlDbType.NVarChar, Convert.ToDateTime(DataMain.DateInput),
                    //        "@Amount", SqlDbType.Decimal, DataMain.TotalAmount,
                    //        "@Ware_ID", SqlDbType.Int, DataMain.Ware,
                    //        "@Note", SqlDbType.Int, DataMain.Content.Replace("'", "").Trim(),
                    //        "@data", SqlDbType.Structured, DataProductDetail.Rows.Count > 0 ? DataProductDetail : null,
                    //        "@Modified_By", SqlDbType.Int, Comon.Global.sys_userid,
                    //        "@Modified", SqlDbType.DateTime, Comon.Comon.GetDateTimeNow(),
                    //        "@CurrentID", SqlDbType.Int, Convert.ToInt32(_CurrentID)


                    //    );
                    //}
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
