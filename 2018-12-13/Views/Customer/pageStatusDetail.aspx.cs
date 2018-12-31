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
    public partial class pageStatusDetail : WebPageBase
    {
        public static string _CustomerID { get; set; }
        public static string _CurrentID { get; set; }

        public static string _dataStatus { get; set; }
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
                else {
                    _CurrentID = null;
                    _dataStatus = null;
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
                dt = confunc.ExecuteDataTable("[YYY_sp_Customer_Status_LoadDetail]", CommandType.StoredProcedure,
                  "@CurrentID", SqlDbType.Int, Convert.ToInt32(id == 0 ? 0 : id));
            }
            if (dt != null)
            {
                _dataStatus = JsonConvert.SerializeObject(dt);
            }
            else
            {
                _dataStatus= "";
            }
         
        }
        [System.Web.Services.WebMethod]
        public static string LoadComboMain()
        {
            
            DataSet ds = new DataSet();
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                DataTable dt = new DataTable();
                dt = confunc.LoadPara("TypeCustomerStatus");
                ds.Tables.Add(dt);
            }
            return JsonConvert.SerializeObject(ds, Formatting.Indented);
        }

        [System.Web.Services.WebMethod]
        public static string ExcuteData(string data)
        {
            try
            {
                StatusDetail DataMain = JsonConvert.DeserializeObject<StatusDetail>(data);
                if (_CurrentID==null)
                {
                    using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                    {
                        connFunc.ExecuteDataTable("YYY_sp_Customer_Status_Insert", CommandType.StoredProcedure,
                            "@Customer_ID", SqlDbType.Int, _CustomerID,
                            "@Content", SqlDbType.NVarChar, DataMain.Content.Replace("'", "").Trim(),
                            "@Created_By", SqlDbType.Int, Comon.Global.sys_userid,
                            "@Created", SqlDbType.DateTime, Comon.Comon.GetDateTimeNow(),
                            "@TypeID", SqlDbType.Int,DataMain.TypeStatus_ID
                        );
                    }
                }
                else
                {
                    using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                    {
                        connFunc.ExecuteDataTable("YYY_sp_Customer_Status_Update", CommandType.StoredProcedure,
                            "@Content", SqlDbType.NVarChar, DataMain.Content.Replace("'", "").Trim(),
                            "@Modified_By", SqlDbType.Int, Comon.Global.sys_userid ,
                            "@Modified", SqlDbType.DateTime, Comon.Comon.GetDateTimeNow(),
                             "@IDcurrent", SqlDbType.Int, _CurrentID,
                             "@TypeID", SqlDbType.Int,  DataMain.TypeStatus_ID

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
    public class StatusDetail
    {
        public int ID { get; set; }
        public string Content { get; set; }

        public int Customer_ID { get; set; }
        public int TypeStatus_ID { get; set; }
    }
}