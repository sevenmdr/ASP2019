using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _2018_12_13.Views.Setting
{
    public partial class pageSettingGeneral : System.Web.UI.Page
    {
        public static string _DataBranch { get; set; }
        public static string _DataCompany { get; set; }
        public static string _DataOption { get; set; }
        public static string _Branch_ID { get; set; }
        public static string _defaultAvatar { get; set; }
        public static string _CompanyID { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            _defaultAvatar = Comon.Global.sys_DefaultAvatar;
            Initialize();
        }
        private void Initialize()
        {
            _DataBranch = "";
            _DataCompany = "";
            _DataOption = "";
            DataSet ds = new DataSet();
            using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
            {
                ds = connFunc.ExecuteDataSet("[YYY_sp_LoadAll_Setting]", CommandType.StoredProcedure); 
            }
            _Branch_ID = ds.Tables[1].Rows[0]["ID"].ToString();
            _CompanyID = ds.Tables[0].Rows[0]["ID"].ToString();

            _DataBranch = JsonConvert.SerializeObject(ds.Tables[1]);
            _DataCompany = JsonConvert.SerializeObject(ds.Tables[0]);
            _DataOption = JsonConvert.SerializeObject(ds.Tables[2]);

        }
        [System.Web.Services.WebMethod]
        public static string ExcuteCompany(string data)
        {

            try
            {
                Company DataMain = JsonConvert.DeserializeObject<Company>(data);
                if (_CompanyID.ToString() != "0")
                {
                    using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                    {
                        connFunc.ExecuteDataTable("[YYY_sp_Company_Update]", CommandType.StoredProcedure,
                      "@Image ", SqlDbType.NVarChar, DataMain.Avatar.Replace("'", "").Trim(),
                      "@Name ", SqlDbType.NVarChar, DataMain.Name.Replace("'", "").Trim(),
                      "@Phone ", SqlDbType.NVarChar, DataMain.Hotline.Replace("'", "").Trim(),
                      "@Address ", SqlDbType.NVarChar, DataMain.Address.Replace("'", "").Trim(),
                      "@Modified_By", SqlDbType.Int, Comon.Global.sys_userid,
                         "@Modified", SqlDbType.DateTime, Comon.Comon.GetDateTimeNow(),
                         "@CurrentID", SqlDbType.Int, _CompanyID
                    );
                    }
                }
                else
                {
                   
                }
                return "1";
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
                return "0";
            }


        }
        [System.Web.Services.WebMethod]
        public static string ExcuteBranch(string data)
        {

            try
            {
                Branch DataMain = JsonConvert.DeserializeObject<Branch>(data);
                if (_Branch_ID.ToString() != "0")
                {
                    using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                    {
                        connFunc.ExecuteDataTable("[YYY_sp_Branch_Update]", CommandType.StoredProcedure,
                      "@BranchCode", SqlDbType.NVarChar, DataMain.BranchCode.Replace("'", "").Trim(),
                      "@Name ", SqlDbType.NVarChar, DataMain.Name.Replace("'", "").Trim(),
                      "@ShortName ", SqlDbType.NVarChar, DataMain.BranchCode.Replace("'", "").Trim(),
                      "@Target_Amount ", SqlDbType.Int, DataMain.Target,
                      "@Address ", SqlDbType.NVarChar, DataMain.Address,
                      "@Suggest_Location ", SqlDbType.NVarChar, DataMain.BranchAddressNote,
                      "@Modified_By", SqlDbType.Int, Comon.Global.sys_userid,
                         "@Modified", SqlDbType.DateTime, Comon.Comon.GetDateTimeNow(),
                         "@CurrentID", SqlDbType.Int, _Branch_ID

                    );
                    }
                }
                else
                {

                }
                return "1";
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
                return "0";
            }


        }
        [System.Web.Services.WebMethod]
        public static string ExcuteOption(string data)
        {

            try
            {
                Option DataMain = JsonConvert.DeserializeObject<Option>(data);
                if (DataMain.ID.ToString() != "0")
                {
                    using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                    {
                        connFunc.ExecuteDataTable("[YYY_sp_Option_Update]", CommandType.StoredProcedure,
                        "@Modified_By", SqlDbType.Int, Comon.Global.sys_userid,
                         "@Modified", SqlDbType.DateTime, Comon.Comon.GetDateTimeNow(),
                         "@CurrentID", SqlDbType.Int, DataMain.ID,
                         "@Value ", SqlDbType.NVarChar, DataMain.Value
                    );
                    }
                }
                else
                {

                }
                return "1";
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
                return "0";
            }


        }
    }
    public class Company
    {
        public string Name { get; set; }
        public string Hotline { get; set; }
        public string Address { get; set; }
        public string Avatar { get; set; }
    }
    public class Branch
    {
        public string Name { get; set; }
        public string BranchCode { get; set; }
        public string Address { get; set; }
        public string BranchAddressNote { get; set; }
        public int Target { get; set; }
    }
    public class Option
    {
        public string ID { get; set; }
        public string Value { get; set; }

    }
}
   
