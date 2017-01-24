using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Principal;
using System.Web.Security;
using FuelCardSystemEntities.Models;

namespace FuelCardSystemMVC.Library.UserAuth
{
    /// <summary>
    /// An identity object represents the user on whose behalf the code is running.
    /// </summary>
    [Serializable]
    public class CustomIdentity : IIdentity
    {
        #region Properties

        public IIdentity Identity { get; set; }

        public long userId { get; set; }
        public string userFirstName { get; set; }
        public string email { get; set; }
        public string loginId { get; set; }
        public long? roleType { get; set; }
        public string[] roles { get; set; }
        #endregion

        #region Implementation of IIdentity

        /// <summary>
        /// Gets the name of the current user.
        /// </summary>
        /// <returns>
        /// The name of the user on whose behalf the code is running.
        /// </returns>
        public string Name
        {
            get { return Identity.Name; }
        }

        /// <summary>
        /// Gets the type of authentication used.
        /// </summary>
        /// <returns>
        /// The type of authentication used to identify the user.
        /// </returns>
        public string AuthenticationType
        {
            get { return Identity.AuthenticationType; }
        }

        /// <summary>
        /// Gets a value that indicates whether the user has been authenticated.
        /// </summary>
        /// <returns>
        /// true if the user was authenticated; otherwise, false.
        /// </returns>
        public bool IsAuthenticated { get { return Identity.IsAuthenticated; } }

        #endregion

        #region Constructor

        public CustomIdentity(IIdentity identity)
        {
            Identity = identity;

            //var customMembershipUser1 = (CustomMembershipUser)Membership.GetUser(identity.Name);
            CustomMembershipProvider objCustomMembershipProvider = new CustomMembershipProvider();
            var customMembershipUser = (Customer)objCustomMembershipProvider.GetUserDetails(identity.Name);
            if (customMembershipUser != null)
            {
                userId = customMembershipUser.Customer_id;
                userFirstName = customMembershipUser.Customer_FirstName;
                email = customMembershipUser.Customer_Email;
                loginId = customMembershipUser.Customer_Email;
                roleType = customMembershipUser.Customer_Role;
                CustomRoleProvider rl = new CustomRoleProvider();
                roles = rl.GetRolesForUser(Convert.ToString(roleType));
            }
        }

        #endregion
    }
}