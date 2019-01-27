using _2018_12_13.Comon;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _2018_12_13.Views.Sms
{
    public partial class pageSmsDetail : WebPageBase
    {
        private static int CustomerID { get; set; }
        private static int Type { get; set; }
        protected static int AppID { get; set; }
        protected static int MasterID { get; set; }
        protected static int TicketID { get; set; }
        static string Phone;
        static string Cust_Code = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["CustomerID"] != null)
            {
                var cusID = Request.QueryString["CustomerID"];
                var typeid = Request.QueryString["Type"];
                var appid = Request.QueryString["AppID"];
                var masterid = Request.QueryString["MasterID"];
                var ticketID = Request.QueryString["TicketID"];
                CustomerID = Convert.ToInt32(cusID == null ? "0" : cusID.ToString());
                Type = Convert.ToInt32(typeid == null ? "0" : typeid.ToString());
                TicketID = Convert.ToInt32(ticketID == null ? "0" : ticketID.ToString());
                AppID = Convert.ToInt32(appid == null ? "0" : appid.ToString());
                MasterID = Convert.ToInt32(masterid == null ? "0" : masterid.ToString());
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "script", string.Format("ChaneUpdateData('{0}')", Loadata(CustomerID)), true);
            }

        }
        private string Loadata(int id)
        {
            DataTable dt = new DataTable();
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                dt = confunc.ExecuteDataTable("[YYY_sp_Customer_LoadPhone]", CommandType.StoredProcedure,
                  "@CurrentID", SqlDbType.Int, Convert.ToInt32(id), "@ticketID", SqlDbType.Int, Convert.ToInt32(TicketID));
            }
            if (dt != null)
            {
                Phone = dt.Rows[0]["Phone1"].ToString();
                Cust_Code = dt.Rows[0]["Cust_Code"].ToString();
                switch (Type)
                {
                    case 1:
                        return string.Format(Comon.Global.sys_SMSRemind, dt.Rows[0]["Name"].ToString()).ToString();
                    case 2:
                        return string.Format("Jarim Kinh chao quy khach {0}", dt.Rows[0]["Name"].ToString()).ToString();
                    case 3:
                        return string.Format("Jarim kinh chuc Quy khach hang {0} sinh nhat vui ve, luon hanh phuc va thanh cong.", dt.Rows[0]["Name"].ToString()).ToString();
                    case 4:
                        return string.Format("Jarim Kinh chao quy khach {0}", dt.Rows[0]["Name"].ToString()).ToString();
                    case 5:
                        return string.Format("Jarim Kinh chao quy khach {0}", dt.Rows[0]["Name"].ToString()).ToString();
                    default:
                        return string.Format("Jarim Kinh chao quy khach {0}", dt.Rows[0]["Name"].ToString()).ToString();
                }

            }
            else
            {
                return "";
            }
        }
        [System.Web.Services.WebMethod]
        public static string ExcuteData(string content)
        {
            try
            {
                using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                {
                    connFunc.ExecuteDataTable("[YYY_sp_Customer_SMS_Insert]", CommandType.StoredProcedure,
                        "@Customer_ID", SqlDbType.Int, CustomerID,
                        "@Content", SqlDbType.NVarChar, content.Replace("'", "").Trim(),
                        "@Created_By", SqlDbType.Int, Comon.Global.sys_userid,
                        "@Created", SqlDbType.DateTime,  Comon.Comon.GetDateTimeNow(),
                        "@Type", SqlDbType.NVarChar, Type.ToString()

                        );
                }
                SendSMS(Phone, Comon.Comon.ConvertToUnsign(content));
                try
                {
                    switch (Type)
                    {
                        case 1:
                            using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                            {
                                connFunc.ExecuteDataTable("YYY_sp_CustomerCare_InsertValue_ToRemindInDay", CommandType.StoredProcedure,
                                    "@CustomerID", SqlDbType.Int, CustomerID,
                                    "@AppID", SqlDbType.Int, AppID,
                                    "@Type", SqlDbType.Int, 0,
                                    "@Created_By", SqlDbType.Int, Comon.Global.sys_userid,
                                    "@Created", SqlDbType.DateTime,  Comon.Comon.GetDateTimeNow(),
                                    "@Content", SqlDbType.NVarChar, content.Replace("'", "").Trim()

                                );
                            }

                            break;


                        case 2:

                            using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                            {
                                connFunc.ExecuteDataTable("YYY_sp_CustomerCare_InsertValue_CheckinNotService", CommandType.StoredProcedure,
                                     "@CustomerID", SqlDbType.Int, CustomerID,
                                     "@AppID", SqlDbType.Int, AppID,
                                     "@Type", SqlDbType.Int, 0,
                                     "@Created_By", SqlDbType.Int, Comon.Global.sys_userid,
                                     "@Created", SqlDbType.DateTime,  Comon.Comon.GetDateTimeNow(),
                                     "@Content", SqlDbType.NVarChar, content.Replace("'", "").Trim()

                                 );
                            }
                            break;
                        case 4:
                            using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                            {
                                connFunc.ExecuteDataTable("YYY_sp_CustomerCare_InsertValue_NotCheckIn", CommandType.StoredProcedure,

                                    "@CustomerID", SqlDbType.Int, CustomerID,
                                    "@AppID", SqlDbType.Int, AppID,
                                    "@Type", SqlDbType.Int, 0,
                                    "@Created_By", SqlDbType.Int, Comon.Global.sys_userid,
                                    "@Created", SqlDbType.DateTime,  Comon.Comon.GetDateTimeNow(),
                                    "@Content", SqlDbType.NVarChar, content.Replace("'", "").Trim()

                                );
                            }
                            break;

                        case 5:
                            using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                            {
                                connFunc.ExecuteDataTable("YYY_sp_CustomerCare_InsertValue_Treatment", CommandType.StoredProcedure,
                                     "@CustomerID", SqlDbType.Int, CustomerID,
                                    "@MasterID", SqlDbType.Int, MasterID,
                                     "@Type", SqlDbType.Int, 0,
                                     "@Created_By", SqlDbType.Int, Comon.Global.sys_userid,
                                     "@Created", SqlDbType.DateTime,  Comon.Comon.GetDateTimeNow(),
                                     "@Content", SqlDbType.NVarChar, content.Replace("'", "").Trim()
                                 );
                            }
                            break;

                        case 3:
                            using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                            {
                                connFunc.ExecuteDataTable("YYY_sp_CustomerCare_InsertValue_Holiday", CommandType.StoredProcedure,
                                         "@CustomerID", SqlDbType.Int, CustomerID,
                                         "@Type", SqlDbType.Int, 0,
                                         "@Created_By", SqlDbType.Int, Comon.Global.sys_userid,
                                         "@Created", SqlDbType.DateTime,  Comon.Comon.GetDateTimeNow(),
                                         "@Content", SqlDbType.NVarChar, content.Replace("'", "").Trim()
                                     );
                            }
                            break;



                    }
                    if (Convert.ToInt32(TicketID) != 0)
                    {
                        using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                        {
                            connFunc.ExecuteDataTable("[YYY_sp_Update_Excuteticket]", CommandType.StoredProcedure,
                                     "@TicketID", SqlDbType.Int, Convert.ToInt32(TicketID),
                                     "@Created_By", SqlDbType.Int, Comon.Global.sys_userid,
                                     "@Created", SqlDbType.DateTime, Comon.Comon.GetDateTimeNow()
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
            catch (Exception ex)
            {
                return "0";
            }
        }
        public static void SendSMS(string phone,string content){
            HttpClient httpClient = new HttpClient();

            string url = @"http://rest.esms.vn/MainService.svc/json/SendMultipleMessage_V4_get?Phone={0}&Content={1}&ApiKey={2}&SecretKey={3}&Brandname={4}&SmsType=2";

            //string convert_data = HttpUtility.UrlEncode(data);

            url = string.Format(url, phone, content, "19008C9EEAAE313D8CC0804B56D9BA", "D2B3ED2AC937523662D213D57F68BB", "VTMJARIM");

            //httpClient.DefaultRequestHeaders.Add("Authorization", "1bddbec2e0f1b9301cdcc58617a0adc9");

            var result = httpClient.GetStringAsync(url).Result;
        }
    }

}