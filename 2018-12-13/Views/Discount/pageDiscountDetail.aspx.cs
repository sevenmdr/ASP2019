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
        public DiscountTable(string id,string stt,string serviceName,string ServiceTypeName)
        {
            this.ID = id;
            this.STT = stt;
            this.ServiceTypeName = ServiceTypeName;
            this.ServiceName = serviceName;
        }
        public string ID { get; set; }
        public string STT { get; set; }
        public string ServiceTypeName { get; set; }
        public string ServiceName { get; set; }
    }
    public partial class pageDiscountDetail : WebPageBase
    {
        public static string _CurrentID { get; set; }
        public static string _TypeID { get; set; }
        public static string _DataTableServiceLeft { get; set; }
        public static string _DataTableServiceRight { get; set; }
        public static string _DataDiscountType { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            var curr = Request.QueryString["CurrentID"];
            InitializeCombo();
            if (curr != null)
            {
                _CurrentID = curr.ToString();
                Loadata(Convert.ToInt32(_CurrentID));
            }
            else
            {
                _CurrentID = null;
            }
        }
        //private void LoadDataInitialize()
        //{
        //    _DataTableServiceLeft = "";
        //    _DataTableServiceRight = "";

        //    DataTable dt1 = new DataTable();
        //    dt1.Columns.Add("ID"); dt1.Columns.Add("STT"); dt1.Columns.Add("ServiceTypeName");
        //    dt1.Columns.Add("ServiceName");

        //    DataTable dt2 = new DataTable();
        //    dt2.Columns.Add("ID"); dt2.Columns.Add("STT"); dt2.Columns.Add("ServiceTypeName");
        //    dt2.Columns.Add("ServiceName");


        //    DataRow dr1 = dt1.NewRow();
        //    dr1["ID"] = "1"; dr1["STT"] = "1"; dr1["ServiceName"] = "Service 1"; dr1["ServiceTypeName"] = "Service Type 1";
        //    DataRow dr2 = dt1.NewRow();
        //    dr2["ID"] = "2"; dr2["STT"] = "1"; dr2["ServiceName"] = "Service 1"; dr2["ServiceTypeName"] = "Service Type 1";
        //    DataRow dr3 = dt1.NewRow();
        //    dr3["ID"] = "3"; dr3["STT"] = "1"; dr3["ServiceName"] = "Service 1"; dr3["ServiceTypeName"] = "Service Type 1";
        //    dt1.Rows.Add(dr1);
        //    dt1.Rows.Add(dr2);
        //    dt1.Rows.Add(dr3);

        //    _DataTableServiceLeft = JsonConvert.SerializeObject(dt1);
        //    _DataTableServiceRight = "";
        //}
        private void InitializeCombo()
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
        [System.Web.Services.WebMethod]
        public static string ExecuteFromLeft(string id, string left, string right/*,string type*/)
        {
            try
            {
                List<DiscountTable> dtLeft =(JsonConvert.DeserializeObject<List<DiscountTable>>(left)!=null) ? JsonConvert.DeserializeObject<List<DiscountTable>>(left)
                    : new List<DiscountTable>();
                List<DiscountTable> dtRight =(JsonConvert.DeserializeObject<List<DiscountTable>>(right)!=null) ? JsonConvert.DeserializeObject<List<DiscountTable>>(right)
                    : new List<DiscountTable>();
                var drr = from items in dtLeft
                              where items.ID == id
                              select items;
                foreach(var dr in drr)
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
        public static string ExecuteFromRight(string id, string left, string right/*,string type*/)
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
                List<DiscountTable> dtLeft = new List<DiscountTable>();
                List<DiscountTable> dtRight = new List<DiscountTable>();
                dtLeft.Add(new DiscountTable("1","1","Service 1",""));
                dtLeft.Add(new DiscountTable("2", "2", "Service 2", ""));
                dtLeft.Add(new DiscountTable("3", "3", "Service 3", ""));

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
        public static string LoadLeftRightInitializeByServiceType()
        {
            try
            {
                List<DiscountTable> dtLeft = new List<DiscountTable>();
                List<DiscountTable> dtRight = new List<DiscountTable>();
                dtLeft.Add(new DiscountTable("1", "1", "", "Service Type 1"));
                dtLeft.Add(new DiscountTable("2", "2", "", "Service Type 2"));
                dtLeft.Add(new DiscountTable("3", "3", "", "Service Type 3"));

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




        private void Loadata(int id)
        {
            //DataTable dt = new DataTable();
            //using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            //{
            //    dt = confunc.ExecuteDataTable("[YYY_sp_Customer_History_LoadDetail]", CommandType.StoredProcedure,
            //      "@ID", SqlDbType.Int, Convert.ToInt32(id == 0 ? 0 : id));
            //}
            //if (dt != null)
            //{
            //    _dataHistory = JsonConvert.SerializeObject(dt);
            //}
            //else
            //{
            //    _dataHistory = "";
            //}

        }
       
        [System.Web.Services.WebMethod]
        public static string ExcuteData(string data)
        {
            //try
            //{
            //    HistoryDetail DataMain = JsonConvert.DeserializeObject<HistoryDetail>(data);
            //    if (_CurrentID == null)
            //    {
            //        using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
            //        {
            //            connFunc.ExecuteDataTable("YYY_sp_Customer_History_Insert", CommandType.StoredProcedure,
            //                "@Customer_ID", SqlDbType.Int, _CurrentID,
            //                "@Content", SqlDbType.NVarChar, DataMain.Content.Replace("'", "").Trim(),
            //                "@Created_By", SqlDbType.Int, Comon.Global.sys_userid,
            //                "@Created", SqlDbType.DateTime, Comon.Comon.GetDateTimeNow(),
            //                "@branch_ID", SqlDbType.Int, Comon.Global.sys_branchID,
            //                "@Type", SqlDbType.Int, DataMain.TypeHistory_ID,
            //                "@Complaint", SqlDbType.Int, DataMain.TypeCompalint_ID
            //            );
            //        }
            //    }
            //    else
            //    {
            //        using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
            //        {
            //            connFunc.ExecuteDataTable("YYY_sp_Customer_History_Update", CommandType.StoredProcedure,
            //                "@Content", SqlDbType.NVarChar, DataMain.Content.Replace("'", "").Trim(),
            //                "@Modified_By", SqlDbType.Int, Comon.Global.sys_userid,
            //                "@Modified", SqlDbType.DateTime, Comon.Comon.GetDateTimeNow(),
            //                 "@IdCurrent", SqlDbType.Int, _CurrentID,
            //                 "@Type", SqlDbType.Int, DataMain.TypeHistory_ID,
            //                 "@Complaint", SqlDbType.Int, DataMain.TypeCompalint_ID

            //            );
            //        }
            //    }
            //    return "1";
            //    }
            //    catch (Exception ex)
            //    {
            //        return "0";
            //    }


            //}
            return "0";
        }
    }

}
