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
    public partial class pageUserDetail : WebPageBase
    {
        public static string _CurrentID { get; set; }
        public static string _dataUserList { get; set; }


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
                _dataUserList = null;
            }
        }
        private void Loadata(int id)
        {
            DataTable dt = new DataTable();
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                dt = confunc.ExecuteDataTable("[YYY_sp_User_Detail]", CommandType.StoredProcedure,
                  "@ID", SqlDbType.Int, Convert.ToInt32(id == 0 ? 0 : id));
            }
            if (dt != null)
            {
                _dataUserList = JsonConvert.SerializeObject(dt);
            }
            else
            {
                _dataUserList = "";
            }

        }
        [System.Web.Services.WebMethod]
        public static string LoadComboMain()
        {
            DataSet ds = new DataSet();
            //Group
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                DataTable dt = new DataTable();
                dt = confunc.ExecuteDataTable("YYY_sp_User_LoadCombo_GroupUser", CommandType.StoredProcedure);
                ds.Tables.Add(dt);
            }
            //Branch
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                DataTable dt = new DataTable();
                dt = confunc.ExecuteDataTable("YYY_sp_Branch_Load", CommandType.StoredProcedure);
                ds.Tables.Add(dt);
            }
         

            //LoadEmployee
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                DataTable dt = new DataTable();
                dt = confunc.ExecuteDataTable("YYY_sp_User_LoadCombo_Employee", CommandType.StoredProcedure);
                ds.Tables.Add(dt);
            }
            //LoadEmployeeEdit
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                DataTable dt = new DataTable();
                dt = confunc.ExecuteDataTable("YYY_sp_User_LoadCombo_Employee_Edit", CommandType.StoredProcedure);
                ds.Tables.Add(dt);
            }
            
            return JsonConvert.SerializeObject(ds, Formatting.Indented);
        }

        [System.Web.Services.WebMethod]
        public static string CheckexistUser(string EmpName)

        {
            EmpName = EmpName.Trim();
            string username = "";
            string[] user = Comon.Comon.ConvertToUnsign(EmpName).Split(' ');
            if (user != null && user.Length > 0)
            {
                username = user[user.Length - 1].ToString().Trim() == user[0].ToString().Trim() ? user[user.Length - 1].ToString().Trim() : user[user.Length - 1].ToString().Trim() + "." + user[0].ToString().Trim();
            }

            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                var dt = confunc.ExecuteDataTable("YYY_sp_User_CheckUserName", CommandType.StoredProcedure, "@username", SqlDbType.NVarChar, username);
                if (dt != null && dt.Rows.Count > 0)
                {
                    if (Convert.ToUInt32(dt.Rows[0][0].ToString()) != 0)
                    {
                        username = username + "." + (Convert.ToUInt32(dt.Rows[0][0].ToString())).ToString();
                    }
                }

            }

            return username;
        }

        [System.Web.Services.WebMethod]
    
            public static string ExcuteData(string data)
            {
                try
                {
                UserDetail DataMain = JsonConvert.DeserializeObject<UserDetail>(data);
                    if (_CurrentID == null)
                    {
                    using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                    {
                        var dt = connFunc.ExecuteDataTable("[YYY_sp_User_Insert]", CommandType.StoredProcedure,
                     "@Employee_ID", SqlDbType.Int, DataMain.Emp_ID,
                     "@Group_ID", SqlDbType.Int, DataMain.Group,
                     "@Branch_ID", SqlDbType.Int, DataMain.Branch_ID,
                     "@Name", SqlDbType.NVarChar, DataMain.Name.Trim(),
                     "@Username", SqlDbType.NVarChar, DataMain.UserName,
                     "@Password", SqlDbType.NVarChar, Comon.Global.sys_PassworDefault,
                     "@State_ID", SqlDbType.Int, DataMain.State,
                     "@Created_By", SqlDbType.Int, Comon.Global.sys_userid,
                        "@Created", SqlDbType.DateTime, Comon.Comon.GetDateTimeNow()
                   );
                    }
                }
                    else
                    {
                    using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                    {
                        connFunc.ExecuteDataTable("YYY_sp_User_Update", CommandType.StoredProcedure,
                      "@Group_ID", SqlDbType.Int, DataMain.Group,
                      "@Branch_ID", SqlDbType.Int, DataMain.Group,
                      "@State_ID", SqlDbType.Int, DataMain.State,
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
    public class UserDetail
    {
        public int Branch_ID { get; set; }
        public int Emp_ID { get; set; }
        public string Name { get; set; }
        public int State { get; set; }
        public int Group { get; set; }
        public string UserName { get; set; }

    }
}
