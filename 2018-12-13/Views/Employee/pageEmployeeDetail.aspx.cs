using _2018_12_13.Comon;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _2018_12_13.Views.Employee
{
    public partial class pageEmployeeDetail : WebPageBase
    {
        public static string _CurrentID { get; set; }
        public static string _dataEmployeeList { get; set; }


        protected void Page_Load(object sender, EventArgs e)
        {
            var curr = Request.QueryString["CurrentID"];
            if (curr != null)
            {
                _CurrentID = curr.ToString();
                Loadata(Convert.ToInt32(_CurrentID));
            }
            else
            {
                _CurrentID = null;
                _dataEmployeeList = null;
            }
        }
        private void Loadata(int id)
        {
            DataTable dt = new DataTable();
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                dt = confunc.ExecuteDataTable("[YYY_sp_Employee_LoadDetail]", CommandType.StoredProcedure,
                  "@ID", SqlDbType.Int, Convert.ToInt32(id == 0 ? 0 : id));
            }
            if (dt != null)
            {
                _dataEmployeeList = JsonConvert.SerializeObject(dt);
            }
            else
            {
                _dataEmployeeList = "";
            }

        }
        [System.Web.Services.WebMethod]
        public static string LoadComboMain()
        {
            DataSet ds = new DataSet();
            //LoadGroup
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                DataTable dt = new DataTable();
                dt = confunc.ExecuteDataTable("YYY_sp_Employee_LoadCombo_Group", CommandType.StoredProcedure);
                ds.Tables.Add(dt);
            }
            //LoadSourceCustomer
            //LoadGender
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                DataTable dt = new DataTable();
                dt = confunc.LoadPara("Gender");
                ds.Tables.Add(dt);
            }

            return JsonConvert.SerializeObject(ds, Formatting.Indented);
        }

        [System.Web.Services.WebMethod]
    
            public static string ExcuteData(string data)
            {
                try
                {
                EmployeeDetail DataMain = JsonConvert.DeserializeObject<EmployeeDetail>(data);
                    if (_CurrentID == null)
                    {
                    using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                    {
                        var dt = connFunc.ExecuteDataTable("YYY_sp_Employee_Insert", CommandType.StoredProcedure,
                     "@Email", SqlDbType.NVarChar, DataMain.Email1.Replace("'", "").Trim(),
                     "@Address", SqlDbType.NVarChar, DataMain.Address.Replace("'", "").Trim(),
                     "@Phone", SqlDbType.NVarChar, DataMain.Phone1.Replace("'", "").Trim(),
                     "@Name", SqlDbType.NVarChar, DataMain.Name.Replace("'", "").Trim(),
                     "@Gender_ID", SqlDbType.Int, DataMain.Gender_ID,
                     "@Group_ID", SqlDbType.Int, DataMain.Group,
                     "@State_ID", SqlDbType.Int, DataMain.State,
                     "@Brithday", SqlDbType.DateTime, Convert.ToDateTime(DataMain.Birthday),
                     "@Created_By", SqlDbType.Int, Comon.Global.sys_userid,
                        "@Created", SqlDbType.DateTime, Comon.Comon.GetDateTimeNow()
                   );
                    }
                }
                    else
                    {
                    using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                    {
                        connFunc.ExecuteDataTable("YYY_sp_Employee_Update", CommandType.StoredProcedure,
                      "@Email", SqlDbType.NVarChar, DataMain.Email1.Replace("'", "").Trim(),
                      "@Address", SqlDbType.NVarChar, DataMain.Address.Replace("'", "").Trim(),
                      "@Phone", SqlDbType.NVarChar, DataMain.Phone1.Replace("'", "").Trim(),
                      "@Name", SqlDbType.NVarChar, DataMain.Name.Replace("'", "").Trim(),
                      "@Gender_ID", SqlDbType.Int, DataMain.Gender_ID,
                      "@Group_ID", SqlDbType.Int, DataMain.Group,
                      "@State_ID", SqlDbType.Int, DataMain.State,
                      "@Brithday", SqlDbType.DateTime, Convert.ToDateTime(DataMain.Birthday),
                      "@Modified_By", SqlDbType.Int, Comon.Global.sys_userid,
                         "@Modified", SqlDbType.DateTime, Comon.Comon.GetDateTimeNow(),
                         "@CurrentID", SqlDbType.Int, _CurrentID
                    );
                    }
                }
                return "1";
                }
                catch (Exception ex)
                {
                    return "Lỗi Hệ Thống";
                }
            }
    }
    public class EmployeeDetail
    {
        public string Email1 { get; set; }
        public string Avarta { get; set; }
        public string Address { get; set; }
        public string Phone1 { get; set; }
        public string Name { get; set; }
        public string CustomerID { get; set; }
        public int Gender_ID { get; set; }
        public int State { get; set; }
        public int Group { get; set; }
        public string Birthday { get; set; }

    }
}
