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

namespace _2018_12_13.Views.Service
{
    public class UnitCountDetail
    {
        public UnitCountDetail(string idUnit, string Number, string name, string state, string idDetail)
        {
            this.IDUnit = idUnit;
            this.Name = name;
            this.Number = Number;
            this.state = state;
            this.idDetail = idDetail;
        }
        public string IDUnit { get; set; }
        public string Name { get; set; }
        public string Number { get; set; }
        public string state { get; set; }
        public string idDetail { get; set; }
    }

    public class DataProduct
    {
        public string Type { get; set; }
        public string DefaultUnit { get; set; }
        public string Name { get; set; }
        public string Content { get; set; }
        public string isManage { get; set; }
        public string N1 { get; set; }
        public string N2 { get; set; }
        public string N3 { get; set; }

    }


    public partial class pageServiceDetail : WebPageBase
    {
        public static string _CurrentID { get; set; }
        public static string _DataProductMain { get; set; }
        public static string _DataComboTypeProduct { get; set; }
        public static string _DataComboTypeUnitCount { get; set; }
        public static string _DataunitCountChoosen { get; set; }
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
                _DataunitCountChoosen = null;
            }

        }
        private void InitializeComboType()
        {
            _DataComboTypeProduct = "";
            _DataComboTypeUnitCount = "";
            DataTable dt = new DataTable();
            using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
            {
                dt = connFunc.ExecuteDataTable("YYY_sp_Product_Combo_Unit", CommandType.StoredProcedure);
            }
            DataTable dt1 = new DataTable();
            using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
            {
                dt1 = connFunc.ExecuteDataTable("YYY_sp_Product_Combo_Product_Type", CommandType.StoredProcedure);
            }
            _DataComboTypeProduct = JsonConvert.SerializeObject(dt1);
            _DataComboTypeUnitCount = JsonConvert.SerializeObject(dt);
        }
        private void Loadata(int id)
        {
            DataSet ds = new DataSet();
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                ds = confunc.ExecuteDataSet("[YYY_sp_Product_LoadDetail]", CommandType.StoredProcedure,
                  "@ID", SqlDbType.Int, Convert.ToInt32(id == 0 ? 0 : id));
            }
            if (ds.Tables[1] != null && ds.Tables[1].Rows.Count > 0)
            {
                _DataunitCountChoosen = JsonConvert.SerializeObject(ds.Tables[1]);
            }
            else
            {
                _DataunitCountChoosen = null;
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

        [System.Web.Services.WebMethod]
        public static string ExcuteData(string data, string dataUnit)
        {
            try
            {
                DataProduct DataMain = JsonConvert.DeserializeObject<DataProduct>(data);
                JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                DataTable DataUnit = new DataTable();
                DataUnit = JsonConvert.DeserializeObject<DataTable>(dataUnit);
                if (_CurrentID == null)
                {
                    using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                    {
                        connFunc.ExecuteDataTable("YYY_sp_Product_Product_Insert", CommandType.StoredProcedure,
                            "@Name", SqlDbType.Int, DataMain.Name.Replace("'", "").Trim(),
                            "@type", SqlDbType.Int, DataMain.Type,
                            "@Created_By", SqlDbType.Int, Comon.Global.sys_userid,
                            "@Created", SqlDbType.DateTime, Comon.Comon.GetDateTimeNow(),
                            "@Unit", SqlDbType.Int, DataMain.DefaultUnit,
                            "@Note", SqlDbType.Int, DataMain.Content.Replace("'", "").Trim(),
                            "@N1", SqlDbType.Int, DataMain.N1,
                            "@N2", SqlDbType.Int, DataMain.N2,
                            "@N3", SqlDbType.Int, DataMain.N3,
                            "@isManage", SqlDbType.Int, DataMain.isManage,
                            "@table_data", SqlDbType.Structured, DataUnit.Rows.Count > 0 ? DataUnit : null
                        );
                    }
                }
                else
                {
                    using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                    {
                        connFunc.ExecuteDataTable("YYY_sp_Product_Product_Update", CommandType.StoredProcedure,
                            "@Name", SqlDbType.NVarChar, DataMain.Name.Replace("'", "").Trim(),
                            "@type", SqlDbType.Int, DataMain.Type,
                            "@Unit", SqlDbType.Int, DataMain.DefaultUnit,
                            "@Note", SqlDbType.Int, DataMain.Name.Replace("'", "").Trim(),
                            "@data", SqlDbType.Structured, DataUnit.Rows.Count > 0 ? DataUnit : null,
                            "@Modified_By", SqlDbType.Int, Comon.Global.sys_userid,
                            "@Modified", SqlDbType.DateTime, Comon.Comon.GetDateTimeNow(),
                            "@N1", SqlDbType.Int, DataMain.N1,
                            "@N2", SqlDbType.Int, DataMain.N2,
                            "@N3", SqlDbType.Int, DataMain.N3,
                             "@isManage", SqlDbType.Int, DataMain.isManage,
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
