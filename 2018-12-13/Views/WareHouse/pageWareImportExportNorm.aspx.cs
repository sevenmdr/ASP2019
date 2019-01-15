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
    public partial class pageWareImportExportNorm :WebPageBase
    {
        public static string _DataWare { get; set; }
        public static string _DataType { get; set; }
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
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                DataTable dt = new DataTable();
                dt.Columns.Add("ID");
                dt.Columns.Add("Name");
                DataRow dr = dt.NewRow();
                dr[0] = 1;dr[1] = "Nhập Kho";
                DataRow dr1 = dt.NewRow();
                dr1[0] = 2; dr1[1] = "Xuất Kho";
                DataRow dr2 = dt.NewRow();
                dr2[0] = 3; dr2[1] = "Tồn Kho Trước";
                DataRow dr3 = dt.NewRow();
                dr3[0] = 4; dr3[1] = "Tất Cả";
                dt.Rows.Add(dr); dt.Rows.Add(dr1); dt.Rows.Add(dr2); dt.Rows.Add(dr3);
                _DataType = JsonConvert.SerializeObject(dt);
            }
        }
        [System.Web.Services.WebMethod]
        public static string LoadList(string wareID)
        {
            DataTable dt = new DataTable();
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                dt = confunc.ExecuteDataTable("[YYY_sp_WareHouse_ExportImportNorm_Load]", CommandType.StoredProcedure,
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