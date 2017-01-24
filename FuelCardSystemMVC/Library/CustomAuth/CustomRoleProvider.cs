using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using FuelCardSystemEntities.Models;

namespace FuelCardSystemMVC.Library.CustomAuth
{
    public class CustomRoleProvider : RoleProvider
    {

        public override bool IsUserInRole(string username, string roleName)
        {
            using (var db = new FuelCardDBEntities())
            {
                var user=string.Empty;
                if (user == null)
                    return false;
                //return user.UserRoles != null && user.UserRoles.Select(
                //     u => u.Role).Any(r => r.RoleName == roleName);
                return true;
            }

        }

        public override string[] GetRolesForUser(string roleId)
        {
                using (var db = new FuelCardDBEntities())
                {
                    List<string> myCollection = new List<string>();
                    long rlid = Convert.ToInt64(roleId);
                    string role = db.Roles.SingleOrDefault(x => x.Role_id == rlid).RoleName;
                    myCollection.Add(role);
                    return myCollection.ToArray();
                }
        }

        public override void AddUsersToRoles(string[] usernames, string[] roleNames)
        {
            throw new NotImplementedException();
        }

        public override string ApplicationName
        {
            get
            {
                throw new NotImplementedException();
            }
            set
            {
                throw new NotImplementedException();
            }
        }

        public override void CreateRole(string roleName)
        {
            throw new NotImplementedException();
        }

        public override bool DeleteRole(string roleName, bool throwOnPopulatedRole)
        {
            throw new NotImplementedException();
        }

        public override string[] FindUsersInRole(string roleName, string usernameToMatch)
        {
            throw new NotImplementedException();
        }

        public override string[] GetAllRoles()
        {
            throw new NotImplementedException();
        }


        public override string[] GetUsersInRole(string roleName)
        {
            throw new NotImplementedException();
        }

        

        public override void RemoveUsersFromRoles(string[] usernames, string[] roleNames)
        {
            throw new NotImplementedException();
        }

        public override bool RoleExists(string roleName)
        {
            throw new NotImplementedException();
        }
    }
}