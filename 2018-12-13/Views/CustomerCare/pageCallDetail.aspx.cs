using _2018_12_13.Comon;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _2018_12_13.Views.CustomerCare
{
    public partial class pageCallDetail : WebPageBase
    {
        protected static int CustomerID { get; set; }
        protected static int Type_Care { get; set; }
        protected static int AppID { get; set; }
        protected static int MasterID { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["CustomerID"] != null)
            {
                var cusID = Request.QueryString["CustomerID"];
                var typeid = Request.QueryString["Type"];
                var appid = Request.QueryString["AppID"];
                var masterid = Request.QueryString["MasterID"];
                CustomerID = Convert.ToInt32(cusID == null ? "0" : cusID.ToString());
                Type_Care = Convert.ToInt32(typeid == null ? "0" : typeid.ToString());
                AppID = Convert.ToInt32(appid == null ? "0" : appid.ToString());
                MasterID = Convert.ToInt32(masterid == null ? "0" : masterid.ToString());
            }
        }
        [System.Web.Services.WebMethod]
        public static string ExcuteData(string content)
        {
            try{
                switch (Type_Care)
                {
                    case 1:
                        using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                        {
                            connFunc.ExecuteDataTable("YYY_sp_CustomerCare_InsertValue_ToRemindInDay", CommandType.StoredProcedure,
                                "@CustomerID", SqlDbType.Int, CustomerID,
                                "@AppID", SqlDbType.Int, AppID,
                                "@Type", SqlDbType.Int, 1,
                                "@Created_By", SqlDbType.Int, Comon.Global.sys_userid,
                                "@Created", SqlDbType.DateTime,  Comon.Comon.GetDateTimeNow(),
                                "@Content", SqlDbType.NVarChar, content.Replace("'", "").Trim()

                            );
                        }

                        break;


                    case 2:

                        using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                        {
                            connFunc.ExecuteDataTable("YYY_sp_CustomerCare_InsertValue_CheckinNotService", CommandType.StoredProcedure,
                                 "@CustomerID", SqlDbType.Int, CustomerID,
                                 "@AppID", SqlDbType.Int, AppID,
                                 "@Type", SqlDbType.Int, 1,
                                 "@Created_By", SqlDbType.Int, Comon.Global.sys_userid,
                                 "@Created", SqlDbType.DateTime,  Comon.Comon.GetDateTimeNow(),
                                 "@Content", SqlDbType.NVarChar, content.Replace("'", "").Trim()

                             );
                        }
                        break;
                    case 4:
                        using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                        {
                            connFunc.ExecuteDataTable("YYY_sp_CustomerCare_InsertValue_NotCheckIn", CommandType.StoredProcedure,

                                "@CustomerID", SqlDbType.Int, CustomerID,
                                "@AppID", SqlDbType.Int, AppID,
                                "@Type", SqlDbType.Int, 1,
                                "@Created_By", SqlDbType.Int, Comon.Global.sys_userid,
                                "@Created", SqlDbType.DateTime,  Comon.Comon.GetDateTimeNow(),
                                "@Content", SqlDbType.NVarChar, content.Replace("'", "").Trim()

                            );
                        }
                        break;

                    case 5:
                        using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                        {
                            connFunc.ExecuteDataTable("YYY_sp_CustomerCare_InsertValue_Treatment", CommandType.StoredProcedure,
                                 "@CustomerID", SqlDbType.Int, CustomerID,
                                "@MasterID", SqlDbType.Int, MasterID,
                                 "@Type", SqlDbType.Int, 1,
                                 "@Created_By", SqlDbType.Int, Comon.Global.sys_userid,
                                 "@Created", SqlDbType.DateTime,  Comon.Comon.GetDateTimeNow(),
                                 "@Content", SqlDbType.NVarChar, content.Replace("'", "").Trim()
                             );
                        }
                        break;
                      
                    case 3:
                        using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                        {
                            connFunc.ExecuteDataTable("YYY_sp_CustomerCare_InsertValue_Holiday", CommandType.StoredProcedure,
                                     "@CustomerID", SqlDbType.Int, CustomerID,
                                     "@Type", SqlDbType.Int, 1,
                                     "@Created_By", SqlDbType.Int, Comon.Global.sys_userid,
                                     "@Created", SqlDbType.DateTime,  Comon.Comon.GetDateTimeNow(),
                                     "@Content", SqlDbType.NVarChar, content.Replace("'", "").Trim()
                                 );
                        }
                        break;
                     


                }
                return "1";
            }
            catch (Exception)
            {
                return "0";
            }
            }
            
    }
}