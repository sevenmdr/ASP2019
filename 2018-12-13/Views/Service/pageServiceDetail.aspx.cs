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
    public class UnitCountDetail
    {
        public UnitCountDetail(string idUnit, float Number, string name, string state, string idDetail)
        {
            this.IDUnit = idUnit;
            this.Name = name;
            this.Number = Number;
            this.state = state;
            this.idDetail = idDetail;
        }
        public string IDUnit { get; set; }
        public string Name { get; set; }
        public float Number { get; set; }
        public string state { get; set; }
        public string idDetail { get; set; }
    }

    public class DataService
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
    }


    public partial class pageServiceDetail : WebPageBase
    {
        public static string _CurrentID { get; set; }
        public static string _DataComboProduct { get; set; }
        public static string _DataComboTypeService { get; set; }
        public static string _DataComboTypeUnitCount { get; set; }
        public static string _DataproductChoosen { get; set; }
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
                _DataproductChoosen = null;
            }
            

        }
        private void InitializeComboType()
        {
            _DataComboTypeService = "";
            _DataComboTypeUnitCount = "";
            _DataComboProduct = "";
            DataTable dt = new DataTable();
            using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
            {
                dt = connFunc.ExecuteDataTable("[YYY_sp_Product_Combo_UnitReceipt]", CommandType.StoredProcedure);
            }
            DataTable dt1 = new DataTable();
            using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
            {
                dt1 = connFunc.ExecuteDataTable("YYY_sp_Service_LoadCombo_ServiceType", CommandType.StoredProcedure);
            }
            DataTable dt2 = new DataTable();
            using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
            {
                dt2 = connFunc.ExecuteDataTable("YYY_sp_Product_Combo_Product_IsNotManager", CommandType.StoredProcedure);
            }
            _DataComboTypeService = JsonConvert.SerializeObject(dt1);
            _DataComboTypeUnitCount = JsonConvert.SerializeObject(dt);
            _DataComboProduct = JsonConvert.SerializeObject(dt2);
        }
        private void Loadata(int id)
        {
            DataSet ds = new DataSet();
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                ds = confunc.ExecuteDataSet("[YYY_sp_Service_LoadDetail]", CommandType.StoredProcedure,
                  "@ID", SqlDbType.Int, Convert.ToInt32(id == 0 ? 0 : id));
            }
            if (ds.Tables[1] != null && ds.Tables[1].Rows.Count > 0)
            {
                _DataproductChoosen = JsonConvert.SerializeObject(ds.Tables[1]);
            }
            else
            {
                _DataproductChoosen = null;
            }
            if (ds.Tables[0] != null && ds.Tables[0].Rows.Count > 0)
            {
                _DataProductMain = JsonConvert.SerializeObject(ds.Tables[0]);
            }
            else
            {
                _DataProductMain = "";
            }

        }
        //public static DataTable ToDataTable<T>(this IList<T> data)
        //{
        //    PropertyDescriptorCollection props =
        //    TypeDescriptor.GetProperties(typeof(T));
        //    DataTable table = new DataTable();
        //    for (int i = 0; i < props.Count; i++)
        //    {
        //        PropertyDescriptor prop = props[i];
        //        if(prop.Name="Nu,be")
        //        table.Columns.Add(prop.Name, prop.PropertyType);
        //    }
        //    object[] values = new object[props.Count];
        //    foreach (T item in data)
        //    {
        //        for (int i = 0; i < values.Length; i++)
        //        {
        //            values[i] = props[i].GetValue(item);
        //        }
        //        table.Rows.Add(values);
        //    }
        //    return table;
        //}

        [System.Web.Services.WebMethod]
        public static string ExcuteData(string data, string dataService)
        {
            try
            {
                DataService DataMain = JsonConvert.DeserializeObject<DataService>(data);
                JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                DataTable DataService = new DataTable();

                DataService = JsonConvert.DeserializeObject<DataTable>(dataService);
                if (_CurrentID == null)
                {
                    using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                    {
                        connFunc.ExecuteDataTable("YYY_sp_Service_Insert", CommandType.StoredProcedure,
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
                            "@table_data", SqlDbType.Structured, DataService.Rows.Count > 0 ? DataService : null
                        );
                    }
                }
                else
                {
                    using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                    {
                        connFunc.ExecuteDataTable("[YYY_sp_Service_Update]", CommandType.StoredProcedure,
                            "@Name", SqlDbType.NVarChar, DataMain.Name.Replace("'", "").Trim(),
                            "@Amount", SqlDbType.Decimal, DataMain.Amount,
                            "@ServiceType", SqlDbType.Int, DataMain.ServiceType,
                            "@Content", SqlDbType.NVarChar, DataMain.Content.Replace("'", "").Trim(),
                            "@table_data", SqlDbType.Structured, DataService.Rows.Count > 0 ? DataService : null,
                            "@Modified_By", SqlDbType.Int, Comon.Global.sys_userid,
                            "@Modified", SqlDbType.DateTime, Comon.Comon.GetDateTimeNow(),
                            "@PerConsulAmount", SqlDbType.Int, DataMain.PerConsulAmount,
                            "@PerConsulPercent", SqlDbType.Int, DataMain.PerConsulPercent,
                            "@PerTreatAmount", SqlDbType.Int, DataMain.PerTreatAmount,
                             "@PerTreatPercent", SqlDbType.Int, DataMain.PerTreatPercent,
                             "@IsPro", SqlDbType.Int, DataMain.IsPro,
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
    }
}
