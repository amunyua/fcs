using FuelCardSystemEntities.Models;
using FuelCardSystemMVC.Library.UserAuth;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FuelCardSystemMVC.Library
{
    public class CheckPermission
    {
        #region HasPermission
        public static bool HasPermission(string permission)
        {
            long role_id = UserContext.Identity.roleType ?? 0;
            using (FuelCardDBEntities db = new FuelCardDBEntities())
            {
                Permission objPermission = db.Permissions.SingleOrDefault(x => x.PermissionName == permission);
                Lnk_Role_Permission objPersnRole = db.Lnk_Role_Permission.SingleOrDefault(x => x.Role_id == role_id && x.Permission_id == objPermission.Permission_Id);
                if (objPersnRole != null)
                {
                    return true;
                }
            }
            return false;
        }
        #endregion
    }
}