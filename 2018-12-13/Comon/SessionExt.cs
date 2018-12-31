using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace _2018_12_13.Comon
{
    public static class SessionExt
    {
        public static void SetCurrentUser(this HttpSessionState session, UserLogin user)
        {
            session["CurrentUser"] = user;
        }
        public static UserLogin GetCurrentUser(this HttpSessionState session)
        {
            return session["CurrentUser"] as UserLogin;
        }
    }
}