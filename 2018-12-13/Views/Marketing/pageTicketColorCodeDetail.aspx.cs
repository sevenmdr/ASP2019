using _2018_12_13.Comon;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _2018_12_13.Views.Marketing
{
    public partial class pageTicketColorCodeDetail : WebPageBase
    {
        public static string _CurrentID { get; set; }
        public static string _dataColor { get; set; }


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
                _CurrentID = "0";
                _dataColor = null;
            }
        }
        private void Loadata(int id)
        {
            DataTable dt = new DataTable();
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                dt = confunc.ExecuteDataTable("[YYY_sp_Ticket_Color_LoadDetail]", CommandType.StoredProcedure,
                  "@ID", SqlDbType.Int, Convert.ToInt32(id == 0 ? 0 : id));
            }
            if (dt != null)
            {
                _dataColor = JsonConvert.SerializeObject(dt);
            }
            else
            {
                _dataColor = "";
            }

        }

        [System.Web.Services.WebMethod]
    
            public static string ExcuteData(string data)
            {
                try
                {
                Color DataMain = JsonConvert.DeserializeObject<Color>(data);
                    if (_CurrentID == "0")
                    {
                        using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                        {
                            DataTable dt = connFunc.ExecuteDataTable("[YYY_sp_Ticket_Color_Insert]", CommandType.StoredProcedure,
                                  "@Name ", SqlDbType.Int, DataMain.Name.Replace("'", "").Trim(),
                                  "@Created_By", SqlDbType.Int, Comon.Global.sys_userid,
                                  "@Created", SqlDbType.DateTime, Comon.Comon.GetDateTimeNow(),
                                  "@Note ", SqlDbType.Int, DataMain.Note.Replace("'", "").Trim(),
                                  "@Color ", SqlDbType.NVarChar, DataMain.ColorCode.Replace("'", "").Trim()
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
                            DataTable dt = connFunc.ExecuteDataTable("[YYY_sp_ticket_color_Update]", CommandType.StoredProcedure,
                                "@Name", SqlDbType.NVarChar, DataMain.Name.Replace("'", "").Trim(),
                                "@Modified_By", SqlDbType.Int, Comon.Global.sys_userid,
                                "@Modified", SqlDbType.DateTime, Comon.Comon.GetDateTimeNow(),
                                 "@currentID ", SqlDbType.Int, _CurrentID,
                                  "@Note ", SqlDbType.NVarChar, DataMain.Note.Replace("'", "").Trim(),
                                  "@Color ", SqlDbType.NVarChar, DataMain.ColorCode.Replace("'", "").Trim()

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
    }
    public class Color
    {
        public string Name { get; set; }
        public string ColorCode { get; set; }
        public string Note { get; set; }
    }

}
