using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Principal;
using FuelCardSystemEntities.Models;

namespace FuelCardSystemMVC.Library.UserAuth
{
    [Serializable]
    public class CustomPrincipal : IPrincipal
    {
        #region Implementation of IPrincipal
        /// <summary>
        /// Determines whether the current principal belongs to the specified role.
        /// </summary>
        /// <returns>
        /// true if the current principal is a member of the specified role; otherwise, false.
        /// </returns>
        /// <param name="role">The name of the role for which to check membership. </param>
        public bool IsInRole(string role)
        {
            if (Identity is CustomIdentity)
            {
                if (string.Compare(role, ((CustomIdentity)Identity).roles[0], StringComparison.CurrentCultureIgnoreCase) == 0)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
                return false; //Identity is CustomIdentity;// && 
            //string.Compare(role, ((CustomIdentity)Identity).roles, StringComparison.CurrentCultureIgnoreCase) == 0;
        }

        /// <summary>
        /// Gets the identity of the current principal.
        /// </summary>
        /// <returns>
        /// The <see cref="T:System.Security.Principal.IIdentity"/> object associated with the current principal.
        /// </returns>
        public IIdentity Identity { get; private set; }

        #endregion

        public CustomIdentity CustomIdentity { get { return (CustomIdentity)Identity; } set { Identity = value; } }

        public CustomPrincipal(CustomIdentity identity)
        {
            Identity = identity;
        }
    }
}