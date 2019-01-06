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
    }


    public partial class pageProductDetail : WebPageBase
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
                // Loadata(Convert.ToInt32(_CurrentID));
            }
            else
            {
                _CurrentID = null;
                _DataProductMain = null;
                _DataunitCountChoosen = null;
            }
            Loadata(Convert.ToInt32(_CurrentID));
        }
        private void InitializeComboType()
        {
            _DataComboTypeProduct = "";
            _DataComboTypeUnitCount = "";
            DataTable dt = new DataTable();
            dt.Columns.Add("ID"); dt.Columns.Add("Name");
            DataRow dr1 = dt.NewRow();
            dr1[0] = "1";
            dr1[1] = "Loại 1";

            DataRow dr2 = dt.NewRow();
            dr2[0] = "2";
            dr2[1] = "Loại 2";

            dt.Rows.Add(dr1); dt.Rows.Add(dr2);
            _DataComboTypeProduct = JsonConvert.SerializeObject(dt);
            _DataComboTypeUnitCount = JsonConvert.SerializeObject(dt);
        }
        private void Loadata(int id)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("IDUnit"); dt.Columns.Add("Number"); dt.Columns.Add("Name"); dt.Columns.Add("state"); dt.Columns.Add("idDetail");
            DataRow dr = dt.NewRow();
            dr[0] = "1"; dr[1] = "10"; dr[2] = "test"; dr[3] = "1"; dr[4] = "3";
            DataRow dr1 = dt.NewRow();
            dr1[0] = "2"; dr1[1] = "20"; dr1[2] = "test"; dr1[3] = "1"; dr1[4] = "4";
            dt.Rows.Add(dr); dt.Rows.Add(dr1);
            _DataunitCountChoosen = JsonConvert.SerializeObject(dt);

            DataTable dt1 = new DataTable();
            dt1.Columns.Add("ID"); dt1.Columns.Add("Name"); dt1.Columns.Add("TypeProduct"); dt1.Columns.Add("Content"); dt1.Columns.Add("MainUnitCount");
            DataRow dr2 = dt1.NewRow();
            dr2[0] = "1"; dr2[1] = "aaaaaa"; dr2[2] = "1"; dr2[3] = "1asdsad as dasd asd "; dr2[4] = "1";
            dt1.Rows.Add(dr2);
            _DataProductMain = JsonConvert.SerializeObject(dt1);
        }
        [System.Web.Services.WebMethod]
        public static string LoadComboMain()
        {

            DataSet ds = new DataSet();
            //LoadTypeHistory
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                DataTable dt = new DataTable();
                dt = confunc.LoadPara("TypeHistory");
                ds.Tables.Add(dt);
            }
            //LoadTypeCompalint
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                DataTable dt = new DataTable();
                dt = confunc.LoadPara("TypeComplaint");
                ds.Tables.Add(dt);
            }

            //
            return JsonConvert.SerializeObject(ds, Formatting.Indented);
        }
        [System.Web.Services.WebMethod]
        public static string ExcuteData(string data, string dataUnit)
        {
            try
            {
                DataProduct DataMain = JsonConvert.DeserializeObject<DataProduct>(data);
                JavaScriptSerializer json_serializer = new JavaScriptSerializer();
                var DataUnit = json_serializer.DeserializeObject(dataUnit);
                if (_CurrentID == null)
                {
                    using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                    {
                        //connFunc.ExecuteDataTable("YYY_sp_Customer_History_Insert", CommandType.StoredProcedure,
                        //    "@Customer_ID", SqlDbType.Int, _CurrentID,
                        //    "@Content", SqlDbType.NVarChar, DataMain.Content.Replace("'", "").Trim(),
                        //    "@Created_By", SqlDbType.Int, Comon.Global.sys_userid,
                        //    "@Created", SqlDbType.DateTime, Comon.Comon.GetDateTimeNow(),
                        //    "@branch_ID", SqlDbType.Int, Comon.Global.sys_branchID,
                        //    "@Type", SqlDbType.Int, DataMain.TypeHistory_ID,
                        //    "@Complaint", SqlDbType.Int, DataMain.TypeCompalint_ID
                        //);
                    }
                }
                else
                {
                    using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                    {
                        //connFunc.ExecuteDataTable("YYY_sp_Customer_History_Update", CommandType.StoredProcedure,
                        //    "@Content", SqlDbType.NVarChar, DataMain.Content.Replace("'", "").Trim(),
                        //    "@Modified_By", SqlDbType.Int, Comon.Global.sys_userid,
                        //    "@Modified", SqlDbType.DateTime, Comon.Comon.GetDateTimeNow(),
                        //     "@IdCurrent", SqlDbType.Int, _CurrentID,
                        //     "@Type", SqlDbType.Int, DataMain.TypeHistory_ID,
                        //     "@Complaint", SqlDbType.Int, DataMain.TypeCompalint_ID

                        //);
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
