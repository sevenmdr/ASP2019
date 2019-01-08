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

namespace _2018_12_13.Views.WareHouse
{
    public class ProductDetailOutput
    {
        public string idProduct { get; set; }//
        public string SupplierID { get; set; }//
        public string NameProduct { get; set; }
        public string NameSupplier { get; set; }
        public string UnitCountID { get; set; }//
        public string NameUnit { get; set; }
        public string Number { get; set; }
        public string Amount { get; set; }
        public string state { get; set; }//
        public string idDetail { get; set; }
    }

    public class DataOutput
    {
        public string InputCode { get; set; } //txtCode

        public string TotalAmount { get; set; }//TotalAmount
        public string dateOutput { get; set; }//dateInput
        public string Content { get; set; }//txtContent

        public string Ware { get; set; }//txtContent
    }


    public partial class pageOutputDetail : WebPageBase
    {
        public static string _CurrentID { get; set; }
        public static string _DataOutputMain { get; set; }
        public static string _DataComboProduct { get; set; }
        public static string _DataComboUnitCount { get; set; }
        public static string _DataProductChoosen { get; set; }
        public static string _DataComboWare { get; set; }
        
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
                _DataOutputMain = null;
                _DataProductChoosen = null;
            }
            //_CurrentID = "9";
            //Loadata(Convert.ToInt32(_CurrentID));

        }
        private void InitializeComboType()
        {
            _DataComboProduct = "";
            _DataComboWare = "";
            DataTable dt = new DataTable();
            using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
            {
                 dt = connFunc.ExecuteDataTable("[YYY_sp_Product_Combo_UnitReceipt]", CommandType.StoredProcedure);
            }
            DataTable dt2 = new DataTable();
            using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
            {
                dt2 = connFunc.ExecuteDataTable("[YYY_sp_Product_Combo_Product_IsManager]", CommandType.StoredProcedure);
            }
            DataTable dt3 = new DataTable();
            using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
            {
                dt3 = connFunc.ExecuteDataTable("[YYY_sp_Product_Combo_BranchWareHouse]", CommandType.StoredProcedure);
            }
            _DataComboProduct = JsonConvert.SerializeObject(dt2);
            _DataComboUnitCount = JsonConvert.SerializeObject(dt);
            _DataComboWare = JsonConvert.SerializeObject(dt3);
        }
        private void Loadata(int id)
        {
            DataSet ds = new DataSet();
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                ds = confunc.ExecuteDataSet("[YYY_sp_Product_Export_LoadDetail]", CommandType.StoredProcedure,
                  "@ID", SqlDbType.Int, Convert.ToInt32(id == 0 ? 0 : id));
            }
            if (ds.Tables[1] != null && ds.Tables[1].Rows.Count>0)
            {
                _DataProductChoosen = JsonConvert.SerializeObject(ds.Tables[1]);
            }
            else
            {
                _DataProductChoosen = null;
            }
            if (ds.Tables[0] != null && ds.Tables[0].Rows.Count > 0)
            {
                _DataOutputMain = JsonConvert.SerializeObject(ds.Tables[0]);
            }
            else
            {
                _DataOutputMain = "";
            }

        }

        [System.Web.Services.WebMethod]
        public static string ExcuteData(string data, string dataProduct)
        {
            try
            {
                DataOutput DataMain = JsonConvert.DeserializeObject<DataOutput>(data);
                JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                DataTable DataProductDetail = new DataTable();
                 DataProductDetail = JsonConvert.DeserializeObject<DataTable>(dataProduct);
                if (_CurrentID == null)
                {
                    using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                    {
                        connFunc.ExecuteDataTable("[YYY_sp_Product_Export_Insert]", CommandType.StoredProcedure,
                            "@date", SqlDbType.DateTime,Convert.ToDateTime( DataMain.dateOutput),
                            "@Created_By", SqlDbType.Int, Comon.Global.sys_userid,
                            "@Created", SqlDbType.DateTime, Comon.Comon.GetDateTimeNow(),
                            "@Ware_ID", SqlDbType.Int, DataMain.Ware,
                            "@Note", SqlDbType.Int, DataMain.Content.Replace("'", "").Trim(),
                            "@table_data", SqlDbType.Structured, DataProductDetail.Rows.Count > 0 ? DataProductDetail : null
                        );
                    }
                }
                else
                {
                    using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                    {
                        connFunc.ExecuteDataTable("[YYY_sp_Product_Export_Update]", CommandType.StoredProcedure,
                            "@date", SqlDbType.NVarChar, Convert.ToDateTime(DataMain.dateOutput),
                            "@Ware_ID", SqlDbType.Int, DataMain.Ware,
                            "@Note", SqlDbType.Int, DataMain.Content.Replace("'", "").Trim(),
                            "@data", SqlDbType.Structured, DataProductDetail.Rows.Count > 0 ? DataProductDetail : null,
                            "@Modified_By", SqlDbType.Int, Comon.Global.sys_userid,
                            "@Modified", SqlDbType.DateTime, Comon.Comon.GetDateTimeNow(),
                            "@CurrentID", SqlDbType.Int, Convert.ToInt32(_CurrentID)


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
