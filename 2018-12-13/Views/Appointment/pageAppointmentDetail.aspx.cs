using _2018_12_13.Comon;
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
    public partial class pageAppointmentDetail : WebPageBase
    {
        public static string _CustomerID { get; set; }
        public static string _CurrentID { get; set; }
        public static string _TicketID { get; set; }
        public static string _dataAppointment { get; set; }
        public static string _dataComboDoc { get; set; }
        public static string _dataComboScheduleType { get; set; }
        public static string _dataComboBranch { get; set; }
        public static string _dataComboServicetype { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadCombo();
            var cus = Request.QueryString["CustomerID"];
            var curr = Request.QueryString["CurrentID"];
            _TicketID = "0";
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
                    _dataAppointment = null;
                }
            }
            else
            {
                _CustomerID = null;
                Response.Redirect("~/Error/index.html");
            }
            //   id = 95;
          //  ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "script", string.Format("ChaneUpdateData({0})", Loadata(id)), true);
        }
        private void Loadata(int id)
        {
            DataTable dt = new DataTable();
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                dt = confunc.ExecuteDataTable("[YYY_sp_Customer_Appointment_LoadToDetail]", CommandType.StoredProcedure,
                  "@App_ID", SqlDbType.Int, Convert.ToInt32(id == 0 ? 0 : id));
            }
            if (dt != null)
            {
                _dataAppointment = JsonConvert.SerializeObject(dt);
               
            }
            else
            {
                _dataAppointment = "";
            }
        }
        public void LoadCombo()
        {
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                DataTable dt = new DataTable();
                dt = confunc.LoadPara("Schedule Type");
                //    ds.Tables.Add(dt);
                _dataComboScheduleType = JsonConvert.SerializeObject(dt);
            }
           



            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                DataTable dt = new DataTable();
                dt = confunc.LoadPara("ServiceCare");
               // ds.Tables.Add(dt);
                _dataComboServicetype = JsonConvert.SerializeObject(dt);
            }


            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                DataTable dt = new DataTable();
                dt = confunc.LoadEmployee("Doctor", 0);
              //  ds.Tables.Add(dt);
                _dataComboDoc = JsonConvert.SerializeObject(dt);

            }



            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                DataTable dt = new DataTable();
                dt = confunc.ExecuteDataTable("YYY_sp_Branch_Load", CommandType.StoredProcedure);
                //ds.Tables.Add(dt);
                _dataComboBranch = JsonConvert.SerializeObject(dt);
            }

        }

        [System.Web.Services.WebMethod]
        public static string ExcuteDataAppointmentData(string data)
        {
            try
            {
                ScheduleDetail DataMain = JsonConvert.DeserializeObject<ScheduleDetail>(data);
                if (_CurrentID == "0")
                {
                    using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                    {
                        var dt = connFunc.ExecuteDataTable("YYY_sp_Customer_Appointment_Insert", CommandType.StoredProcedure,
                         "@Customer_ID", SqlDbType.Int, _CustomerID,
                         "@branch_ID", SqlDbType.Int, DataMain.branch_ID,
                         "@Doctor_ID", SqlDbType.Int, DataMain.Doctor_ID,
                         "@TicketID", SqlDbType.Int, _TicketID,
                         "@TypeSchedule", SqlDbType.Int, DataMain.TypeSchedule,
                         "@Created_By", SqlDbType.Int, Comon.Global.sys_userid,
                         "@Note", SqlDbType.NVarChar, DataMain.Note.Replace("'", ""),
                         "@Created", SqlDbType.DateTime, Comon.Comon.GetDateTimeNow(),
                         "@Date_from", SqlDbType.DateTime, Convert.ToDateTime(DataMain.Date_from),
                         "@ServiceCare_ID", SqlDbType.NVarChar, DataMain.ServiceCare_ID
                   );
                        if (dt != null && dt.Rows.Count > 0)
                        {
                            if (Convert.ToInt32(dt.Rows[0]["Resulf"]) == 2)
                            {
                                Console.WriteLine("1");
                                return "1";
                               
                            }
                            else
                            {
                                Console.WriteLine("11");
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
                       "@Current_ID", SqlDbType.Date, _CurrentID
                   );
                        Console.WriteLine("123");
                        return "1";


                    }
                }
                return "1";
            }
            catch (Exception ex)
            {

                Console.WriteLine("1323");
                Console.WriteLine(ex.ToString());
                return "1";
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