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
        protected void Page_Load(object sender, EventArgs e)
        {
            var cus = Request.QueryString["CustomerID"];
            var curr = Request.QueryString["CurrentID"];

            if (cus != null)
            {
                _CustomerID = cus.ToString();
                if (curr != null)
                {
                    _CurrentID = curr.ToString();
                    Loadata(Convert.ToInt32(_CurrentID));
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
        [System.Web.Services.WebMethod]
        public static string LoadComboMain()
        {
            DataSet ds = new DataSet();
            //LoadDoctor
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                DataTable dt = new DataTable();
                dt = confunc.LoadEmployee("Doctor", 0);
                ds.Tables.Add(dt);
            }
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                DataTable dt = new DataTable();
                dt = confunc.LoadEmployee("Assistant", 0);
                ds.Tables.Add(dt);
            }
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                DataTable dt = new DataTable();
                dt = confunc.ExecuteDataTable("YYY_sp_Customer_Treatment_LoadComboService", CommandType.StoredProcedure,
                 "@Customer_ID", SqlDbType.Int, _CustomerID);
                ds.Tables.Add(dt);
            }
            return JsonConvert.SerializeObject(ds, Formatting.Indented);
        }
        [System.Web.Services.WebMethod]
        public static string ExcuteData(string data)
        {
            try
            {
                TreatDetail DataMain = JsonConvert.DeserializeObject<TreatDetail>(data);
                if (_CurrentID == null)
                {
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
                    "@PT2", SqlDbType.Int, DataMain.Ass2);
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
                            "@CurrentID", SqlDbType.Int, _CurrentID

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
    }
}