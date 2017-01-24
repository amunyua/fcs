using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using FuelCardSystemEntities.Models;

namespace FuelCardSystemMVC.Library.UserAuth
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

        public CustomMembershipUser(FuelCardSystemEntities.Models.Customer user)
            : base("CustomMembershipProvider", string.Empty, user.Customer_id, user.Customer_Email, string.Empty, string.Empty, true, false, DateTime.Now, DateTime.Now, DateTime.Now, DateTime.Now, DateTime.Now)
        {
            userId = user.Customer_id;
            userFirstName = user.Customer_FirstName;
            email = user.Customer_Email;
            loginId = user.Customer_Email;
            roleType = user.Customer_Role;
        }
    }
}