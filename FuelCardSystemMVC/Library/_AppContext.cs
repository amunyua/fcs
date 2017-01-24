using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using FuelCardSystemEntities.Models;
using FuelCardSystemMVC.Library.CustomAuth;

namespace FuelCardSystemMVC.Library
{
    public class _AppContext
    {
        public static string strCommonErrorMsg = "The Site Has Some Technical Difficulty, Please Retry After Some Time";

        #region GET IP ADDRESS
        public static string GetIPAddress()
        {
            System.Web.HttpContext context = System.Web.HttpContext.Current;
            string ipAddress = context.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (!string.IsNullOrEmpty(ipAddress))
            {
                string[] addresses = ipAddress.Split(',');
                if (addresses.Length != 0)
                {
                    return addresses[0];
                }
            }
            return context.Request.ServerVariables["REMOTE_ADDR"];
        }
        #endregion

        //#region CryptoEngine
        //public static string QueryStringId = CryptorEngine.Encrypt("Id").Replace("=", string.Empty);
        //public static string QueryStringannId = CryptorEngine.Encrypt("annId").Replace("=", string.Empty);
        //#endregion CryptoEngine
        #region GetRootPath
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public static string GetRootPath()
        {
            string strRootPath = string.Empty;
            strRootPath = HttpContext.Current.Request.ApplicationPath + "/";
            strRootPath = strRootPath.Replace("//", "/");
            return strRootPath;
        }
        #endregion
        #region BaseSiteUrl
        /// <summary>
        /// Gets base site url
        /// </summary>
        public static string BaseSiteUrl
        {
            get
            {
                HttpContext context = HttpContext.Current;
                string baseUrl = context.Request.Url.Scheme + "://" + context.Request.Url.Authority + context.Request.ApplicationPath.TrimEnd('/') + '/';
                //string baseUrl = context.Request.Url.Authority + context.Request.ApplicationPath.TrimEnd('/') + '/';
                return baseUrl;
            }
        }
        #endregion
        #region Images Path
        /// <summary>
        /// Gets Images Path
        /// </summary>
        public static string ImagesRoot
        {
            get
            {
                string cssRoot = BaseSiteUrl + "Images/";
                return cssRoot;
            }
        }
        #endregion Images Path
        #region CSS Root
        /// <summary>
        /// Gets Css Path
        /// </summary>
        public static string CssRoot
        {
            get
            {
                string cssRoot = BaseSiteUrl + "Content/";
                return cssRoot;
            }
        }
        #endregion
        #region Admin Root
        /// <summary>
        /// Gets Admin Root Path
        /// </summary>
        public static string AdminRoot
        {
            get
            {
                string cssRoot = BaseSiteUrl + "Admin/";
                return cssRoot;
            }
        }
        #endregion
        #region WriteLogFile
        /// <summary>
        /// This Function is use to Write The Error Log To File
        /// </summary>
        /// <CreatedBy>Surendra Yadav</CreatedBy>
        /// <CreatedDate>27-02-2015</CreatedDate>
        /// <param name="fileName">fileName</param>
        /// <param name="methodName">methodName</param>
        /// /// <param name="message">message</param>
        /// <returns>Void</returns>
        public static void WriteLogFile(string fileName, string methodName, string message)
        {
            try
            {

                string LogFile = Convert.ToString(ConfigurationManager.AppSettings["ErrorLog"]);
                if (!string.IsNullOrEmpty(message))
                {
                    using (FileStream file = new FileStream(System.AppDomain.CurrentDomain.BaseDirectory + LogFile, FileMode.Append, FileAccess.Write))
                    {
                        StreamWriter streamWriter = new StreamWriter(file);
                        streamWriter.WriteLine((((System.DateTime.Now + " - ") + fileName + " - ") + methodName + " - ") + message);
                        streamWriter.WriteLine("----------------------------------------------------------------------------------" + System.Environment.NewLine);
                        streamWriter.Close();
                    }
                }
            }
            catch
            {
                throw;
            }
        }
        #endregion WriteLogFile
        #region WriteSecurityLogFile
        /// <summary>
        /// This Function is use to Write The Security Log To File
        /// </summary>
        /// <CreatedBy>Surendra Yadav</CreatedBy>
        /// <CreatedDate>12-03-2016</CreatedDate>
        /// <param name="fileName">fileName</param>
        /// <param name="methodName">methodName</param>
        /// /// <param name="message">message</param>
        /// <returns>Void</returns>
        public static void WriteSecurityLogFile(string userid, string attempts, string ip, string portal)
        {
            try
            {

                string LogFile = Convert.ToString(ConfigurationManager.AppSettings["SecurityLog"]);
                if (!string.IsNullOrEmpty(userid))
                {
                    using (FileStream file = new FileStream(System.AppDomain.CurrentDomain.BaseDirectory + LogFile, FileMode.Append, FileAccess.Write))
                    {
                        StreamWriter streamWriter = new StreamWriter(file);
                        streamWriter.WriteLine("A user with user id:" + userid + " has tried to login into " + portal + " with " + attempts + " unsuccessful attempts on " + System.DateTime.Now + ", IP Address :" + ip);
                        streamWriter.WriteLine("----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------" + System.Environment.NewLine);
                        streamWriter.Close();
                    }
                }
            }
            catch
            {
                throw;
            }
        }
        #endregion WriteLogFile
        #region Enum's Used
        /// <summary>
        /// Message After Operation Performed.
        /// </summary>
        public enum Messages
        {
            Error = 0,
            Insert,
            Update,
            ChangeStatus,
            Duplicate,
            Delete,
            PasswordSent,
            EmailNotExist,
            NotExist,
            Success,
            Blocked,
            File,
            PasswordChanged,
            InvalidPassword,
            InvalidPassword2,
            PasswordResetLinkExpired,
            AllreadyAssigned,
            WaitingforApproval,
            Approved,
            ApprovalRequired,
            limitexceed
        }
        public enum PageSize
        {
            Small = 7,
            Normal = 10,
            Medium = 15,
            Large = 20,
            ExtraLarge = 25

        }
        public enum CardType
        {
            Prepaid = 0,
            Postpaid
        }
        #endregion Enum's Used
        #region Dictonary Used
        public static Dictionary<string, string> Gender()
        {
            Dictionary<string, string> dicGender = new Dictionary<string, string>();
            dicGender.Add("M", "Male");
            dicGender.Add("F", "Female");
            return dicGender;
        }
        public static Dictionary<string, bool> CommonDropdown()
        {
            Dictionary<string, bool> dicCommonDropdown = new Dictionary<string, bool>();
            dicCommonDropdown.Add("Yes", true);
            dicCommonDropdown.Add("No", false);
            return dicCommonDropdown;
        }
        public static Dictionary<string, string> TimePeriod()
        {
            Dictionary<string, string> dicTimePeriod = new Dictionary<string, string>();
            dicTimePeriod.Add("daily", "daily");
            dicTimePeriod.Add("weekly", "weekly");
            dicTimePeriod.Add("monthly", "monthly");
            dicTimePeriod.Add("yearly", "yearly");
            return dicTimePeriod;
        }
        public static Dictionary<long, string> CardTypes()
        {
            Dictionary<long, string> dicCardTypes = new Dictionary<long, string>();
            dicCardTypes.Add(-1, "All");
            dicCardTypes.Add(-2, "None");
            dicCardTypes.Add(0, "Prepaid");
            dicCardTypes.Add(1, "Postpaid");
            return dicCardTypes;
        }
        public static Dictionary<string, string> ComTemplateTypes()
        {
            Dictionary<string, string> dicComTemplateTypes = new Dictionary<string, string>();
            dicComTemplateTypes.Add("Email", "Email");
            dicComTemplateTypes.Add("SMS", "SMS");
            return dicComTemplateTypes;
        }
        public static Dictionary<string, string> TankTypes()
        {
            Dictionary<string, string> dicTankType = new Dictionary<string, string>();
            dicTankType.Add("Petrol", "Petrol");
            dicTankType.Add("Diesel", "Diesel");
            return dicTankType;
        }
        public static Dictionary<string, string> DiscountTypes()
        {
            Dictionary<string, string> dicDiscountType = new Dictionary<string, string>();
            dicDiscountType.Add("Absolute", "Absolute");
            dicDiscountType.Add("Percentage", "Percentage");
            return dicDiscountType;
        }
        public static Dictionary<string, string> CustomerDesig()
        {
            Dictionary<string, string> dicCustomerDesig = new Dictionary<string, string>();
            dicCustomerDesig.Add("Individual", "Individual");
            dicCustomerDesig.Add("Corporate", "Corporate");
            return dicCustomerDesig;
        }
        #endregion Dictonary Items
        #region File Uploader
        /// <summary>
        /// Gets Uploaded Horse Document Path
        /// </summary>
        public static string UploadedJobsDocument
        {
            get
            {
                return System.Configuration.ConfigurationManager.AppSettings["UploadedJobsDocument"];
            }
        }
        #endregion File Uploader

        #region Image Uploader
        /// <summary>
        /// Gets Uploaded Images for Slider
        /// </summary>
        public static string UploadedSliderImages
        {
            get
            {
                return System.Configuration.ConfigurationManager.AppSettings["UploadedSliderImages"];
            }
        }
        #endregion Image Uploader
        #region Bid Documents Uploader
        /// <summary>
        /// Gets Uploaded Bid Documents
        /// </summary>
        public static string UploadedBidDocs
        {
            get
            {
                return System.Configuration.ConfigurationManager.AppSettings["UploadedBidDocs"];
            }
        }
        #endregion Bid Documents Uploader

        #region FeedBackDocs
        /// <summary>
        /// Gets Uploaded FeedBack Documents
        /// </summary>
        public static string UploadedFeedBackDocs
        {
            get
            {
                return System.Configuration.ConfigurationManager.AppSettings["UploadedFeedBackDocs"];
            }
        }

        #endregion FeedBackDocs

        #region GetRandomNumbers
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public static string GetRandomNumbers()
        {
            Random r = new Random();
            return Convert.ToString(r.Next(100000, 990000));
        }
        public static string GetFourDigitRandomNumbers()
        {
            Random r = new Random();
            return Convert.ToString(r.Next(1000, 9999));
        }
        #endregion GetRendumNumbers

        #region Send Password Reset Mail
        public static bool SendPasswordResetMail(Customer objUser)
        {
            try
            {
                FuelCardDBEntities db = new FuelCardDBEntities();
                CommunicationTemplates objComTemplate = db.CommunicationTemplates.SingleOrDefault(x => x.Template_Name == "Registration Email");
                string content = string.Empty;
                if (objComTemplate != null)
                {
                    content = objComTemplate.Template_Content;
                }
                string id = CryptorEngine.Encrypt(Convert.ToString(objUser.Customer_id));
                string verificationLink = _AppContext.BaseSiteUrl + "Home/PasswordReset/?id=" + HttpUtility.UrlEncode(id);

                StringBuilder strBody = new StringBuilder(content);
                strBody.Replace("@name", objUser.Customer_FirstName);
                strBody.Replace("@link", "<a href='" + verificationLink + "'>Click here</a>");
                EmailDispacher objEmail = new EmailDispacher();
                objEmail.from = ConfigurationManager.AppSettings["AdminEmail"];
                objEmail.to = objUser.Customer_Email;
                string bcc = CheckCCEmail();
                if (!string.IsNullOrEmpty(bcc))
                    objEmail.bcc = bcc;
                objEmail.subject = objComTemplate.Template_Subject;
                objEmail.password = ConfigurationManager.AppSettings["AdminEmailPassword"];
                objEmail.strbody = strBody.ToString();
                return objEmail.SendEmail();
            }
            catch
            {
                throw;
            }
        }
        #endregion

        #region Send Password Reset Mail for Staff
        public static bool SendStaffPasswordResetMail(Staff objUser, string templateName)
        {
            try
            {
                FuelCardDBEntities db = new FuelCardDBEntities();
                CommunicationTemplates objComTemplate = db.CommunicationTemplates.SingleOrDefault(x => x.Template_Name == templateName);
                string content = string.Empty;
                if (objComTemplate != null)
                {
                    content = objComTemplate.Template_Content;
                }
                string id = CryptorEngine.Encrypt(Convert.ToString(objUser.Staff_id));
                string verificationLink = _AppContext.BaseSiteUrl + "Home/StaffPasswordReset/?id=" + HttpUtility.UrlEncode(id);
                StringBuilder strBody = new StringBuilder(content);
                strBody.Replace("@name", objUser.Staff_Name);
                strBody.Replace("@link", "<a href='" + verificationLink + "'>Click here</a>");

                EmailDispacher objEmail = new EmailDispacher();
                objEmail.from = ConfigurationManager.AppSettings["AdminEmail"];
                objEmail.to = objUser.Staff_Email;
                string bcc = CheckCCEmail();
                if (!string.IsNullOrEmpty(bcc))
                    objEmail.bcc = bcc;
                objEmail.subject = objComTemplate.Template_Subject;
                objEmail.password = ConfigurationManager.AppSettings["AdminEmailPassword"];
                objEmail.strbody = strBody.ToString();
                return objEmail.SendEmail();
            }
            catch
            {
                throw;
            }
        }
        #endregion
        #region SendStaffPINMail
        public static bool SendStaffPINMail(Staff objUser)
        {
            try
            {
                FuelCardDBEntities db = new FuelCardDBEntities();
                CommunicationTemplates objComTemplate = db.CommunicationTemplates.SingleOrDefault(x => x.Template_Name == "Staff PIN");
                string content = string.Empty;
                if (objComTemplate != null)
                {
                    content = objComTemplate.Template_Content;
                }

                StringBuilder strBody = new StringBuilder(content);
                strBody.Replace("@name", objUser.Staff_Name);
                strBody.Replace("@PIN", EncryptDecrypt.Decrypt(objUser.Staff_PIN, "@#Df4190^"));

                EmailDispacher objEmail = new EmailDispacher();
                objEmail.from = ConfigurationManager.AppSettings["AdminEmail"];
                objEmail.to = objUser.Staff_Email;
                string bcc = CheckCCEmail();
                if (!string.IsNullOrEmpty(bcc))
                    objEmail.bcc = bcc;
                objEmail.subject = objComTemplate.Template_Subject;
                objEmail.password = ConfigurationManager.AppSettings["AdminEmailPassword"];
                objEmail.strbody = strBody.ToString();
                return objEmail.SendEmail();
            }
            catch
            {
                throw;
            }
        }
        #endregion

        #region To Send Forgot Password Email to Staff
        /// <summary>
        /// To Send Forgot Password Email 
        /// </summary>
        /// <param name="objUser"></param>
        /// <returns></returns>
        public static bool SendForgotPasswordEmail(Staff objUser)
        {
            try
            {
                string strBody = string.Empty;
                strBody += "Hello " + objUser.Staff_Name + ",";
                strBody += "<br>";
                strBody += "<br> Your Email Id is: " + objUser.Staff_Email;
                strBody += "<br>";
                strBody += "<br> Your Password is: " + objUser.Staff_Password;
                EmailDispacher objEmail = new EmailDispacher();
                objEmail.from = ConfigurationManager.AppSettings["AdminEmail"];
                objEmail.to = objUser.Staff_Email;
                string bcc = CheckCCEmail();
                if (!string.IsNullOrEmpty(bcc))
                    objEmail.bcc = bcc;
                objEmail.subject = "Forgot Password";
                objEmail.password = ConfigurationManager.AppSettings["AdminEmailPassword"];
                objEmail.strbody = strBody.ToString();
                return objEmail.SendEmail();
            }
            catch
            {
                throw;
            }

        }
        #endregion To Send Forgot Password Email

        #region To Send Forgot Password Email to Customer
        /// <summary>
        /// To Send Forgot Password Email
        /// </summary>
        /// <param name="objUser"></param>
        /// <returns></returns>
        public static bool SendForgotPasswordEmailtoCustomer(Customer objUser)
        {
            try
            {
                string strBody = string.Empty;
                strBody += "Hello " + objUser.Customer_FirstName + ",";
                strBody += "<br>";
                strBody += "<br> Your User Id is: " + objUser.Customer_Email;
                strBody += "<br>";
                strBody += "<br> Password is: " + objUser.Customer_Password;
                EmailDispacher objEmail = new EmailDispacher();
                objEmail.from = ConfigurationManager.AppSettings["AdminEmail"];
                objEmail.to = objUser.Customer_Email;
                string bcc = CheckCCEmail();
                if (!string.IsNullOrEmpty(bcc))
                    objEmail.bcc = bcc;
                objEmail.subject = "Forgot Password";
                objEmail.password = ConfigurationManager.AppSettings["AdminEmailPassword"];
                objEmail.strbody = strBody.ToString();
                return objEmail.SendEmail();
            }
            catch
            {
                throw;
            }

        }
        #endregion To Send Forgot Password Email

        #region SendMessageToCustomers
        public static bool SendMessageToCustomers(string customers, string subject, string body)
        {
            EmailDispacher objEmail = new EmailDispacher();
            objEmail.from = ConfigurationManager.AppSettings["AdminEmail"];
            objEmail.to = customers;
            string bcc = CheckCCEmail();
            if (!string.IsNullOrEmpty(bcc))
                objEmail.bcc = bcc;
            objEmail.subject = subject;
            objEmail.password = ConfigurationManager.AppSettings["AdminEmailPassword"];
            objEmail.strbody = body;
            return objEmail.SendEmail();
        }
        #endregion

        #region Check CCEmail in General Setting is set
        public static string CheckCCEmail()
        {
            string bcc = string.Empty;
            using (FuelCardDBEntities db = new FuelCardDBEntities())
            {
                GeneralSetting objGensetting = db.GeneralSettings.SingleOrDefault(x => x.IsCCEmail == true && (x.CCEmail != null || x.CCEmail != ""));
                if (objGensetting != null)
                    bcc = objGensetting.CCEmail;
            }
            return bcc;
        }
        #endregion

        #region File Operations
        public static string ReadFile(string filePath)
        {
            FileStream file = new FileStream(filePath, FileMode.Open, FileAccess.Read);
            StreamReader sr = new StreamReader(file);
            string retVal = sr.ReadToEnd();
            sr.Close();
            file.Close();
            return retVal;
        }
        public static bool WriteFile(string filePath, string content)
        {
            try
            {
                //File.WriteAllText(filePath, editorStaticContant.Text);
                File.WriteAllText(filePath, string.Empty);
                FileStream file = new FileStream(filePath, FileMode.Open, FileAccess.Write); //File.OpenWrite(filePath);// 
                StreamWriter sw = new StreamWriter(file);
                sw.Write(content, false);
                sw.Close();

                file.Close();
                return true;
            }
            catch
            {
                return false;
            }
        }
        #endregion File Operations

        #region HasPermission
        public static bool HasPermission(string permission)
        {
            long role_id = UserContext.Identity.roleType ?? 0;
            using (FuelCardDBEntities db = new FuelCardDBEntities())
            {
                Permission objPermission = db.Permissions.SingleOrDefault(x => x.PermissionName == permission);
                Console.WriteLine(permission);
                Console.WriteLine(objPermission.Permission_Id);
                Console.WriteLine(role_id);
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