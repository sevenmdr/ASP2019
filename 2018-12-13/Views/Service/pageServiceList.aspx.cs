﻿using _2018_12_13.Comon;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _2018_12_13.Views.Service
{
  
    public partial class pageServiceList :WebPageBase
    {
        public static string _DataComboTypeService { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            InitializeComboType();
        }
        private void InitializeComboType()
        {
            _DataComboTypeService = "";
            DataTable dt = new DataTable();
            using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
            {
                dt = connFunc.ExecuteDataTable("[YYY_sp_Product_Combo_Service_Type_FilterList]", CommandType.StoredProcedure);
            }
            _DataComboTypeService = JsonConvert.SerializeObject(dt);
        }
        [System.Web.Services.WebMethod]

        public static string LoadataService()
        {
            DataTable dt = new DataTable();
            using (Models.ExecuteDataBase confunc = new Models.ExecuteDataBase())
            {
                dt = confunc.ExecuteDataTable("YYY_sp_Service_Load", CommandType.StoredProcedure,
                  "@UserID", SqlDbType.Int, Comon.Global.sys_userid);
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
        public static string DeleteItem(int id)
        {
            try
            {
                using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
                {
                    connFunc.ExecuteDataTable("[YYY_sp_Service_Delete]", CommandType.StoredProcedure,
                        "@CurrentID", SqlDbType.Int, id,
                        "@Datenow", SqlDbType.DateTime, Comon.Comon.GetDateTimeNow(),
                        "@userID", SqlDbType.Int, Comon.Global.sys_userid
                    );
                }
                return "1";
            }
            catch (Exception ex)
            {
                return "0";
            }

        }
    }
}