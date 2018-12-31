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
    public partial class pageTabDetail : WebPageBase
    {
        public static string _CustomerID { get; set; }
        public static string _CurrentID { get; set; }

        public static string _dataTab { get; set; }
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
                    _dataTab = null;
                }
            }
            else
            {
                _CustomerID = null;
                Response.Redirect("~/Error/index.html");
            }
        }
       // protected string id { get { return Request.QueryString["id"]; } }
        [System.Web.Services.WebMethod]
        public static string LoadComboMain()
        {
            DataSet ds = new DataSet();
            //LoadService
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                DataTable dt = new DataTable();
                dt = confunc.ExecuteDataTable("YYY_sp_Customer_TabService_LoadComBo_Service", CommandType.StoredProcedure);
                ds.Tables.Add(dt);
            }
            //Load Discount
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                DataTable
                dt = confunc.ExecuteDataTable("[YYY_sp_Customer_TabService_LoadComBo_Discount]", CommandType.StoredProcedure);
                ds.Tables.Add(dt);
            }
            //
            return JsonConvert.SerializeObject(ds, Formatting.Indented);
        }
        private void Loadata(int id)
        {
            DataTable dt = new DataTable();
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                dt = confunc.ExecuteDataTable("[YYY_sp_Customer_TabService_LoadDetail]", CommandType.StoredProcedure,
                  "@Current_ID", SqlDbType.Int, Convert.ToInt32(id == 0 ? 0 : id));
            }
            if (dt != null)
            {
                _dataTab = JsonConvert.SerializeObject(dt);
            }
            else
            {
                _dataTab = "";
            }

        }

        [System.Web.Services.WebMethod]
        public static string ExcuteData(string data)
        {
            try
            {
                ServiceDetail DataMain = JsonConvert.DeserializeObject<ServiceDetail>(data);
                if (_CurrentID == null)
                {
                    using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                    {
                        connFunc.ExecuteDataTable("YYY_sp_Customer_TabService_Insert", CommandType.StoredProcedure,
                            "@Customer_ID", SqlDbType.Int, _CustomerID,
                            "@Content", SqlDbType.NVarChar, DataMain.Content.Replace("'", "").Trim(),
                            "@Created_By", SqlDbType.Int, Comon.Global.sys_userid,
                            "@Created", SqlDbType.DateTime, Comon.Comon.GetDateTimeNow(),
                            "@Branch_ID", SqlDbType.Int, Comon.Global.sys_branchID,
                             "@Quantity", SqlDbType.Int, DataMain.Quantity,
                             "@Service_ID", SqlDbType.Int, DataMain.ServiceID,
                             "@Discount_ID", SqlDbType.Int, DataMain.Discount_ID,
                             "@Price_Root", SqlDbType.Decimal, DataMain.Price_Root,
                             "@Discount_Amount", SqlDbType.Decimal, DataMain.Discount_Amount,
                             "@Discount_Percent", SqlDbType.Int, DataMain.Discount_Percent,
                             "@Discount_Amount_Doctor", SqlDbType.Decimal, DataMain.Discount_Amount_Doctor,
                             "@Price_Discounted", SqlDbType.Decimal, DataMain.Price_Discounted,
                             "@Employee_ID", SqlDbType.Int, Comon.Global.sys_employeeid

                        );
                    }
                }
                else
                {
                    using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                    {
                        connFunc.ExecuteDataTable("YYY_sp_Customer_TabService_Update", CommandType.StoredProcedure,
                            "@Content", SqlDbType.NVarChar, DataMain.Content.Replace("'", "").Trim(),
                            "@Modified_By", SqlDbType.Int, Comon.Global.sys_userid,
                            "@Modified", SqlDbType.DateTime, Comon.Comon.GetDateTimeNow(),
                            "@Service_ID", SqlDbType.Int, DataMain.ServiceID,
                            "@Quantity", SqlDbType.Int, DataMain.Quantity,
                            "@Price_Root", SqlDbType.Decimal, DataMain.Price_Root,
                            "@Discount_ID", SqlDbType.Int, DataMain.Discount_ID,
                            "@Discount_Persent", SqlDbType.Int, DataMain.Discount_Percent,
                            "@Discount_Amount", SqlDbType.Decimal, DataMain.Discount_Amount,
                            "@Discount_Amount_Doctor", SqlDbType.DateTime, DataMain.Discount_Amount_Doctor,
                            "@Price_Discounted", SqlDbType.Decimal, DataMain.Price_Discounted,
                            "@Current_ID", SqlDbType.Int, _CurrentID
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
        public class ServiceDetail
        {
            public int ID { get; set; }
            public string Content { get; set; }

            public int Created_By { get; set; }

            public string Created { get; set; }
            public int Motified_By { get; set; }

            public string Motified { get; set; }
            public int Branch_ID { get; set; }

            public int Quantity { get; set; }
            public int ServiceID { get; set; }

            public int Discount_ID { get; set; }
            public decimal Price_Root { get; set; }

            public decimal Discount_Amount { get; set; }
            public decimal Discount_Percent { get; set; }
            public decimal Discount_Amount_Doctor { get; set; }
            public decimal Price_Discounted { get; set; }

            public int Employee_ID { get; set; }
        }
    }
}