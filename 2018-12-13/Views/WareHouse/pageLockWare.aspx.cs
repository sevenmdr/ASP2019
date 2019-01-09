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
    public partial class pageLockWare : System.Web.UI.Page
    {
        public static string _DataWare { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadComboDataBranch();
        }

        private void LoadComboDataBranch()
        {
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                DataTable dt = new DataTable();
                dt = confunc.ExecuteDataTable("YYY_sp_Product_WareHouse_LoadList", CommandType.StoredProcedure);
                _DataWare = JsonConvert.SerializeObject(dt);
            }
        }
        [System.Web.Services.WebMethod]
        public static string LoadLockList(string datefrom ,string dateto)
        {
            DataTable dt = new DataTable();
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                dt = confunc.ExecuteDataTable("[YYY_sp_WareHouse_Lock_Load]", CommandType.StoredProcedure,
                  "@UserID", SqlDbType.Int, Comon.Global.sys_userid,
                  "@datefrom", SqlDbType.DateTime, Convert.ToDateTime(datefrom),
                  "@dateto", SqlDbType.DateTime, Convert.ToDateTime(dateto));
            }
            if (dt != null)
            {
                return JsonConvert.SerializeObject(dt);
            }
            else
            {
                return "";
            }
        }

        [System.Web.Services.WebMethod]
        public static string LoadLockDetailNew()
        {
            DataTable dt = new DataTable();
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                dt = confunc.ExecuteDataTable("[YYY_sp_WareHouse_LockDetailNew_Load]", CommandType.StoredProcedure,
                  "@UserID", SqlDbType.Int, Comon.Global.sys_userid);
            }
            if (dt != null)
            {
                return JsonConvert.SerializeObject(dt);
            }
            else
            {
                return "";
            }
        }

        [System.Web.Services.WebMethod]
        public static string LoadLockDetail(string idLock)
        {
            DataTable dt = new DataTable();
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                dt = confunc.ExecuteDataTable("[YYY_sp_WareHouse_LockDetail_Load]", CommandType.StoredProcedure,
                  "@UserID", SqlDbType.Int, Comon.Global.sys_userid,
                   "@IDLock", SqlDbType.Int,Convert.ToInt32(idLock));
            }
            if (dt != null)
            {
                return JsonConvert.SerializeObject(dt);
            }
            else
            {
                return "";
            }
        }



        [System.Web.Services.WebMethod]
        public static string ExcuteDataNew(string dataDetail, string idWare, string newOrUpdate)
        {
            //try
            //{
            //    DataInput DataMain = JsonConvert.DeserializeObject<DataInput>(data);
            //    JavaScriptSerializer json_serializer = new JavaScriptSerializer();
            //    DataTable DataProductDetail = new DataTable();
            //    DataProductDetail = JsonConvert.DeserializeObject<DataTable>(dataProduct);
            //    if (_CurrentID == null)
            //    {
            //        using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
            //        {
            //            connFunc.ExecuteDataTable("YYY_sp_Product_Receipt_Insert", CommandType.StoredProcedure,
            //                "@date", SqlDbType.DateTime, Convert.ToDateTime(DataMain.DateInput),
            //                "@Amount", SqlDbType.Decimal, DataMain.TotalAmount,
            //                "@Created_By", SqlDbType.Int, Comon.Global.sys_userid,
            //                "@Created", SqlDbType.DateTime, Comon.Comon.GetDateTimeNow(),
            //                "@Ware_ID", SqlDbType.Int, DataMain.Ware,
            //                "@Note", SqlDbType.Int, DataMain.Content.Replace("'", "").Trim(),
            //                "@table_data", SqlDbType.Structured, DataProductDetail.Rows.Count > 0 ? DataProductDetail : null
            //            );
            //        }
            //    }
            //    else
            //    {
            //        using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
            //        {
            //            connFunc.ExecuteDataTable("YYY_sp_Product_Receipt_Update", CommandType.StoredProcedure,
            //                "@date", SqlDbType.NVarChar, Convert.ToDateTime(DataMain.DateInput),
            //                "@Amount", SqlDbType.Decimal, DataMain.TotalAmount,
            //                "@Ware_ID", SqlDbType.Int, DataMain.Ware,
            //                "@Note", SqlDbType.Int, DataMain.Content.Replace("'", "").Trim(),
            //                "@data", SqlDbType.Structured, DataProductDetail.Rows.Count > 0 ? DataProductDetail : null,
            //                "@Modified_By", SqlDbType.Int, Comon.Global.sys_userid,
            //                "@Modified", SqlDbType.DateTime, Comon.Comon.GetDateTimeNow(),
            //                "@CurrentID", SqlDbType.Int, Convert.ToInt32(_CurrentID)


            //            );
            //        }
            //    }
            return "1";
            //}
            //catch (Exception ex)
            //{
            //    return "0";
            //}
        }
        [System.Web.Services.WebMethod]
        public static string DeleteItem(int id)
        {
            try
            {
                using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                {
                    connFunc.ExecuteDataTable("[YYY_sp_Product_Reciept_Delete]", CommandType.StoredProcedure,
                        "@CurrentID", SqlDbType.Int, id,
                        "@Datenow", SqlDbType.DateTime, Comon.Comon.GetDateTimeNow(),
                        "@userID", SqlDbType.Int, Comon.Global.sys_userid
                    );
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