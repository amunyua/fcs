using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FuelCardSystemBAL;
using FuelCardSystemEntities.Models;

namespace FuelCardSystemMVC.Library
{
    public class MyAuthorizeAttribute : AuthorizeAttribute
    {
        public FuelCardDBEntities db = new FuelCardDBEntities();
        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {
            List<Lnk_Role_Permission> lstTest = db.Lnk_Role_Permission.Where(x => x.Permission_id == db.Permissions.FirstOrDefault(y => y.PermissionName == Parameters.Can_log_in_to_portal).Permission_Id).ToList();
            List<Lnk_Role_Permission> lstPermissions = db.Lnk_Role_Permission.Where(x => x.Permission_id == db.Permissions.FirstOrDefault(y => y.PermissionName == Parameters.Can_log_in_to_portal).Permission_Id).ToList();
            string roles = string.Empty;
            foreach (var item in lstPermissions)
            {
                Role objRole=db.Roles.SingleOrDefault(x=>x.Role_id==item.Role_id && x.Role_IsActive==true && x.Role_IsDeleted==false);
                if (objRole != null)
                {
                    roles = roles + objRole.RoleName + ",";
                }
            }
            roles = roles.TrimEnd(new char[] { ',' });
            Roles = roles;
        return base.AuthorizeCore(httpContext);
        }
    }

    //public class CanAddorEditRoleAttribute : AuthorizeAttribute
    //{
    //    public FuelCardDBEntities db = new FuelCardDBEntities();
    //    protected override bool AuthorizeCore(HttpContextBase httpContext)
    //    {
    //        List<Lnk_Role_Permission> lstPermissions = db.Lnk_Role_Permission.Where(x => x.Permission_id == db.Permissions.FirstOrDefault(y => y.PermissionName == Parameters.Can_Assign_PermissionsToRoles).Permission_Id).ToList();
    //        string roles = string.Empty;
    //        foreach (var item in lstPermissions)
    //        {
    //            Role objRole = db.Roles.Single(x => x.Role_id == item.Role_id);
    //            roles = roles + objRole.RoleName + ",";
    //        }
    //        lstPermissions = db.Lnk_Role_Permission.Where(x => x.Permission_id == db.Permissions.FirstOrDefault(y => y.PermissionName == Parameters.Can_Create_Role).Permission_Id).ToList();
    //        foreach (var item in lstPermissions)
    //        {
    //            Role objRole = db.Roles.Single(x => x.Role_id == item.Role_id);
    //            roles = roles + objRole.RoleName + ",";
    //        }
    //        roles = roles.TrimEnd(new char[] { ',' });
    //        Roles = roles;
    //        return base.AuthorizeCore(httpContext);
    //    }
    //}
}