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
    public partial class pageTicketAllByDay : WebPageBase
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [System.Web.Services.WebMethod]
    public static string LoadData(string dateFrom,string dateTo)
    {
        DataTable dt = new DataTable();
        using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
        {
            dt = confunc.ExecuteDataTable("[YYY_sp_Ticket_AllTicketByDay_Load]", CommandType.StoredProcedure,
              "@UserID", SqlDbType.Int, Comon.Global.sys_userid
              , "@dateFrom", SqlDbType.DateTime,Convert.ToDateTime(dateFrom)
              , "@dateTo", SqlDbType.DateTime, Convert.ToDateTime(dateTo));
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