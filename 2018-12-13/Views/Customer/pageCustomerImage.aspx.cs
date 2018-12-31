using _2018_12_13.Comon;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _2018_12_13.Views.Customer
{
    public partial class pageCustomerImage : WebPageBase
    {
        public static string _CustomerID { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            var cus = Request.QueryString["CustomerID"];

            if (cus != null)
            {
                _CustomerID = cus.ToString();
            }
            else
            {
                _CustomerID = null;
                Response.Redirect("~/Error/index.html");
            }
        }
        [System.Web.Services.WebMethod]
        public static string LoadAllFolder()
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("FolderName");
            List<string> directories = Comon.Comon.GetAllDirectoryInFolder(_CustomerID.ToString());
            if (directories != null && directories.Count != 0)
            {
                foreach (var dir in directories)
                {
                    var dr = dt.NewRow();
                    dr[0] = dir;
                    dt.Rows.Add(dr);
                }
            }
            return JsonConvert.SerializeObject(dt);

        }

        [System.Web.Services.WebMethod]
        public static string LoadImageByFolder(string folderName)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("link");
            List<string> directories = Comon.Comon.GetImageFromDirectory(folderName);
            if (directories != null && directories.Count != 0)
            {
                foreach (var dir in directories)
                {
                    var dr = dt.NewRow();
                    dr[0] = dir;
                    dt.Rows.Add(dr);
                }
            }
            return JsonConvert.SerializeObject(dt);

        }
    }
}