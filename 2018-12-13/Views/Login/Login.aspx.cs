using _2018_12_13.Comon;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _2018_12_13.Views.Login
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            using (Models.ExecuteDataBase connFunc = new Models.ExecuteDataBase())
            {
                DataTable dt = connFunc.ExecuteDataTable("[YYY_sp_Permission_User_LogIn]", CommandType.StoredProcedure,
                     "@username", SqlDbType.NVarChar, u_name.Value.Replace("'", "").Trim(),
                     "@password", SqlDbType.NVarChar, u_pass.Value.Replace("'", "").Trim()
                 );

                if (dt.Rows.Count > 0)
                {
                    Comon.Global.sys_userid = Convert.ToInt32(dt.Rows[0]["ID"].ToString());
                    Session.SetCurrentUser(new UserLogin()
                    {
                        UserName = u_name.Value.Replace("'", "").Trim(),
                        Password = u_pass.Value.Replace("'", "").Trim(),
                        id = "12"
                    });
                    Label1.Text = "";
                    Comon.Global.Initalize();
                    Response.Redirect("~/Views/Appointment/pageAppointmentInDay.aspx");

                }
                else
                {
                    Label1.Text = "Sai Username , Password";
                    Session.SetCurrentUser(null);
                    

                }
            }
        }
    }
}