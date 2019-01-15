using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using _2018_12_13.Comon;
namespace _2018_12_13.Views.WareHouse
{
    public partial class pageWareReview :WebPageBase
    {
        public static string _DataWare { get; set; }
        public static string _DataComboTypeProduct { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadComboDataWare();
        }


        private void LoadComboDataWare()
        {
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                DataTable dt = new DataTable();
                dt = confunc.ExecuteDataTable("YYY_sp_Product_WareHouse_LoadList", CommandType.StoredProcedure);
                _DataWare = JsonConvert.SerializeObject(dt);
            }
                _DataComboTypeProduct = "";
                DataTable dt1 = new DataTable();
                using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                {
                    dt1 = connFunc.ExecuteDataTable("[YYY_sp_Product_Combo_Product_Type_FilterList]", CommandType.StoredProcedure);
                }
                _DataComboTypeProduct = JsonConvert.SerializeObject(dt1);
            
        }
        [System.Web.Services.WebMethod]
        public static string LoadList(string wareID)
        {
            DataTable dt = new DataTable();
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                dt = confunc.ExecuteDataTable("[YYY_sp_WareHouse_ReviewProduct_Load]", CommandType.StoredProcedure,
                  "@UserID", SqlDbType.Int, Comon.Global.sys_userid
                  , "@WareID", SqlDbType.Int,Convert.ToInt32(wareID));
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
    }
}