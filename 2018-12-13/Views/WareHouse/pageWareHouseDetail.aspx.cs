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
    public partial class pageWareHouseDetail : WebPageBase
    {
        public static string _CurrentID { get; set; }
        public static string _dataWareHouse { get; set; }

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
                _dataWareHouse = null;
            }
        }
        private void Loadata(int id)
        {
            DataTable dt = new DataTable();
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                dt = confunc.ExecuteDataTable("[YYY_sp_Product_WareHouse_LoadDetail]", CommandType.StoredProcedure,
                  "@ID", SqlDbType.Int, Convert.ToInt32(id == 0 ? 0 : id));
            }
            if (dt != null)
            {
                _dataWareHouse = JsonConvert.SerializeObject(dt);
            }
            else
            {
                _dataWareHouse = "";
            }

        }
        [System.Web.Services.WebMethod]
        public static string LoadComboMain()
        {

            DataSet ds = new DataSet();
            //LoadBranchWareHouse
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                DataTable dt = new DataTable();
                dt = confunc.ExecuteDataTable("[YYY_sp_Product_Combo_BranchWareHouse]", CommandType.StoredProcedure);
                ds.Tables.Add(dt);
            }
            //
            return JsonConvert.SerializeObject(ds, Formatting.Indented);
        }
        [System.Web.Services.WebMethod]
        public static string ExcuteData(string data)
        {
            try
            {
                WareHouseDetail DataMain = JsonConvert.DeserializeObject<WareHouseDetail>(data);
                if (_CurrentID == null)
                {
                    using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                    {
                        DataTable dt = connFunc.ExecuteDataTable("[YYY_sp_Product_WareHouse_Insert]", CommandType.StoredProcedure,
                              "@Name ", SqlDbType.Int, DataMain.Name.Replace("'", "").Trim(),
                              "@BranchID ", SqlDbType.NVarChar, DataMain.BranchID.Replace("'", "").Trim(),
                              "@Created_By", SqlDbType.Int, Comon.Global.sys_userid,
                              "@Created", SqlDbType.DateTime, Comon.Comon.GetDateTimeNow(),
                              "@Code ", SqlDbType.Int, DataMain.Code.Replace("'", "").Trim(),
                              "@Address ", SqlDbType.Int, DataMain.Address.Replace("'", "").Trim()
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
                        DataTable dt = connFunc.ExecuteDataTable("YYY_sp_Product_WareHouse_Update", CommandType.StoredProcedure,
                            "@Name", SqlDbType.NVarChar, DataMain.Name.Replace("'", "").Trim(),
                            "@Modified_By", SqlDbType.Int, Comon.Global.sys_userid,
                            "@Modified", SqlDbType.DateTime, Comon.Comon.GetDateTimeNow(),
                             "@currentID ", SqlDbType.Int, _CurrentID,
                             "@BranchID", SqlDbType.NVarChar, DataMain.BranchID.Replace("'", "").Trim(),
                             "@Code", SqlDbType.NVarChar, DataMain.Code.Replace("'", "").Trim(),
                             "@Address ", SqlDbType.NVarChar, DataMain.Address.Replace("'", "").Trim()

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
        public class WareHouseDetail
        {
            public string Name { get; set; }
            public string BranchID { get; set; }
            public string Address { get; set; }
            public string Code { get; set; }
        } }
}
