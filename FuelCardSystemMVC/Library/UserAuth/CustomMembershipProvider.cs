using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.Security;
using FuelCardSystemEntities.Models;
using WebMatrix.WebData;
using FuelCardSystemMVC.Library;

namespace FuelCardSystemMVC.Library.UserAuth
{
    public class CurrentUser
    {
        public long userId { get; set; }
        public string userFirstName { get; set; }
        public string email { get; set; }
        public string loginId { get; set; }
        public long? roleType { get; set; }
        public string[] roles { get; set; }
        public bool isActive { get; set; }
    }
    public class CustomMembershipProvider : ExtendedMembershipProvider
    {

        #region Overrides of MembershipProvider

        /// <summary>
        /// Verifies that the specified user name and password exist in the data source.
        /// </summary>
        /// <returns>
        /// true if the specified username and password are valid; otherwise, false.
        /// </returns>
        /// <param name="username">The name of the user to validate. </param><param name="password">The password for the specified user. </param>
        public override bool ValidateUser(string username, string password)
        {
            MembershipHelper mh = new MembershipHelper();
            using (var db = new FuelCardDBEntities())
            {
                string passhash = mh.CreatePassswordHash(password, "@#Df4190^");
                return Convert.ToBoolean(db.Customers.Any(x => x.Customer_Email.ToLower() == username.ToLower() && x.Customer_Password == passhash && x.IsActive == true && x.IsDeleted==false));
            }
        }
        #endregion
        //custome method for get user details
        public Customer GetUserDetails(string username)
        {
            using (var db = new FuelCardDBEntities())
            {
                return db.Customers.FirstOrDefault(x => (x.Customer_Email.ToLower() == username.ToLower()));
            }
            
        }


        #region Overrides of MembershipProvider that throw NotImplementedException

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
        public override bool ChangePassword(string username, string oldPassword, string newPassword)
        {
            throw new NotImplementedException();
        }

        public override bool ChangePasswordQuestionAndAnswer(string username, string password, string newPasswordQuestion, string newPasswordAnswer)
        {
            throw new NotImplementedException();
        }

        public override MembershipUser CreateUser(string username, string password, string email, string passwordQuestion, string passwordAnswer, bool isApproved, object providerUserKey, out MembershipCreateStatus status)
        {
            throw new NotImplementedException();
        }

        public override bool DeleteUser(string username, bool deleteAllRelatedData)
        {
            throw new NotImplementedException();
        }

        public override bool EnablePasswordReset
        {
            get { throw new NotImplementedException(); }
        }

        public override bool EnablePasswordRetrieval
        {
            get { throw new NotImplementedException(); }
        }

        public override MembershipUserCollection FindUsersByEmail(string emailToMatch, int pageIndex, int pageSize, out int totalRecords)
        {
            throw new NotImplementedException();
        }

        public override MembershipUserCollection FindUsersByName(string usernameToMatch, int pageIndex, int pageSize, out int totalRecords)
        {
            throw new NotImplementedException();
        }

        public override MembershipUserCollection GetAllUsers(int pageIndex, int pageSize, out int totalRecords)
        {
            throw new NotImplementedException();
        }

        public override int GetNumberOfUsersOnline()
        {
            throw new NotImplementedException();
        }

        public override string GetPassword(string username, string answer)
        {
            throw new NotImplementedException();
        }

        public override MembershipUser GetUser(string username, bool userIsOnline)
        {
            throw new NotImplementedException();
        }

        public override MembershipUser GetUser(object providerUserKey, bool userIsOnline)
        {
            throw new NotImplementedException();
        }

        public override string GetUserNameByEmail(string email)
        {
            throw new NotImplementedException();
        }

        public override int MaxInvalidPasswordAttempts
        {
            get { throw new NotImplementedException(); }
        }

        public override int MinRequiredNonAlphanumericCharacters
        {
            get { throw new NotImplementedException(); }
        }

        public override int MinRequiredPasswordLength
        {
            get { throw new NotImplementedException(); }
        }

        public override int PasswordAttemptWindow
        {
            get { throw new NotImplementedException(); }
        }

        public override MembershipPasswordFormat PasswordFormat
        {
            get { throw new NotImplementedException(); }
        }

        public override string PasswordStrengthRegularExpression
        {
            get { throw new NotImplementedException(); }
        }

        public override bool RequiresQuestionAndAnswer
        {
            get { throw new NotImplementedException(); }
        }

        public override bool RequiresUniqueEmail
        {
            get { throw new NotImplementedException(); }
        }

        public override string ResetPassword(string username, string answer)
        {
            throw new NotImplementedException();
        }

        public override bool UnlockUser(string userName)
        {
            throw new NotImplementedException();
        }

        public override void UpdateUser(MembershipUser user)
        {
            throw new NotImplementedException();
        }
        #endregion

        #region ExtendedMembershipProvider

        public override bool ConfirmAccount(string accountConfirmationToken)
        {
            throw new NotImplementedException();
        }

        public override bool ConfirmAccount(string userName, string accountConfirmationToken)
        {
            throw new NotImplementedException();
        }

        public override string CreateAccount(string userName, string password, bool requireConfirmationToken)
        {
            throw new NotImplementedException();
        }

        public override string CreateUserAndAccount(string userName/*email*/, string password, bool requireConfirmation, IDictionary<string, object> values)
        {
            throw new NotImplementedException();
        }

        public override bool DeleteAccount(string userName)
        {
            throw new NotImplementedException();
        }

        public override string GeneratePasswordResetToken(string userName, int tokenExpirationInMinutesFromNow)
        {
            throw new NotImplementedException();
        }

        public override ICollection<OAuthAccountData> GetAccountsForUser(string userName)
        {
            throw new NotImplementedException();
        }

        public override DateTime GetCreateDate(string userName)
        {
            throw new NotImplementedException();
        }

        public override DateTime GetLastPasswordFailureDate(string userName)
        {
            throw new NotImplementedException();
        }

        public override DateTime GetPasswordChangedDate(string userName)
        {
            throw new NotImplementedException();
        }

        public override int GetPasswordFailuresSinceLastSuccess(string userName)
        {
            throw new NotImplementedException();
        }

        public override int GetUserIdFromPasswordResetToken(string token)
        {
            throw new NotImplementedException();
        }

        public override bool IsConfirmed(string userName)
        {
            throw new NotImplementedException();
        }

        public override bool ResetPasswordWithToken(string token, string newPassword)
        {
            throw new NotImplementedException();
        }

        public override int GetUserIdFromOAuth(string provider, string providerUserId)
        {
            //throw new NotImplementedException();
            //var oAuthMembership = this.usersService.GetOAuthMembership(provider, providerUserId);
            //if (oAuthMembership != null)
            //{
            //    return oAuthMembership.UserId;
            //}
            return -1;
        }

        public override void CreateOrUpdateOAuthAccount(string provider, string providerUserId, string userName)
        {
            //throw new NotImplementedException();
            using (var db = new FuelCardDBEntities())
            {
                var userProfile = db.Customers.Where(x => x.Customer_Email.Equals(userName));
                if (userProfile == null)
                {
                    throw new Exception("User profile was not created.");
                }
            }

            //this.usersService.SaveOAuthMembership(provider, providerUserId, userProfile.UserId);
        }

        public override string GetUserNameFromId(int userId)
        {
            throw new NotImplementedException();
            //var userProfile = this.usersService.GetUserProfile(userId);
            //if (userProfile != null)
            //{
            //    return userProfile.UserName;
            //}
            //return null;
        }

        #endregion ExtendedMembershipProvider

        #region Membership helper class to use in custom membership
        /// <summary>
        /// Membership helper class to use in custom membership
        /// </summary>
        /// <author>Surendra Yadav</author>
        /// <Date>25-Feb-2015</Date>
        /// <Last Modified By>Sunil Kumar</Last Modified By>
        /// <Last Modified Date>06-Oct-2014</Last Modified Date>
        public class MembershipHelper
        {
            #region To Create Password Hash
            /// <summary>
            /// To Create Password Hash
            /// </summary>
            /// <param name="Password">Password To Hashed</param>
            /// <param name="Salt">Salt to hashed the password</param>
            /// <returns>Hashed password</returns>
            /// <author>Surendra Yadav</author>
            /// <Date>25-Feb-2015</Date>
            /// <Last Modified By>Surendra Yadav</Last Modified By>
            /// <Last Modified Date>13-Oct-2014</Last Modified Date>
            public string CreatePassswordHash(string Password, string Salt)
            {
                return EncryptDecrypt.Encrypt(Password, Salt);
            }
            #endregion
            #region To Create Salt Key
            /// <summary>
            /// To Create Salt Key
            /// </summary>
            /// <param name="size">Size of salt key</param>
            /// <returns>Salt as string</returns>
            /// <author>Surendra Yadav</author>
            /// <Date>25-Feb-2015</Date>
            /// <Last Modified By>Surendra Yadav</Last Modified By>
            /// <Last Modified Date>13-Oct-2014</Last Modified Date>
            public static string CreatSalt(int size)
            {
                try
                {
                    var provider = new RNGCryptoServiceProvider();
                    var data = new byte[size];
                    provider.GetBytes(data);
                    return Convert.ToBase64String(data);
                }
                catch (Exception ex)
                {

                    throw (ex);
                }
            }
            #endregion
        }
        #endregion
    }
}