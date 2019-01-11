using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _2018_12_13.Views.Appointment
{
    public partial class pageAppointmentDetail : System.Web.UI.Page
    {
        private static int id { get; set; }
        private static int CustomerID { get; set; }

        public static int _TicketID { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            var v = Request.QueryString["id"];
            if (Request.QueryString["CustomerID"] != null)
            {
                var cusID = Request.QueryString["CustomerID"];
                var _ticketID = Request.QueryString["TicketID"];
                CustomerID = Convert.ToInt32(cusID == null ? "0" : cusID.ToString());
                _TicketID = Convert.ToInt32(_ticketID == null ? "0" : _ticketID.ToString());
            }
            id = Convert.ToInt32(v == null ? "0" : v.ToString());
         //   id = 95;
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "script", string.Format("ChaneUpdateData({0})", Loadata(id)), true);
        }
        private string Loadata(int id)
        {
            DataTable dt = new DataTable();
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                dt = confunc.ExecuteDataTable("[YYY_sp_Customer_Appointment_LoadToDetail]", CommandType.StoredProcedure,
                  "@App_ID", SqlDbType.Int, Convert.ToInt32(id == 0 ? 0 : id));
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
        public static string LoadCombo()
        {
            DataSet ds = new DataSet();



            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                DataTable dt = new DataTable();
                dt = confunc.LoadPara("Schedule Type");
                ds.Tables.Add(dt);
            }


            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                DataTable dt = new DataTable();
                dt = confunc.LoadPara("ServiceCare");
                ds.Tables.Add(dt);
            }


            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                DataTable dt = new DataTable();
                dt = confunc.LoadEmployee("Doctor", 0);
                ds.Tables.Add(dt);

            }



            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                DataTable dt = new DataTable();
                dt = confunc.ExecuteDataTable("YYY_sp_Branch_Load", CommandType.StoredProcedure);
                ds.Tables.Add(dt);
            }


            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                DataTable dt = new DataTable();
                dt = confunc.LoadPara("TimeTreatment");
                ds.Tables.Add(dt);

            }
            return JsonConvert.SerializeObject(ds, Formatting.Indented);
        }
        [System.Web.Services.WebMethod]
        public static string ExcuteData(string data)
        {
            try
            {
                ScheduleDetail DataMain = JsonConvert.DeserializeObject<ScheduleDetail>(data);
                if (id == 0)
                {
                    using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                    {
                        var dt = connFunc.ExecuteDataTable("YYY_sp_Customer_Appointment_Insert", CommandType.StoredProcedure,
                         "@Customer_ID", SqlDbType.Int, CustomerID,
                         "@branch_ID", SqlDbType.Int, DataMain.branch_ID,
                         "@Doctor_ID", SqlDbType.Int, DataMain.Doctor_ID,
                         "@TicketID", SqlDbType.Int, _TicketID,
                         "@TypeSchedule", SqlDbType.Int, DataMain.TypeSchedule,
                         "@Created_By", SqlDbType.Int, Comon.Global.sys_userid,
                         "@Note", SqlDbType.NVarChar, DataMain.Note.Replace("'", ""),
                         "@Created", SqlDbType.DateTime, Comon.Comon.GetDateTimeNow(),
                         "@Date_from", SqlDbType.DateTime,Convert.ToDateTime(DataMain.Date_from),
                         "@ServiceCare_ID", SqlDbType.NVarChar, DataMain.ServiceCare_ID
                   );
                        if (dt != null && dt.Rows.Count > 0)
                        {
                            if (Convert.ToInt32(dt.Rows[0]["Resulf"]) == 2)
                            {
                                return "1";
                            }
                            else
                            {
                                string s = dt.Rows[0]["refultNoticeVN"].ToString();
                                return "0";
                            }
                        }
                    }
                }
                else
                {
                    using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                    {
                        connFunc.ExecuteDataTable("YYY_sp_Customer_Appointment_Update", CommandType.StoredProcedure,
                       "@branch_ID", SqlDbType.Int, DataMain.branch_ID,
                       "@Doctor_ID", SqlDbType.Int, DataMain.Doctor_ID,
                       "@TypeSchedule", SqlDbType.DateTime, DataMain.TypeSchedule,
                        "@Modified_By", SqlDbType.Int, Comon.Global.sys_userid,
                       "@Note", SqlDbType.Int, DataMain.Note.Replace("'", ""),
                       "@Modified", SqlDbType.Decimal, Comon.Comon.GetDateTimeNow(),
                       "@Date_from", SqlDbType.Date, Convert.ToDateTime(DataMain.Date_from),
                       "@ServiceCare_ID", SqlDbType.NVarChar, DataMain.ServiceCare_ID,
                       "@Current_ID", SqlDbType.Date, id
                   );
                        return "1";


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
    public class ScheduleDetail
    {
        public int Customer_ID { get; set; }
        public string branch_ID { get; set; }
        public string Doctor_ID { get; set; }
        public string TypeSchedule { get; set; }
        public string Note { get; set; }
        public string ServiceCare_ID { get; set; }
        public string Date_from { get; set; }

    }
}