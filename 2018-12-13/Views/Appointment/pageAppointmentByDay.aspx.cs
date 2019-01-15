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
    public partial class pageAppointmentByDay : WebPageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
                dt = confunc.ExecuteDataTable("YYY_sp_Branch_Load", CommandType.StoredProcedure);
                ds.Tables.Add(dt);
            }

            return JsonConvert.SerializeObject(ds, Formatting.Indented);
        }
        [System.Web.Services.WebMethod]
        public static string LoadataAppointmentList(int branchID,string dateFrom,string dateTo)
        {
            DataTable dt = new DataTable();
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                dt = confunc.ExecuteDataTable("[YYY_sp_Appointment_LoadByDay]", CommandType.StoredProcedure,
                  "@BranchID", SqlDbType.Int, branchID
                  , "@DateFrom", SqlDbType.DateTime,Convert.ToDateTime( dateFrom)
                  , "@DateTo", SqlDbType.DateTime, Convert.ToDateTime(dateTo));
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
    }
}