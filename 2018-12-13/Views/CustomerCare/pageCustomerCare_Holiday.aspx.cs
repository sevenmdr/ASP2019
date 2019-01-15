using _2018_12_13.Comon;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _2018_12_13.Views.CustomerCare
{
    public partial class pageCustomerCare_Holiday : WebPageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [System.Web.Services.WebMethod]
        public static string LoadComboMain()
        {

            DataSet ds = new DataSet();
            //LoadBranch
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                DataTable dt = new DataTable();
                dt = confunc.ExecuteDataTable("YYY_sp_Branch_Load", CommandType.StoredProcedure);
                ds.Tables.Add(dt);
            }

            //
            return JsonConvert.SerializeObject(ds, Formatting.Indented);
        }

        [System.Web.Services.WebMethod]
    public static string LoadataCustomerCare(int Branch_ID,string Date)
    {
        DataTable dt = new DataTable();
        using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
        {
            dt = confunc.ExecuteDataTable("[YYY_CustomerCare_GetCustomerHoliDay]", CommandType.StoredProcedure,
              "@Branch_ID", SqlDbType.Int, Branch_ID);
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