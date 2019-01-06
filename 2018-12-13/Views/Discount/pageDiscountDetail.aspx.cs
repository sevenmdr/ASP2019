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

namespace _2018_12_13.Views.Discount
{

    public class DiscountTable
    {
        public DiscountTable(string id, string Name)
        {
            this.ID = id;
            this.Name = Name;
        }
        public string ID { get; set; }
        public string Name { get; set; }
    }
    public partial class pageDiscountDetail : WebPageBase
    {
        public static string _CurrentID { get; set; }
        public static string _TypeID { get; set; }
        public static string _DataTableServiceLeft { get; set; }
        public static string _DataTableServiceRight { get; set; }
        public static string _DataDiscountType { get; set; }
        public static string _DataDiscount { get; set; }
        private static List<DiscountTable> _Service { get; set; }
        private static List<DiscountTable> _ServiceType { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            var curr = Request.QueryString["CurrentID"];
            InitializeComboType();
            InitializeService();
            //Loadata(Convert.ToInt32(2));

            if (curr != null)
            {
                _CurrentID = curr.ToString();
                Loadata(Convert.ToInt32(_CurrentID));
            }
            else
            {
                _CurrentID = null;
                _DataTableServiceLeft = null;
                _DataTableServiceRight = null;
                _DataDiscount = null;
            }
        }
        private void Loadata(int id)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("ID");
            dt.Columns.Add("Name");
            dt.Columns.Add("Content");
            dt.Columns.Add("DateForm");
            dt.Columns.Add("DateTo");
            dt.Columns.Add("Amount", typeof(Decimal));
            dt.Columns.Add("Percent", typeof(Int32));
            dt.Columns.Add("Type");
            dt.Columns.Add("Rule");
            dt.Columns.Add("Left");
            dt.Columns.Add("Right");

          

            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                dt = confunc.ExecuteDataTable("[YYY_sp_Discount_LoadDetail]", CommandType.StoredProcedure,
                  "@Current", SqlDbType.Int, Convert.ToInt32(id));
            }
            if (dt != null)
            {
                string[] service = dt.Rows[0]["Rule"].ToString().Split('-');
              _DataDiscount = JsonConvert.SerializeObject(dt);
                if (dt.Rows[0]["Type"].ToString() == "1")
                {
                    var drrContain = from items in _Service
                                     where service.Contains(items.ID)
                                     select items;
                    var drrNotContain = from items in _Service
                                        where !service.Contains(items.ID)
                                        select items;
                    _DataTableServiceLeft = JsonConvert.SerializeObject(drrNotContain);
                    _DataTableServiceRight = JsonConvert.SerializeObject(drrContain);

                }
                if (dt.Rows[0]["Type"].ToString() == "2")
                {
                    var drrContain = from items in _ServiceType
                                     where service.Contains(items.ID)
                                     select items;
                    var drrNotContain = from items in _ServiceType
                                        where !service.Contains(items.ID)
                                        select items;
                    _DataTableServiceLeft = JsonConvert.SerializeObject(drrNotContain);
                    _DataTableServiceRight = JsonConvert.SerializeObject(drrContain);
                }

            }
            else
            {
                _DataTableServiceLeft = "";
                _DataTableServiceRight = "";
                _DataDiscount = "";
            }
        }
        private void InitializeComboType()
        {
            _DataDiscountType = "";

            DataTable dt = new DataTable();
            dt.Columns.Add("ID"); dt.Columns.Add("Name");
            DataRow dr1 = dt.NewRow();
            dr1[0] = "1";
            dr1[1] = "Theo Dịch Vụ";

            DataRow dr2 = dt.NewRow();
            dr2[0] = "2";
            dr2[1] = "Theo Nhóm Dịch Vụ";

            DataRow dr3 = dt.NewRow();
            dr3[0] = "3";
            dr3[1] = "Tất Cả";

            dt.Rows.Add(dr1); dt.Rows.Add(dr2); dt.Rows.Add(dr3);
            _DataDiscountType = JsonConvert.SerializeObject(dt);
        }
        private void InitializeService()
        {
            _Service = new List<DiscountTable>();
            _ServiceType = new List<DiscountTable>();
            DataSet ds = new DataSet();
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                ds = confunc.ExecuteDataSet("[YYY_sp_Discount_LoadListService]", CommandType.StoredProcedure);
            }
            if (ds != null)
            {
                DataTable dtService = ds.Tables[0];
                DataTable dtServiceType = ds.Tables[1];
                foreach (DataRow dr in dtService.Rows)
                {
                    _Service.Add(new DiscountTable(dr[0].ToString(), dr[1].ToString()));
                }
                foreach (DataRow dr in dtServiceType.Rows)
                {
                    _ServiceType.Add(new DiscountTable(dr[0].ToString(), dr[1].ToString()));
                }
            }
            else
            {
                _Service = null;
                _ServiceType = null;
            }

        }

        [System.Web.Services.WebMethod]
        public static string ExecuteFromLeft(string id, string left, string right)
        {
            try
            {
                List<DiscountTable> dtLeft = (JsonConvert.DeserializeObject<List<DiscountTable>>(left) != null) ? JsonConvert.DeserializeObject<List<DiscountTable>>(left)
                    : new List<DiscountTable>();
                List<DiscountTable> dtRight = (JsonConvert.DeserializeObject<List<DiscountTable>>(right) != null) ? JsonConvert.DeserializeObject<List<DiscountTable>>(right)
                    : new List<DiscountTable>();
                var drr = from items in dtLeft
                          where items.ID == id
                          select items;
                foreach (var dr in drr)
                {
                    dtRight.Add(dr);
                    dtLeft.Remove(dr);
                    break;
                }
                JArray array = new JArray();
                array.Add(new JavaScriptSerializer().Serialize(dtLeft));
                array.Add(new JavaScriptSerializer().Serialize(dtRight));
                return array.ToString();
            }
            catch (Exception ex)
            {
                return "0";
            }
        }

        [System.Web.Services.WebMethod]
        public static string ExecuteFromRight(string id, string left, string right)
        {
            try
            {
                List<DiscountTable> dtLeft = (JsonConvert.DeserializeObject<List<DiscountTable>>(left) != null) ? JsonConvert.DeserializeObject<List<DiscountTable>>(left)
                    : new List<DiscountTable>();
                List<DiscountTable> dtRight = (JsonConvert.DeserializeObject<List<DiscountTable>>(right) != null) ? JsonConvert.DeserializeObject<List<DiscountTable>>(right)
                    : new List<DiscountTable>();
                var drr = from items in dtRight
                          where items.ID == id
                          select items;
                foreach (var dr in drr)
                {
                    dtLeft.Add(dr);
                    dtRight.Remove(dr);
                    break;
                }
                JArray array = new JArray();
                array.Add(new JavaScriptSerializer().Serialize(dtLeft));
                array.Add(new JavaScriptSerializer().Serialize(dtRight));
                return array.ToString();
            }
            catch (Exception ex)
            {
                return "0";
            }
        }

        [System.Web.Services.WebMethod]
        public static string LoadLeftRightInitializeByService()
        {
            try
            {
                JArray array = new JArray();
                array.Add(new JavaScriptSerializer().Serialize(_Service));
                array.Add(new JavaScriptSerializer().Serialize(new List<DiscountTable>()));
                return array.ToString();
            }
            catch (Exception ex)
            {
                return "0";
            }
        }

        [System.Web.Services.WebMethod]
        public static string LoadLeftRightInitializeByServiceType()
        {
            try
            {
                JArray array = new JArray();
                array.Add(new JavaScriptSerializer().Serialize(_ServiceType));
                array.Add(new JavaScriptSerializer().Serialize(new List<DiscountTable>()));
                return array.ToString();
            }
            catch (Exception ex)
            {
                return "0";
            }
        }

   

        [System.Web.Services.WebMethod]
        public static string ExcuteData(string data)
        {
            try
            {
                DiscountDetail DataMain = JsonConvert.DeserializeObject<DiscountDetail>(data);
                if (_CurrentID == null)
                {
                    using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                    {
                        connFunc.ExecuteDataTable("YYY_sp_Discount_Insert", CommandType.StoredProcedure,
                            "@Name", SqlDbType.NVarChar, DataMain.Name.Replace("'", "").Trim(),
                            "@Created_By", SqlDbType.Int, Comon.Global.sys_userid,
                            "@Created", SqlDbType.DateTime, Comon.Comon.GetDateTimeNow(),
                             "@Percent", SqlDbType.Int, DataMain.Percent,
                             "@Amount", SqlDbType.Decimal, DataMain.Amount,
                             "@Type", SqlDbType.Int, DataMain.Type,
                             "@Rule", SqlDbType.NVarChar, DataMain.Rule,
                             "@Date_From", SqlDbType.DateTime, Convert.ToDateTime(DataMain.DateFrom),
                             "@Date_To", SqlDbType.DateTime, Convert.ToDateTime(DataMain.DateTo),
                             "@Note", SqlDbType.NVarChar, DataMain.Content
                        );
                    }
                }
                else
                {
                using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                {
                        connFunc.ExecuteDataTable("YYY_sp_Discount_Update", CommandType.StoredProcedure,
                            "@Name", SqlDbType.NVarChar, DataMain.Name.Replace("'", "").Trim(),
                            "@Modified_By", SqlDbType.Int, Comon.Global.sys_userid,
                            "@Modified", SqlDbType.DateTime, Comon.Comon.GetDateTimeNow(),
                             "@CurrentID", SqlDbType.Int, _CurrentID,
                             "@Percent", SqlDbType.Int, DataMain.Percent,
                             "@Amount", SqlDbType.Decimal, DataMain.Amount,
                             "@Type", SqlDbType.Int, DataMain.Type,
                             "@Rule", SqlDbType.NVarChar, DataMain.Rule,
                             "@Date_From", SqlDbType.DateTime, Convert.ToDateTime(DataMain.DateFrom),
                             "@Date_To", SqlDbType.DateTime, Convert.ToDateTime(DataMain.DateTo),
                             "@Note", SqlDbType.NVarChar, DataMain.Content
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
    public class DiscountDetail
    {
        public string Name { get; set; }
        public string DateFrom { get; set; }
        public string DateTo { get; set; }
        public int Amount { get; set; }
        public int Percent { get; set; }
        public int Type { get; set; }
        public string Content { get; set; }
        public string Rule { get; set; }
    }

}
