using _2018_12_13.Comon;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _2018_12_13.Views.WareHouse
{
    public partial class pageSupplierDetail : WebPageBase
    {
        public static string _CurrentID { get; set; }
        public static string _dataSupplier { get; set; }


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
                _dataSupplier = null;
            }
        }
        private void Loadata(int id)
        {
            DataTable dt = new DataTable();
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                dt = confunc.ExecuteDataTable("[YYY_sp_Product_Supplier_LoadDetail]", CommandType.StoredProcedure,
                  "@ID", SqlDbType.Int, Convert.ToInt32(id == 0 ? 0 : id));
            }
            if (dt != null)
            {
                _dataSupplier = JsonConvert.SerializeObject(dt);
            }
            else
            {
                _dataSupplier = "";
            }

        }

        [System.Web.Services.WebMethod]
        public static string ExcuteData(string data)
        {
            try
            {
                SupplierDetail DataMain = JsonConvert.DeserializeObject<SupplierDetail>(data);
                if (_CurrentID == null)
                {
                    using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                    {
                        DataTable dt = connFunc.ExecuteDataTable("[YYY_sp_Product_Supplier_Insert]", CommandType.StoredProcedure,
                              "@Name ", SqlDbType.Int, DataMain.Name.Replace("'", "").Trim(),
                              "@Phone ", SqlDbType.NVarChar, DataMain.Phone.Replace("'", "").Trim(),
                              "@Created_By", SqlDbType.Int, Comon.Global.sys_userid,
                              "@Created", SqlDbType.DateTime, Comon.Comon.GetDateTimeNow(),
                              "@Person ", SqlDbType.Int, DataMain.Person.Replace("'", "").Trim(),
                              "@Email ", SqlDbType.Int, DataMain.Email.Replace("'", "").Trim(),
                              "@Note ", SqlDbType.Int, DataMain.Note.Replace("'", "").Trim()
                          );
                        if (dt.Rows.Count > 0)
                        {
                            if (dt.Rows[0][0].ToString() != "0")
                            {
                                return "Tên Hoặc Mã Đã Tồn Tại Vui Lòng Kiểm Tra Lại";
                            }
                            else
                            {
                                return "1";
                            }
                        }
                        else
                        {
                            return "1";
                        }
                    }
                }
                else
                {
                    using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                    {
                        DataTable dt = connFunc.ExecuteDataTable("YYY_sp_Product_Supplier_Update", CommandType.StoredProcedure,
                            "@Name", SqlDbType.NVarChar, DataMain.Name.Replace("'", "").Trim(),
                            "@Modified_By", SqlDbType.Int, Comon.Global.sys_userid,
                            "@Modified", SqlDbType.DateTime, Comon.Comon.GetDateTimeNow(),
                             "@currentID ", SqlDbType.Int, _CurrentID,
                             "@Phone", SqlDbType.NVarChar, DataMain.Phone.Replace("'", "").Trim(),
                             "@Person", SqlDbType.NVarChar, DataMain.Person.Replace("'", "").Trim(),
                             "@Email ", SqlDbType.NVarChar, DataMain.Email.Replace("'", "").Trim(),
                              "@Note ", SqlDbType.NVarChar, DataMain.Note.Replace("'", "").Trim()

                        );
                        if (dt.Rows.Count > 0)
                        {
                            if (dt.Rows[0][0].ToString() != "0")
                            {
                                return "Tên Hoặc Mã Đã Tồn Tại Vui Lòng Kiểm Tra Lại";
                            }
                            else
                            {
                                return "1";
                            }
                        }
                        else
                        {
                            return "1";
                        }
                    }
                }

            }
            catch (Exception ex)
            {
                return "0";
            }


        }
        public class SupplierDetail
        {
            public string Name { get; set; }
            public string Person { get; set; }
            public string Email { get; set; }
            public string Note { get; set; }
            public string Phone { get; set; }
        }
    }
}
