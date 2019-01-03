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
    public partial class pageSupplierList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [System.Web.Services.WebMethod]

        public static string LoadataSupplier()
        {
            DataTable dt = new DataTable();
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                dt = confunc.ExecuteDataTable("YYY_sp_Product_Supplier_LoadList", CommandType.StoredProcedure,
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
        public static string DeleteItem(int id)
        {
            try
            {
                using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                {
                    connFunc.ExecuteDataTable("[YYY_sp_Product_Supplier_Delete]", CommandType.StoredProcedure,
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