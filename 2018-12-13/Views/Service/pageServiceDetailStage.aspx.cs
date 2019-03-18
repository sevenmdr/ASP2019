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
using System.ComponentModel;

namespace _2018_12_13.Views.Service
{


    public class DataServiceStage
    {
        public string Name { get; set; }
        public string ServiceType { get; set; }
        public string Amount { get; set; }
        public string PerConsulAmount { get; set; }
        public string PerConsulPercent { get; set; }
        public string PerTreatAmount { get; set; }
        public string PerTreatPercent { get; set; }
        public string Content { get; set; }
        public string IsPro { get; set; }
        public string TimeToTreatment { get; set; }

    }


    public partial class pageServiceDetailStage : WebPageBase
    {
        public static string _CurrentID { get; set; }
        public static string _DataServiceStage { get; set; }
        public static string _DataComboTypeService { get; set; }
        public static string _DataProductMain { get; set; }
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
                _DataProductMain = null;
            }
        }
        private void InitializeComboType()
        {
            _DataComboTypeService = "";
            DataTable dt1 = new DataTable();
            using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
            {
                dt1 = connFunc.ExecuteDataTable("YYY_sp_Service_LoadCombo_ServiceType", CommandType.StoredProcedure);
            }
            _DataComboTypeService = JsonConvert.SerializeObject(dt1);
        }
        private void Loadata(int id)
        {
            DataSet ds = new DataSet();
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                ds = confunc.ExecuteDataSet("[YYY_sp_Service_LoadDetail_Stage]", CommandType.StoredProcedure,
                  "@ID", SqlDbType.Int, Convert.ToInt32(id == 0 ? 0 : id));
            }
            if (ds.Tables[0] != null && ds.Tables[0].Rows.Count > 0)
            {
                _DataProductMain = JsonConvert.SerializeObject(ds.Tables[0]);
            }
            else
            {
                _DataProductMain = "";
            }
            if (ds.Tables[1] != null && ds.Tables[1].Rows.Count > 0)
            {
                _DataServiceStage = JsonConvert.SerializeObject(ds.Tables[1]);
            }
            else
            {
                _DataServiceStage = null;
            }
        }


        [System.Web.Services.WebMethod]
        public static string ExcuteData(string data, string dataServiceStage)
        {
            try
            {
                DataServiceStage DataMain = JsonConvert.DeserializeObject<DataServiceStage>(data);
                JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                DataTable DataServiceStage = new DataTable();

                DataServiceStage = JsonConvert.DeserializeObject<DataTable>(dataServiceStage);
                if (_CurrentID == null)
                {
                    using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                    {
                        connFunc.ExecuteDataTable("YYY_sp_Service_Stage_Insert", CommandType.StoredProcedure,
                            "@Name", SqlDbType.NVarChar, DataMain.Name.Replace("'", "").Trim(),
                            "@Amount", SqlDbType.Decimal, DataMain.Amount,
                            "@ServiceType", SqlDbType.Int, DataMain.ServiceType,
                            "@Created_By", SqlDbType.Int, Comon.Global.sys_userid,
                            "@Created", SqlDbType.DateTime, Comon.Comon.GetDateTimeNow(),
                            "@Content", SqlDbType.Int, DataMain.Content.Replace("'", "").Trim(),
                            "@PerConsulAmount", SqlDbType.Int, DataMain.PerConsulAmount,
                            "@PerConsulPercent", SqlDbType.Int, DataMain.PerConsulPercent,
                            "@PerTreatAmount", SqlDbType.Int, DataMain.PerTreatAmount,
                             "@PerTreatPercent", SqlDbType.Int, DataMain.PerTreatPercent,
                             "@IsPro", SqlDbType.Int, DataMain.IsPro,
                             "@TimeToTreatment", SqlDbType.Int, DataMain.TimeToTreatment,

                            "@table_data", SqlDbType.Structured, DataServiceStage.Rows.Count > 0 ? DataServiceStage : null
                        );
                    }
                }
                else
                {
                    using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                    {
                        connFunc.ExecuteDataTable("[YYY_sp_Service_Stage_Update]", CommandType.StoredProcedure,
                            "@Name", SqlDbType.NVarChar, DataMain.Name.Replace("'", "").Trim(),
                            "@Amount", SqlDbType.Decimal, DataMain.Amount,
                            "@ServiceType", SqlDbType.Int, DataMain.ServiceType,
                            "@Content", SqlDbType.NVarChar, DataMain.Content.Replace("'", "").Trim(),
                            "@table_data", SqlDbType.Structured, DataServiceStage.Rows.Count > 0 ? DataServiceStage : null,
                            "@Modified_By", SqlDbType.Int, Comon.Global.sys_userid,
                            "@Modified", SqlDbType.DateTime, Comon.Comon.GetDateTimeNow(),
                            "@PerConsulAmount", SqlDbType.Int, DataMain.PerConsulAmount,
                            "@PerConsulPercent", SqlDbType.Int, DataMain.PerConsulPercent,
                            "@PerTreatAmount", SqlDbType.Int, DataMain.PerTreatAmount,
                             "@PerTreatPercent", SqlDbType.Int, DataMain.PerTreatPercent,
                             "@IsPro", SqlDbType.Int, DataMain.IsPro,
                             "@TimeToTreatment", SqlDbType.Int, DataMain.TimeToTreatment,
                            "@currentID", SqlDbType.Int, Convert.ToInt32(_CurrentID)
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

        [System.Web.Services.WebMethod]
        public static string CheckDeleStage(string idStage)
        {
            try
            {
                DataTable dt1 = new DataTable();
                using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                {
                    dt1 = connFunc.ExecuteDataTable("[YYY_sp_Service_CheckDeleteStage]", CommandType.StoredProcedure,
                    "@ID", SqlDbType.Int, Convert.ToInt32(idStage));
                }
                if (dt1 != null && dt1.Rows.Count != 0 && Convert.ToInt32(dt1.Rows[0][0]) != 0)
                    return "0";
                else return "1";
            }
            catch (Exception ex)
            {
                return "0";
            }
        }
    }
}
