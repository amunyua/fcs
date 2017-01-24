using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FuelCardSystemMVC.Library.UserAuth
{
    public static class UserContext
    {
        public static CustomPrincipal User { get { return (CustomPrincipal)User; } }
        public static CustomIdentity Identity
        {
            get
            {
                //return (CustomIdentity)User.Identity;

                var identity = new CustomIdentity(HttpContext.Current.User.Identity);
                var principal = new CustomPrincipal(identity);
                return identity;
            }
        }

    }


}