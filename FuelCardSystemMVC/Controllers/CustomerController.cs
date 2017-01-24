using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FuelCardSystemEntities.Models;
using FuelCardSystemMVC.Library;
using FuelCardSystemMVC.Library.UserAuth;
using FuelCardSystemMVC.Models;
using System.Web.Security;
using FuelCardSystemBAL;
using System.Web.Script.Serialization;

namespace FuelCardSystemMVC.Controllers
{
    //[CustAuthorize]
    [Authorize(Roles="Admin,NormalUser")]
    public class CustomerController : Controller
    {
        public FuelCardDBEntities db = new FuelCardDBEntities();
        #region Authorization
        protected override void OnAuthorization(AuthorizationContext filterContext)
        {
            string requestUrl = Convert.ToString(Request.Url.LocalPath).ToLower();
            if (requestUrl != "/customer/login" && !UserContext.Identity.IsAuthenticated)
            {
                filterContext.HttpContext.Response.Redirect("~/Customer/Login");
            }
            if (Request.IsAuthenticated)
            {
                var identity = new CustomIdentity(HttpContext.User.Identity);
                var principal = new CustomPrincipal(identity);
                HttpContext.User = principal;
                ViewBag.custName = UserContext.Identity.userFirstName;
                var nnn = UserContext.Identity;
            }
            base.OnAuthorization(filterContext);
        }
        #endregion
        #region Login
        /// <summary>
        /// Here [AllowAnonymous] is used so that Customer/Login can be accessed without Authorization
        /// </summary>
        /// <param name="returnUrl"></param>
        /// <returns></returns>
        [AllowAnonymous]
        public ActionResult Login(string returnUrl)
        {
            ViewBag.ReturnURL = returnUrl;
            return View();
        }
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public ActionResult Login(LoginModel model, string returnUrl)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    var membershipProvider1 = Membership.Providers["MyMembershipProvider1"];
                    if (TempData["count"] == null)
                        TempData["count"] = 0;
                    if (TempData["time"] == null)
                        TempData["time"] = DateTime.Now.AddMinutes(5);
                    if ((int)TempData["count"] <= 3)
                    {
                        if (membershipProvider1.ValidateUser(model.UserName, model.Password))
                        {
                            FormsAuthentication.SetAuthCookie(model.UserName, false);
                            return RedirectToAction("Index");
                        }
                        else
                        {
                            TempData["count"] = (int)TempData["count"] + 1;
                            ViewBag.msg = _AppContext.Messages.InvalidPassword;
                            ModelState.AddModelError("", "The user name or password is incorrect");
                        }
                    }
                    else if (((DateTime)TempData["time"]) > DateTime.Now)
                    {
                        TempData["msg"] = _AppContext.Messages.Blocked;
                        _AppContext.WriteSecurityLogFile(model.UserName, TempData["count"].ToString(), _AppContext.GetIPAddress(), "Customer Portal");
                        return RedirectToAction("ForgotpasswordCustomer", "Home");
                    }
                    else
                    {
                        TempData["count"] = null;
                        TempData["time"] = null;
                    }
                }
            }
            catch (Exception ex)
            {
                ViewBag.Response = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Customer", "Login_POST", ex.ToString());
            }
            //redisplay the login form
            ViewBag.msg = _AppContext.Messages.InvalidPassword;
            return View(model);
        }
        [AllowAnonymous]
        public ActionResult LogOff()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Login", "Customer");
        }
        #endregion

        #region ChangePassword
        public ActionResult ChangePassword()
        {
            try
            {

            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Customer", "ChangePassword_GET", ex.ToString());
            }
            return View();
        }
        [HttpPost]
        public ActionResult ChangePassword(LocalPasswordModel objUser)
        {
            try
            {
                string passwd = EncryptDecrypt.Encrypt(objUser.OldPassword, "@#Df4190^");
                Customer objUsr = new Customer();
                objUsr = db.Customers.SingleOrDefault(x => x.Customer_Password == passwd && x.Customer_Email == UserContext.Identity.email && x.IsActive == true);
                if (objUsr != null)
                {
                    objUsr.Customer_Password = EncryptDecrypt.Encrypt(objUser.NewPassword, "@#Df4190^");
                    objUsr.ReportingPassword = CryptorEngineMd5.MD5Hash(objUser.NewPassword);
                    if (AdminBAL.ChangeCustomerPassword(objUsr) == 1)
                    {
                        ViewBag.Msg = _AppContext.Messages.PasswordChanged;
                        return RedirectToAction("LogOff", "Customer");
                    }
                }
                else
                {
                    ViewBag.Msg = _AppContext.Messages.InvalidPassword;
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Customer", "ChangePassword_POST", ex.ToString());
            }
            return View();
        }
        #endregion
        #region Dashboard
        public ActionResult Index()
        {
            
            return View();
        }
        #endregion

        #region CustomerVehicleList
        /// <summary>
        /// 
        /// </summary>
        /// <param name="id">Vehicle Id</param>
        /// <param name="custid">Customer Id</param>
        /// <returns></returns>
        public ActionResult CustomerVehicleList(long? id, long? accountnumber, string status)
        {
            try
            {
                if (id.HasValue)
                {
                    Customer_Vehicle objVehicle = db.Customer_Vehicle.SingleOrDefault(x => x.CustomerVehicleId == id);
                    if (objVehicle != null && !string.IsNullOrEmpty(status))
                    {
                        if (status.Equals("active"))
                        {
                            if (objVehicle.IsActive == true)
                                objVehicle.IsActive = false;
                            else
                                objVehicle.IsActive = true;
                        }
                        else if (status.Equals("delete"))
                        {
                            if (objVehicle.IsDeleted == true)
                                objVehicle.IsDeleted = false;
                            else
                                objVehicle.IsDeleted = true;
                        }
                        objVehicle.DateCreated = DateTime.Now;
                        AdminBAL.AddUpdateCustomerVehicle(objVehicle);
                        RouteData.Values.Remove("id");
                        return RedirectToAction("CustomerVehicleList", "Customer");
                    }
                    if (accountnumber.HasValue)
                    {
                        AdminBAL.UnassignVehicleFromAccount(id, accountnumber);
                    }
                }
                    List<Customer_Vehicle> lstVehicles = db.Customer_Vehicle.Where(x => x.Customer_Id == UserContext.Identity.userId).OrderByDescending(x => x.DateCreated).ToList();
                    ViewBag.customer = UserContext.Identity.userFirstName;
                    ViewBag.custid = UserContext.Identity.userId;
                    return View(lstVehicles);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Customer", "CustomerVehicleList_GET", ex.ToString());
            }
            return View();
        }
        #endregion
        #region AddCustomerVehicle
        /// <summary>
        /// 
        /// </summary>
        /// <param name="id">Customer Vehicle Id</param>
        /// <returns></returns>
        public ActionResult AddCustomerVehicle(long? id)
        {
            try
            {
                List<Vehicle> lstVehicles = db.Vehicle.Where(x => x.VehicleIsActive == true && x.VehicleIsDeleted == false).OrderBy(x => x.Vehicle_Make).ToList();
                lstVehicles.Insert(0, new Vehicle { Vehicle_Id = -1, Vehicle_Make = "Please Select Vehicle..." });
                ViewBag.vehicles = new SelectList(lstVehicles, "Vehicle_Id", "Vehicle_Make");
                ViewBag.fueltype = new SelectList(db.Products.Where(x => x.Product_IsActive == true && x.Product_IsDeleted == false).OrderBy(x => x.Product_Type).ToList(), "Product_id", "Product_Name");
                //List<Customer_Account> lstAccount = db.Customer_Account.Where(x => x.Customer_id == UserContext.Identity.userId && x.IsDeleted == false).ToList();
                var accounts = db.VwCustomerEmpAccount.Where(x => x.Customer_id == UserContext.Identity.userId && x.IsDeleted == false).ToList().Select(x => new { AccountNumber = x.AccountNumber, Description = string.Format("{0}, Customer({1}), Employee({2})", x.AccountNumber, x.Customer_FirstName + " " + x.Customer_MiddleName + " " + x.Customer_LastName, string.IsNullOrEmpty(x.Emp_Name) ? "none" : x.Emp_Name) });
                if (accounts != null && accounts.Select(x => x.AccountNumber).ToList().Count > 0)
                {
                    ViewBag.custacc = new SelectList(accounts, "AccountNumber", "Description");
                }
                else
                {
                    ViewBag.msg = _AppContext.Messages.NotExist;
                }
                Customer_Vehicle objVehicle = new Customer_Vehicle();
                List<WeekDays> lstWeekDays = db.WeekDays.ToList();
                Lnk_CustomerVehicle_Account objVehicleAccount = new Lnk_CustomerVehicle_Account();
                if (id.HasValue)
                {
                    objVehicle = db.Customer_Vehicle.SingleOrDefault(x => x.CustomerVehicleId == id);
                    string[] str = objVehicle.DaystoFuel.Split(',');
                    foreach (var item in str)
                    {
                        lstWeekDays.Find(x => x.WeekdayName == item).IsSelected = true;
                    }
                    objVehicleAccount = db.Lnk_CustomerVehicle_Account.FirstOrDefault(x => x.Lnk_CustomerVehicleId == id);
                }
                ViewBag.custid = UserContext.Identity.userId;
                objVehicle.Customer_Id = UserContext.Identity.userId;

                var tpl = new Tuple<Customer_Vehicle, List<WeekDays>, Lnk_CustomerVehicle_Account>(objVehicle, lstWeekDays, objVehicleAccount) { };
                return View(tpl);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Customer", "AddCustomerVehicle_GET", ex.ToString());
            }
            return View();
        }
        [HttpPost]
        public ActionResult AddCustomerVehicle(Customer_Vehicle item1, Lnk_CustomerVehicle_Account item3)
        {
            try
            {
                bool isExists = false;
                item1.IsActive = true;
                item1.IsDeleted = false;
                item1.DateCreated = DateTime.Now;
                string days = item1.DaystoFuel.Trim();
                int index = days.IndexOf("on", 0, 2);
                days = (index < 0) ? days : days.Remove(index, 2).Trim(new char[] { ',' });
                item1.DaystoFuel = days;
                List<Customer_Vehicle> lst = db.Customer_Vehicle.Where(x => x.VehicleRegNo.Equals(item1.VehicleRegNo)).ToList();
                if (lst.Count > 0 && lst!=null)
                {
                    foreach (var item in lst)
                    {
                        Lnk_CustomerVehicle_Account objVehicle = db.Lnk_CustomerVehicle_Account.FirstOrDefault(x => x.Lnk_CustomerVehicleId == item.CustomerVehicleId && x.Lnk_IsDeleted == false);
                        if (objVehicle != null)
                      {
                          isExists = true;
                          break;
                      }
                    }
                }
                if (isExists == false)
                {
                    if (AdminBAL.AddUpdateCustomerVehicle(item1) == 1)
                    {
                        item3.Lnk_IsActive = true;
                        item3.Lnk_IsDeleted = false;
                        item3.Lnk_CustomerVehicleId = item1.CustomerVehicleId;
                        if (AdminBAL.AddUpdateVehicleAccount(item3) == 1)
                        {
                            ModelState.Clear();
                            TempData["msg"] = _AppContext.Messages.Success;
                        }
                    }
                }
                else
                {
                    TempData["msg"] = _AppContext.Messages.AllreadyAssigned;
                }
                return RedirectToAction("CustomerVehicleList", "Customer", new { custid = item1.Customer_Id });
            }
            catch (Exception ex)
            {
                ViewBag.msg = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Customer", "AddCustomerVehicle_GET", ex.ToString());
            }
            return View();
        }
        #endregion
        #region GetModelsFromVehicleID
        public JsonResult GetModelsFromVehicleID(string id)
        {
            JsonResult objJR = Json(new { Status = "failed" }, JsonRequestBehavior.AllowGet);
            try
            {
                if (!string.IsNullOrEmpty(id))
                {
                    long typeId = Convert.ToInt64(id);
                    return Json(AdminBAL.GetModelsFromVehicleId(typeId));
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Customer", "GetModelsFromVehicleID_JSON", ex.ToString());
            }
            return objJR;
        }
        #endregion

        #region Add Customer Employee/Department
        /// <summary>
        /// Add or Update customer's employee or department
        /// </summary>
        /// <returns></returns>
        public ActionResult AddCustomerEmp(long? id)
        {
            try
            {
                Employee objEmp = new Employee();
                if (id.HasValue)
                {
                    objEmp = db.Employees.SingleOrDefault(x => x.Emp_id == id);
                }
                    objEmp.Emp_Customer_id = UserContext.Identity.userId;
                    ViewBag.custName = UserContext.Identity.userFirstName;
                return View(objEmp);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Customer", "AddCustomerEmp_GET", ex.ToString());
            }
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddCustomerEmp(Employee objEmp)
        {
            try
            {
                if (objEmp.Emp_Customer_id > 0 && db.Customers.SingleOrDefault(x => x.Customer_id == objEmp.Emp_Customer_id) != null)
                {
                    ViewBag.custName = UserContext.Identity.userFirstName;
                    objEmp.Emp_IsActive = true;
                    objEmp.Emp_IsDeleted = false;
                    objEmp.Emp_DateCreated = DateTime.Now;
                    if (objEmp.Emp_id > 0)
                    {

                        if (AdminBAL.AddUpdateCustomerEmp(objEmp) == 1)
                        {
                            TempData["msg"] = _AppContext.Messages.Update;
                        }
                    }
                    else
                    {
                        if (AdminBAL.AddUpdateCustomerEmp(objEmp) == 1)
                            TempData["msg"] = _AppContext.Messages.Insert;
                    }

                }
                else
                {
                    TempData["msg"] = _AppContext.Messages.Error;
                }
                ModelState.Clear();
                Employee objEmployee = new Employee();
                objEmployee.Emp_Customer_id = objEmp.Emp_Customer_id;
                return RedirectToAction("AddCustomerEmp", "Customer");
            }
            catch (Exception ex)
            {
                TempData["msg"] = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Customer", "AddCustomerEmp_GET", ex.ToString());
            }
            return View();
        }
        #endregion
        #region Employee/Department List
        /// <summary>
        /// 
        /// </summary>
        /// <param name="id">Customer_id or Emp_id</param>
        /// <param name="status"></param>
        /// <returns></returns>
        public ActionResult CustomerEmpList(long? id, string status)
        {
            try
            {
                if (id.HasValue)
                {
                    if (!string.IsNullOrEmpty(status))
                    {
                        Employee objEmployee = db.Employees.SingleOrDefault(x => x.Emp_id == id);
                        if (objEmployee != null)
                        {
                            if (status.Equals("active"))
                            {
                                if (objEmployee.Emp_IsActive == true)
                                    objEmployee.Emp_IsActive = false;
                                else
                                    objEmployee.Emp_IsActive = true;
                            }
                            else if (status.Equals("delete"))
                            {
                                if (objEmployee.Emp_IsDeleted == true)
                                    objEmployee.Emp_IsDeleted = false;
                                else
                                    objEmployee.Emp_IsDeleted = true;
                            }
                            objEmployee.Emp_DateCreated = DateTime.Now;
                            AdminBAL.AddUpdateCustomerEmp(objEmployee);
                            RouteData.Values.Remove("id");
                            RedirectToAction("CustomerEmpList", "Customer");
                        }
                    }
                }
                    List<Employee> lstEmployees = db.Employees.Where(x => x.Emp_Customer_id == UserContext.Identity.userId).OrderByDescending(x => x.Emp_DateCreated).ToList();
                    ViewBag.custId = UserContext.Identity.userId;
                    ViewBag.custName = UserContext.Identity.userFirstName;
                    return View(lstEmployees);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Customer", "CustomerEmpList_GET", ex.ToString());
            }
            return View();
        }
        #endregion
        #region Assign Accounts to Employees
        /// <summary>
        /// Assign Cards to Employees related to customer
        /// </summary>
        /// <param name="id">Employee Id</param>
        /// <returns></returns>
        public ActionResult AssignAccountstoEmp(long? id)
        {
            try
            {
                if (id.HasValue)
                {
                    Employee objEmployee = db.Employees.SingleOrDefault(x => x.Emp_id == id && x.Emp_Customer_id == UserContext.Identity.userId && x.Emp_IsActive == true && x.Emp_IsDeleted == false); //Employee of Customer
                    if (objEmployee != null)
                    {
                        TempData["custId"] = UserContext.Identity.userId;
                        TempData["empId"] = id;
                        TempData["employee"] = objEmployee.Emp_Name;
                        ViewBag.msg = _AppContext.Messages.ChangeStatus;
                        Customer_Account objCard = new Customer_Account();
                        List<Customer_Account> lstCards = db.Customer_Account.Where(x => x.IsDeleted == false && x.Customer_id == UserContext.Identity.userId && x.Employee_id == null).OrderByDescending(x => x.DateCreated).ToList();
                        var tplCards = new Tuple<Customer_Account, List<Customer_Account>>(objCard, lstCards) { };
                        return View(tplCards);
                    }
                }
                ViewBag.msg = _AppContext.Messages.NotExist;
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Customer", "AssignAccountstoEmp_GET", ex.ToString());
            }
            return View();
        }
        [HttpPost]
        public ActionResult AssignAccountstoEmp(Customer_Account item1, FormCollection frm)
        {
            try
            {
                List<long> Card_Ids = string.IsNullOrEmpty(frm["hdnCardId"]) ? new List<long>() : frm["hdnCardId"].Split(',').Select(long.Parse).ToList();
                long empId = Convert.ToInt64(frm["hdnEmpId"]);
                long custId = Convert.ToInt64(frm["hdnCustId"]);
                foreach (long item in Card_Ids)
                {
                    Customer_Account objAccount = db.Customer_Account.Single(x => x.AccountNumber == item);
                    objAccount.Employee_id = empId;
                    objAccount.DateCreated = DateTime.Now;
                    AdminBAL.AddUpdateCustomerAccount(objAccount);
                    ViewBag.msg = _AppContext.Messages.Success;
                }
                TempData["custId"] = custId;
                Employee objEmployee = db.Employees.Single(x => x.Emp_id == empId);
                TempData["employee"] = objEmployee.Emp_Name;
                TempData["empId"] = objEmployee.Emp_id;
                ModelState.Clear();
                Customer_Account obj_Account = new Customer_Account();
                List<Customer_Account> lstCards = db.Customer_Account.Where(x => x.IsDeleted == false && x.Employee_id == null && x.Customer_id == custId).OrderByDescending(x => x.DateCreated).ToList();
                var tplCards = new Tuple<Customer_Account, List<Customer_Account>>(obj_Account, lstCards) { };
                return View(tplCards);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Customer", "AssignAccountstoEmp_POST", ex.ToString());
            }
            return View();
        }
        #endregion
        #region ViewEmpAccounts
        public ActionResult ViewEmpAccounts(long? id, string status)
        {
            try
            {
                if (id.HasValue && !string.IsNullOrEmpty(status)) //id = Account Number
                {
                    Customer_Account objAccount = db.Customer_Account.SingleOrDefault(x => x.AccountNumber == id);
                    long? empid = objAccount.Employee_id;
                    if (objAccount != null)
                    {
                        if (status.Equals("assign"))
                        {
                            if (objAccount.Employee_id > 0)
                                objAccount.Employee_id = null;
                            else
                                objAccount.Employee_id = id;
                        }
                        objAccount.DateCreated = DateTime.Now;
                        AdminBAL.AddUpdateCustomerAccount(objAccount);
                        return RedirectToAction("ViewEmpAccounts", "Customer", new { id = empid });
                    }
                }
                else if (id.HasValue) //id = Employee id
                {
                    List<Customer_Account> lstCards = db.Customer_Account.Where(x => x.Employee_id == id).OrderByDescending(x => x.DateCreated).ToList();
                    if (lstCards.Count > 0)
                        ViewBag.msg = _AppContext.Messages.Success;
                    else
                        ViewBag.msg = _AppContext.Messages.NotExist;
                    Employee objEmployee = db.Employees.SingleOrDefault(x => x.Emp_id == id);
                    if (objEmployee != null)
                    {
                        TempData["custId"] = objEmployee.Emp_Customer_id;
                        TempData["employee"] = objEmployee.Emp_Name;
                    }
                    return View(lstCards);
                }
                ViewBag.msg = _AppContext.Messages.NotExist;
            }
            catch (Exception ex)
            {
                ViewBag.msg = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Customer", "ViewEmpCards_GET", ex.ToString());
            }
            return View();
        }
        #endregion

        #region IsCustomerEmpExists
        /// <summary>
        /// Checking is customer email already exists
        /// </summary>
        /// <param name="Data"></param>
        /// <returns></returns>
        public JsonResult IsCustomerEmpExists(string Data)
        {
            JsonResult objJR = Json(new { Status = "failed" }, JsonRequestBehavior.AllowGet);
            try
            {
                JavaScriptSerializer oSerializer = new JavaScriptSerializer();
                Dictionary<string, object> custDetails = (Dictionary<string, object>)oSerializer.Deserialize(Data, typeof(object));
                string EmpName = Convert.ToString(custDetails["Emp_Name"]);
                long EmpId = Convert.ToInt64(custDetails["Emp_id"]);
                long EmpCustomerId = Convert.ToInt64(custDetails["Emp_Customer_id"]);
                JsonResult objBR = Json(new { Status = "Success", Result = Convert.ToBoolean(db.Employees.Where(x => x.Emp_Name.ToLower() == EmpName.ToLower() && x.Emp_Customer_id == EmpCustomerId).Select(x => x.Emp_Name).ToList().Count) }, JsonRequestBehavior.AllowGet);
                if (EmpId > 0)
                {
                    if (EmpName != db.Employees.Single(x => x.Emp_id == EmpId).Emp_Name) //Name changed then search the duplicate name
                    {
                        return objBR;
                    }
                    else
                    {
                        return Json(new { Status = "Success", Result = false }, JsonRequestBehavior.AllowGet); //Name not changed then ignore validation of duplicate name
                    }
                }
                else
                {
                    return objBR;
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Customer", "IsCustomerExists_JSON", ex.ToString());
            }
            return objJR;
        }
        #endregion
        #region IsEmpEmailExists
        public JsonResult IsEmpEmailExists(string Data)
        {
            JsonResult objJR = Json(new { Status = "failed" }, JsonRequestBehavior.AllowGet);
            try
            {
                JavaScriptSerializer oSerializer = new JavaScriptSerializer();
                Dictionary<string, object> EmpDetails = (Dictionary<string, object>)oSerializer.Deserialize(Data, typeof(object));
                string Emp_Email = Convert.ToString(EmpDetails["Emp_Email"]);
                long EmpId = Convert.ToInt64(EmpDetails["Emp_id"]);
                long EmpCustomerId = Convert.ToInt64(EmpDetails["Emp_Customer_id"]);
                JsonResult objBR = Json(new { Status = "Success", Result = Convert.ToBoolean(db.Employees.Where(x => x.Emp_Email.ToLower() == Emp_Email.ToLower() && x.Emp_Customer_id == EmpCustomerId).Select(x => x.Emp_Name).ToList().Count) }, JsonRequestBehavior.AllowGet);
                if (EmpId > 0)
                {
                    if (Emp_Email != db.Employees.Single(x => x.Emp_id == EmpId).Emp_Email) //Email changed then search the duplicate Email if Employee is being edited
                    {
                        return objBR;
                    }
                    else
                    {
                        return Json(new { Status = "Success", Result = false }, JsonRequestBehavior.AllowGet); //Email not changed then ignore validation of duplicate Email
                    }
                }
                else
                {
                    return objBR;
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Customer", "IsCustomerExists_JSON", ex.ToString());
            }
            return objJR;
        }
        #endregion
        #region IsEmpPhoneExists
        public JsonResult IsEmpPhoneExists(string Data)
        {
            JsonResult objJR = Json(new { Status = "failed" }, JsonRequestBehavior.AllowGet);
            try
            {
                JavaScriptSerializer oSerializer = new JavaScriptSerializer();
                Dictionary<string, object> EmpDetails = (Dictionary<string, object>)oSerializer.Deserialize(Data, typeof(object));
                string Emp_Phone = Convert.ToString(EmpDetails["Emp_Phone"]);
                long EmpId = Convert.ToInt64(EmpDetails["Emp_id"]);
                long EmpCustomerId = Convert.ToInt64(EmpDetails["Emp_Customer_id"]);
                JsonResult objBR = Json(new { Status = "Success", Result = Convert.ToBoolean(db.Employees.Where(x => x.Emp_Phone == Emp_Phone && x.Emp_Customer_id == EmpCustomerId).Select(x => x.Emp_Name).ToList().Count) }, JsonRequestBehavior.AllowGet);
                if (EmpId > 0)
                {
                    if (Emp_Phone != db.Employees.Single(x => x.Emp_id == EmpId).Emp_Phone) //Emp_Phone changed then search the duplicate Emp_Phone if Employee is being edited
                    {
                        return objBR;
                    }
                    else
                    {
                        return Json(new { Status = "Success", Result = false }, JsonRequestBehavior.AllowGet); //Emp_Phone not changed then ignore validation of duplicate Emp_Phone
                    }
                }
                else
                {
                    return objBR;
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Customer", "IsCustomerExists_JSON", ex.ToString());
            }
            return objJR;
        }
        #endregion

        #region CustomerAccountDetails
        public ActionResult CustomerAccountDetails()
        {
            try
            {
                    ViewBag.id = UserContext.Identity.userId;
                    ViewBag.custname = UserContext.Identity.userFirstName;
                    List<Customer_Account> lst = db.Customer_Account.Where(x => x.Customer_id == UserContext.Identity.userId).OrderByDescending(x => x.DateCreated).ToList();
                    return View(lst);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Customer", "CustomerAccountDetails_GET", ex.ToString());
            }
            return View();
        }
        #endregion
        #region Set Customer Account Limit
        public ActionResult SetLimitCustomerAccount(long? id)
        {
            try
            {
                ViewBag.accno = id;
                PostpaidAccountCreditLimit objAccLimit = new PostpaidAccountCreditLimit();
                objAccLimit.AccountNumber = id;
                Customer_Account objAcc = db.Customer_Account.SingleOrDefault(x => x.AccountNumber == id);
                if (objAcc != null)
                {
                    ViewBag.custid = objAcc.Customer_id;
                    PostpaidCustCreditLimits objPostPaid = AdminBAL.GetPostpaidCustCrLimitByCustId(objAcc.Customer_id);
                    if (objPostPaid != null)
                        objAccLimit.Credit_id = objPostPaid.Credit_id;
                }
                List<PostpaidAccountCreditLimit> lst = db.PostpaidAccountCreditLimit.Where(x => x.AccountNumber == id).OrderByDescending(x => x.DateCreated).ToList();
                var tpl = new Tuple<PostpaidAccountCreditLimit, List<PostpaidAccountCreditLimit>>(objAccLimit, lst) { };
                return View(tpl);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Customer", "SetLimitCustomerAccount_GET", ex.ToString());
            }
            return View();
        }
        [HttpPost]
        public ActionResult SetLimitCustomerAccount(PostpaidAccountCreditLimit item1)
        {
            try
            {
                ViewBag.accno = item1.AccountNumber;
                

                item1.DateCreated = DateTime.Now;
                item1.IsActive = true;
                PostpaidAccountCreditLimit objPostPaid = db.PostpaidAccountCreditLimit.FirstOrDefault(x => x.AccountNumber == item1.AccountNumber && x.IsActive == true);
                if (objPostPaid != null)
                {
                    objPostPaid.IsActive = false;
                    AdminBAL.AddUpdateAccountPostpaidLimit(objPostPaid);
                }
                PostpaidCustCreditLimits objPostpaidCreditLimit = db.PostpaidCustCreditLimits.SingleOrDefault(x => x.Credit_id == item1.Credit_id);
                if (objPostpaidCreditLimit != null)
                {
                    ViewBag.custid = objPostpaidCreditLimit.Cust_id;
                    decimal? credit = 0;
                    List<PostpaidAccountCreditLimit> lstCreditLimit = db.PostpaidAccountCreditLimit.Where(x => x.Credit_id == item1.Credit_id && x.IsActive == true).ToList();
                    foreach (var item in lstCreditLimit)
                    {
                        credit += item.Account_CreditLimit;

                    }
                    credit += item1.Account_CreditLimit;
                    if (credit <= objPostpaidCreditLimit.CreditLimit)
                    {
                        AdminBAL.AddUpdateAccountPostpaidLimit(item1);
                        Customer_Account objCustomerAccount = db.Customer_Account.SingleOrDefault(x => x.AccountNumber == item1.AccountNumber);
                        if (objCustomerAccount != null)
                        {

                            objCustomerAccount.Balance = item1.Account_CreditLimit;
                            AdminBAL.AddUpdateCustomerAccount(objCustomerAccount);
                            ViewBag.msg = _AppContext.Messages.Success;
                        }
                    }
                    else
                    {
                        ViewBag.msg = _AppContext.Messages.limitexceed;
                        objPostPaid.IsActive = true;
                        AdminBAL.AddUpdateAccountPostpaidLimit(objPostPaid);
                    }
                }
                else
                {
                    ViewBag.msg = _AppContext.Messages.NotExist;
                }
                List<PostpaidAccountCreditLimit> lst = db.PostpaidAccountCreditLimit.Where(x => x.AccountNumber == item1.AccountNumber).OrderByDescending(x => x.DateCreated).ToList();
                var tpl = new Tuple<PostpaidAccountCreditLimit, List<PostpaidAccountCreditLimit>>(item1, lst) { };
                return View(tpl);
            }
            catch (Exception ex)
            {
                ViewBag.msg = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Customer", "SetLimitCustomerAccount_POST", ex.ToString());
            }
            return View();
        }
        #endregion
        #region Setup Account Usage Limit
        public ActionResult SetupAccountUsageLimit(long? id)
        {
            try
            {
                if (id.HasValue)
                {
                    ViewBag.accno = id;
                    ViewBag.custid = UserContext.Identity.userId;
                    List<Product> lst = AdminBAL.GetAllProducts().OrderBy(x => x.Product_Name).ToList();
                    lst.Insert(0, new Product { Product_id = -1, Product_Name = "Overall" });
                    ViewBag.products = new SelectList(lst, "Product_id", "Product_Name", -1);
                    ViewBag.time = new SelectList(db.TimeDurations.Where(x => x.Type == "LongDuration").ToList(), "TimeDuration_id", "Value");
                    ViewBag.msg = _AppContext.Messages.ChangeStatus;
                    return View();
                }
            }
            catch (Exception ex)
            {
                ViewBag.msg = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Customer", "SetupAccountUsageLimit_GET", ex.ToString());
            }
            ViewBag.msg = _AppContext.Messages.NotExist;
            return View();
        }
        [HttpPost]
        public ActionResult SetupAccountUsageLimit(Customer_AccountUsageLimit objUsage, long? id)
        {
            try
            {
                if (id.HasValue)
                {
                    ViewBag.accno = id;
                    ViewBag.custid = UserContext.Identity.userId;
                    Customer_AccountUsageLimit objUsageLimit = db.Customer_AccountUsageLimit.SingleOrDefault(x => x.UsageLimit_AccountNumber == id && x.UsageLimit_Product_id == objUsage.UsageLimit_Product_id);
                    if (objUsageLimit == null)
                    {
                        objUsageLimit = new Customer_AccountUsageLimit();
                    }
                    objUsageLimit.UsageLimit_AccountNumber = id;
                    objUsageLimit.UsageLimit_Product_id = objUsage.UsageLimit_Product_id;
                    objUsageLimit.UsageLimit_Type = objUsage.UsageLimit_Type;
                    objUsageLimit.UsageLimit_Value = objUsage.UsageLimit_Value;
                    objUsageLimit.UsageLimit_DateCreated = DateTime.Now;
                    objUsageLimit.UsageLimit_IsActive = true;
                    objUsageLimit.UsageLimit_IsDeleted = false;
                    AdminBAL.AddUpdateAccUsageLimit(objUsageLimit);
                    List<Product> lst = AdminBAL.GetAllProducts().OrderBy(x => x.Product_Name).ToList();
                    lst.Insert(0, new Product { Product_id = -1, Product_Name = "Overall" });
                    ViewBag.products = new SelectList(lst, "Product_id", "Product_Name", -1);
                    ViewBag.time = new SelectList(db.TimeDurations.Where(x => x.Type == "LongDuration").ToList(), "TimeDuration_id", "Value");
                    ViewBag.msg = _AppContext.Messages.Success;
                    return View();
                }
            }
            catch (Exception ex)
            {
                ViewBag.msg = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Customer", "SetUsageLimit_POST", ex.ToString());
            }
            ViewBag.msg = _AppContext.Messages.NotExist;
            return View();
        }
        #endregion
        #region ViewAccountUsageLimits
        public ActionResult ViewAccountUsageLimits(long? id, string status)
        {
            try
            {
                if (id.HasValue && !string.IsNullOrEmpty(status))
                {
                    Customer_AccountUsageLimit objCUL = db.Customer_AccountUsageLimit.SingleOrDefault(x => x.UsageLimit_id == id);
                    if (objCUL != null)
                    {
                        if (status.Equals("active"))
                        {
                            if (objCUL.UsageLimit_IsActive == true)
                                objCUL.UsageLimit_IsActive = false;
                            else
                                objCUL.UsageLimit_IsActive = true;
                        }
                        else if (status.Equals("delete"))
                        {
                            if (objCUL.UsageLimit_IsDeleted == true)
                                objCUL.UsageLimit_IsDeleted = false;
                            else
                                objCUL.UsageLimit_IsDeleted = true;
                        }
                        else if (status.Equals("overall"))
                        {
                            if (objCUL.UsageLimit_IsOverall == true)
                                objCUL.UsageLimit_IsOverall = false;
                            else
                                objCUL.UsageLimit_IsOverall = true;
                        }
                        objCUL.UsageLimit_DateCreated = DateTime.Now;
                        AdminBAL.AddUpdateAccUsageLimit(objCUL);
                        RouteData.Values.Remove("id");
                        return RedirectToAction("ViewAccountUsageLimits", "Customer", new { id = objCUL.UsageLimit_AccountNumber });
                    }
                }
                else if (id.HasValue)
                {
                    List<VwAccUsageLimit_Products> lstCardUsageLimit = db.VwAccUsageLimit_Products.Where(x => x.UsageLimit_AccountNumber == id && x.UsageLimit_Product_id != -1).ToList();
                    VwAccUsageLimit_Products objOverAllUsageLimit = db.VwAccUsageLimit_Products.SingleOrDefault(x => x.UsageLimit_AccountNumber == id && x.UsageLimit_Product_id == -1);
                    ViewBag.accno = id;
                    Customer_Account objCustAcc = db.Customer_Account.First(x => x.AccountNumber == id);
                    ViewBag.custid = objCustAcc.Customer_id;
                    if (lstCardUsageLimit.Count > 0 || objOverAllUsageLimit != null)
                    {
                        ViewBag.msg = _AppContext.Messages.ChangeStatus;
                        var tplCardUsage = new Tuple<List<VwAccUsageLimit_Products>, VwAccUsageLimit_Products>(lstCardUsageLimit, objOverAllUsageLimit) { };
                        return View(tplCardUsage);
                    }
                    else
                    {
                        ViewBag.msg = _AppContext.Messages.NotExist;
                    }
                }
            }
            catch (Exception ex)
            {
                ViewBag.msg = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Customer", "CardUsageLimitList_GET", ex.ToString());
            }
            ViewBag.msg = _AppContext.Messages.NotExist;
            return View();
        }
        #endregion
        #region EditAccUsageLimit
        /// <summary>
        /// 
        /// </summary>
        /// <param name="id">Card_UsageLimit_id</param>
        /// <returns></returns>
        public ActionResult EditAccUsageLimit(long? id, string status)
        {
            try
            {
                if (id.HasValue)
                {
                    Customer_AccountUsageLimit objUsageLimit = db.Customer_AccountUsageLimit.SingleOrDefault(x => x.UsageLimit_id == id);
                    List<Product> lst = AdminBAL.GetAllProducts().OrderBy(x => x.Product_Name).ToList();
                    if (!string.IsNullOrEmpty(status) && status.Equals("per"))
                    {
                        ViewBag.products = new SelectList(lst, "Product_id", "Product_Name");
                    }
                    else
                    {
                        lst.Insert(0, new Product { Product_id = -1, Product_Name = "Overall" });
                        ViewBag.products = new SelectList(lst, "Product_id", "Product_Name", -1);
                    }
                    ViewBag.custid = db.Customer_Account.FirstOrDefault(x => x.AccountNumber == objUsageLimit.UsageLimit_AccountNumber).Customer_id;
                    ViewBag.time = new SelectList(db.TimeDurations.Where(x => x.Type == "LongDuration").ToList(), "TimeDuration_id", "Value");
                    ViewBag.msg = _AppContext.Messages.ChangeStatus;
                    return View(objUsageLimit);
                }

            }
            catch (Exception ex)
            {
                ViewBag.msg = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Customer", "EditAccUsageLimit_GET", ex.ToString());
            }
            ViewBag.msg = _AppContext.Messages.NotExist;
            return View();
        }
        [HttpPost]
        public ActionResult EditAccUsageLimit(Customer_AccountUsageLimit objUsage)
        {
            try
            {
                objUsage.UsageLimit_DateCreated = DateTime.Now;
                AdminBAL.AddUpdateAccUsageLimit(objUsage);
                List<Product> lst = AdminBAL.GetAllProducts().OrderBy(x => x.Product_Name).ToList();
                lst.Insert(0, new Product { Product_id = -1, Product_Name = "Overall" });
                ViewBag.products = new SelectList(lst, "Product_id", "Product_Name", -1);
                ViewBag.time = new SelectList(db.TimeDurations.Where(x => x.Type == "LongDuration").ToList(), "TimeDuration_id", "Value");
                ViewBag.msg = _AppContext.Messages.Success;
                return RedirectToAction("ViewAccountUsageLimits", "Customer", new { id = objUsage.UsageLimit_AccountNumber });
            }
            catch (Exception ex)
            {
                ViewBag.msg = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Customer", "SetUsageLimit_POST", ex.ToString());
            }
            ViewBag.msg = _AppContext.Messages.NotExist;
            return View();
        }
        #endregion
        #region ViewAccTopup
        /// <summary>
        /// 
        /// </summary>
        /// <param name="id">Account Number</param>
        /// <returns></returns>
        public ActionResult ViewAccTopup(long? id, string status)
        {
            try
            {
                    List<Customer_AccountTopup> lstCardtopup = db.Customer_AccountTopup.Where(x => x.AccountNumber == id).OrderByDescending(x => x.UpdateDate).ToList();
                    ViewBag.custid = db.Customer_Account.SingleOrDefault(x => x.AccountNumber == id).Customer_id;
                    if (lstCardtopup.Count > 0)
                    {
                        ViewBag.msg = _AppContext.Messages.Success;
                        return View(lstCardtopup);
                    }
                    else
                    {
                        ViewBag.msg = _AppContext.Messages.NotExist;
                        return View();
                    }
            }
            catch (Exception ex)
            {
                ViewBag.msg = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Customer", "ViewTopup_GET", ex.ToString());
            }
            ViewBag.msg = _AppContext.Messages.NotExist;
            return View();
        }
        #endregion
        #region TransferAccount
        public ActionResult TransferAccount(long? id, long? accno)
        {
            try
            {
                PostpaidAccountCreditLimit objPostpaidFrom = db.PostpaidAccountCreditLimit.FirstOrDefault(x => x.AccountNumber == accno && x.IsActive == true);
                Customer_Account objAccount = db.Customer_Account.SingleOrDefault(x => x.AccountNumber == accno);
                List<Customer_Account> lstCustomerAccounts = db.Customer_Account.Where(x => x.Customer_id == id && x.AccountNumber != accno && x.IsDeleted == false && x.CreditType==objAccount.CreditType).ToList();
                var tpl = new Tuple<Customer_Account, List<Customer_Account>>(objAccount, lstCustomerAccounts) { };
                ViewBag.accno = accno;
                if (objPostpaidFrom != null)
                    ViewBag.Creditlimit = string.Format("{0:n}", objPostpaidFrom.Account_CreditLimit);
                else
                    ViewBag.Creditlimit = null;
                return View(tpl);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Customer", "TransferAccount_GET", ex.ToString());
            }
            return View();
        }
        [HttpPost]
        public ActionResult TransferAccount(Customer_Account item1, FormCollection frm)
        {
            try
            {
                long accno = Convert.ToInt64(frm["hdnAccno"].ToString()); //from Account Number
                Customer_Account fromAcc = db.Customer_Account.SingleOrDefault(x => x.AccountNumber == accno);
                Customer_Account toAcc = db.Customer_Account.SingleOrDefault(x => x.AccountNumber == item1.AccountNumber);
                if (fromAcc.CreditType != toAcc.CreditType)
                {
                    TempData["msg"] = _AppContext.Messages.Blocked;
                    return RedirectToAction("TransferAccount", "Customer", new { @id = fromAcc.Customer_id, @accno = accno });
                }
                else
                {
                    if (item1.CreditType == 1) //if fromAccount is post paid then make toAccount postpaid
                    {
                        //if (toAcc.IsCollection == false)
                        //    toAcc.CreditType = 1;
                        PostpaidAccountCreditLimit objPostpaidFrom = db.PostpaidAccountCreditLimit.FirstOrDefault(x => x.AccountNumber == accno && x.IsActive == true);
                        PostpaidAccountCreditLimit objTo = new PostpaidAccountCreditLimit();
                        objTo.Credit_id = objPostpaidFrom.Credit_id;
                        objTo.AccountNumber = item1.AccountNumber;
                        if (objPostpaidFrom.Account_CreditLimit >= item1.Balance)
                        {
                            objTo.Account_CreditLimit = item1.Balance;
                            objPostpaidFrom.Account_CreditLimit -= item1.Balance;
                        }
                        else
                        {
                            TempData["msg"] = _AppContext.Messages.limitexceed;
                            return RedirectToAction("TransferAccount", "Customer", new { @id = fromAcc.Customer_id, @accno = accno });
                        }
                        objTo.IsActive = false;
                        objTo.DateCreated = DateTime.Now;
                        AdminBAL.AddUpdateAccountPostpaidLimit(objTo);

                        //objPostpaidFrom.Account_CreditLimit = 0;
                        objPostpaidFrom.DateCreated = DateTime.Now;
                        objPostpaidFrom.IsActive = true;
                        AdminBAL.AddUpdateAccountPostpaidLimit(objPostpaidFrom);
                    }
                    else
                    {
                        Finance_Transaction objFin = new Finance_Transaction();
                        AccoutingDocTypes objDocType = db.AccoutingDocTypes.FirstOrDefault(x => x.Doc_Type_Name.Equals("Misc voucher"));
                        if (objDocType != null)
                            objFin.Doc_Type_id = objDocType.Doc_Type_id;
                        objFin.Finance_Trans_description = "Transfer by Customer";
                        objFin.Transaction_Code = Convert.ToString(UserContext.Identity.userId) + DateTime.Now.ToString();
                        objFin.IsPosted = true;
                        objFin.Transaction_DateCreated = DateTime.Now;
                        if (AdminBAL.AddFinanceTransaction(objFin) == 1)
                        {
                            int? currency_id = db.GeneralSettings.SingleOrDefault().BaseCurrency;
                            string currency = db.Currencies.SingleOrDefault(x => x.Currency_id == currency_id).CurrencySymbol;
                            GLTransactions objGL = new GLTransactions();
                            objGL.Finance_Transaction_id = objFin.Finance_Transaction_id;
                            objGL.Amount = Convert.ToInt64(item1.Balance);
                            objGL.Currency = currency;
                            objGL.Memo = "Transfer by Customer";
                            objGL.GlTrans_DateCreated = DateTime.Now;
                            string AccountNum = fromAcc.AccountNumber.ToString();
                            ChartofAccounts objChartsofAccount = db.ChartofAccounts.SingleOrDefault(x => x.Account_Name == AccountNum);
                            if (objChartsofAccount != null)
                                objGL.ChartofAccount_id = objChartsofAccount.ChartofAccount_id;
                            objGL.GLTrans_Actual_DateCreated = DateTime.Now;
                            Periods objPeriods = db.Periods.FirstOrDefault(x => x.LastDate_In_Period.Value.Year == DateTime.Now.Year && x.LastDate_In_Period.Value.Month == DateTime.Now.Month);
                            if (objPeriods != null)
                                objGL.Period_id = objPeriods.Period_id;
                            if (AdminBAL.AddGLTransactions(objGL) == 1)
                            {
                                AccountNum = toAcc.AccountNumber.ToString();
                                objChartsofAccount = db.ChartofAccounts.SingleOrDefault(x => x.Account_Name == AccountNum);
                                if (objChartsofAccount != null)
                                    objGL.ChartofAccount_id = objChartsofAccount.ChartofAccount_id;
                                objGL.Amount = -Convert.ToInt64(item1.Balance);
                                AdminBAL.AddGLTransactions(objGL);
                            }
                        }
                    }
                    if (toAcc.Balance == null)
                        toAcc.Balance = 0;
                    if (fromAcc.Balance >= item1.Balance)
                    {
                        toAcc.Balance += item1.Balance;
                        fromAcc.Balance -= item1.Balance;

                        Customer_AccountTopup oToAcc = new Customer_AccountTopup();
                        oToAcc.Amount = item1.Balance;
                        oToAcc.AccountNumber = toAcc.AccountNumber;
                        oToAcc.Modeofpayment = "Transfer";
                        oToAcc.Reference = "Transfered from " + fromAcc.AccountNumber;
                        oToAcc.ModifiedBy = UserContext.Identity.userId;
                        oToAcc.Topupby = UserContext.Identity.userId;
                        oToAcc.Topupdate = DateTime.Now;
                        oToAcc.UpdateDate = DateTime.Now;
                        oToAcc.IsDeleted = false;
                        AdminBAL.AddUpdateCustomerAccTopup(oToAcc);

                        Customer_AccountTopup oFromAcc = new Customer_AccountTopup();
                        oFromAcc.Amount = 0 - item1.Balance;
                        oFromAcc.AccountNumber = fromAcc.AccountNumber;
                        oFromAcc.Modeofpayment = "Transfer";
                        oFromAcc.Reference = "Transfered to " + toAcc.AccountNumber;
                        oFromAcc.ModifiedBy = UserContext.Identity.userId;
                        oFromAcc.Topupby = UserContext.Identity.userId;
                        oFromAcc.Topupdate = DateTime.Now;
                        oFromAcc.UpdateDate = DateTime.Now;
                        oFromAcc.IsDeleted = false;
                        AdminBAL.AddUpdateCustomerAccTopup(oFromAcc);

                        AdminBAL.AddUpdateCustomerAccount(toAcc);
                        AdminBAL.AddUpdateCustomerAccount(fromAcc);
                    }
                    else
                    {
                        TempData["msg"] = _AppContext.Messages.limitexceed;
                        return RedirectToAction("TransferAccount", "Customer", new { @id = fromAcc.Customer_id, @accno = accno });
                    }
                }
                return RedirectToAction("CustomerAccountDetails", "Customer", new { id = fromAcc.Customer_id });
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Customer", "TransferAccount_POST", ex.ToString());
            }
            return View();
        }
        #endregion
        //#region Credit Limit for Postpaid Customers
        ///// <summary>
        ///// 
        ///// </summary>
        ///// <param name="id">Customer Id</param>
        ///// <returns></returns>
        //public ActionResult CreditLimitPostpaidCust()
        //{
        //    try
        //    {
        //            PostpaidCustCreditLimits objCard = new PostpaidCustCreditLimits();
        //            objCard.Cust_id = UserContext.Identity.userId;
        //            List<PostpaidCustCreditLimits> lstCredit = db.PostpaidCustCreditLimits.Where(x => x.Cust_id == UserContext.Identity.userId).OrderByDescending(x => x.DateCreated).ToList();
        //            ViewBag.creditid = lstCredit.FirstOrDefault().Credit_id;
        //            var tpl = new Tuple<PostpaidCustCreditLimits, List<PostpaidCustCreditLimits>>(objCard, lstCredit) { };
        //            return View(tpl);
        //    }
        //    catch (Exception ex)
        //    {
        //        _AppContext.WriteLogFile("Customer", "CreditLimitPostpaidCust_GET", ex.ToString());
        //    }
        //    return View();
        //}
        //[HttpPost]
        //public ActionResult CreditLimitPostpaidCust(PostpaidCustCreditLimits item1)
        //{
        //    try
        //    {
        //        PostpaidCustCreditLimits objLimit = new PostpaidCustCreditLimits();
        //        objLimit.Cust_id = item1.Cust_id;
        //        objLimit.CreditLimit = item1.CreditLimit;
        //        objLimit.CreditLimit_Expiration = item1.CreditLimit_Expiration;
        //        objLimit.DateCreated = DateTime.Now;
        //        if (AdminBAL.AddCreditLimitPostpaidCust(objLimit) == 1)
        //        {
        //            List<Customer_Account> lstCustomerAccount = db.Customer_Account.Where(x => x.CreditType == 1 && x.Customer_id == item1.Cust_id).ToList();
        //            foreach (Customer_Account item in lstCustomerAccount)
        //            {
        //                item.Balance = 0;
        //                AdminBAL.AddUpdateCustomerAccount(item);
        //            }
        //            ModelState.Clear();
        //            ViewBag.msg = _AppContext.Messages.Success;
        //        }
        //        List<PostpaidCustCreditLimits> lstCredit = db.PostpaidCustCreditLimits.Where(x => x.Cust_id == item1.Cust_id).OrderByDescending(x => x.DateCreated).ToList();
        //        ViewBag.creditid = lstCredit.FirstOrDefault().Credit_id;
        //        item1 = new PostpaidCustCreditLimits();
        //        item1.Cust_id = objLimit.Cust_id;
        //        var tpl = new Tuple<PostpaidCustCreditLimits, List<PostpaidCustCreditLimits>>(item1, lstCredit) { };
        //        return View(tpl);
        //    }
        //    catch (Exception ex)
        //    {
        //        _AppContext.WriteLogFile("Customer", "CreditLimitPostpaidCust_GET", ex.ToString());
        //    }
        //    return View();
        //}
        //#endregion
    }
}
