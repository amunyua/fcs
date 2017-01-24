using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using FuelCardSystemEntities.Models;
using System.Web.Mvc;

namespace FuelCardSystemMVC.Library
{
    public class CustAuthorizeAttribute : AuthorizeAttribute
    {
        public FuelCardDBEntities db = new FuelCardDBEntities();
        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {
            List<Lnk_Role_Permission> lstPermissions = db.Lnk_Role_Permission.Where(x => x.Permission_id == db.Permissions.FirstOrDefault(y => y.PermissionName == Parameters.Can_Login_to_CustomerPortal).Permission_Id).ToList();
            string roles = string.Empty;
            foreach (var item in lstPermissions)
            {
                Role objRole = db.Roles.Single(x => x.Role_id == item.Role_id);
                roles = roles + objRole.RoleName + ",";
            }
            roles = roles.TrimEnd(new char[] { ',' });
            Roles = roles;
            return base.AuthorizeCore(httpContext);
        }
    }
}