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
    public partial class pageCustomerDetail : WebPageBase
    {
        private static int id { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            var v = Request.QueryString["CustomerID"];
            if (v != null)
            {
                id = Convert.ToInt32(v == null ? "0" : v.ToString());
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "script", string.Format("ChaneUpdateData({0})", Loadata(id)), true);
            }
            else
            {
                id = 0;
            }
        }
        private string Loadata(int id)
        {
            DataTable dt = new DataTable();
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                dt = confunc.ExecuteDataTable("[YYY_sp_Customer_LoadToEdit]", CommandType.StoredProcedure,
                  "@CurrentID", SqlDbType.Int, Convert.ToInt32(id == 0 ? 0 : id));
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
        public static string LoadComboMain()
        {
            DataSet ds = new DataSet();
            //LoadLanguage
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                DataTable dt = new DataTable();
                dt = confunc.LoadPara("Language");
                ds.Tables.Add(dt);
            }
            //LoadSourceCustomer
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                DataTable dt = new DataTable();
                dt = confunc.LoadPara("SourceCustomer");
                ds.Tables.Add(dt);
            }
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
                CustomerDetail DataMain = JsonConvert.DeserializeObject<CustomerDetail>(data);
                if (id == 0)
                {
                    using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                    {
                        var dt = connFunc.ExecuteDataTable("YYY_sp_Customer_Insert", CommandType.StoredProcedure,
                     "@Note", SqlDbType.NVarChar, "",
                     "@Email1", SqlDbType.NVarChar, DataMain.Email1.Replace("'", "").Trim(),
                     "@Address", SqlDbType.NVarChar, DataMain.Address.Replace("'", "").Trim(),
                     "@Phone1", SqlDbType.NVarChar, DataMain.Phone1.Replace("'", "").Trim(),
                     "@Branch_ID", SqlDbType.Int, Comon.Global.sys_branchID,
                     "@Name", SqlDbType.NVarChar, DataMain.Name.Replace("'", "").Trim(),
                     "@Gender_ID", SqlDbType.Int, DataMain.Gender_ID,
                     "@Type_Cat_ID", SqlDbType.Int, DataMain.Type_Cat_ID,
                     "@Language_ID", SqlDbType.Int, DataMain.Language_ID,
                     "@Birthday", SqlDbType.DateTime, Convert.ToDateTime(DataMain.Birthday),
                     "@Created_By", SqlDbType.Int, Comon.Global.sys_userid,
                        "@Created", SqlDbType.DateTime, Comon.Comon.GetDateTimeNow()
                   );
                    }
                }
                else
                {
                    using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                    {
                        connFunc.ExecuteDataTable("YYY_sp_Customer_Update", CommandType.StoredProcedure,
                      "@Note", SqlDbType.NVarChar, "",
                      "@Email1", SqlDbType.NVarChar, DataMain.Email1.Replace("'", "").Trim(),
                      "@Address", SqlDbType.NVarChar, DataMain.Address.Replace("'", "").Trim(),
                      "@Phone1", SqlDbType.NVarChar, DataMain.Phone1.Replace("'", "").Trim(),
                      "@Name", SqlDbType.NVarChar, DataMain.Name.Replace("'", "").Trim(),
                      "@Gender_ID", SqlDbType.Int, DataMain.Gender_ID,
                      "@Type_Cat_ID", SqlDbType.Int, DataMain.Type_Cat_ID,
                      "@Language_ID", SqlDbType.Int, DataMain.Language_ID,
                      "@Birthday", SqlDbType.DateTime, Convert.ToDateTime(DataMain.Birthday),
                      "@Modified_By", SqlDbType.Int, Comon.Global.sys_userid,
                         "@Modified", SqlDbType.DateTime, Comon.Comon.GetDateTimeNow(),
                         "@CurrentID", SqlDbType.Int, id
                    );
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
    public class CustomerDetail
    {
        public string Note { get; set; }
        public string Email1 { get; set; }
        public string Address { get; set; }
        public string Content { get; set; }
        public string Phone1 { get; set; }
        public string Name { get; set; }
        public string CustomerID { get; set; }
        public int Gender_ID { get; set; }
        public int Type_Cat_ID { get; set; }
        public int Language_ID { get; set; }
        public string Birthday { get; set; }

    }
}