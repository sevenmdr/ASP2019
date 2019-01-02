using _2018_12_13.Comon;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _2018_12_13.Views.WareHouse
{
    public partial class pageWareHouseDetail : WebPageBase
    {
        public static string _CurrentID { get; set; }

   
        protected void Page_Load(object sender, EventArgs e)
        {
            var curr = Request.QueryString["CurrentID"];
            if (curr != null)
            {
                _CurrentID = curr.ToString();
            }
            else
            {
                _CurrentID = null;
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
    public class HistoryDetail
    {
        //public int ID { get; set; }
        //public string Content { get; set; }
        //public int TypeHistory_ID { get; set; }
        //public int TypeCompalint_ID { get; set; }
    }
}
