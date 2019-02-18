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
    public partial class pageTakeCareDetail : WebPageBase
    {
        public static string _CustomerID { get; set; }



        protected void Page_Load(object sender, EventArgs e)
        {

            var cus = Request.QueryString["CustomerID"];
            if (cus != null)
            {
                _CustomerID = cus.ToString();
            }
            else
            {
                _CustomerID = null;
                Response.Redirect("~/Error/index.html");
            }
        }

        [System.Web.Services.WebMethod]
        public static string ExcuteData(string data)
        {
            try
            {
                TakeCareDetail DataMain = JsonConvert.DeserializeObject<TakeCareDetail>(data);
                if (_CustomerID != null)
                {
                    using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                    {
                        connFunc.ExecuteDataTable("YYY_sp_Customer_TakeCare_Insert", CommandType.StoredProcedure,
                        "@TakeCare1", SqlDbType.DateTime, (DataMain.TakeCare1 != "") ? Convert.ToDateTime(DataMain.TakeCare1).ToString("yyyy-MM-dd HH:mm:ss") : null,
                        "@TakeCare2", SqlDbType.DateTime, (DataMain.TakeCare2 != "") ? Convert.ToDateTime(DataMain.TakeCare2).ToString("yyyy-MM-dd HH:mm:ss") : null,
                        "@TakeCare3", SqlDbType.DateTime, (DataMain.TakeCare3 != "") ? Convert.ToDateTime(DataMain.TakeCare3).ToString("yyyy-MM-dd HH:mm:ss") : null,
                        "@TakeCare4", SqlDbType.DateTime, (DataMain.TakeCare4 != "") ? Convert.ToDateTime(DataMain.TakeCare4).ToString("yyyy-MM-dd HH:mm:ss") : null,
                        "@Content", SqlDbType.NVarChar, DataMain.Content.Replace("'", "").Trim(),
                        "@Branch_ID", SqlDbType.Int, Comon.Global.sys_branchID,
                          "@Created_By", SqlDbType.Int, Comon.Global.sys_userid,
                        "@Customer_ID", SqlDbType.Int, _CustomerID);
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
    public class TakeCareDetail
    {
        public string Content { get; set; }
        public string TakeCare1 { get; set; }
        public string TakeCare2 { get; set; }
        public string TakeCare3 { get; set; }
        public string TakeCare4 { get; set; }
    }
}