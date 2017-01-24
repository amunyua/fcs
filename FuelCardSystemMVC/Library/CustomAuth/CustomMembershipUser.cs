using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using FuelCardSystemEntities.Models;

namespace FuelCardSystemMVC.Library.CustomAuth
{

    public class CustomMembershipUser : MembershipUser
    {
        #region Properties

        public long userId { get; set; }
        public string userFirstName { get; set; }
        public string email { get; set; }
        public string loginId { get; set; }
        public long? roleType { get; set; }
        public string[] roles { get; set; }
        #endregion

        public CustomMembershipUser(FuelCardSystemEntities.Models.Staff user)
            : base("CustomMembershipProvider", string.Empty, user.Staff_id, user.Staff_Email, string.Empty, string.Empty, true, false, DateTime.Now, DateTime.Now, DateTime.Now, DateTime.Now, DateTime.Now)
        {
            userId = user.Staff_id;
            userFirstName = user.Staff_Name;
            email = user.Staff_Email;
            loginId = user.Staff_Email;
            roleType = user.Staff_Role;
        }
    }
}