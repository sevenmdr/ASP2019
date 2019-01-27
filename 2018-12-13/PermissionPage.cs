using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace _2018_12_13
{
    public static class PermissionPage
    {
        public static bool CheckPermissionPageByMenu(string pageAbsoulte)
        {
            try
            {
                string pageName = pageAbsoulte.Split('/')[pageAbsoulte.Split('/').Count() - 1].Replace(".aspx", "");
                DataRow[] foundRows = Comon.Global.sys_PermissionTableMenu_Table.Select("PageName='"+ pageName + "'");
                if (foundRows.Count() != 0) return true;
                return false;
            }
            catch(Exception)
            {
                return false;
            }

        }
    }
}