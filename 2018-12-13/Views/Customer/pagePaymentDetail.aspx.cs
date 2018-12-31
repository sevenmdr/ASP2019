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
    public partial class pagePaymentDetail : WebPageBase
    {
        public static string _CustomerID { get; set; }
        public static string _CurrentID { get; set; }

        public static string _dataPayment { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            var cus = Request.QueryString["CustomerID"];
            var curr = Request.QueryString["CurrentID"];

            if (cus != null)
            {
                _CustomerID = cus.ToString();
                if (curr != null)
                {
                    _CurrentID = curr.ToString();
                    Loadata(Convert.ToInt32(_CurrentID));
                }
                else
                {
                    _CurrentID = null;
                    _dataPayment = null;
                }
            }
            else
            {
                _CustomerID = null;
                Response.Redirect("~/Error/index.html");
            }


        }
        private void Loadata(int id)
        {
            DataTable dt = new DataTable();
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                dt = confunc.ExecuteDataTable("[YYY_sp_Customer_Payment_LoadToEdit]", CommandType.StoredProcedure,
                  "@Current", SqlDbType.Int, Convert.ToInt32(id == 0 ? 0 : id));
            }
            if (dt != null)
            {
                _dataPayment = JsonConvert.SerializeObject(dt);
            }
            else
            {
                _dataPayment = "";
            }

        }
        [System.Web.Services.WebMethod]
        public static string LoadComboMain()
        {

            DataSet ds = new DataSet();
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                DataTable dt = new DataTable();
                dt = confunc.LoadPara("Method");
                ds.Tables.Add(dt);
            }
            return JsonConvert.SerializeObject(ds, Formatting.Indented);
        }
        [System.Web.Services.WebMethod]
        public static string ExcuteData(string data)
        {
            try
            {
                PaymentDetail DataMain = JsonConvert.DeserializeObject<PaymentDetail>(data);
                if (_CurrentID == null)
                {
                    using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                    {
                        var dt = connFunc.ExecuteDataTable("YYY_sp_Customer_Payment_Insert", CommandType.StoredProcedure,
                              "@Customer_ID", SqlDbType.Int, _CustomerID,
                              "@Amount", SqlDbType.Decimal, DataMain.Amount,
                              "@PaymentMethod_ID", SqlDbType.Int, DataMain.Method_ID,
                              "@Branch_ID", SqlDbType.Int, Comon.Global.sys_branchID,
                              "@BranchCode", SqlDbType.NVarChar, Comon.Global.sys_branchCode,
                              "@CodeFormat", SqlDbType.Int, Comon.Global.sys_CodePayment,
                              "@Content", SqlDbType.NVarChar, DataMain.Content.Replace("'", ""),
                              "@Created_By", SqlDbType.Int, Comon.Global.sys_userid,
                            "@Created", SqlDbType.DateTime, Comon.Comon.GetDateTimeNow()
                          );
                    }
                }
                else
                {
                    using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                    {
                        connFunc.ExecuteDataTable("YYY_sp_Customer_Payment_Upadte", CommandType.StoredProcedure,
                           "@Amount", SqlDbType.Decimal, DataMain.Amount,
                          "@PaymentMethod_ID", SqlDbType.Int, DataMain.Method_ID,
                           "@Content", SqlDbType.NVarChar, DataMain.Content.Replace("'", ""),
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
                return "0";
            }


        }
    }
    public class PaymentDetail
    {
        public int ID { get; set; }
        public string Content { get; set; }
        public int Method_ID { get; set; }
        public string Amount { get; set; }
    }
}