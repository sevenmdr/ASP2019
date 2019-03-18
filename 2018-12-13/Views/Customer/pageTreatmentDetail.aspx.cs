using _2018_12_13.Comon;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _2018_12_13.Views.Customer
{
    public partial class pageTreatmentDetail : WebPageBase
    {
        public static string _CustomerID { get; set; }
        public static string _CurrentID { get; set; }

        public static string _dataTreatment { get; set; }

        public static string _dataComboDoctor { get; set; }
        public static string _dataComboAssist { get; set; }
        public static string _dataComboService { get; set; }
        public static string _dataComboStage { get; set; }
        public static string _dataMaterialWhenUpdate { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {

            var cus = Request.QueryString["CustomerID"];
            var curr = Request.QueryString["CurrentID"];

            if (cus != null)
            {
                _CustomerID = cus.ToString();
                LoadComboMain();
                if (curr != null)
                {
                    _CurrentID = curr.ToString();
                    Loadata(Convert.ToInt32(_CurrentID));
                    LoadataMaterial(Convert.ToInt32(_CurrentID));
                }
                else
                {
                    _CurrentID = null;
                    _dataTreatment = null;
                }
            }
            else
            {
                _CustomerID = null;
                Response.Redirect("~/Error/index.html");
            }
        }
        private void LoadataMaterial(int id)
        {

            DataTable dt = new DataTable();
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                dt = confunc.ExecuteDataTable("[YYY_sp_Customer_Treatment_LoadDetailMaterial]", CommandType.StoredProcedure,
                  "@ID", SqlDbType.Int, Convert.ToInt32(id == 0 ? 0 : id));
            }
            if (dt != null)
            {
                _dataMaterialWhenUpdate = JsonConvert.SerializeObject(dt);
            }
            else
            {
                _dataMaterialWhenUpdate = "";
            }

        }
        private void Loadata(int id)
        {

            DataTable dt = new DataTable();
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                dt = confunc.ExecuteDataTable("[YYY_sp_Customer_Treatment_LoadDetail]", CommandType.StoredProcedure,
                  "@ID", SqlDbType.Int, Convert.ToInt32(id == 0 ? 0 : id));
            }
            if (dt != null)
            {
                _dataTreatment = JsonConvert.SerializeObject(dt);
            }
            else
            {
                _dataTreatment = "";
            }

        }
        private void LoadComboMain()
        {
            _dataComboDoctor = "";
            _dataComboAssist = "";
            _dataComboStage = "";
            //LoadDoctor
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                DataTable dt = new DataTable();
                dt = confunc.LoadEmployee("Doctor", 0);
                _dataComboDoctor = JsonConvert.SerializeObject(dt, Formatting.Indented);
            }
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                DataTable dt = new DataTable();
                dt = confunc.LoadEmployee("Assistant", 0);
                _dataComboAssist = JsonConvert.SerializeObject(dt, Formatting.Indented);
            }
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                DataTable dt = new DataTable();
                dt = confunc.ExecuteDataTable("YYY_sp_Customer_Treatment_LoadComboService", CommandType.StoredProcedure,
                 "@Customer_ID", SqlDbType.Int, _CustomerID);
                _dataComboService = JsonConvert.SerializeObject(dt, Formatting.Indented);
            }
        }
        [System.Web.Services.WebMethod]
        public static string LoadStageByService(string serviceID)
        {
            DataTable dt = new DataTable();
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                dt = confunc.ExecuteDataTable("[YYY_sp_Customer_Treatment_LoadStage]",
                    CommandType.StoredProcedure
                  , "@serviceID", SqlDbType.Int, Convert.ToInt32(serviceID));
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
        public static string LoadProductByStage(string stageID)
        {
            DataTable dt = new DataTable();
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                dt = confunc.ExecuteDataTable("[YYY_sp_Customer_Treatment_LoadMaterial]", CommandType.StoredProcedure,
                  "@UserID", SqlDbType.Int, Comon.Global.sys_userid
                  , "@stageID", SqlDbType.Int, Convert.ToInt32(stageID));
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
        public static string ExcuteData(string data, string dataDetailProduct)
        {
            try
            {
                TreatDetail DataMain = JsonConvert.DeserializeObject<TreatDetail>(data);
               
                if (_CurrentID == null)
                {
                    DataTable DataDetailProduct = new DataTable();
                    if (dataDetailProduct != "\"\"")
                        DataDetailProduct = JsonConvert.DeserializeObject<DataTable>(dataDetailProduct);
                    else DataDetailProduct = null;
                    using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                    {
                        connFunc.ExecuteDataTable("YYY_sp_Customer_Treatment_Insert", CommandType.StoredProcedure,
                    "@Customer_ID", SqlDbType.Int, _CustomerID,
                    "@tabID", SqlDbType.Int, DataMain.Tab_ID,
                    "@Content", SqlDbType.NVarChar, DataMain.Content.Replace("'", "").Trim(),
                    "@Created_By", SqlDbType.Int, Comon.Global.sys_userid,
                    "@Created", SqlDbType.DateTime, Comon.Comon.GetDateTimeNow(),
                    "@branch_ID", SqlDbType.Int, Comon.Global.sys_branchID,
                    "@BS1", SqlDbType.Int, DataMain.Doc1,
                    "@BS2", SqlDbType.Int, DataMain.Doc2,
                     "@PT1", SqlDbType.Int, DataMain.Ass1,
                    "@PT2", SqlDbType.Int, DataMain.Ass2,
                     "@StageID", SqlDbType.Int, DataMain.StageID,
                       "@table_data", SqlDbType.Structured,(DataDetailProduct!=null &&DataDetailProduct.Rows.Count > 0) ? DataDetailProduct : null,
                    "@TreatmentAmount", SqlDbType.Decimal, DataMain.TreatmentAmount);
                    }
                }
                else
                {
                    using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                    {
                        connFunc.ExecuteDataTable("YYY_sp_Customer_Treatment_Update", CommandType.StoredProcedure,
                            "@Content", SqlDbType.NVarChar, DataMain.Content.Replace("'", "").Trim(),
                            "@Modified_By", SqlDbType.Int, Comon.Global.sys_userid,
                            "@Modified", SqlDbType.DateTime, Comon.Comon.GetDateTimeNow(),
                             "@BS1", SqlDbType.Int, DataMain.Doc1,
                            "@BS2", SqlDbType.Int, DataMain.Doc2,
                            "@PT1", SqlDbType.Int, DataMain.Ass1,
                            "@PT2", SqlDbType.Int, DataMain.Ass2,
                            "@CurrentID", SqlDbType.Int, _CurrentID,
                            "@TreatmentAmount", SqlDbType.Decimal, DataMain.TreatmentAmount

                        );
                    }
                }
                return "1";
            }
            catch (Exception ex)
            {
                return "0";
            }


        }

    }
    public class TreatDetail
    {
        public string Content { get; set; }
        public int Doc1 { get; set; }
        public int Doc2 { get; set; }
        public int Ass1 { get; set; }
        public int Ass2 { get; set; }
        public int Tab_ID { get; set; }
        public int StageID { get; set; }
        public decimal TreatmentAmount { get; set; }
    }
}