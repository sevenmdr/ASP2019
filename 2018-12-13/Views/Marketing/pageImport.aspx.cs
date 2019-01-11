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
using System.Text.RegularExpressions;

namespace _2018_12_13.Views.Marketing
{

    public partial class pageImport : WebPageBase
    {
        public static string _DataComboSource { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            InitializeCombo();

        }
        private void InitializeCombo()
        {
            _DataComboSource = "";
            DataTable dt1 = new DataTable();
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                dt1 = confunc.LoadPara("SourceCustomer");
            }
            _DataComboSource = JsonConvert.SerializeObject(dt1);

        }

        [System.Web.Services.WebMethod]
        public static string ExcuteData(string data,string sourceID,string filename)
        {
            try
            {
                DataTable DataImportDetail = new DataTable();
                DataImportDetail = JsonConvert.DeserializeObject<DataTable>(data);
                int count = 0;
                foreach(DataRow dr in DataImportDetail.Rows)
                {
                   // || dr["Phone"] != null || !regexItem.IsMatch(dr["Phone"].ToString()) || dr["Phone"].ToString().Length != 10
                    count = count + 1;
                    if(dr["Name"]==null || Regex.IsMatch(dr["Name"].ToString(), "^[ A-Za-z0-9]$")  || dr["Phone"] == null || Regex.IsMatch(dr["Phone"].ToString(), "^[ A-Za-z0-9]$") || dr["Phone"].ToString().Length != 10)
                    {
                        return string.Format("Kiểm tra lại dữ liệu ở dòng {0} . Không thể có ký tự đặc biết và số điện thoại là 10 số", count);
                    }
                }
                using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                {
                    connFunc.ExecuteDataTable("[YYY_sp_Ticket_Import_Insert]", CommandType.StoredProcedure,
                        "@Created_By", SqlDbType.Int, Comon.Global.sys_userid,
                         "@Source", SqlDbType.Int, Convert.ToInt32(sourceID),
                        "@Created", SqlDbType.DateTime, Comon.Comon.GetDateTimeNow(),
                        "@Name", SqlDbType.NVarChar, filename.Replace("'", "").Trim(),
                        "@table_data", SqlDbType.Structured, DataImportDetail.Rows.Count > 0 ? DataImportDetail : null
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
