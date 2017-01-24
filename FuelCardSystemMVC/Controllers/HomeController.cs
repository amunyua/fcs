using FuelCardSystemMVC.Library;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FuelCardSystemEntities.Models;
using FuelCardSystemBAL;
using FuelCardSystemMVC.Models;

namespace FuelCardSystemMVC.Controllers
{
    //[HandleError]
    public class HomeController : Controller
    {
        public FuelCardDBEntities db = new FuelCardDBEntities();
        public ActionResult Index()
        {
            return View();
        }
        #region Password Reset
        public ActionResult PasswordReset(string id)
        {
            try
            {
                if (!string.IsNullOrEmpty(id))
                {
                    string uid = CryptorEngine.Decrypt(id);
                    long custId = Convert.ToInt64(uid);
                    Customer objCustomer = db.Customers.SingleOrDefault(x => x.Customer_id == custId && x.PasswordResetLnkDate >= DateTime.Now);
                    if (objCustomer != null)
                    {
                        ViewBag.msg = _AppContext.Messages.Success;
                        objCustomer.Customer_Password = "";
                        objCustomer.Customer_id = custId;
                        return View(objCustomer);
                    }
                    else
                    {
                        ViewBag.msg = _AppContext.Messages.PasswordResetLinkExpired;
                    }
                }
            }
            catch (Exception ex)
            {
                ViewBag.msg = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Home", "PasswordReset_GET", ex.ToString());
            }
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult PasswordReset(Customer objCustomer)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    Customer objCust = db.Customers.SingleOrDefault(x => x.Customer_id == objCustomer.Customer_id && x.PasswordResetLnkDate >= DateTime.Now);
                    if (objCust != null)
                    {
                        objCust.Customer_Password = EncryptDecrypt.Encrypt(objCustomer.Customer_Password, "@#Df4190^");
                        objCust.ReportingPassword = CryptorEngineMd5.MD5Hash(objCustomer.Customer_Password);
                        objCust.IsVerified = true;
                        objCust.VerificationMailDate = DateTime.Now;
                        AdminBAL.AddUpdateCustomer(objCust);
                        ViewBag.msg = _AppContext.Messages.PasswordChanged;
                    }
                }
            }
            catch (Exception ex)
            {
                ViewBag.msg = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Home", "PasswordReset_POST", ex.ToString());
            }
            return View();
        }
        #endregion
        #region StaffPasswordReset
        public ActionResult StaffPasswordReset(string id)
        {
            try
            {
                if (!string.IsNullOrEmpty(id))
                {
                    string uid = CryptorEngine.Decrypt(id);
                    long stafftId = Convert.ToInt64(uid);
                    Staff objStaff = db.Staffs.SingleOrDefault(x => x.Staff_id == stafftId && x.PasswordResetExpDate >= DateTime.Now);
                    if (objStaff != null)
                    {
                        ViewBag.msg = _AppContext.Messages.Success;
                        objStaff.Staff_Password = "";
                        objStaff.Staff_id = stafftId;
                        return View(objStaff);
                    }
                    else
                    {
                        ViewBag.msg = _AppContext.Messages.PasswordResetLinkExpired;
                    }
                }
            }
            catch (Exception ex)
            {
                ViewBag.msg = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Home", "StaffPasswordReset_GET", ex.ToString());
            }
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult StaffPasswordReset(Staff objStaff)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    Staff objStf = db.Staffs.SingleOrDefault(x => x.Staff_id == objStaff.Staff_id && x.PasswordResetExpDate >= DateTime.Now);
                    if (objStf != null)
                    {
                        objStf.Staff_Password = EncryptDecrypt.Encrypt(objStaff.Staff_Password, "@#Df4190^");
                        AdminBAL.AddUpdateStaff(objStf);
                        ViewBag.msg = _AppContext.Messages.PasswordChanged;
                    }
                }
            }
            catch (Exception ex)
            {
                ViewBag.msg = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Home", "StaffPasswordReset_POST", ex.ToString());
            }
            return View();
        }
        #endregion
        #region Forgotpassword
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public ActionResult Forgotpassword()
        {
            try
            {

            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Home", "Forgotpassword_GET", ex.ToString());
            }
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Forgotpassword(LoginModel model)
        {
            try
            {
                List<Lnk_Role_Permission> lstPermissions = db.Lnk_Role_Permission.Where(x => x.Permission_id == db.Permissions.FirstOrDefault(y => y.PermissionName == Parameters.Can_log_in_to_portal).Permission_Id).ToList();
                Staff objStaff = db.Staffs.SingleOrDefault(x => x.Staff_Email == model.UserName);
                if (objStaff != null)
                {
                    if (lstPermissions.Find(x => x.Role_id == objStaff.Staff_Role).Role_id > 0)
                    {
                        objStaff.Staff_Password = EncryptDecrypt.Decrypt(objStaff.Staff_Password, "@#Df4190^");
                        _AppContext.SendForgotPasswordEmail(objStaff);
                        ViewBag.msg = _AppContext.Messages.Success;
                    }
                    else
                    {
                        ViewBag.msg = _AppContext.Messages.EmailNotExist;
                    }
                }
                else
                {
                    ViewBag.msg = _AppContext.Messages.EmailNotExist;
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Home", "Forgotpassword_GET", ex.ToString());
            }
            return View();
        }
        #endregion
        #region ForgotpasswordCustomer
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public ActionResult ForgotpasswordCustomer()
        {
            try
            {

            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Home", "ForgotpasswordCustomer_GET", ex.ToString());
            }
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ForgotpasswordCustomer(LoginModel model)
        {
            try
            {
                List<Customer_Roles> lstRoles = db.Customer_Roles.Where(x => x.Customer_RoleName == "Admin" || x.Customer_RoleName == "NormalUser").ToList();
                Customer objCustomer = db.Customers.SingleOrDefault(x => x.Customer_Email == model.UserName);
                if (objCustomer != null)
                {
                    if (lstRoles.Find(x => x.Customer_RoleId == objCustomer.Customer_Role).Customer_RoleId > 0)
                    {
                        objCustomer.Customer_Password = EncryptDecrypt.Decrypt(objCustomer.Customer_Password, "@#Df4190^");
                        _AppContext.SendForgotPasswordEmailtoCustomer(objCustomer);
                        ViewBag.msg = _AppContext.Messages.Success;
                    }
                    else
                    {
                        ViewBag.msg = _AppContext.Messages.EmailNotExist;
                    }
                }
                else
                {
                    ViewBag.msg = _AppContext.Messages.EmailNotExist;
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Home", "ForgotpasswordCustomer_POST", ex.ToString());
            }
            return View();
        }
        #endregion
        #region NoPage
        //public ActionResult NoPage()
        //{
        //    throw new Exception("Error Occured !");
        //    return View();
        //}
        #endregion
        #region test
        public ActionResult test()
        {
            return View();
        }
        #endregion
    }
}
