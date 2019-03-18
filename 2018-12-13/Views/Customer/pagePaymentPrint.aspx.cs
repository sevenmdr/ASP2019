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
    public partial class pagePaymentPrint : WebPageBase
    {
        private static int id { get; set; }
        protected string Variable_codebehind;
        protected void Page_Load(object sender, EventArgs e)
        {
            var v = Request.QueryString["id"];
            id = Convert.ToInt32(v == null ? "0" : v.ToString());
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", string.Format("PrintDetail({0})", Loadata(id)), true);
        }
        private string Loadata(int id)
        {
            DataTable dt = new DataTable();
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                dt = confunc.ExecuteDataTable("[YYY_sp_Customer_Payment_LoadDataToPrint]", CommandType.StoredProcedure,
                  "@currentID", SqlDbType.Int, Convert.ToInt32(id == 0 ? 0 : id));
                
            }
            if (dt != null)
            {
                dt.Rows[0]["Word"] = Comon.Comon.ConvertNumToString(Convert.ToDouble(dt.Rows[0]["Word"]));
                return JsonConvert.SerializeObject(dt);
            }
            else
            {
                return "";
            }

        }      
    }
}