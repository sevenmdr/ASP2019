using _2018_12_13.Comon;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;
using Newtonsoft.Json.Linq;

namespace _2018_12_13.Views.Marketing
{

    public partial class pageImport : WebPageBase
    {
        public static string _DataComboSource { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            InitializeCombo();

        }
        private void InitializeCombo()
        {
            _DataComboSource = "";
            DataTable dt1 = new DataTable();
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                dt1 = confunc.LoadPara("SourceCustomer");
            }
            _DataComboSource = JsonConvert.SerializeObject(dt1);

        }

        [System.Web.Services.WebMethod]
        public static string ExcuteData(string data,string sourceID)
        {
            try
            {
                // CHeck Phone, Name is Valid
                return "1";
            }
            catch (Exception ex)
            {
                return "0";
            }


        }
    }
}
