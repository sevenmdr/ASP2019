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
        private static int _CurrentID { get; set; }
        public static string _defaultAvatar { get; set; }

        public static string _dataInfo { get; set; }
        public static string _dataGender { get; set; }
        public static string _dataSource { get; set; }
        public static string _dataLangue { get; set; }



        protected void Page_Load(object sender, EventArgs e)
        {
            LoadComboMain();
            _defaultAvatar = Comon.Global.sys_DefaultAvatar;
            var v = Request.QueryString["CustomerID"];
            if (v != null)
            {
                _CurrentID = Convert.ToInt32(v == null ? "0" : v.ToString());
                Loadata(_CurrentID);
            }
            else
            {
                _CurrentID = 0;
                _dataInfo = "";
            }
        }
        private void Loadata(int id)
        {
            DataTable dt = new DataTable();
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                dt = confunc.ExecuteDataTable("[YYY_sp_Customer_LoadToEdit]", CommandType.StoredProcedure,
                  "@CurrentID", SqlDbType.Int, Convert.ToInt32(id == 0 ? 0 : id));
            }
            if (dt != null)
            {
                _dataInfo = JsonConvert.SerializeObject(dt);
            }
            else
            {
                _dataInfo = "";
            }

        }

        public void LoadComboMain()
        {
            //LoadLanguage
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                DataTable dt = new DataTable();
                dt = confunc.LoadPara("Language");
                _dataLangue = JsonConvert.SerializeObject(dt, Formatting.Indented);
            }
            //LoadSourceCustomer
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                DataTable dt = new DataTable();
                dt = confunc.LoadPara("SourceCustomer");
                _dataSource = JsonConvert.SerializeObject(dt, Formatting.Indented);
            }
            //LoadGender
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                DataTable dt = new DataTable();
                dt = confunc.LoadPara("Gender");
                _dataGender = JsonConvert.SerializeObject(dt, Formatting.Indented);
            }

        }
        [System.Web.Services.WebMethod]
        public static string ExcuteData(string data)
        {

            CustomerDetail DataMain = JsonConvert.DeserializeObject<CustomerDetail>(data);
            try
            {
                if (_CurrentID == 0)
                {
                    using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                    {
                        var dt = connFunc.ExecuteDataTable("YYY_sp_Customer_Insert", CommandType.StoredProcedure,
                     "@Note", SqlDbType.NVarChar, "",
                     "@Email1", SqlDbType.NVarChar, DataMain.Email1.Replace("'", "").Trim(),
                     "@Address", SqlDbType.NVarChar, DataMain.Address.Replace("'", "").Trim(),
                     "@Phone1", SqlDbType.NVarChar, DataMain.Phone1.Replace("'", "").Trim(),
                      "@Phone2", SqlDbType.NVarChar, DataMain.Phone2.Replace("'", "").Trim(),
                     "@Branch_ID", SqlDbType.Int, Comon.Global.sys_branchID,
                     "@Name", SqlDbType.NVarChar, DataMain.Name.Replace("'", "").Trim(),
                     "@Gender_ID", SqlDbType.Int, DataMain.Gender_ID,
                     "@Type_Cat_ID", SqlDbType.Int, DataMain.Type_Cat_ID,
                     "@Language_ID", SqlDbType.Int, DataMain.Language_ID,
                       "@Avatar", SqlDbType.NVarChar, DataMain.Avatar.ToString(),
                     "@Birthday", SqlDbType.NVarChar, Convert.ToDateTime(DataMain.Birthday).ToString("yyyy-MM-dd HH:mm:ss"),
                     "@instgramurl", SqlDbType.NVarChar, DataMain.instgramurl.Replace("'", "").Trim(),
                     "@facebookurl", SqlDbType.NVarChar, DataMain.facebookurl.Replace("'", "").Trim(),
                     "@Created_By", SqlDbType.Int, Comon.Global.sys_userid,
                        "@Created", SqlDbType.DateTime, Comon.Comon.GetDateTimeNow()
                   );
                    }
                    Console.WriteLine("1");
                    return "2";


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
                      "@Phone2", SqlDbType.NVarChar, DataMain.Phone2.Replace("'", "").Trim(),

                      "@Name", SqlDbType.NVarChar, DataMain.Name.Replace("'", "").Trim(),
                      "@Gender_ID", SqlDbType.Int, DataMain.Gender_ID,
                      "@Type_Cat_ID", SqlDbType.Int, DataMain.Type_Cat_ID,
                      "@Language_ID", SqlDbType.Int, DataMain.Language_ID,
                       "@Avatar", SqlDbType.NVarChar, DataMain.Avatar.ToString(),
                      "@Birthday", SqlDbType.DateTime, Convert.ToDateTime(DataMain.Birthday).ToString("yyyy-MM-dd HH:mm:ss"),
                      "@instgramurl", SqlDbType.NVarChar, DataMain.instgramurl.Replace("'", "").Trim(),
                     "@facebookurl", SqlDbType.NVarChar, DataMain.facebookurl.Replace("'", "").Trim(),
                      "@Modified_By", SqlDbType.Int, Comon.Global.sys_userid,
                         "@Modified", SqlDbType.DateTime, Comon.Comon.GetDateTimeNow(),
                         "@CurrentID", SqlDbType.Int, _CurrentID
                    );
                    }
                }
                Console.WriteLine("1");
                return "1";
            }
            catch (Exception ex)
            {
                return DataMain.Birthday.ToString();
      
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
        public string Phone2 { get; set; }
        public string Name { get; set; }
        public string CustomerID { get; set; }
        public int Gender_ID { get; set; }
        public int Type_Cat_ID { get; set; }
        public int Language_ID { get; set; }
        public string Birthday { get; set; }
        public string Avatar { get; set; }
        public string instgramurl { get; set; }
        public string facebookurl { get; set; }
    }
}