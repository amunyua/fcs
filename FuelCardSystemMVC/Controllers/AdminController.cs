using FuelCardSystemMVC.Library;
using FuelCardSystemMVC.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using FuelCardSystemEntities.Models;
using FuelCardSystemMVC.Library.CustomAuth;
using FuelCardSystemBAL;
using System.Web.Script.Serialization;
using System.IO;
using CsvHelper;
using System.Data.Entity.SqlServer;

namespace FuelCardSystemMVC.Controllers
{
    //[Authorize(Roles = "SysAdmin")]
    [MyAuthorize]
    public class AdminController : Controller
    {
        public FuelCardDBEntities db = new FuelCardDBEntities();
        #region Authorization
        protected override void OnAuthorization(AuthorizationContext filterContext) //What is this for?? Checking if user is authorized
        {
            string requestUrl = Convert.ToString(Request.Url.LocalPath).ToLower();
            if (requestUrl != "/admin/login" && !UserContext.Identity.IsAuthenticated)
            {
                filterContext.HttpContext.Response.Redirect("~/Admin/Login");
            }
            base.OnAuthorization(filterContext);
        }
        #endregion
        #region Login
        /// <summary>
        /// Here [AllowAnonymous] is used so that Admin/Login can be accessed without Authorization
        /// </summary>
        /// <param name="returnUrl"></param>
        /// <returns></returns>
        [AllowAnonymous] 
        public ActionResult Login(string returnUrl) //The returnUrl equals the page that redirected to the login page
        {
            ViewBag.ReturnURL = returnUrl; //returnUrl is passed to the viewBag and passed to the view at HtmlBeginForm where the view stores it
            return View();
        }
        [HttpPost]
        [AllowAnonymous] 
        [ValidateAntiForgeryToken] //What for??
        public ActionResult Login(LoginModel model, string returnUrl) //returnUrl value is the value that was stored in Login view at HtmlBeginForm
        {
            try
            {
                Console.WriteLine("In try");
                if (ModelState.IsValid)
                {
                    Console.WriteLine("In try-if");
                    if (TempData["count"] == null) //Where is TempData coming from??
                        TempData["count"] = 0;
                    if (TempData["time"] == null)
                        TempData["time"] = DateTime.Now.AddMinutes(5);
                    if ((int)TempData["count"] < 3)
                    {
                        if (Membership.ValidateUser(model.UserName, model.Password))
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
                        _AppContext.WriteSecurityLogFile(model.UserName, TempData["count"].ToString(), _AppContext.GetIPAddress(), "Admin Portal");
                        return RedirectToAction("Forgotpassword", "Home");
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
                Console.WriteLine("In catch");
                ViewBag.Response = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Admin", "Login_POST", ex.ToString());
            }
            //If we got this far something is wrong, redisplay the login form
            ViewBag.msg = _AppContext.Messages.InvalidPassword2;
            return View(model);
        }
        [AllowAnonymous]
        public ActionResult LogOff()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Login", "Admin");
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
                _AppContext.WriteLogFile("Admin", "ChangePassword_GET", ex.ToString());
            }
            return View();
        }
        [HttpPost]
        public ActionResult ChangePassword(LocalPasswordModel objUser)
        {
            try
            {
                string passwd = EncryptDecrypt.Encrypt(objUser.OldPassword, "@#Df4190^");
                Staff objUsr = new Staff();
                objUsr = db.Staffs.SingleOrDefault(x => x.Staff_Password == passwd && x.Staff_Email == UserContext.Identity.email && x.IsActive == true);
                if (objUsr != null)
                {
                    objUsr.Staff_Password = EncryptDecrypt.Encrypt(objUser.NewPassword, "@#Df4190^");
                    objUsr.ModifiedBy = UserContext.Identity.userId;
                    if (AdminBAL.ChangePassword(objUsr) == 1)
                    {
                        ViewBag.Msg = _AppContext.Messages.PasswordChanged;
                        return RedirectToAction("LogOff", "Admin");
                    }
                }
                else
                {
                    ViewBag.Msg = _AppContext.Messages.InvalidPassword;
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "ChangePassword_POST", ex.ToString());
            }
            return View();
        }
        #endregion

        #region Dashboard
        public ActionResult Index()
        {
            DateTime dt = DateTime.Now.AddMonths(-1);
            ViewBag.Customes = db.Customers.Where(x => x.IsActive == true && x.IsDeleted == false && x.DateCreated.Value > dt).Count();
            ViewBag.Staff = db.Staffs.Where(x => x.IsActive == true && x.IsDeleted == false && x.DateCreated.Value > dt).Count();
            ViewBag.Products = db.Products.Where(x => x.Product_IsActive == true && x.Product_IsDeleted == false && x.Product_DateCreated > dt).Count();
            ViewBag.Gadgets = db.Gadgets.Where(x => x.Gadget_IsActive == true && x.Gadget_IsDeleted == false && x.Gadget_DateCreated > dt).Count();
            return View();
        }
        #endregion
        #region Topups Graph
        public JsonResult TopupGraphData()
        {
            JsonResult objJR = Json(new { Status = "failed" }, JsonRequestBehavior.AllowGet);
            try
            {
                var query =
           (from Customer_AccountTopup in db.Customer_AccountTopup
            where
              SqlFunctions.DateDiff("mm", Customer_AccountTopup.Topupdate, SqlFunctions.GetDate()) < 6
            group Customer_AccountTopup by new
            {
                Column1 = (int?)SqlFunctions.DatePart("year", Customer_AccountTopup.Topupdate),
                Column2 = (int?)SqlFunctions.DatePart("month", Customer_AccountTopup.Topupdate)
            } into g
            select new
            {
                Amount = (decimal?)g.Sum(p => p.Amount),
                TopupMonth = g.Key.Column2//,
                //TopupYear = g.Key.Column1
            }).Take(6);
                JsonResult objBR = Json(new { query }, JsonRequestBehavior.AllowGet);
                return objBR;
                //     var query =
                //(from CardTopups in db.CardTopups
                // where
                //   SqlFunctions.DateDiff("mm", CardTopups.Card_topupdate, SqlFunctions.GetDate()) < 6
                // group CardTopups by new
                // {
                //     Column1 = (int?)SqlFunctions.DatePart("year", CardTopups.Card_topupdate),
                //     Column2 = (int?)SqlFunctions.DatePart("month", CardTopups.Card_topupdate)
                // } into g
                // select new
                // {
                //     Amount = (decimal?)g.Sum(p => p.Card_Amount),
                //     TopupMonth = g.Key.Column2//,
                //     //TopupYear = g.Key.Column1
                // }).Take(6);
                //     JsonResult objBR = Json(new { query }, JsonRequestBehavior.AllowGet);
                //     return objBR;
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "TopupGraphData_JSON", ex.ToString());
            }
            return objJR;
        }
        #endregion

        #region General Settings
        public ActionResult GenSettings()
        {
            try
            {
                GeneralSetting objGenSettings = db.GeneralSettings.FirstOrDefault();
                if (objGenSettings == null)
                {
                    objGenSettings = new GeneralSetting();
                }
                ViewBag.TimeDurations = new SelectList(AdminBAL.GetAllTimePeriods(), "Value", "Value");
                ViewBag.Currency = new SelectList(AdminBAL.GetAllCurrency(), "Currency_id", "CurrencySymbol");
                return View(objGenSettings);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "GenSettings_GET", ex.ToString());
            }
            return View();
        }
        [HttpPost]
        public ActionResult GenSettings(GeneralSetting objGeneralSettings)
        {
            try
            {
                GeneralSetting objGenSettings = db.GeneralSettings.FirstOrDefault();
                if (objGenSettings != null)
                {
                    objGeneralSettings.GenSet_id = objGenSettings.GenSet_id;
                    objGeneralSettings.IndividualMultipleAccounts = objGenSettings.IndividualMultipleAccounts;
                    objGeneralSettings.ModifiedBy = UserContext.Identity.userId;
                }
                AdminBAL.AddUpdateGenSettings(objGeneralSettings);
                TempData["msg"] = _AppContext.Messages.Update;
                ViewBag.TimeDurations = new SelectList(AdminBAL.GetAllTimePeriods(), "Value", "Value");
                ViewBag.Currency = new SelectList(AdminBAL.GetAllCurrency(), "Currency_id", "CurrencySymbol");
            }
            catch (Exception ex)
            {
                TempData["msg"] = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Admin", "GenSettings_POST", ex.ToString());
            }
            return View();
        }
        #endregion
        #region Print Settings
        public ActionResult PrintSettings()
        {
            try
            {
                List<ReceiptSettings> lstReceiptSettings = db.ReceiptSettings.ToList();
                return View(lstReceiptSettings);
            }
            catch (Exception)
            {

                throw;
            }
            return View();
        }
        #endregion
        #region IsPrintable
        public JsonResult IsPrintable(string Data)
        {
            JsonResult objJR = Json(new { Status = "failed" }, JsonRequestBehavior.AllowGet);
            try
            {
                JavaScriptSerializer oSerializer = new JavaScriptSerializer();
                Dictionary<string, object> Printable = (Dictionary<string, object>)oSerializer.Deserialize(Data, typeof(object));
                long id = Convert.ToInt64(Printable["id"]);
                //JsonResult objBR = Json(new { Status = "Success", Result = Convert.ToBoolean(db.AccountType.Where(x => x.AccType.Trim().ToLower() == AccType.Trim().ToLower()).ToList().Count) }, JsonRequestBehavior.AllowGet);
                if (id > 0)
                {
                    if (AdminBAL.UpdatePrintSettings(id, UserContext.Identity.userId) == 1)
                    {
                        return Json(new { Status = "Success", Result = false }, JsonRequestBehavior.AllowGet);
                    }
                    else
                    {
                        return objJR;
                    }
                }
                else
                {
                    return objJR;
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "IsPrintable_JSON", ex.ToString());
            }
            return objJR;
        }

        #endregion

        #region Company
        public ActionResult CompanyDetails()
        {
            try
            {
                Company objCom = db.Companies.FirstOrDefault();
                if (objCom == null)
                    objCom = new Company();
                ViewBag.Countries = new SelectList(AdminBAL.GetAllCountries(), "CountryName", "CountryName");
                ViewBag.tables = db.CustomTableFields.Where(x => x.TableName == "Company" && x.IsActive == true).ToList();
                return View(objCom);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "CompanyDetails_GET", ex.ToString());
            }
            return View();
        }
        [HttpPost]
        public ActionResult CompanyDetails(Company objCom)
        {
            try
            {
                Company objCompany = db.Companies.FirstOrDefault();
                if (objCompany != null)
                    objCom.Company_Id = objCompany.Company_Id;
                objCom.Company_DateCreated = DateTime.Now;
                objCom.ModifiedBy = UserContext.Identity.userId;
                if (AdminBAL.AddUpdateCompany(objCom) == 1)
                    ViewBag.msg = _AppContext.Messages.Success;
                else
                    ViewBag.msg = _AppContext.Messages.Error;
                ViewBag.Countries = new SelectList(AdminBAL.GetAllCountries(), "CountryName", "CountryName");
                ViewBag.tables = db.CustomTableFields.Where(x => x.TableName == "Company" && x.IsActive == true).ToList();
            }
            catch (Exception ex)
            {
                ViewBag.msg = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Admin", "CompanyDetails_GET", ex.ToString());
            }
            return View();
        }
        #endregion

        #region Currency Conversion Rates
        public ActionResult CurrencyConversionRates(long? id)
        {
            try
            {
                Currency objCurrency = new Currency();
                if (id.HasValue)
                {
                    objCurrency = db.Currencies.SingleOrDefault(x => x.Currency_id == id);
                }
                ViewBag.Currency = new SelectList(AdminBAL.GetAllCurrency(), "Currency_id", "CurrencySymbol");
                List<Currency> lstCurrency = db.Currencies.OrderByDescending(x => x.DateCreated).ToList();

                var tplCurrency = new Tuple<Currency, List<Currency>>(objCurrency, lstCurrency) { };
                return View(tplCurrency);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "CurrencyConversionRates_GET", ex.ToString());
            }
            return View();
        }
        [HttpPost]
        public ActionResult CurrencyConversionRates(Currency item1)
        {
            try
            {
                ViewBag.Currency = new SelectList(AdminBAL.GetAllCurrency(), "Currency_id", "CurrencySymbol");
                Currency objCurrency = db.Currencies.SingleOrDefault(x => x.Currency_id == item1.Currency_id);
                objCurrency.RatioToBase = item1.RatioToBase;
                objCurrency.ModifiedBy = UserContext.Identity.userId;
                if (AdminBAL.AddUpdateCurrencyConversionRates(objCurrency) == 1)
                {
                    TempData["Msg"] = "Successfully Saved";
                }
                List<Currency> lstCurrency = db.Currencies.OrderByDescending(x => x.DateCreated).ToList();
                var tplCurrency = new Tuple<Currency, List<Currency>>(objCurrency, lstCurrency) { };
                return View(tplCurrency);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "CurrencyConversionRates_POST", ex.ToString());
            }
            return View();
        }
        #endregion

        #region Add Tax Category
        public ActionResult AddTaxCategory(long? id, string status)
        {
            try
            {
                TaxCategory objCategory = new TaxCategory();
                if (id.HasValue)
                {
                    objCategory = db.TaxCategory.SingleOrDefault(x => x.CatID == id);
                }
                return View(objCategory);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "AddTaxCategory_GET", ex.ToString());
            }
            return View();
        }
        [HttpPost]
        public ActionResult AddTaxCategory(TaxCategory objTaxCategory)
        {
            try
            {
                objTaxCategory.IsDeleted = false;
                objTaxCategory.IsActive = true;
                objTaxCategory.DateCreated = DateTime.Now;
                objTaxCategory.ModifiedBy = UserContext.Identity.userId;
                AdminBAL.AddTaxCat(objTaxCategory);
                TempData["msg"] = _AppContext.Messages.Success;
            }
            catch (Exception ex)
            {
                TempData["msg"] = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Admin", "AddTaxCategory_POST", ex.ToString());
            }
            return RedirectToAction("TaxCategoryList", "Admin");
        }
        #endregion
        #region TaxCategoryList
        public ActionResult TaxCategoryList(long? id, string status)
        {
            try
            {
                TaxCategory objCategory = new TaxCategory();
                if (id.HasValue)
                {
                    objCategory = db.TaxCategory.SingleOrDefault(x => x.CatID == id);
                    if (objCategory != null && !string.IsNullOrEmpty(status))
                    {
                        if (status.Equals("delete"))
                        {
                            if (objCategory.IsDeleted == true)
                                objCategory.IsDeleted = false;
                            else
                                objCategory.IsDeleted = true;
                        }
                        else if (status.Equals("active"))
                        {
                            if (objCategory.IsActive == true)
                                objCategory.IsActive = false;
                            else
                                objCategory.IsActive = true;
                        }
                        objCategory.DateCreated = DateTime.Now;
                        objCategory.ModifiedBy = UserContext.Identity.userId;
                        AdminBAL.AddTaxCat(objCategory);
                        RouteData.Values.Remove("id");
                        return RedirectToAction("TaxCategoryList", "Admin");
                    }
                }
                List<TaxCategory> lstTaxCategory = db.TaxCategory.OrderByDescending(x => x.DateCreated).ToList();
                return View(lstTaxCategory);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "TaxCategoryList_GET", ex.ToString());
            }
            return View();
        }
        #endregion
        #region Is Tax Category Exists
        public JsonResult IsTaxCategoryExists(string Data)
        {
            JsonResult objJR = Json(new { Status = "failed" }, JsonRequestBehavior.AllowGet);
            try
            {
                JavaScriptSerializer oSerializer = new JavaScriptSerializer();
                Dictionary<string, object> TaxCat = (Dictionary<string, object>)oSerializer.Deserialize(Data, typeof(object));
                long CatID = Convert.ToInt64(TaxCat["CatID"]);
                string CatName = Convert.ToString(TaxCat["CatName"]);
                JsonResult objBR = Json(new { Status = "Success", Result = Convert.ToBoolean(db.TaxCategory.Where(x => x.CatName.ToLower() == CatName.ToLower()).Count()) }, JsonRequestBehavior.AllowGet);
                if (CatID > 0)
                {
                    if (CatName != db.TaxCategory.Single(x => x.CatID == CatID).CatName)
                    {
                        return objBR;
                    }
                    else
                    {
                        return Json(new { Status = "Success", Result = false }, JsonRequestBehavior.AllowGet);
                    }
                }
                else
                {
                    return objBR;
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "IsTaxCategoryExists_Json", ex.ToString());
            }
            return objJR;
        }
        #endregion

        #region Add Tax Rate
        public ActionResult AddTaxRate(long? id)
        {
            try
            {
                TaxRate oTaxrate = new TaxRate();
                if (id.HasValue)
                    oTaxrate = db.TaxRate.SingleOrDefault(x => x.TaxRateID == id);
                return View(oTaxrate);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "AddTaxRate_GET", ex.ToString());
            }
            return View();
        }
        [HttpPost]
        public ActionResult AddTaxRate(TaxRate oTaxRate)
        {
            try
            {
                oTaxRate.IsActive = true;
                oTaxRate.IsDeleted = false;
                oTaxRate.DateCreated = DateTime.Now;
                oTaxRate.ModifiedBy = UserContext.Identity.userId;
                AdminBAL.AddTaxRate(oTaxRate);
                TempData["msg"] = _AppContext.Messages.Success;
                return RedirectToAction("TaxRateList", "Admin");
            }
            catch (Exception ex)
            {
                TempData["msg"] = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Admin", "AddTaxRate_POST", ex.ToString());
            }
            return View();
        }
        #endregion
        #region TaxRateList
        public ActionResult TaxRateList(long? id, string status)
        {
            try
            {
                TaxRate oTaxrate = new TaxRate();
                if (id.HasValue)
                {
                    oTaxrate = db.TaxRate.SingleOrDefault(x => x.TaxRateID == id);
                    if (oTaxrate != null && !string.IsNullOrEmpty(status))
                    {
                        if (status.Equals("delete"))
                        {
                            if (oTaxrate.IsDeleted == true)
                                oTaxrate.IsDeleted = false;
                            else
                                oTaxrate.IsDeleted = true;
                        }
                        else if (status.Equals("active"))
                        {
                            if (oTaxrate.IsActive == true)
                                oTaxrate.IsActive = false;
                            else
                                oTaxrate.IsActive = true;
                        }
                        oTaxrate.DateCreated = DateTime.Now;
                        oTaxrate.ModifiedBy = UserContext.Identity.userId;
                        AdminBAL.AddTaxRate(oTaxrate);
                        RouteData.Values.Remove("id");
                        return RedirectToAction("TaxRateList", "Admin");
                    }
                }
                List<TaxRate> lstTaxRate = db.TaxRate.OrderByDescending(x => x.DateCreated).ToList();
                return View(lstTaxRate);
            }
            catch (Exception ex)
            {
                TempData["msg"] = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Admin", "TaxRateList_GET", ex.ToString());
            }
            return View();
        }
        #endregion
        #region Is Tax Rate Name Exists
        public JsonResult IsTaxRateNameExists(string Data)
        {
            JsonResult objJR = Json(new { Status = "failed" }, JsonRequestBehavior.AllowGet);
            try
            {
                JavaScriptSerializer oSerializer = new JavaScriptSerializer();
                Dictionary<string, object> TaxRate = (Dictionary<string, object>)oSerializer.Deserialize(Data, typeof(object));
                long TaxRateID = Convert.ToInt64(TaxRate["TaxRateID"]);
                string TaxRateName = Convert.ToString(TaxRate["TaxRateName"]);
                JsonResult objBR = Json(new { Status = "Success", Result = Convert.ToBoolean(db.TaxRate.Where(x => x.TaxRateName.ToLower() == TaxRateName.ToLower()).Count()) }, JsonRequestBehavior.AllowGet);
                if (TaxRateID > 0)
                {
                    if (TaxRateName != db.TaxRate.Single(x => x.TaxRateID == TaxRateID).TaxRateName)
                    {
                        return objBR;
                    }
                    else
                    {
                        return Json(new { Status = "Success", Result = false }, JsonRequestBehavior.AllowGet);
                    }
                }
                else
                {
                    return objBR;
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "IsTaxRateNameExists_Json", ex.ToString());
            }
            return objJR;
        }
        #endregion

        #region Add Customer Tax Category
        public ActionResult AddCustomerTaxCategory(long? id, string status)
        {
            try
            {
                Customer_TaxCategory objCategory = new Customer_TaxCategory();
                if (id.HasValue)
                {
                    objCategory = db.Customer_TaxCategory.SingleOrDefault(x => x.CustCatID == id);
                }
                return View(objCategory);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "AddCustomerTaxCategory_GET", ex.ToString());
            }
            return View();
        }
        [HttpPost]
        public ActionResult AddCustomerTaxCategory(Customer_TaxCategory objTaxCategory)
        {
            try
            {
                objTaxCategory.IsDeleted = false;
                objTaxCategory.IsActive = true;
                objTaxCategory.DateCreated = DateTime.Now;
                objTaxCategory.ModifiedBy = UserContext.Identity.userId;
                AdminBAL.AddCustomerTaxCat(objTaxCategory);
                TempData["msg"] = _AppContext.Messages.Success;
            }
            catch (Exception ex)
            {
                TempData["msg"] = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Admin", "AddCustomerTaxCategory_POST", ex.ToString());
            }
            return RedirectToAction("CustomerTaxCategoryList", "Admin");
        }
        #endregion
        #region TaxCategoryList
        public ActionResult CustomerTaxCategoryList(long? id, string status)
        {
            try
            {
                Customer_TaxCategory objCategory = new Customer_TaxCategory();
                if (id.HasValue)
                {
                    objCategory = db.Customer_TaxCategory.SingleOrDefault(x => x.CustCatID == id);
                    if (objCategory != null && !string.IsNullOrEmpty(status))
                    {
                        if (status.Equals("delete"))
                        {
                            if (objCategory.IsDeleted == true)
                                objCategory.IsDeleted = false;
                            else
                                objCategory.IsDeleted = true;
                        }
                        else if (status.Equals("active"))
                        {
                            if (objCategory.IsActive == true)
                                objCategory.IsActive = false;
                            else
                                objCategory.IsActive = true;
                        }
                        objCategory.DateCreated = DateTime.Now;
                        objCategory.ModifiedBy = UserContext.Identity.userId;
                        AdminBAL.AddCustomerTaxCat(objCategory);
                        RouteData.Values.Remove("id");
                        return RedirectToAction("CustomerTaxCategoryList", "Admin");
                    }
                }
                List<Customer_TaxCategory> lstTaxCategory = db.Customer_TaxCategory.OrderByDescending(x => x.DateCreated).ToList();
                return View(lstTaxCategory);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "CustomerTaxCategoryList_GET", ex.ToString());
            }
            return View();
        }
        #endregion
        #region Is Customer Tax Category Exists
        public JsonResult IsCustomerTaxCategoryExists(string Data)
        {
            JsonResult objJR = Json(new { Status = "failed" }, JsonRequestBehavior.AllowGet);
            try
            {
                JavaScriptSerializer oSerializer = new JavaScriptSerializer();
                Dictionary<string, object> TaxCat = (Dictionary<string, object>)oSerializer.Deserialize(Data, typeof(object));
                long CustCatID = Convert.ToInt64(TaxCat["CustCatID"]);
                string CustCatName = Convert.ToString(TaxCat["CustCatName"]);
                JsonResult objBR = Json(new { Status = "Success", Result = Convert.ToBoolean(db.Customer_TaxCategory.Where(x => x.CustCatName.ToLower() == CustCatName.ToLower()).Count()) }, JsonRequestBehavior.AllowGet);
                if (CustCatID > 0)
                {
                    if (CustCatName != db.Customer_TaxCategory.Single(x => x.CustCatID == CustCatID).CustCatName)
                    {
                        return objBR;
                    }
                    else
                    {
                        return Json(new { Status = "Success", Result = false }, JsonRequestBehavior.AllowGet);
                    }
                }
                else
                {
                    return objBR;
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "IsCustomerTaxCategoryExists_Json", ex.ToString());
            }
            return objJR;
        }
        #endregion

        #region Add Tax
        public ActionResult AddTax(long? id)
        {
            try
            {
                Tax oTax = new Tax();
                if (id.HasValue)
                {
                    oTax = db.Tax.SingleOrDefault(x => x.TaxID == id);
                }
                ViewBag.TaxCat = new SelectList(AdminBAL.GetAllTaxCategories(), "CatID", "CatName");
                ViewBag.CustTax = new SelectList(AdminBAL.GetAllCustomerTaxCategories(), "CustCatID", "CustCatName");
                ViewBag.TaxRates = new SelectList(AdminBAL.GetAllTaxRates(), "TaxRateID", "TaxRateName");
                return View(oTax);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "AddTax_GET", ex.ToString());
            }
            return View();
        }
        [HttpPost]
        public ActionResult AddTax(Tax oTax)
        {
            try
            {
                oTax.ModifiedBy = UserContext.Identity.userId;
                oTax.DateCreated = DateTime.Now;
                oTax.IsActive = true;
                oTax.IsDeleted = false;
                AdminBAL.AddTax(oTax);
                TempData["msg"] = _AppContext.Messages.Success;
                return RedirectToAction("TaxList", "Admin");
            }
            catch (Exception ex)
            {
                TempData["msg"] = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Admin", "AddTax_GET", ex.ToString());
            }
            return View();
        }
        #endregion
        #region TaxList
        public ActionResult TaxList(long? id, string status)
        {
            try
            {
                if (id.HasValue && !string.IsNullOrEmpty(status))
                {
                    Tax oTax = db.Tax.SingleOrDefault(x => x.TaxID == id);
                    if (oTax != null)
                    {
                        if (status.Equals("delete"))
                        {
                            if (oTax.IsDeleted == true)
                                oTax.IsDeleted = false;
                            else
                                oTax.IsDeleted = true;
                        }
                        else if (status.Equals("active"))
                        {
                            if (oTax.IsActive == true)
                                oTax.IsActive = false;
                            else
                                oTax.IsActive = true;
                        }
                        oTax.DateCreated = DateTime.Now;
                        oTax.ModifiedBy = UserContext.Identity.userId;
                        AdminBAL.AddTax(oTax);
                        RouteData.Values.Remove("id");
                        return RedirectToAction("TaxList", "Admin");
                    }
                }
                List<VwTax> lstTax = db.VwTax.OrderByDescending(x => x.DateCreated).ToList();
                return View(lstTax);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "TaxList_GET", ex.ToString());
            }
            return View();
        }
        #endregion
        #region Is Tax Name Exists
        public JsonResult IsTaxNameExists(string Data)
        {
            JsonResult objJR = Json(new { Status = "failed" }, JsonRequestBehavior.AllowGet);
            try
            {
                JavaScriptSerializer oSerializer = new JavaScriptSerializer();
                Dictionary<string, object> TaxCat = (Dictionary<string, object>)oSerializer.Deserialize(Data, typeof(object));
                long TaxID = Convert.ToInt64(TaxCat["TaxID"]);
                string TaxName = Convert.ToString(TaxCat["TaxName"]);
                JsonResult objBR = Json(new { Status = "Success", Result = Convert.ToBoolean(db.Tax.Where(x => x.TaxName.ToLower() == TaxName.ToLower()).Count()) }, JsonRequestBehavior.AllowGet);
                if (TaxID > 0)
                {
                    if (TaxName != db.Tax.Single(x => x.TaxID == TaxID).TaxName)
                    {
                        return objBR;
                    }
                    else
                    {
                        return Json(new { Status = "Success", Result = false }, JsonRequestBehavior.AllowGet);
                    }
                }
                else
                {
                    return objBR;
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "IsTaxNameExists_Json", ex.ToString());
            }
            return objJR;
        }
        #endregion

        #region Product Types
        public ActionResult ProdTypes(long? id, string status)
        {
            try
            {
                if (id.HasValue)
                {
                    ProductType objProdType = db.ProductTypes.SingleOrDefault(x => x.ProductType_id == id);
                    if (objProdType != null)
                    {
                        if (!string.IsNullOrEmpty(status))
                        {
                            if (status.Equals("active"))
                            {
                                if (objProdType.ProductType_IsActive == true)
                                    objProdType.ProductType_IsActive = false;
                                else
                                    objProdType.ProductType_IsActive = true;
                            }
                            else if (status.Equals("delete"))
                            {
                                if (objProdType.ProductType_IsDeleted == true)
                                {
                                    objProdType.ProductType_IsDeleted = false;
                                }
                                else
                                {
                                    objProdType.ProductType_IsDeleted = true;
                                }
                            }
                            objProdType.ProductType_DateCreated = DateTime.Now;
                            objProdType.ModifiedBy = UserContext.Identity.userId;
                            AdminBAL.AddUpdateProductType(objProdType);
                            RouteData.Values.Remove("id");//clear the querystring
                            return RedirectToAction("ProdTypes", "Admin");//clear the querystring
                        }
                    }
                }
                List<ProductType> lstProdTypes = db.ProductTypes.OrderByDescending(x => x.ProductType_DateCreated).ToList();
                return View(lstProdTypes);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "ProdTypes_GET", ex.ToString());
            }
            return View();
        }
        #endregion
        #region Add or Edit Product Types
        public ActionResult AddProductType(long? id)
        {
            try
            {
                ProductType objProductType = new ProductType();
                if (id.HasValue)
                {
                    objProductType = db.ProductTypes.SingleOrDefault(x => x.ProductType_id == id);
                }
                ViewBag.tables = db.CustomTableFields.Where(x => x.TableName == "ProductType" && x.IsActive == true).ToList();
                return View(objProductType);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "AddProductType_GET", ex.ToString());
            }
            return View();
        }
        #endregion
        #region Add or Edit Product Types
        [HttpPost]
        public ActionResult AddProductType(ProductType objProdType)
        {
            try
            {
                if (objProdType.ProductType_id > 0) //editing the product type
                {
                    ProductType objType = db.ProductTypes.Single(x => x.ProductType_id == objProdType.ProductType_id);
                    objType.ProductType_Name = objProdType.ProductType_Name;
                    objType.ProductType_Description = objProdType.ProductType_Description;
                    objProdType = objType;
                    objType = null;
                }
                else //new product type
                {
                    objProdType.ProductType_DateCreated = DateTime.Now;
                    objProdType.ProductType_IsActive = true;
                    objProdType.ProductType_IsDeleted = false;
                    objProdType.IsAddApproved = true;
                    objProdType.IsDelApproved = true;
                    objProdType.IsEditApproved = true;
                    objProdType.ProductType_IsDeletedFlag = -1;
                    objProdType.ProductType_IsbeingDeleted = false;
                    objProdType.ProductType_IsbeingEdited = false;
                    objProdType.ProductType_IsbeingAdded = false;
                }
                objProdType.ModifiedBy = UserContext.Identity.userId;
                AdminBAL.AddUpdateProductType(objProdType);
                return RedirectToAction("ProdTypes", "Admin");
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "AddProductType_POST", ex.ToString());
            }
            return View();
        }
        #endregion
        #region IsProductTypeExists
        public JsonResult IsProductTypeExists(string Data)
        {
            JsonResult objJR = Json(new { Status = "failed" }, JsonRequestBehavior.AllowGet);
            try
            {
                JavaScriptSerializer oSerializer = new JavaScriptSerializer();
                Dictionary<string, object> prodDetails = (Dictionary<string, object>)oSerializer.Deserialize(Data, typeof(object));
                string prodtypeName = Convert.ToString(prodDetails["ProductType_Name"]);
                long prodTypeId = Convert.ToInt64(prodDetails["ProductType_id"]);
                JsonResult objBR = Json(new { Status = "Success", Result = Convert.ToBoolean(db.ProductTypes.Where(x => x.ProductType_Name == prodtypeName).Select(x => x.ProductType_Name).ToList().Count) }, JsonRequestBehavior.AllowGet);
                if (prodTypeId > 0)
                {
                    if (prodtypeName != db.ProductTypes.Single(x => x.ProductType_id == prodTypeId).ProductType_Name)
                    {
                        return objBR;
                    }
                    else
                    {
                        return Json(new { Status = "Success", Result = false }, JsonRequestBehavior.AllowGet);
                    }
                }
                else
                {
                    return objBR;
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "IsProductTypeExists_Json", ex.ToString());
            }
            return objJR;
        }
        #endregion

        #region Product Properties
        public ActionResult ProdProperties(long? id, string status)
        {
            try
            {
                if (id.HasValue)
                {
                    ProductProperty objProdProperty = db.ProductProperties.SingleOrDefault(x => x.ProductProperty_id == id);

                    if (objProdProperty != null)
                    {
                        if (!string.IsNullOrEmpty(status))
                        {
                            if (status.Equals("active"))
                            {
                                if (objProdProperty.ProductProperty_IsActive == true)
                                    objProdProperty.ProductProperty_IsActive = false;
                                else
                                    objProdProperty.ProductProperty_IsActive = true;
                            }
                            else if (status.Equals("delete"))
                            {
                                if (objProdProperty.ProductProperty_IsDeleted == true)
                                {
                                    objProdProperty.ProductProperty_IsDeleted = false;
                                }
                                else
                                {
                                    objProdProperty.ProductProperty_IsDeleted = true;
                                }
                            }
                            objProdProperty.ProductProperty_DateCreated = DateTime.Now;
                            objProdProperty.ModifiedBy = UserContext.Identity.userId;
                            AdminBAL.AddUpdateProductProperty(objProdProperty);
                            RouteData.Values.Remove("id");//clear the querystring
                            return RedirectToAction("ProdProperties", "Admin");//clear the querystring
                        }
                    }
                }
                List<ProductProperty> lstProdTypes = db.ProductProperties.OrderByDescending(x => x.ProductProperty_DateCreated).ToList();
                return View(lstProdTypes);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "ProdProperties_GET", ex.ToString());
            }
            return View();
        }
        #endregion
        #region Add or Edit Product Properties
        public ActionResult AddProductProperty(long? id)
        {
            try
            {
                ProductProperty objProductProp = new ProductProperty();
                if (id.HasValue)
                {
                    objProductProp = db.ProductProperties.SingleOrDefault(x => x.ProductProperty_id == id);
                }
                return View(objProductProp);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "AddProductProperty_GET", ex.ToString());
            }
            return View();
        }
        [HttpPost]
        public ActionResult AddProductProperty(ProductProperty objProdProp)
        {
            try
            {
                if (objProdProp.ProductProperty_id > 0)
                {
                    ProductProperty obj = db.ProductProperties.Single(x => x.ProductProperty_id == objProdProp.ProductProperty_id);
                    obj.ProductProperty_Name = objProdProp.ProductProperty_Name;
                    obj.ProductProperty_Description = objProdProp.ProductProperty_Description;
                    objProdProp = obj;
                    obj = null;
                }
                else //New 
                {
                    objProdProp.ProductProperty_DateCreated = DateTime.Now;
                    objProdProp.ProductProperty_IsActive = true;
                    objProdProp.ProductProperty_IsDeleted = false;
                    objProdProp.IsAddApproved = true;
                    objProdProp.IsDelApproved = true;
                    objProdProp.IsEditApproved = true;
                    objProdProp.IsDeletedFlag = -1;
                    objProdProp.IsbeingDeleted = false;
                    objProdProp.IsbeingEdited = false;
                    objProdProp.IsbeingAdded = false;
                }
                objProdProp.ModifiedBy = UserContext.Identity.userId;
                AdminBAL.AddUpdateProductProperty(objProdProp);
                return RedirectToAction("ProdProperties", "Admin");
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "AddProductProperty_POST", ex.ToString());
            }
            return View();
        }
        #endregion
        #region IsProductPropExists
        public JsonResult IsProductPropExists(string Data)
        {
            JsonResult objJR = Json(new { Status = "failed" }, JsonRequestBehavior.AllowGet);
            try
            {
                JavaScriptSerializer oSerializer = new JavaScriptSerializer();
                Dictionary<string, object> prodProp = (Dictionary<string, object>)oSerializer.Deserialize(Data, typeof(object));
                long prodPropId = Convert.ToInt64(prodProp["ProductProperty_id"]);
                string prodPropName = Convert.ToString(prodProp["ProductProperty_Name"]);
                JsonResult objBR = Json(new { Status = "Success", Result = Convert.ToBoolean(db.ProductProperties.Where(x => x.ProductProperty_Name.ToLower() == prodPropName.ToLower()).Count()) }, JsonRequestBehavior.AllowGet);
                if (prodPropId > 0)
                {
                    if (prodPropName != db.ProductProperties.Single(x => x.ProductProperty_id == prodPropId).ProductProperty_Name)
                    {
                        return objBR;
                    }
                    else
                    {
                        return Json(new { Status = "Success", Result = false }, JsonRequestBehavior.AllowGet);
                    }
                }
                else
                {
                    return objBR;
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "IsProductPropExists_Json", ex.ToString());
            }
            return objJR;
        }
        #endregion

        #region Products
        public ActionResult ProductsList(long? id, string status)
        {
            try
            {
                if (id.HasValue)
                {
                    Product objProd = db.Products.SingleOrDefault(x => x.Product_id == id);
                    if (objProd != null)
                    {
                        if (!string.IsNullOrEmpty(status))
                        {
                            if (status.Equals("active"))
                            {
                                if (objProd.Product_IsActive == true)
                                    objProd.Product_IsActive = false;
                                else
                                    objProd.Product_IsActive = true;
                            }
                            else if (status.Equals("delete"))
                            {
                                if (objProd.Product_IsDeleted == true)
                                    objProd.Product_IsDeleted = false;
                                else
                                    objProd.Product_IsDeleted = true;
                            }
                            objProd.ModifiedBy = UserContext.Identity.userId;
                            AdminBAL.AddUpdateProducts(objProd);
                            RouteData.Values.Remove("id");//clear the querystring
                            return RedirectToAction("ProductsList", "Admin");//clear the querystring
                        }
                    }
                }
                List<VwProducts_ProductTypes> lstProducts = db.VwProducts_ProductTypes.OrderByDescending(x => x.Product_DateCreated).ToList();

                List<VwProduct_ProductProperty> lstProperties = db.VwProduct_ProductProperty.ToList();
                var tplProducts = new Tuple<List<VwProducts_ProductTypes>, List<VwProduct_ProductProperty>>(lstProducts, lstProperties) { };
                return View(tplProducts);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "ProductsList_GET", ex.ToString());
            }
            return View();
        }
        #endregion
        #region Add or Edit Product
        public ActionResult AddProduct(long? id)
        {
            try
            {
                Product objProduct = new Product();
                List<ProductProperty> lstProdProperties = db.ProductProperties.ToList();
                if (id.HasValue)
                {
                    objProduct = db.Products.SingleOrDefault(x => x.Product_id == id);
                    if (objProduct != null)
                    {
                        List<Lnk_Products_Properties> lstProdProps = db.Lnk_Products_Properties.Where(x => x.Product_id == objProduct.Product_id).ToList();
                        if (lstProdProps != null && lstProdProps.Count > 0)
                        {
                            foreach (var item in lstProdProps)
                            {
                                lstProdProperties.Find(x => x.ProductProperty_id == item.Product_Property_id).IsSelected = true;
                            }
                        }
                    }
                }
                ViewBag.tables = db.CustomTableFields.Where(x => x.TableName == "Product" && x.IsActive == true).ToList();
                ViewBag.Currency = new SelectList(AdminBAL.GetAllCurrency(), "CurrencySymbol", "CurrencySymbol");
                ViewBag.ProdTypes = new SelectList(AdminBAL.ProductTypeList(), "ProductType_id", "ProductType_Name");
                ViewBag.TaxCat = new SelectList(AdminBAL.GetAllTaxCategories(), "CatID", "CatName");
                var tplProducts = new Tuple<Product, List<ProductProperty>>(objProduct, lstProdProperties) { };
                return View(tplProducts);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "AddProduct_GET", ex.ToString());
            }
            return View();
        }
        [HttpPost]
        public ActionResult AddProduct(Product item1, FormCollection frm)
        {
            try
            {
                string strPropertyId = frm["hdnProp"];
                List<long> slctdProperties = string.IsNullOrEmpty(strPropertyId) ? new List<long>() : strPropertyId.Split(',').Select(long.Parse).ToList();
                ViewBag.Currency = new SelectList(AdminBAL.GetAllCurrency(), "CurrencySymbol", "CurrencySymbol");
                ViewBag.ProdTypes = new SelectList(AdminBAL.ProductTypeList(), "ProductType_id", "ProductType_Name");
                item1.Product_IsActive = true;
                item1.Product_IsDeleted = false;
                item1.Product_DateCreated = DateTime.Now;
                item1.ModifiedBy = UserContext.Identity.userId;
                AdminBAL.AddUpdateProducts(item1);
                AdminBAL.AddUpdateLnkProdProperties(item1.Product_id, slctdProperties);
                TempData["msg"] = _AppContext.Messages.Success;
                return RedirectToAction("ProductsList", "Admin");
            }
            catch (Exception ex)
            {
                TempData["msg"] = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Admin", "AddProduct_POST", ex.ToString());
            }
            return View();
        }
        #endregion
        #region IsProductExists
        public JsonResult IsProductExists(string Data)
        {
            JsonResult objJR = Json(new { Status = "failed" }, JsonRequestBehavior.AllowGet);
            try
            {
                JavaScriptSerializer oSerializer = new JavaScriptSerializer();
                Dictionary<string, object> product = (Dictionary<string, object>)oSerializer.Deserialize(Data, typeof(object));
                long Productid = Convert.ToInt64(product["Productid"]);
                string ProductName = Convert.ToString(product["ProductName"]);
                JsonResult objBR = Json(new { Status = "Success", Result = Convert.ToBoolean(db.Products.Where(x => x.Product_Name.ToLower() == ProductName.ToLower()).Count()) }, JsonRequestBehavior.AllowGet);
                if (Productid > 0)
                {
                    if (ProductName != db.Products.Single(x => x.Product_id == Productid).Product_Name)
                    {
                        return objBR;
                    }
                    else
                    {
                        return Json(new { Status = "Success", Result = false }, JsonRequestBehavior.AllowGet);
                    }
                }
                else
                {
                    return objBR;
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "IsProductExists_Json", ex.ToString());
            }
            return objJR;
        }
        #endregion

        #region Add Price List
        public ActionResult AddPriceList(long? id)
        {
            try
            {
                PriceList objList = new PriceList();
                if (id.HasValue)
                    objList = db.PriceList.SingleOrDefault(x => x.PriceList_id == id);
                return View(objList);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "AddPriceList_GET", ex.ToString());
            }
            return View();
        }
        [HttpPost]
        public ActionResult AddPriceList(PriceList objList)
        {
            try
            {
                bool flag = false;
                if (objList.PriceList_id > 0)
                    flag = true;
                objList.PriceList_IsActive = true;
                objList.PriceList_IsDeleted = false;
                objList.PriceList_DateCreated = DateTime.Now;
                objList.ModifiedBy = UserContext.Identity.userId;
                AdminBAL.AddUpdatePriceList(objList);
                if (flag)
                    TempData["msg"] = _AppContext.Messages.Update;
                else
                    TempData["msg"] = _AppContext.Messages.Insert;
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "AddPriceList_Post", ex.ToString());
            }
            return RedirectToAction("AllPriceLists", "Admin");
        }
        #endregion
        #region All Price Lists
        /// <summary>
        /// 
        /// </summary>
        /// <param name="id">PriceList_id</param>
        /// <param name="status">active/delete</param>
        /// <returns></returns>
        public ActionResult AllPriceLists(long? id, string status)
        {
            try
            {
                if (id.HasValue && !string.IsNullOrEmpty(status))
                {
                    PriceList objList = db.PriceList.SingleOrDefault(x => x.PriceList_id == id);
                    if (objList != null)
                    {
                        if (status.Equals("baseitem") && _AppContext.HasPermission(Parameters.Can_Make_PriceList_Default))
                        {
                            if (objList.PriceList_IsDefault == false)
                            {
                                List<PriceList> lstItems = db.PriceList.Where(x => x.PriceList_IsDefault == true).ToList();
                                if (lstItems.Count > 0 && lstItems != null)
                                {
                                    foreach (PriceList item in lstItems)
                                    {
                                        item.PriceList_IsDefault = false;
                                        item.ModifiedBy = UserContext.Identity.userId;
                                        AdminBAL.AddUpdatePriceList(item);
                                    }
                                }
                                objList.PriceList_IsDefault = true;
                            }
                        }
                        if (status.Equals("active"))
                        {
                            if (objList.PriceList_IsActive == true)
                                objList.PriceList_IsActive = false;
                            else
                                objList.PriceList_IsActive = true;
                        }
                        else if (status.Equals("delete"))
                        {
                            if (objList.PriceList_IsDeleted == true)
                                objList.PriceList_IsDeleted = false;
                            else
                                objList.PriceList_IsDeleted = true;
                        }
                        objList.PriceList_DateCreated = DateTime.Now;
                        objList.ModifiedBy = UserContext.Identity.userId;
                        AdminBAL.AddUpdatePriceList(objList);
                        RouteData.Values.Remove("id");
                        return RedirectToAction("AllPriceLists", "Admin");
                    }
                }
                List<PriceList> lstPriceList = db.PriceList.OrderByDescending(x => x.PriceList_IsDefault).ToList();
                return View(lstPriceList);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "AllPriceLists_GET", ex.ToString());
            }
            return View();
        }
        #endregion
        #region IsPriceListExists
        public JsonResult IsPriceListExists(string Data)
        {
            JsonResult objJR = Json(new { Status = "failed" }, JsonRequestBehavior.AllowGet);
            try
            {
                JavaScriptSerializer oSerializer = new JavaScriptSerializer();
                Dictionary<string, object> pricelistDetails = (Dictionary<string, object>)oSerializer.Deserialize(Data, typeof(object));
                string pricelistName = Convert.ToString(pricelistDetails["PriceList_Name"]);
                long pricelistId = Convert.ToInt64(pricelistDetails["PriceList_id"]);
                JsonResult objBR = Json(new { Status = "Success", Result = Convert.ToBoolean(db.PriceList.Where(x => x.PriceList_Name.ToLower() == pricelistName.ToLower()).Select(y => y.PriceList_Name).Count()) }, JsonRequestBehavior.AllowGet);
                if (pricelistId > 0)
                {
                    if (pricelistName != db.PriceList.Single(x => x.PriceList_id == pricelistId).PriceList_Name)
                    {
                        return objBR;
                    }
                    else
                    {
                        return Json(new { Status = "Success", Result = false }, JsonRequestBehavior.AllowGet);
                    }
                }
                else
                {
                    return objBR;
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "IsPriceListExists_JSON", ex.ToString());
            }
            return objJR;
        }
        #endregion
        #region Add Product to Price List
        /// <summary>
        /// Adds products to price list
        /// </summary>
        /// <param name="id">PriceList_id</param>
        /// <returns></returns>
        public ActionResult AddProductPriceList(long? id)
        {
            try
            {
                Lnk_Products_Channels objProduct = new Lnk_Products_Channels();
                if (id.HasValue)
                {
                    PriceList objPricelist = db.PriceList.SingleOrDefault(x => x.PriceList_id == id);//if user is manually adding id then check whether it exists
                    if (objPricelist != null)
                    {
                        ViewBag.pricelist = objPricelist.PriceList_Name;
                        objProduct.Price_List_id = id;
                    }
                    else
                    {
                        ViewBag.msg = _AppContext.Messages.NotExist;
                        return View();
                    }
                }
                ViewBag.Products = new SelectList(AdminBAL.GetAllProducts(), "Product_id", "Product_Name");
                ViewBag.Currency = new SelectList(AdminBAL.GetAllCurrency(), "CurrencySymbol", "CurrencySymbol");
                ViewBag.schedule = new SelectList(AdminBAL.GetAllSchedule(), "Schedule_Id", "Schedule_Name");
                List<Channel> lstChannels = db.Channels.Where(x => x.Channel_IsActive == true && x.Channel_IsDeleted == false).ToList();
                List<Lnk_Products_Channels> lstProductChannel = db.Lnk_Products_Channels.Where(x => x.Product_id == objProduct.Product_id).ToList();
                foreach (var item in lstProductChannel)
                {
                    lstChannels.Find(x => x.Channel_id == item.Channel_id).Channel_IsSelected = true;
                }
                List<VwChannelProducts> lstChannelProducts = db.VwChannelProducts.Where(x => x.Price_List_id == id).OrderByDescending(x => x.Product_DateCreated).ToList();
                var tplChannels = new Tuple<Lnk_Products_Channels, List<Channel>, List<VwChannelProducts>>(objProduct, lstChannels, lstChannelProducts) { };
                return View(tplChannels);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "AddProductPriceList_GET", ex.ToString());
            }
            return View();
        }
        [HttpPost]
        public ActionResult AddProductPriceList(Lnk_Products_Channels item1, FormCollection frm)
        {
            try
            {
                item1.Product_IsActive = true;
                item1.Product_IsDeleted = false;
                item1.Product_DateCreated = DateTime.Now;
                List<long> Channel_ids = string.IsNullOrEmpty(frm["hdnChannelIds"]) ? new List<long>() : frm["hdnChannelIds"].Split(',').Select(long.Parse).ToList();
                if (Channel_ids != null)
                {
                    item1.ModifiedBy = UserContext.Identity.userId;
                    AdminBAL.AddUpdateChannelProducts(item1, Channel_ids);
                    TempData["msg"] = _AppContext.Messages.Success;
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "AddChannelProducts_Post", ex.ToString());
            }
            return RedirectToAction("AddProductPriceList", "Admin", new { id = item1.Price_List_id });
        }
        #endregion
        //#region Assign Price List
        ///// <summary>
        ///// 
        ///// </summary>
        ///// <param name="id">Pricelist_id</param>
        ///// <returns></returns>
        //public ActionResult AssignPriceList(long? id)
        //{
        //    try
        //    {
        //        ViewBag.pricelist = db.PriceList.SingleOrDefault(x => x.PriceList_id == id).PriceList_Name;
        //        ViewBag.pricelistid = id;
        //        List<Customer> lstCustomers = db.Customers.Where(x => x.IsActive == true && x.IsDeleted == false).ToList();
        //        List<Customer_PriceList> lstPriceList = db.Customer_PriceList.Where(x => x.Price_List_id == id).ToList();
        //        if (lstPriceList != null && lstPriceList.Count > 0)
        //        {
        //            foreach (var item in lstPriceList)
        //            {
        //                lstCustomers.Remove(db.Customers.Single(x => x.Customer_id == item.Customer_id));
        //            }
        //        }
        //        return View(lstCustomers);
        //    }
        //    catch (Exception ex)
        //    {
        //        _AppContext.WriteLogFile("Admin", "AssignPriceList_GET", ex.ToString());
        //    }
        //    return View();
        //}
        //[HttpPost]
        //public ActionResult AssignPriceList(FormCollection frm)
        //{
        //    try
        //    {
        //        long id = Convert.ToInt64(frm["hdnPriceListId"]);
        //        List<long> Customer_ids = string.IsNullOrEmpty(frm["hdnCustId"]) ? new List<long>() : frm["hdnCustId"].Split(',').Select(long.Parse).ToList();
        //        ViewBag.pricelist = db.PriceList.SingleOrDefault(x => x.PriceList_id == id).PriceList_Name;
        //        ViewBag.pricelistid = id;
        //        if (Customer_ids.Count > 0 && Customer_ids != null)
        //        {
        //            if (AdminBAL.AssignPriceList(id, Customer_ids) == 1)
        //                ViewBag.msg = _AppContext.Messages.Success;
        //        }
        //        List<Customer> lstCustomers = db.Customers.Where(x => x.IsActive == true && x.IsDeleted == false).ToList();
        //        List<Customer_PriceList> lstPriceList = db.Customer_PriceList.Where(x => x.Price_List_id == id).ToList();
        //        if (lstPriceList != null && lstPriceList.Count > 0)
        //        {
        //            foreach (var item in lstPriceList)
        //            {
        //                lstCustomers.Remove(db.Customers.Single(x => x.Customer_id == item.Customer_id));
        //            }
        //        }
        //        return View(lstCustomers);
        //    }
        //    catch (Exception ex)
        //    {
        //        _AppContext.WriteLogFile("Admin", "AssignPriceList_POST", ex.ToString());
        //    }
        //    return View();
        //}
        //#endregion
        #region View Price List Customers
        /// <summary>
        /// 
        /// </summary>
        /// <param name="id">PriceList_id</param>
        /// <returns></returns>
        public ActionResult ViewPriceListCustomers(long? id, long? custid)
        {
            try
            {
                if (id.HasValue)
                {
                    ViewBag.pricelistid = id;
                    ViewBag.pricelist = db.PriceList.SingleOrDefault(x => x.PriceList_id == id).PriceList_Name;
                    //if (custid.HasValue)
                    //{
                    //    if (AdminBAL.UnassignPriceList(id, custid) == 1)
                    //        ViewBag.msg = _AppContext.Messages.Success;
                    //}
                    //List<Customer_PriceList> lstCustPriceList = db.Customer_PriceList.Where(x => x.Price_List_id == id).ToList();
                    //List<Customer> lstCustomer = new List<Customer>();
                    //if (lstCustPriceList.Count > 0 && lstCustPriceList != null)
                    //{
                    //    foreach (var item in lstCustPriceList)
                    //    {
                    //        Customer objCust = db.Customers.Single(x => x.Customer_id == item.Customer_id);
                    //        lstCustomer.Add(objCust);
                    //    }
                    //}
                    List<Customer> lstCustomer = db.Customers.Where(x => x.Price_List_id == id).ToList();
                    return View(lstCustomer);
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "ViewPriceListCustomers_GET", ex.ToString());
            }

            return View();
        }
        #endregion

        #region Add Discount List
        public ActionResult AddDiscountList(long? id)
        {
            try
            {
                List<DiscountsList> lst = db.DiscountsList.Where(x => x.DiscountList_IsDefault == true).ToList();
                if (lst.Count > 0)
                {
                    ViewBag.isdefaultset = "yes";
                }
                else
                {
                    ViewBag.isdefaultset = "no";
                }
                DiscountsList objList = new DiscountsList();
                if (id.HasValue)
                    objList = db.DiscountsList.SingleOrDefault(x => x.DiscountList_id == id);
                return View(objList);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "AddDiscountList_GET", ex.ToString());
            }
            return View();
        }
        [HttpPost]
        public ActionResult AddDiscountList(DiscountsList objList)
        {
            try
            {
                bool flag = false;
                if (objList.DiscountList_id > 0)
                {
                    flag = true;
                    DiscountsList oDiscount = db.DiscountsList.Single(x => x.DiscountList_id == objList.DiscountList_id);
                    //if (oDiscount.DiscountList_IsDefault == true)
                    //    objList.DiscountList_IsDefault = oDiscount.DiscountList_IsDefault;
                }
                objList.DiscountList_IsActive = true;
                objList.DiscountList_IsDeleted = false;
                objList.DiscountList_DateCreated = DateTime.Now;
                objList.ModifiedBy = UserContext.Identity.userId;
                AdminBAL.AddUpdateDiscountList(objList);
                if (flag)
                    TempData["msg"] = _AppContext.Messages.Update;
                else
                    TempData["msg"] = _AppContext.Messages.Insert;
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "AddDiscountList_Post", ex.ToString());
            }
            return RedirectToAction("AllDiscounts", "Admin");
        }
        #endregion
        #region IsDiscountListExists
        public JsonResult IsDiscountListExists(string Data)
        {
            JsonResult objJR = Json(new { Status = "failed" }, JsonRequestBehavior.AllowGet);
            try
            {
                JavaScriptSerializer oSerializer = new JavaScriptSerializer();
                Dictionary<string, object> DiscountlistDetails = (Dictionary<string, object>)oSerializer.Deserialize(Data, typeof(object));
                string DiscountlistName = Convert.ToString(DiscountlistDetails["DiscountList_Name"]);
                long DiscountlistId = Convert.ToInt64(DiscountlistDetails["DiscountList_id"]);
                JsonResult objBR = Json(new { Status = "Success", Result = Convert.ToBoolean(db.DiscountsList.Where(x => x.DiscountList_Name.ToLower() == DiscountlistName.ToLower()).Select(y => y.DiscountList_Name).Count()) }, JsonRequestBehavior.AllowGet);
                if (DiscountlistId > 0)
                {
                    if (DiscountlistName != db.DiscountsList.Single(x => x.DiscountList_id == DiscountlistId).DiscountList_Name)
                    {
                        return objBR;
                    }
                    else
                    {
                        return Json(new { Status = "Success", Result = false }, JsonRequestBehavior.AllowGet);
                    }
                }
                else
                {
                    return objBR;
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "IsDiscountListExists_JSON", ex.ToString());
            }
            return objJR;
        }
        #endregion
        #region AllDiscounts
        public ActionResult AllDiscounts(long? id, string status)
        {
            try
            {
                if (id.HasValue && !string.IsNullOrEmpty(status))
                {
                    DiscountsList objList = db.DiscountsList.SingleOrDefault(x => x.DiscountList_id == id);
                    if (objList != null)
                    {
                        if (status.Equals("active"))
                        {
                            if (objList.DiscountList_IsActive == true)
                                objList.DiscountList_IsActive = false;
                            else
                                objList.DiscountList_IsActive = true;
                        }
                        else if (status.Equals("delete"))
                        {
                            if (objList.DiscountList_IsDeleted == true)
                                objList.DiscountList_IsDeleted = false;
                            else
                                objList.DiscountList_IsDeleted = true;
                        }
                        objList.DiscountList_DateCreated = DateTime.Now;
                        objList.ModifiedBy = UserContext.Identity.userId;
                        AdminBAL.AddUpdateDiscountList(objList);
                        RouteData.Values.Remove("id");
                        return RedirectToAction("AllDiscounts", "Admin");
                    }
                }
                List<DiscountsList> lstDiscountList = db.DiscountsList.OrderByDescending(x => x.DiscountList_IsDefault).ToList();
                return View(lstDiscountList);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "AllDiscounts_GET", ex.ToString());
            }
            return View();
        }
        #endregion
        #region Add Product to Discount List
        /// <summary>
        /// Adds products to Discount list
        /// </summary>
        /// <param name="id">Discount_List_id</param>
        /// <returns></returns>
        public ActionResult AddProductDiscountList(long? id)
        {
            try
            {
                Lnk_Discount_Product objProduct = new Lnk_Discount_Product();
                if (id.HasValue)
                {
                    DiscountsList objlist = db.DiscountsList.SingleOrDefault(x => x.DiscountList_id == id);//if user is manually adding id then check whether it exists
                    if (objlist != null)
                    {
                        ViewBag.discountlist = objlist.DiscountList_Name;
                        objProduct.Discount_List_id = id;
                    }
                    else
                    {
                        ViewBag.msg = _AppContext.Messages.NotExist;
                        return View();
                    }
                }
                ViewBag.Products = new SelectList(AdminBAL.GetAllProducts(), "Product_id", "Product_Name");
                ViewBag.Currency = new SelectList(AdminBAL.GetAllCurrency(), "CurrencySymbol", "CurrencySymbol");
                GeneralSetting objGen = db.GeneralSettings.FirstOrDefault();
                if (objGen != null)
                {
                    Currency currency = db.Currencies.SingleOrDefault(x => x.Currency_id == objGen.BaseCurrency);
                    if (currency != null)
                    {
                        ViewBag.Currency = new SelectList(AdminBAL.GetAllCurrency(), "CurrencySymbol", "CurrencySymbol", currency.CurrencySymbol);
                    }
                }
                List<Channel> lstChannels = db.Channels.Where(x => x.Channel_IsActive == true && x.Channel_IsDeleted == false).ToList();

                List<VwDiscountProducts> lstChannelProducts = db.VwDiscountProducts.Where(x => x.Discount_List_id == id).ToList();
                var tplChannels = new Tuple<Lnk_Discount_Product, List<Channel>, List<VwDiscountProducts>>(objProduct, lstChannels, lstChannelProducts) { };
                return View(tplChannels);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "AddProductDiscountList_GET", ex.ToString());
            }
            return View();
        }
        [HttpPost]
        public ActionResult AddProductDiscountList(Lnk_Discount_Product item1, FormCollection frm)
        {
            try
            {
                List<long> Channel_ids = string.IsNullOrEmpty(frm["hdnChannelIds"]) ? new List<long>() : frm["hdnChannelIds"].Split(',').Select(long.Parse).ToList();
                string discounttype = frm["discounttype"];
                if (Channel_ids != null)
                {
                    if (discounttype.Equals("Percentage"))
                        item1.Discount_Currency = null;
                    item1.Discount_Type = discounttype;
                    item1.ModifiedBy = UserContext.Identity.userId;
                    AdminBAL.AddUpdateProductDiscount(item1, Channel_ids);
                    TempData["msg"] = _AppContext.Messages.Success;
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "AddProductDiscountList_POST", ex.ToString());
            }
            return RedirectToAction("AddProductDiscountList", "Admin", new { id = item1.Discount_List_id });
        }
        #endregion
        #region View Discount List Customers
        /// <summary>
        /// 
        /// </summary>
        /// <param name="id">PriceList_id</param>
        /// <returns></returns>
        public ActionResult ViewDiscountListCustomers(long? id, long? custid)
        {
            try
            {
                if (id.HasValue)
                {
                    ViewBag.discountlistid = id;
                    ViewBag.discountlist = db.DiscountsList.SingleOrDefault(x => x.DiscountList_id == id).DiscountList_Name;
                    List<Customer> lstCustomer = db.Customers.Where(x => x.Discount_List_id == id).ToList();
                    return View(lstCustomer);
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "ViewPriceListCustomers_GET", ex.ToString());
            }

            return View();
        }
        #endregion

        #region Gadgets
        public ActionResult GadgetsList(long? id, string status)
        {
            try
            {
                if (id.HasValue)
                {
                    Gadget objGadget = db.Gadgets.SingleOrDefault(x => x.Gadget_id == id);
                    if (objGadget != null)
                    {
                        if (!string.IsNullOrEmpty(status))
                        {
                            if (status.Equals("active"))
                            {
                                if (objGadget.Gadget_IsActive == true)
                                    objGadget.Gadget_IsActive = false;
                                else
                                    objGadget.Gadget_IsActive = true;
                            }
                            else if (status.Equals("delete"))
                            {
                                if (objGadget.Gadget_IsDeleted == true)
                                    objGadget.Gadget_IsDeleted = false;
                                else
                                    objGadget.Gadget_IsDeleted = true;
                            }
                            objGadget.Gadget_DateCreated = DateTime.Now;
                            objGadget.ModifiedBy = UserContext.Identity.userId;
                            AdminBAL.AddUpdateGadget(objGadget);
                            RouteData.Values.Remove("id");//clear the querystring
                            return RedirectToAction("GadgetsList", "Admin");//clear the querystring
                        }
                    }
                }
                List<Gadget> lstGadget = db.Gadgets.OrderByDescending(x => x.Gadget_DateCreated).ToList();
                return View(lstGadget);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "GadgetsList_GET", ex.ToString());
            }
            return View();
        }
        #endregion
        #region Add Gadget
        public ActionResult AddGadget(long? id)
        {
            try
            {
                Gadget objGadget = new Gadget();
                if (id.HasValue)
                {
                    objGadget = db.Gadgets.SingleOrDefault(x => x.Gadget_id == id);
                }
                return View(objGadget);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "AddGadget_GET", ex.ToString());
            }
            return View();
        }
        [HttpPost]
        public ActionResult AddGadget(Gadget objGadget)
        {
            try
            {
                objGadget.Gadget_DateCreated = DateTime.Now;
                objGadget.Gadget_IsActive = true;
                objGadget.Gadget_IsDeleted = false;
                objGadget.ModifiedBy = UserContext.Identity.userId;
                AdminBAL.AddUpdateGadget(objGadget);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "AddGadget_POST", ex.ToString());
            }
            return RedirectToAction("GadgetsList", "Admin");
        }
        #endregion
        #region IsGadgetExists
        public JsonResult IsGadgetExists(string Data)
        {
            JsonResult objJR = Json(new { Status = "failed" }, JsonRequestBehavior.AllowGet);
            try
            {
                JavaScriptSerializer oSerializer = new JavaScriptSerializer();
                Dictionary<string, object> gadgetDetails = (Dictionary<string, object>)oSerializer.Deserialize(Data, typeof(object));
                string gadgetName = Convert.ToString(gadgetDetails["Gadget_Name"]);
                long gadgetId = Convert.ToInt64(gadgetDetails["Gadget_id"]);
                JsonResult objBR = Json(new { Status = "Success", Result = Convert.ToBoolean(db.Gadgets.Where(x => x.Gadget_Name.ToLower() == gadgetName.ToLower()).Select(y => y.Gadget_Name).Count()) }, JsonRequestBehavior.AllowGet);
                if (gadgetId > 0)
                {
                    if (gadgetName != db.Gadgets.Single(x => x.Gadget_id == gadgetId).Gadget_Name)
                    {
                        return objBR;
                    }
                    else
                    {
                        return Json(new { Status = "Success", Result = false }, JsonRequestBehavior.AllowGet);
                    }
                }
                else
                {
                    return objBR;
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "IsGadgetExists_JSON", ex.ToString());
            }
            return objJR;
        }
        #endregion

        #region Channel Types
        public ActionResult ChannelTypesList(long? id, string status)
        {
            try
            {
                if (id.HasValue)
                {
                    ChannelType objChannelType = db.ChannelTypes.SingleOrDefault(x => x.ChannelType_id == id);
                    if (objChannelType != null)
                    {
                        if (!string.IsNullOrEmpty(status))
                        {
                            if (status.Equals("active"))
                            {
                                if (objChannelType.ChannelType_IsActive == true)
                                    objChannelType.ChannelType_IsActive = false;
                                else
                                    objChannelType.ChannelType_IsActive = true;
                            }
                            else if (status.Equals("delete"))
                            {
                                if (objChannelType.ChannelType_IsDeleted == true)
                                    objChannelType.ChannelType_IsDeleted = false;
                                else
                                    objChannelType.ChannelType_IsDeleted = true;
                            }
                            objChannelType.ChannelType_DateCreated = DateTime.Now;
                            objChannelType.ModifiedBy = UserContext.Identity.userId;
                            AdminBAL.AddUpdateChannelType(objChannelType);
                            RouteData.Values.Remove("id");//clear the querystring
                            return RedirectToAction("ChannelTypesList", "Admin");//clear the querystring
                        }
                    }
                }
                List<ChannelType> lstChannelTypes = db.ChannelTypes.OrderByDescending(x => x.ChannelType_DateCreated).ToList();
                return View(lstChannelTypes);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "ChannelTypesList_GET", ex.ToString());
            }
            return View();
        }
        #endregion
        #region Add Channel Type
        public ActionResult AddChannelType(long? id)
        {
            try
            {
                ChannelType objChannelType = new ChannelType();
                if (id.HasValue)
                {
                    objChannelType = db.ChannelTypes.SingleOrDefault(x => x.ChannelType_id == id);
                }
                ViewBag.tables = db.CustomTableFields.Where(x => x.TableName == "ChannelType" && x.IsActive == true).ToList();
                return View(objChannelType);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "AddChannelType_GET", ex.ToString());
            }
            return View();
        }
        [HttpPost]
        public ActionResult AddChannelType(ChannelType objChannelType)
        {
            try
            {
                objChannelType.ChannelType_DateCreated = DateTime.Now;
                objChannelType.ChannelType_IsActive = true;
                objChannelType.ChannelType_IsDeleted = false;
                objChannelType.ModifiedBy = UserContext.Identity.userId;
                AdminBAL.AddUpdateChannelType(objChannelType);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "AddChannelType_POST", ex.ToString());
            }
            return RedirectToAction("ChannelTypesList", "Admin");
        }
        #endregion
        #region IsChannelTypeExists
        public JsonResult IsChannelTypeExists(string Data)
        {
            JsonResult objJR = Json(new { Status = "failed" }, JsonRequestBehavior.AllowGet);
            try
            {
                JavaScriptSerializer oSerializer = new JavaScriptSerializer();
                Dictionary<string, object> ChannelTypeDetails = (Dictionary<string, object>)oSerializer.Deserialize(Data, typeof(object));
                string ChannelTypeName = Convert.ToString(ChannelTypeDetails["ChannelTypeName"]);
                long ChannelTypeId = Convert.ToInt64(ChannelTypeDetails["ChannelTypeId"]);
                JsonResult objBR = Json(new { Status = "Success", Result = Convert.ToBoolean(db.ChannelTypes.Where(x => x.ChannelType_Name.ToLower() == ChannelTypeName.ToLower()).Select(y => y.ChannelType_Name).ToList().Count) }, JsonRequestBehavior.AllowGet);
                if (ChannelTypeId > 0)
                {
                    if (ChannelTypeName != db.ChannelTypes.Single(x => x.ChannelType_id == ChannelTypeId).ChannelType_Name)
                    {
                        return objBR;
                    }
                    else
                    {
                        return Json(new { Status = "Success", Result = false }, JsonRequestBehavior.AllowGet);
                    }
                }
                else
                {
                    return objBR;
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "IsChannelTypeExists_JSON", ex.ToString());
            }
            return objJR;
        }
        #endregion

        #region List of Channels
        public ActionResult ChannelsList(long? id, string status)
        {
            try
            {
                if (id.HasValue)
                {
                    Channel objChannel = db.Channels.SingleOrDefault(x => x.Channel_id == id);
                    if (objChannel != null)
                    {
                        if (!string.IsNullOrEmpty(status))
                        {
                            if (status.Equals("active"))
                            {
                                if (objChannel.Channel_IsActive == true)
                                    objChannel.Channel_IsActive = false;
                                else
                                    objChannel.Channel_IsActive = true;
                            }
                            else if (status.Equals("delete") && _AppContext.HasPermission(Parameters.Can_Delete_Channel))
                            {
                                if (objChannel.Channel_IsDeleted == true)
                                    objChannel.Channel_IsDeleted = false;
                                else
                                    objChannel.Channel_IsDeleted = true;
                            }
                            objChannel.Channel_DateCreated = DateTime.Now;
                            objChannel.ModifiedBy = UserContext.Identity.userId;
                            AdminBAL.AddUpdateChannel(objChannel);
                            RouteData.Values.Remove("id");
                            return RedirectToAction("ChannelsList", "Admin");
                        }
                    }
                }
                List<VwChannels_ChannelTypes> lstChannel = db.VwChannels_ChannelTypes.OrderByDescending(x => x.Channel_DateCreated).ToList();
                return View(lstChannel);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "ChannelsList_GET", ex.ToString());
            }
            return View();
        }
        #endregion
        #region AddChannel
        public ActionResult AddChannel(long? id)
        {
            try
            {
                Channel objChannel = new Channel();
                if (id.HasValue)
                {
                    objChannel = db.Channels.SingleOrDefault(x => x.Channel_id == id);
                }
                ViewBag.Countries = new SelectList(AdminBAL.GetAllCountries(), "CountryName", "CountryName");
                ViewBag.ChannelTypes = new SelectList(AdminBAL.GetAllChannelTypes(), "ChannelType_id", "ChannelType_Name");
                ViewBag.tables = db.CustomTableFields.Where(x => x.TableName == "Channel" && x.IsActive == true).ToList();
                return View(objChannel);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "AddChannel_GET", ex.ToString());
            }
            return View();
        }
        [HttpPost]
        public ActionResult AddChannel(Channel objChannel)
        {
            try
            {
                objChannel.Channel_DateCreated = DateTime.Now;
                objChannel.Channel_IsActive = true;
                objChannel.Channel_IsDeleted = false;
                objChannel.ModifiedBy = UserContext.Identity.userId;
                AdminBAL.AddUpdateChannel(objChannel);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "AddChannel_GET", ex.ToString());
            }
            return RedirectToAction("ChannelsList", "Admin");
        }
        #endregion
        #region IsChannelExists
        public JsonResult IsChannelExists(string Data)
        {
            JsonResult objJR = Json(new { Status = "failed" }, JsonRequestBehavior.AllowGet);
            try
            {
                JavaScriptSerializer oSerializer = new JavaScriptSerializer();
                Dictionary<string, object> ChannelDetails = (Dictionary<string, object>)oSerializer.Deserialize(Data, typeof(object));
                string ChannelName = Convert.ToString(ChannelDetails["ChannelName"]);
                long ChannelId = Convert.ToInt64(ChannelDetails["ChannelId"]);
                JsonResult objBR = Json(new { Status = "Success", Result = Convert.ToBoolean(db.Channels.Where(x => x.Channel_Name.ToLower() == ChannelName.ToLower()).Count()) }, JsonRequestBehavior.AllowGet);
                if (ChannelId > 0)
                {
                    if (ChannelName != db.Channels.Single(x => x.Channel_id == ChannelId).Channel_Name)
                    {
                        return objBR;
                    }
                    else
                    {
                        return Json(new { Status = "Success", Result = false }, JsonRequestBehavior.AllowGet);
                    }
                }
                else
                {
                    return objBR;
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "IsChannelExists_JSON", ex.ToString());
            }
            return objJR;
        }
        #endregion
        #region Channel products list
        public ActionResult ProductsChannelList(long? id, string status)
        {
            try
            {
                if (id.HasValue)
                {
                    Lnk_Products_Channels objProduct = db.Lnk_Products_Channels.SingleOrDefault(x => x.Lnk_Products_Channels_id == id);

                    if (!string.IsNullOrEmpty(status))
                    {
                        if (status.Equals("active"))
                        {
                            if (objProduct.Product_IsActive == true)
                                objProduct.Product_IsActive = false;
                            else
                                objProduct.Product_IsActive = true;
                        }
                        else if (status.Equals("delete"))
                        {
                            if (objProduct.Product_IsDeleted == true)
                                objProduct.Product_IsDeleted = false;
                            else
                                objProduct.Product_IsDeleted = true;
                        }
                        objProduct.Product_DateCreated = DateTime.Now;
                        objProduct.ModifiedBy = UserContext.Identity.userId;
                        AdminBAL.UpdateChannelProductStatus(objProduct);
                        RouteData.Values.Remove("id");
                        return RedirectToAction("ProductsChannelList", "Admin");
                    }
                }
                List<VwChannelProducts> lstChannelProducts = db.VwChannelProducts.OrderByDescending(x => x.Product_DateCreated).ToList();
                return View(lstChannelProducts);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "AddProductChannel_GET", ex.ToString());
            }
            return View();
        }
        #endregion
        #region Add Products to Channels
        /// <summary>
        /// 
        /// </summary>
        /// <param name="id">Pricelist_id</param>
        /// <returns></returns>
        public ActionResult AddChannelProducts(long? id)
        {
            try
            {
                Lnk_Products_Channels objProduct = new Lnk_Products_Channels();
                if (id.HasValue)
                {
                    PriceList objPricelist = db.PriceList.SingleOrDefault(x => x.PriceList_id == id);//if user is manually adding id then check whether it exists
                    if (objPricelist != null)
                    {
                        ViewBag.pricelist = objPricelist.PriceList_Name;
                        objProduct.Price_List_id = id;
                    }
                    else
                    {
                        ViewBag.msg = _AppContext.Messages.NotExist;
                        return View();
                    }
                }
                ViewBag.Products = new SelectList(AdminBAL.GetAllProducts(), "Product_id", "Product_Name");
                ViewBag.Currency = new SelectList(AdminBAL.GetAllCurrency(), "CurrencySymbol", "CurrencySymbol");
                ViewBag.schedule = new SelectList(AdminBAL.GetAllSchedule(), "Schedule_Id", "Schedule_Name");
                List<Channel> lstChannels = db.Channels.Where(x => x.Channel_IsActive == true && x.Channel_IsDeleted == false).ToList();
                List<Lnk_Products_Channels> lstProductChannel = db.Lnk_Products_Channels.Where(x => x.Product_id == objProduct.Product_id).ToList();
                foreach (var item in lstProductChannel)
                {
                    lstChannels.Find(x => x.Channel_id == item.Channel_id).Channel_IsSelected = true;
                }
                var tplChannels = new Tuple<Lnk_Products_Channels, List<Channel>>(objProduct, lstChannels) { };
                return View(tplChannels);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "AddChannelProducts_GET", ex.ToString());
            }
            return View();
        }
        [HttpPost]
        public ActionResult AddChannelProducts(Lnk_Products_Channels item1, FormCollection frm)
        {
            try
            {
                item1.Product_IsActive = true;
                item1.Product_IsDeleted = false;
                item1.Product_DateCreated = DateTime.Now;
                List<long> Channel_ids = string.IsNullOrEmpty(frm["hdnChannelIds"]) ? new List<long>() : frm["hdnChannelIds"].Split(',').Select(long.Parse).ToList();
                if (Channel_ids != null)
                {
                    item1.ModifiedBy = UserContext.Identity.userId;
                    AdminBAL.AddUpdateChannelProducts(item1, Channel_ids);
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "AddChannelProducts_GET", ex.ToString());
            }
            return RedirectToAction("ProductsChannelList", "Admin");
        }
        #endregion
        #region EditChannelProduct
        /// <summary>
        /// 
        /// </summary>
        /// <param name="id">Id of table Lnk_Products_Channels</param>
        /// <returns></returns>
        public ActionResult EditChannelProduct(long? id)
        {
            try
            {
                Lnk_Products_Channels objProduct = new Lnk_Products_Channels();
                if (id.HasValue)
                {
                    objProduct = db.Lnk_Products_Channels.SingleOrDefault(x => x.Lnk_Products_Channels_id == id);
                    ViewBag.Product = AdminBAL.GetProductNameById(objProduct.Product_id);
                }
                ViewBag.Currency = new SelectList(AdminBAL.GetAllCurrency(), "CurrencySymbol", "CurrencySymbol");
                return View(objProduct);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "EditChannelProduct_GET", ex.ToString());
            }
            return View();
        }
        [HttpPost]
        public ActionResult EditChannelProduct(Lnk_Products_Channels objProduct)
        {
            try
            {
                objProduct.Product_IsActive = true;
                objProduct.Product_IsDeleted = false;
                objProduct.Product_DateCreated = DateTime.Now;
                objProduct.ModifiedBy = UserContext.Identity.userId;
                AdminBAL.EditProductofChannel(objProduct);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "EditChannelProduct_GET", ex.ToString());
            }
            return RedirectToAction("ProductsChannelList", "Admin");
        }
        #endregion
        #region Get Product Price
        public JsonResult GetProductPrice(string s)
        {
            JsonResult objJR = Json(new { Status = "failed" }, JsonRequestBehavior.AllowGet);
            try
            {
                long id = Convert.ToInt64(s);
                JsonResult objBR = Json(new { data = db.Products.Where(x => x.Product_id == id).Select(x => new { x.Product_Price, x.Product_currency }).ToList() }, JsonRequestBehavior.AllowGet);
                return objBR;
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "GetProductPrice_JSON", ex.ToString());
            }
            return objJR;
        }
        #endregion
        #region Get Product Price with thousand separator
        public JsonResult GetProductPriceThousandSeparator(string s)
        {
            JsonResult objJR = Json(new { Status = "failed" }, JsonRequestBehavior.AllowGet);
            try
            {
                long id = Convert.ToInt64(s);
                IEnumerable<Product> lst = db.Products.Where(x => x.Product_id == id).ToList();
                JsonResult objBR = Json(new { data = lst.Select(x => new string[] { string.Format("{0:n}", x.Product_Price), x.Product_currency }) }, JsonRequestBehavior.AllowGet);
                return objBR;
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "GetProductPrice_JSON", ex.ToString());
            }
            return objJR;
        }
        #endregion
        #region Channel Gadgets List
        public ActionResult GadgetsChannelList(long? id, string status)
        {
            try
            {
                if (id.HasValue)
                {
                    Lnk_Gadgets_Channels objGadget = db.Lnk_Gadgets_Channels.SingleOrDefault(x => x.Lnk_Gadgets_Channels_id == id);
                    if (!string.IsNullOrEmpty(status))
                    {
                        if (status.Equals("active"))
                        {
                            if (objGadget.Lnk_Gadget_IsActive == true)
                                objGadget.Lnk_Gadget_IsActive = false;
                            else
                                objGadget.Lnk_Gadget_IsActive = true;
                        }
                        else if (status.Equals("delete"))
                        {
                            if (objGadget.Lnk_Gadget_IsDeleted == true)
                                objGadget.Lnk_Gadget_IsDeleted = false;
                            else
                                objGadget.Lnk_Gadget_IsDeleted = true;
                        }
                        objGadget.Lnk_Gadget_DateCreated = DateTime.Now;
                        objGadget.ModifiedBy = UserContext.Identity.userId;
                        AdminBAL.AddUpdateChannelGadgets(objGadget);
                        RouteData.Values.Remove("id");
                        return RedirectToAction("GadgetsChannelList", "Admin");
                    }
                }
                List<VwChannelGadgets> lstGadgets = db.VwChannelGadgets.OrderByDescending(x => x.Lnk_Gadget_DateCreated).ToList();
                return View(lstGadgets);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "GadgetsChannelList_GET", ex.ToString());
            }
            return View();
        }
        #endregion
        #region Add or Update Channel Gadgets
        public ActionResult AddChannelGadgets(long? id)
        {
            try
            {
                ViewBag.Gadgets = new SelectList(AdminBAL.GetAllGadgets(), "Gadget_id", "Gadget_Name");
                ViewBag.Channels = new SelectList(AdminBAL.GetAllChannels(), "Channel_id", "Channel_Name");
                Lnk_Gadgets_Channels objGadget = new Lnk_Gadgets_Channels();
                if (id.HasValue)
                    objGadget = db.Lnk_Gadgets_Channels.SingleOrDefault(x => x.Lnk_Gadgets_Channels_id == id);
                return View(objGadget);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "AddChannelGadgets_GET", ex.ToString());
            }
            return View();
        }
        [HttpPost]
        public ActionResult AddChannelGadgets(Lnk_Gadgets_Channels objGadget)
        {
            try
            {
                objGadget.Lnk_Gadget_IsActive = true;
                objGadget.Lnk_Gadget_IsDeleted = false;
                objGadget.Lnk_Gadget_DateCreated = DateTime.Now;
                Lnk_Gadgets_Channels objChannelGadget = db.Lnk_Gadgets_Channels.SingleOrDefault(x => x.Channel_id == objGadget.Channel_id && x.Gadget_id == objGadget.Gadget_id);
                List<Lnk_Gadgets_Channels> lstChannelGadgets = db.Lnk_Gadgets_Channels.Where(x => x.Gadget_id == objGadget.Gadget_id).ToList();

                if (objGadget.Lnk_Gadgets_Channels_id > 0)
                {
                    objChannelGadget = db.Lnk_Gadgets_Channels.SingleOrDefault(x => x.Lnk_Gadgets_Channels_id == objGadget.Lnk_Gadgets_Channels_id);
                    if (objChannelGadget.Gadget_id == objGadget.Gadget_id)
                    {
                        objGadget.ModifiedBy = UserContext.Identity.userId;
                        AdminBAL.AddUpdateChannelGadgets(objGadget);
                        TempData["Msg"] = "<div class=\"alert alert-success alert-dismissable\"><button aria-hidden=\"true\" data-dismiss=\"alert\" class=\"close\" type=\"button\">×</button><h4><i class=\"icon fa fa-check\">Successfully Saved</i></h4></div>";
                        return RedirectToAction("GadgetsChannelList", "Admin");
                    }
                }

                if (objChannelGadget != null || lstChannelGadgets.Count > 0)
                {
                    TempData["Msg"] = "<div class=\"alert alert-danger alert-dismissable\"><button aria-hidden=\"true\" data-dismiss=\"alert\" class=\"close\" type=\"button\">×</button><h4><i class=\"icon fa fa-ban\">Already Exists</i></h4></div>";
                }
                else
                {
                    objGadget.ModifiedBy = UserContext.Identity.userId;
                    AdminBAL.AddUpdateChannelGadgets(objGadget);
                    TempData["Msg"] = "<div class=\"alert alert-success alert-dismissable\"><button aria-hidden=\"true\" data-dismiss=\"alert\" class=\"close\" type=\"button\">×</button><h4><i class=\"icon fa fa-check\">Successfully Saved</i></h4></div>";
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "AddChannelGadgets_POST", ex.ToString());
            }
            return RedirectToAction("GadgetsChannelList", "Admin");
        }
        #endregion
        #region Add Schedule
        public ActionResult AddSchedule(long? id)
        {
            try
            {
                Schedule objSchedule = new Schedule();
                if (id.HasValue)
                {
                    objSchedule = db.Schedule.SingleOrDefault(x => x.Schedule_Id == id);
                }
                return View(objSchedule);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "AddSchedule_GET", ex.ToString());
            }
            return View();
        }
        [HttpPost]
        public ActionResult AddSchedule(Schedule objSchedule)
        {
            try
            {
                objSchedule.Schedule_IsActive = true;
                objSchedule.Schedule_IsDeleted = false;
                objSchedule.Schedule_DateCreated = DateTime.Now;
                objSchedule.ModifiedBy = UserContext.Identity.userId;
                AdminBAL.AddUpdateSchedule(objSchedule);
                ViewBag.msg = _AppContext.Messages.Success;
                ModelState.Clear();
                return View();
            }
            catch (Exception ex)
            {
                ViewBag.msg = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Admin", "AddSchedule_GET", ex.ToString());
            }
            return View();
        }
        #endregion
        #region ScheduleList
        public ActionResult ScheduleList(long? id, string status)
        {
            try
            {
                if (id.HasValue && !string.IsNullOrEmpty(status))
                {
                    Schedule objSchedule = db.Schedule.SingleOrDefault(x => x.Schedule_Id == id);
                    if (objSchedule != null)
                    {
                        if (status.Equals("delete"))
                        {
                            if (objSchedule.Schedule_IsDeleted == false)
                                objSchedule.Schedule_IsDeleted = true;
                            else
                                objSchedule.Schedule_IsDeleted = false;
                        }
                        else if (status.Equals("active"))
                        {
                            if (objSchedule.Schedule_IsActive == false)
                                objSchedule.Schedule_IsActive = true;
                            else
                                objSchedule.Schedule_IsActive = false;
                        }
                        objSchedule.Schedule_DateCreated = DateTime.Now;
                        objSchedule.ModifiedBy = UserContext.Identity.userId;
                        AdminBAL.AddUpdateSchedule(objSchedule);
                        RouteData.Values.Remove("id");
                        return RedirectToAction("ScheduleList", "Admin");
                    }
                }
                List<Schedule> lst = db.Schedule.OrderByDescending(x => x.Schedule_DateCreated).ToList();
                return View(lst);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "ScheduleList_GET", ex.ToString());
            }
            return View();
        }
        #endregion
        #region IsScheduleExists
        public JsonResult IsScheduleExists(string Data)
        {
            JsonResult objJR = Json(new { Status = "failed" }, JsonRequestBehavior.AllowGet);
            try
            {
                JavaScriptSerializer oSerializer = new JavaScriptSerializer();
                Dictionary<string, object> schedule = (Dictionary<string, object>)oSerializer.Deserialize(Data, typeof(object));
                string schedulename = Convert.ToString(schedule["Schedule_Name"]);
                long scheduleid = Convert.ToInt64(schedule["Schedule_Id"]);
                JsonResult objBR = Json(new { Status = "Success", Result = Convert.ToBoolean(db.Schedule.Where(x => x.Schedule_Name.ToLower() == schedulename.ToLower()).Select(y => y.Schedule_Name).ToList().Count) }, JsonRequestBehavior.AllowGet);
                if (scheduleid > 0) // Schedule is being edited 
                {
                    if (schedulename != db.Schedule.Single(x => x.Schedule_Id == scheduleid).Schedule_Name) //Schedule is being edited and Schedule name changed then check whether it exists or not
                    {
                        return objBR;
                    }
                    else
                    {
                        return Json(new { Status = "Success", Result = false }, JsonRequestBehavior.AllowGet);//Schedule is being edited and Schedule is not changed then return false
                    }
                }
                else
                {
                    return objBR;
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "IsRoleExists_JSON", ex.ToString());
            }
            return objJR;
        }
        #endregion
        #region Add Price Schedule to Channel Products
        public ActionResult AddPriceScheduletoChannels(long? id)
        {
            try
            {
                Lnk_Products_Channels objProduct = new Lnk_Products_Channels();
                if (id.HasValue)
                {
                    objProduct = db.Lnk_Products_Channels.SingleOrDefault(x => x.Lnk_Products_Channels_id == id);
                }
                ViewBag.Products = new SelectList(AdminBAL.GetAllProducts(), "Product_id", "Product_Name");
                ViewBag.Currency = new SelectList(AdminBAL.GetAllCurrency(), "CurrencySymbol", "CurrencySymbol");
                ViewBag.schedule = new SelectList(AdminBAL.GetAllSchedule(), "Schedule_Id", "Schedule_Name");
                ViewBag.PriceList = new SelectList(db.PriceList.Where(x => x.PriceList_IsActive == true).OrderByDescending(x => x.PriceList_IsDefault).ToList(), "PriceList_id", "PriceList_Name");
                List<Channel> lstChannels = db.Channels.Where(x => x.Channel_IsActive == true && x.Channel_IsDeleted == false).ToList();
                List<Lnk_Products_Channels> lstProductChannel = db.Lnk_Products_Channels.Where(x => x.Product_id == objProduct.Product_id).ToList();
                foreach (var item in lstProductChannel)
                {
                    lstChannels.Find(x => x.Channel_id == item.Channel_id).Channel_IsSelected = true;
                }
                var tplChannels = new Tuple<Lnk_Products_Channels, List<Channel>>(objProduct, lstChannels) { };
                return View(tplChannels);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "AddPriceScheduletoChannels_GET", ex.ToString());
            }
            return View();
        }
        [HttpPost]
        public ActionResult AddPriceScheduletoChannels(Lnk_Products_Channels item1, FormCollection frm)
        {
            try
            {
                item1.Product_IsActive = true;
                item1.Product_IsDeleted = false;
                item1.Product_DateCreated = DateTime.Now;
                List<long> Channel_ids = string.IsNullOrEmpty(frm["hdnChannelIds"]) ? new List<long>() : frm["hdnChannelIds"].Split(',').Select(long.Parse).ToList();
                if (Channel_ids != null)
                {
                    item1.ModifiedBy = UserContext.Identity.userId;
                    AdminBAL.AddUpdateChannelProducts(item1, Channel_ids);
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "AddPriceScheduletoChannels_POST", ex.ToString());
            }
            return RedirectToAction("ChannelProductSchedulesList", "Admin");
        }
        #endregion
        #region ChannelProductSchedulesList
        public ActionResult ChannelProductSchedulesList(long? id)
        {
            try
            {
                if (id.HasValue)
                {
                    Lnk_Products_Channels objProduct = db.Lnk_Products_Channels.SingleOrDefault(x => x.Lnk_Products_Channels_id == id);
                    if (objProduct != null)
                    {
                        Schedule_History objHistory = new Schedule_History();
                        objHistory.Channel_Name = AdminBAL.GetChannelNameById(objProduct.Channel_id);
                        objHistory.Product_Name = AdminBAL.GetProductNameById(objProduct.Product_id);
                        objHistory.Original_Price = objProduct.Product_Price;
                        objHistory.Scheduled_Price = objProduct.Scheduled_Price;
                        objHistory.Scheduled_Date = DateTime.Now;
                        objHistory.ModifiedBy = UserContext.Identity.userId;
                        AdminBAL.AddScheduleHistory(objHistory);

                        objProduct.Product_Price = objProduct.Scheduled_Price;
                        objProduct.PriceSchedule_Id = null;
                        objProduct.Scheduled_Price = null;
                        objProduct.ModifiedBy = UserContext.Identity.userId;
                        AdminBAL.UpdateChannelProductStatus(objProduct);
                    }
                }
                List<VwChannelProductSchedule> lst = db.VwChannelProductSchedule.OrderByDescending(x => x.Product_DateCreated).ToList();
                return View(lst);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "ChannelProductSchedulesList_GET", ex.ToString());
            }
            return View();
        }
        #endregion
        #region ChannelProductScheduleHistory
        public ActionResult ChannelProductScheduleHistory()
        {
            List<Schedule_History> lstHistory = db.Schedule_History.OrderByDescending(x => x.Scheduled_Date).ToList();
            return View(lstHistory);
        }
        #endregion

        #region Create Roles
        public ActionResult AddRole(long? id)
        {
            try
            {
                bool flag = false;
                var tplRole = new Tuple<Role, List<Permission>>(null, null) { };
                if (_AppContext.HasPermission(Parameters.Can_Assign_PermissionsToRoles) && id.HasValue)
                {
                    flag = true;
                }
                else if (_AppContext.HasPermission(Parameters.Can_Create_Role))
                {
                    flag = true;
                }
                if (flag)
                {
                    Role objRole = new Role();
                    List<Permission> lstPermission = db.Permissions.ToList();
                    List<Lnk_Role_Permission> lstRolePermissions = new List<Lnk_Role_Permission>();
                    if (id.HasValue)
                    {
                        objRole = db.Roles.SingleOrDefault(x => x.Role_id == id);
                        lstRolePermissions = db.Lnk_Role_Permission.Where(x => x.Role_id == id).ToList();
                        if (lstRolePermissions != null && lstRolePermissions.Count() > 0)
                        {
                            foreach (var item in lstRolePermissions)
                            {
                                //Making PermissionIsSelected true if already saved in Lnk_Role_Permission table. This will make checkboxlist selected according to the matching values.
                                lstPermission.Find(x => x.Permission_Id == item.Permission_id).PermissionIsSelected = true;
                            }
                            lstPermission = lstPermission.OrderByDescending(x => x.PermissionIsSelected).ToList();
                        }
                    }
                    tplRole = new Tuple<Role, List<Permission>>(objRole, lstPermission) { };
                }
                return View(tplRole);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "AddRole_GET", ex.ToString());
            }
            return View();
        }
        [HttpPost]
        public ActionResult AddRole(Role item1, FormCollection frm)
        {
            try
            {
                bool flag = false;
                if (item1.Role_id > 0)//Edit role
                {
                    if (_AppContext.HasPermission(Parameters.Can_Assign_PermissionsToRoles))
                    {
                        flag = true;
                    }
                }
                else //Add role
                {
                    if (_AppContext.HasPermission(Parameters.Can_Create_Role))
                    {
                        flag = true;
                    }
                }
                if (flag == true)
                {
                    List<long> Permission_Ids = string.IsNullOrEmpty(frm["hdnPermission"]) ? new List<long>() : frm["hdnPermission"].Split(',').Select(long.Parse).ToList();
                    item1.Role_IsActive = true;
                    item1.Role_IsDeleted = false;
                    item1.Role_DateCreated = DateTime.Now;
                    item1.ModifiedBy = UserContext.Identity.userId;
                    AdminBAL.AddUpdateRole(item1);
                    AdminBAL.AddUpdateRolePermissions(item1.Role_id, Permission_Ids);
                    TempData["msg"] = _AppContext.Messages.Success;
                }
            }
            catch (Exception ex)
            {
                TempData["msg"] = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Admin", "AddRole_GET", ex.ToString());
            }
            return RedirectToAction("RolePermissionsList", "Admin");
        }
        #endregion
        #region RolePermissionsList
        public ActionResult RolePermissionsList(long? id, string status)
        {
            try
            {
                if (id.HasValue)
                {
                    bool flagCanActive = false, flagCanDelete = false;
                    if (_AppContext.HasPermission(Parameters.Can_Assign_PermissionsToRoles) && _AppContext.HasPermission(Parameters.Can_Delete_Roles))
                    {
                        flagCanActive = flagCanDelete = true;
                    }
                    else if (_AppContext.HasPermission(Parameters.Can_Delete_Roles))
                    {
                        flagCanDelete = true;
                    }
                    Role objRole = db.Roles.SingleOrDefault(x => x.Role_id == id);
                    if (objRole != null)
                    {
                        if (!string.IsNullOrEmpty(status))
                        {
                            if (status.Equals("active") && flagCanActive)
                            {
                                if (objRole.Role_IsActive == true)
                                    objRole.Role_IsActive = false;
                                else
                                    objRole.Role_IsActive = true;
                            }
                            else if (status.Equals("delete") && flagCanDelete)
                            {
                                if (objRole.Role_IsDeleted == true)
                                    objRole.Role_IsDeleted = false;
                                else
                                    objRole.Role_IsDeleted = true;
                            }
                            if (flagCanActive || flagCanDelete)
                            {
                                objRole.Role_DateCreated = DateTime.Now;
                                objRole.ModifiedBy = UserContext.Identity.userId;
                                AdminBAL.AddUpdateRole(objRole);
                            }
                            RouteData.Values.Remove("id");
                            return RedirectToAction("RolePermissionsList", "Admin");
                        }
                    }
                }
                List<Role> lstRole = db.Roles.OrderByDescending(x => x.Role_DateCreated).ToList();
                return View(lstRole);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "RolePermissionsList_GET", ex.ToString());
            }
            return View();
        }
        #endregion
        #region IsRoleExists
        public JsonResult IsRoleExists(string Data)
        {
            JsonResult objJR = Json(new { Status = "failed" }, JsonRequestBehavior.AllowGet);
            try
            {
                JavaScriptSerializer oSerializer = new JavaScriptSerializer();
                Dictionary<string, object> roles = (Dictionary<string, object>)oSerializer.Deserialize(Data, typeof(object));
                string rolename = Convert.ToString(roles["rolename"]);
                long roleid = Convert.ToInt64(roles["roleid"]);
                JsonResult objBR = Json(new { Status = "Success", Result = Convert.ToBoolean(db.Roles.Where(x => x.RoleName.ToLower() == rolename.ToLower()).Select(y => y.RoleName).ToList().Count) }, JsonRequestBehavior.AllowGet);
                if (roleid > 0) //role is being edited 
                {
                    if (rolename != db.Roles.Single(x => x.Role_id == roleid).RoleName) //role is being edited and role name changed then check whether it exists or not
                    {
                        return objBR;
                    }
                    else
                    {
                        return Json(new { Status = "Success", Result = false }, JsonRequestBehavior.AllowGet);//role is being edited and rolename is not changed then return false
                    }
                }
                else
                {
                    return objBR;
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "IsRoleExists_JSON", ex.ToString());
            }
            return objJR;
        }
        #endregion

        //#region AddCustomerRole
        //public ActionResult AddCustomerRole(long? id)
        //{
        //    try
        //    {
        //        bool flag = false;
        //        var tplRole = new Tuple<Customer_Roles, List<CustomerPermissions>>(null, null) { };
        //        if (_AppContext.HasPermission(Parameters.Can_Assign_PermissionsToRoles) && id.HasValue)
        //        {
        //            flag = true;
        //        }
        //        else if (_AppContext.HasPermission(Parameters.Can_Create_Role))
        //        {
        //            flag = true;
        //        }
        //        if (flag)
        //        {
        //            Customer_Roles objRole = new Customer_Roles();
        //            List<CustomerPermissions> lstPermission = db.CustomerPermissions.ToList();
        //            List<LnkCustomer_Role_Permission> lstRolePermissions = new List<LnkCustomer_Role_Permission>();
        //            if (id.HasValue)
        //            {
        //                objRole = db.Customer_Roles.SingleOrDefault(x => x.Customer_RoleId == id);
        //                lstRolePermissions = db.LnkCustomer_Role_Permission.Where(x => x.Role_id == id).ToList();
        //                if (lstRolePermissions != null && lstRolePermissions.Count() > 0)
        //                {
        //                    foreach (var item in lstRolePermissions)
        //                    {
        //                        //Making PermissionIsSelected true if already saved in Lnk_Role_Permission table. This will make checkboxlist selected according to the matching values.
        //                        lstPermission.Find(x => x.Permission_Id == item.Permission_id).PermissionIsSelected = true;
        //                    }
        //                    lstPermission = lstPermission.OrderByDescending(x => x.PermissionIsSelected).ToList();
        //                }
        //            }
        //            tplRole = new Tuple<Customer_Roles, List<CustomerPermissions>>(objRole, lstPermission) { };
        //        }
        //        return View(tplRole);
        //    }
        //    catch (Exception ex)
        //    {
        //        _AppContext.WriteLogFile("Admin", "AddRole_GET", ex.ToString());
        //    }
        //    return View();
        //}
        //[HttpPost]
        //public ActionResult AddCustomerRole(Customer_Roles item1, FormCollection frm)
        //{
        //    try
        //    {
        //        bool flag = false;
        //        if (item1.Customer_RoleId > 0)//Edit role
        //        {
        //            if (_AppContext.HasPermission(Parameters.Can_Assign_PermissionsToRoles))
        //            {
        //                flag = true;
        //            }
        //        }
        //        else //Add role
        //        {
        //            if (_AppContext.HasPermission(Parameters.Can_Create_Role))
        //            {
        //                flag = true;
        //            }
        //        }
        //        if (flag == true)
        //        {
        //            List<long> Permission_Ids = string.IsNullOrEmpty(frm["hdnPermission"]) ? new List<long>() : frm["hdnPermission"].Split(',').Select(long.Parse).ToList();
        //            item1.Role_IsActive = true;
        //            item1.Role_IsDeleted = false;
        //            item1.Role_DateCreated = DateTime.Now;
        //            AdminBAL.AddUpdateCustomerRole(item1);
        //            AdminBAL.AddUpdateCustomerRolePermissions(item1.Customer_RoleId, Permission_Ids);
        //            TempData["msg"] = _AppContext.Messages.Success;
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        TempData["msg"] = _AppContext.Messages.Error;
        //        _AppContext.WriteLogFile("Admin", "AddRole_GET", ex.ToString());
        //    }
        //    return RedirectToAction("RolePermissionsList", "Admin");
        //}
        //#endregion

        #region Add Customer Types
        public ActionResult AddCustomerTypes(long? id)
        {
            try
            {
                CustomerType objCustomerType = new CustomerType();
                if (id.HasValue)
                {
                    objCustomerType = db.CustomerTypes.SingleOrDefault(x => x.CustomerType_id == id);
                }
                return View(objCustomerType);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "AddCustomerTypes_GET", ex.ToString());
            }
            return RedirectToAction("CustomerTypesList", "Admin");
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddCustomerTypes(CustomerType objCustomerType)
        {
            try
            {
                Approval objApp = db.Approval.SingleOrDefault(x => x.TableName == "CustomerTypes");
                objCustomerType.DateCreated = DateTime.Now;
                objCustomerType.IsActive = true;
                objCustomerType.IsDeleted = false;
                if (objApp.IsApprovalReqEdit == true && (UserContext.Identity.roleType != objApp.FirstApprover && UserContext.Identity.roleType != objApp.SecondApprover) && objCustomerType.CustomerType_id > 0)
                {
                    objCustomerType.IsbeingEdited = true;
                    objCustomerType.IsEditApproved = false;
                }
                else
                {
                    objCustomerType.IsbeingEdited = false;
                    objCustomerType.IsEditApproved = true;
                }
                if (objApp.IsApprovalReqAdd == true && (UserContext.Identity.roleType != objApp.FirstApprover && UserContext.Identity.roleType != objApp.SecondApprover) && objCustomerType.CustomerType_id == 0)
                {
                    objCustomerType.IsAddApproved = false;
                }
                else
                {
                    objCustomerType.IsAddApproved = true;
                }
                if (objCustomerType.CustomerType_id == 0)
                {
                    objCustomerType.IsDelApproved = true;
                    objCustomerType.IsDeletedFlag = -1;
                }
                objCustomerType.ModifiedBy = UserContext.Identity.userId;
                AdminBAL.AddUpdateCustomerType(objCustomerType);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "AddCustomerTypes_GET", ex.ToString());
            }
            return RedirectToAction("CustomerTypesList", "Admin");
        }
        #endregion
        #region Customer Type List
        public ActionResult CustomerTypesList(long? id, string status)
        {
            try
            {
                if (id.HasValue)
                {
                    CustomerType objCustomerType = db.CustomerTypes.SingleOrDefault(x => x.CustomerType_id == id);
                    Approval objApp = db.Approval.SingleOrDefault(x => x.TableName == "CustomerTypes");
                    if (objCustomerType != null)
                    {
                        if (!string.IsNullOrEmpty(status))
                        {
                            if (status.Equals("active"))
                            {
                                if (objCustomerType.IsActive == true)
                                    objCustomerType.IsActive = false;
                                else
                                    objCustomerType.IsActive = true;
                            }
                            else if (status.Equals("delete"))
                            {
                                if (objApp.IsApprovalReqDelete == false || UserContext.Identity.roleType == objApp.FirstApprover || UserContext.Identity.roleType == objApp.SecondApprover)
                                {
                                    if (objCustomerType.IsDeleted == true)
                                        objCustomerType.IsDeleted = false;
                                    else
                                        objCustomerType.IsDeleted = true;
                                    objCustomerType.IsDelApproved = true;
                                }
                                else
                                {
                                    if (objCustomerType.IsDeletedFlag == 1)
                                        objCustomerType.IsDeletedFlag = 0;
                                    else
                                        objCustomerType.IsDeletedFlag = 1;
                                    objCustomerType.IsDelApproved = false;
                                }
                            }
                            objCustomerType.DateCreated = DateTime.Now;
                            objCustomerType.ModifiedBy = UserContext.Identity.userId;
                            AdminBAL.AddUpdateCustomerType(objCustomerType);
                        }
                    }
                }
                List<CustomerType> lstCustomerType = db.CustomerTypes.OrderByDescending(x => x.DateCreated).ToList();
                return View(lstCustomerType);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "CustomerTypesList_GET", ex.ToString());
            }
            return View();
        }
        #endregion
        #region IsCustomerTypeExists
        public JsonResult IsCustomerTypeExists(string Data)
        {
            JsonResult objJR = Json(new { Status = "failed" }, JsonRequestBehavior.AllowGet);
            try
            {
                JavaScriptSerializer oSerializer = new JavaScriptSerializer();
                Dictionary<string, object> custtypeDetails = (Dictionary<string, object>)oSerializer.Deserialize(Data, typeof(object));
                string customerType = Convert.ToString(custtypeDetails["Customer_Type"]);
                long customerTypeId = Convert.ToInt64(custtypeDetails["CustomerType_id"]);
                JsonResult objBR = Json(new { Status = "Success", Result = Convert.ToBoolean(db.CustomerTypes.Where(x => x.Customer_Type.ToLower() == customerType.ToLower()).Select(y => y.Customer_Type).ToList().Count) }, JsonRequestBehavior.AllowGet);
                if (customerTypeId > 0)
                {
                    if (customerType != db.CustomerTypes.Single(x => x.CustomerType_id == customerTypeId).Customer_Type)
                    {
                        return objBR;
                    }
                    else
                    {
                        return Json(new { Status = "Success", Result = false }, JsonRequestBehavior.AllowGet);
                    }
                }
                else
                {
                    return objBR;
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "IsCustomerTypeExists_JSON", ex.ToString());
            }
            return objJR;
        }
        #endregion

        #region Add Customer
        public ActionResult AddCustomer(long? id, string type)
        {
            try
            {
                ViewBag.isDesignationSet = false;
                ViewBag.Countries = new SelectList(AdminBAL.GetAllCountries(), "CountryName", "CountryName");
                ViewBag.Roles = new SelectList(AdminBAL.GetAllCustomerRoles(), "Customer_RoleId", "Customer_RoleName");
                ViewBag.PaymentTerms = new SelectList(db.Payment_Terms.ToList(), "PaymentTerm_id", "PaymentTerm_Name");
                ViewBag.pricelist = new SelectList(db.PriceList.OrderByDescending(x => x.PriceList_IsDefault).ToList(), "PriceList_id", "PriceList_Name");
                ViewBag.CustTax = new SelectList(AdminBAL.GetAllCustomerTaxCategories(), "CustCatID", "CustCatName");
                ViewBag.Currency = new SelectList(AdminBAL.GetAllCurrency(), "CurrencySymbol", "CurrencySymbol","USD");
                DiscountsList defaultDiscount = db.DiscountsList.SingleOrDefault(x => x.DiscountList_IsDefault == true);
                long defaultID = 0;
                if (defaultDiscount != null)
                    defaultID = defaultDiscount.DiscountList_id;
                ViewBag.discountlist = new SelectList(db.DiscountsList.OrderByDescending(x => x.DiscountList_IsDefault).ToList(), "DiscountList_id", "DiscountList_Name", defaultID);
                //ViewBag.Roles = new SelectList(AdminBAL.GetAllRoles(), "Role_id", "RoleName");
                Customer objCustomer = new Customer();
                objCustomer.CustomerDesignation = type;
                List<CustomerType> lstCustomerType = db.CustomerTypes.Where(x => x.IsActive == true && x.IsDeleted == false).ToList();
                if (id.HasValue)
                {
                    objCustomer = db.Customers.SingleOrDefault(x => x.Customer_id == id);
                    if (objCustomer != null)
                    {
                        if (objCustomer.CustomerDesignation != null)
                            ViewBag.isDesignationSet = true;
                    }
                    List<Lnk_Customers_CustomerTypes> lstCustCustTypes = db.Lnk_Customers_CustomerTypes.Where(x => x.Customer_id == objCustomer.Customer_id).ToList();
                    if (lstCustCustTypes.Count > 0 && lstCustCustTypes != null)
                    {
                        foreach (var item in lstCustCustTypes)
                        {
                            lstCustomerType.Find(x => x.CustomerType_id == item.CustomerType_id).IsSelected = true;
                        }
                        lstCustomerType = lstCustomerType.OrderByDescending(x => x.IsSelected).ToList();
                    }
                }
                List<CustomTableFields> lstCustomTableFields = db.CustomTableFields.Where(x => x.TableName == "Customers" && x.IsActive == true).ToList();
                var tplCustomer = new Tuple<Customer, List<CustomerType>, List<CustomTableFields>>(objCustomer, lstCustomerType, lstCustomTableFields) { };
                if (type.Equals("Individual"))
                    return View(tplCustomer);
                else
                    return View("AddCorporateCustomer", tplCustomer);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "AddCustomer_GET", ex.ToString());
            }
            return RedirectToAction("CustomersList", "Admin");
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddCustomer(Customer item1, FormCollection frm)
        {
            try
            {
                bool flag = false;
                List<long> CustomerType_ids = string.IsNullOrEmpty(frm["hdnCusttype"]) ? new List<long>() : frm["hdnCusttype"].Split(',').Select(long.Parse).ToList();
                item1.IsActive = true;
                item1.IsDeleted = false;
                item1.ModifiedBy = UserContext.Identity.userId;
                if (item1.Customer_id == 0)
                {
                    item1.IsVerified = false;
                    flag = true; //New Customer
                    string pswd = _AppContext.GetRandomNumbers();
                    item1.Customer_Password = EncryptDecrypt.Encrypt(pswd, "@#Df4190^");
                    item1.ReportingPassword = CryptorEngineMd5.MD5Hash(pswd);
                }
                else
                {
                    Customer objCustomer = db.Customers.SingleOrDefault(x => x.Customer_id == item1.Customer_id);
                    item1.PasswordResetLnkDate = objCustomer.PasswordResetLnkDate;
                    item1.IsVerificationMailSent = objCustomer.IsVerificationMailSent;
                    item1.Customer_Password = objCustomer.Customer_Password;
                    item1.ReportingPassword = objCustomer.ReportingPassword;
                    if (objCustomer.CustomerDesignation != null)
                        item1.CustomerDesignation = objCustomer.CustomerDesignation;
                    if (objCustomer.AutoRedistributeFunds != null)
                        item1.AutoRedistributeFunds = objCustomer.AutoRedistributeFunds;
                    //********Audit Trail
                    Customer_AuditTrail objAudit = new Customer_AuditTrail();
                    if (objCustomer.AutoRedistributeFunds != item1.AutoRedistributeFunds)
                    {
                        objAudit.Field_Name = "AutoRedistributeFunds";
                        objAudit.FieldValueBeforeChange = Convert.ToString(objCustomer.AutoRedistributeFunds);
                        objAudit.FieldValueAfterChange = Convert.ToString(item1.AutoRedistributeFunds);
                        objAudit.Staff_Id = UserContext.Identity.userId;
                        objAudit.Customer_Id = item1.Customer_id;
                        objAudit.DateofChange = DateTime.Now;
                        AdminBAL.AddCustomerAuditTrail(objAudit);
                    }
                    if (objCustomer.CF1 != item1.CF1)
                    {
                        objAudit.Field_Name = "CF1";
                        objAudit.FieldValueBeforeChange = Convert.ToString(objCustomer.CF1);
                        objAudit.FieldValueAfterChange = Convert.ToString(item1.CF1);
                        objAudit.Staff_Id = UserContext.Identity.userId;
                        objAudit.Customer_Id = item1.Customer_id;
                        objAudit.DateofChange = DateTime.Now;
                        AdminBAL.AddCustomerAuditTrail(objAudit);
                    }
                    if (objCustomer.CF2 != item1.CF2)
                    {
                        objAudit.Field_Name = "CF2";
                        objAudit.FieldValueBeforeChange = Convert.ToString(objCustomer.CF2);
                        objAudit.FieldValueAfterChange = Convert.ToString(item1.CF2);
                        objAudit.Staff_Id = UserContext.Identity.userId;
                        objAudit.Customer_Id = item1.Customer_id;
                        objAudit.DateofChange = DateTime.Now;
                        AdminBAL.AddCustomerAuditTrail(objAudit);
                    }
                    if (objCustomer.CF3 != item1.CF3)
                    {
                        objAudit.Field_Name = "CF3";
                        objAudit.FieldValueBeforeChange = Convert.ToString(objCustomer.CF3);
                        objAudit.FieldValueAfterChange = Convert.ToString(item1.CF3);
                        objAudit.Staff_Id = UserContext.Identity.userId;
                        objAudit.Customer_Id = item1.Customer_id;
                        objAudit.DateofChange = DateTime.Now;
                        AdminBAL.AddCustomerAuditTrail(objAudit);
                    }
                    if (objCustomer.CF4 != item1.CF4)
                    {
                        objAudit.Field_Name = "CF4";
                        objAudit.FieldValueBeforeChange = Convert.ToString(objCustomer.CF4);
                        objAudit.FieldValueAfterChange = Convert.ToString(item1.CF4);
                        objAudit.Staff_Id = UserContext.Identity.userId;
                        objAudit.Customer_Id = item1.Customer_id;
                        objAudit.DateofChange = DateTime.Now;
                        AdminBAL.AddCustomerAuditTrail(objAudit);
                    }
                    if (objCustomer.CF5 != item1.CF5)
                    {
                        objAudit.Field_Name = "CF5";
                        objAudit.FieldValueBeforeChange = Convert.ToString(objCustomer.CF5);
                        objAudit.FieldValueAfterChange = Convert.ToString(item1.CF5);
                        objAudit.Staff_Id = UserContext.Identity.userId;
                        objAudit.Customer_Id = item1.Customer_id;
                        objAudit.DateofChange = DateTime.Now;
                        AdminBAL.AddCustomerAuditTrail(objAudit);
                    }
                    if (objCustomer.Customer_Country != item1.Customer_Country)
                    {
                        objAudit.Field_Name = "Customer_Country";
                        objAudit.FieldValueBeforeChange = Convert.ToString(objCustomer.Customer_Country);
                        objAudit.FieldValueAfterChange = Convert.ToString(item1.Customer_Country);
                        objAudit.Staff_Id = UserContext.Identity.userId;
                        objAudit.Customer_Id = item1.Customer_id;
                        objAudit.DateofChange = DateTime.Now;
                        AdminBAL.AddCustomerAuditTrail(objAudit);
                    }
                    if (objCustomer.Customer_DoB != item1.Customer_DoB)
                    {
                        objAudit.Field_Name = "Customer_DoB";
                        objAudit.FieldValueBeforeChange = Convert.ToString(objCustomer.Customer_DoB);
                        objAudit.FieldValueAfterChange = Convert.ToString(item1.Customer_DoB);
                        objAudit.Staff_Id = UserContext.Identity.userId;
                        objAudit.Customer_Id = item1.Customer_id;
                        objAudit.DateofChange = DateTime.Now;
                        AdminBAL.AddCustomerAuditTrail(objAudit);
                    }
                    if (objCustomer.Customer_Email != item1.Customer_Email)
                    {
                        objAudit.Field_Name = "Customer_Email";
                        objAudit.FieldValueBeforeChange = Convert.ToString(objCustomer.Customer_Email);
                        objAudit.FieldValueAfterChange = Convert.ToString(item1.Customer_Email);
                        objAudit.Staff_Id = UserContext.Identity.userId;
                        objAudit.Customer_Id = item1.Customer_id;
                        objAudit.DateofChange = DateTime.Now;
                        AdminBAL.AddCustomerAuditTrail(objAudit);
                    }
                    if (objCustomer.Customer_Gender != item1.Customer_Gender)
                    {
                        objAudit.Field_Name = "Customer_Gender";
                        objAudit.FieldValueBeforeChange = Convert.ToString(objCustomer.Customer_Gender);
                        objAudit.FieldValueAfterChange = Convert.ToString(item1.Customer_Gender);
                        objAudit.Staff_Id = UserContext.Identity.userId;
                        objAudit.Customer_Id = item1.Customer_id;
                        objAudit.DateofChange = DateTime.Now;
                        AdminBAL.AddCustomerAuditTrail(objAudit);
                    }
                    if (objCustomer.Customer_FirstName != item1.Customer_FirstName)
                    {
                        objAudit.Field_Name = "Customer_Name";
                        objAudit.FieldValueBeforeChange = Convert.ToString(objCustomer.Customer_FirstName);
                        objAudit.FieldValueAfterChange = Convert.ToString(item1.Customer_FirstName);
                        objAudit.Staff_Id = UserContext.Identity.userId;
                        objAudit.Customer_Id = item1.Customer_id;
                        objAudit.DateofChange = DateTime.Now;
                        AdminBAL.AddCustomerAuditTrail(objAudit);
                    }
                    if (objCustomer.Customer_OtherName != item1.Customer_OtherName)
                    {
                        objAudit.Field_Name = "Customer_OtherName";
                        objAudit.FieldValueBeforeChange = Convert.ToString(objCustomer.Customer_OtherName);
                        objAudit.FieldValueAfterChange = Convert.ToString(item1.Customer_OtherName);
                        objAudit.Staff_Id = UserContext.Identity.userId;
                        objAudit.Customer_Id = item1.Customer_id;
                        objAudit.DateofChange = DateTime.Now;
                        AdminBAL.AddCustomerAuditTrail(objAudit);
                    }
                    if (objCustomer.Customer_Phone != item1.Customer_Phone)
                    {
                        objAudit.Field_Name = "Customer_Phone";
                        objAudit.FieldValueBeforeChange = Convert.ToString(objCustomer.Customer_Phone);
                        objAudit.FieldValueAfterChange = Convert.ToString(item1.Customer_Phone);
                        objAudit.Staff_Id = UserContext.Identity.userId;
                        objAudit.Customer_Id = item1.Customer_id;
                        objAudit.DateofChange = DateTime.Now;
                        AdminBAL.AddCustomerAuditTrail(objAudit);
                    }
                    if (objCustomer.Customer_Role != item1.Customer_Role)
                    {
                        objAudit.Field_Name = "Customer_Role";
                        objAudit.FieldValueBeforeChange = Convert.ToString(objCustomer.Customer_Role);
                        objAudit.FieldValueAfterChange = Convert.ToString(item1.Customer_Role);
                        objAudit.Staff_Id = UserContext.Identity.userId;
                        objAudit.Customer_Id = item1.Customer_id;
                        objAudit.DateofChange = DateTime.Now;
                        AdminBAL.AddCustomerAuditTrail(objAudit);
                    }
                    if (objCustomer.CustomerDesignation != item1.CustomerDesignation)
                    {
                        objAudit.Field_Name = "CustomerDesignation";
                        objAudit.FieldValueBeforeChange = Convert.ToString(objCustomer.CustomerDesignation);
                        objAudit.FieldValueAfterChange = Convert.ToString(item1.CustomerDesignation);
                        objAudit.Staff_Id = UserContext.Identity.userId;
                        objAudit.Customer_Id = item1.Customer_id;
                        objAudit.DateofChange = DateTime.Now;
                        AdminBAL.AddCustomerAuditTrail(objAudit);
                    }
                    if (objCustomer.Discount_List_id != item1.Discount_List_id)
                    {
                        objAudit.Field_Name = "Discount_List_id";
                        objAudit.FieldValueBeforeChange = Convert.ToString(objCustomer.Discount_List_id);
                        objAudit.FieldValueAfterChange = Convert.ToString(item1.Discount_List_id);
                        objAudit.Staff_Id = UserContext.Identity.userId;
                        objAudit.Customer_Id = item1.Customer_id;
                        objAudit.DateofChange = DateTime.Now;
                        AdminBAL.AddCustomerAuditTrail(objAudit);
                    }
                    if (objCustomer.Payment_Term_id != item1.Payment_Term_id)
                    {
                        objAudit.Field_Name = "Payment_Term_id";
                        objAudit.FieldValueBeforeChange = Convert.ToString(objCustomer.Payment_Term_id);
                        objAudit.FieldValueAfterChange = Convert.ToString(item1.Payment_Term_id);
                        objAudit.Staff_Id = UserContext.Identity.userId;
                        objAudit.Customer_Id = item1.Customer_id;
                        objAudit.DateofChange = DateTime.Now;
                        AdminBAL.AddCustomerAuditTrail(objAudit);
                    }
                    if (objCustomer.Price_List_id != item1.Price_List_id)
                    {
                        objAudit.Field_Name = "Price_List_id";
                        objAudit.FieldValueBeforeChange = Convert.ToString(objCustomer.Price_List_id);
                        objAudit.FieldValueAfterChange = Convert.ToString(item1.Price_List_id);
                        objAudit.Staff_Id = UserContext.Identity.userId;
                        objAudit.Customer_Id = item1.Customer_id;
                        objAudit.DateofChange = DateTime.Now;
                        AdminBAL.AddCustomerAuditTrail(objAudit);
                    }
                    if (objCustomer.ReportingPassword != item1.ReportingPassword)
                    {
                        objAudit.Field_Name = "ReportingPassword";
                        objAudit.FieldValueBeforeChange = Convert.ToString(objCustomer.ReportingPassword);
                        objAudit.FieldValueAfterChange = Convert.ToString(item1.ReportingPassword);
                        objAudit.Staff_Id = UserContext.Identity.userId;
                        objAudit.Customer_Id = item1.Customer_id;
                        objAudit.DateofChange = DateTime.Now;
                        AdminBAL.AddCustomerAuditTrail(objAudit);
                    }
                    //********End Audit Trail
                }
                item1.DateCreated = DateTime.Now;
                item1.ModifiedBy = UserContext.Identity.userId;
                if (AdminBAL.AddUpdateCustomer(item1) == 1)
                {
                   // if (AdminBAL.AddUpdateCustomerCustomerTypes(item1.Customer_id, CustomerType_ids) == 1)
                   // {
                        if (flag)
                        {
                            if (!string.IsNullOrEmpty(item1.Customer_Email))
                            {
                                if (_AppContext.SendPasswordResetMail(item1))
                                {
                                    item1.PasswordResetLnkDate = DateTime.Now.AddDays(5);
                                    item1.IsVerificationMailSent = true;
                                    AdminBAL.AddUpdateCustomer(item1);
                                }
                            }
                        }
                   // }
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "AddCustomer_POST", ex.ToString());
            }
            return RedirectToAction("CustomersList", "Admin");
        }
        #endregion
        #region Customers List
        public ActionResult CustomersList(long? id, string status)
        {
            try
            {
                if (id.HasValue)
                {
                    Customer objCustomer = db.Customers.SingleOrDefault(x => x.Customer_id == id);
                    Customer_AuditTrail objAudit = new Customer_AuditTrail();
                    if (objCustomer != null)
                    {
                        if (!string.IsNullOrEmpty(status))
                        {
                            if (status.Equals("active"))
                            {
                                objAudit.Field_Name = "IsActive";
                                objAudit.FieldValueBeforeChange = objCustomer.IsActive.ToString();
                                if (objCustomer.IsActive == true)
                                    objCustomer.IsActive = false;
                                else
                                    objCustomer.IsActive = true;
                                objAudit.FieldValueAfterChange = objCustomer.IsActive.ToString();
                            }
                            else if (status.Equals("delete"))
                            {
                                objAudit.Field_Name = "IsDeleted";
                                objAudit.FieldValueBeforeChange = objCustomer.IsDeleted.ToString();
                                if (objCustomer.IsDeleted == true)
                                    objCustomer.IsDeleted = false;
                                else
                                    objCustomer.IsDeleted = true;
                                objAudit.FieldValueAfterChange = objCustomer.IsDeleted.ToString();
                            }
                            else if (status.Equals("autodist"))
                            {
                                objAudit.Field_Name = "AutoRedistributeFunds";
                                objAudit.FieldValueBeforeChange = objCustomer.AutoRedistributeFunds.ToString();
                                if (objCustomer.AutoRedistributeFunds == true)
                                    objCustomer.AutoRedistributeFunds = false;
                                else
                                    objCustomer.AutoRedistributeFunds = true;
                                objAudit.FieldValueAfterChange = objCustomer.AutoRedistributeFunds.ToString();
                            }
                            objCustomer.DateCreated = DateTime.Now;
                            objCustomer.ModifiedBy = UserContext.Identity.userId;
                            AdminBAL.AddUpdateCustomer(objCustomer);
                            objAudit.DateofChange = DateTime.Now;
                            objAudit.Customer_Id = id;
                            objAudit.Staff_Id = UserContext.Identity.userId;
                            objAudit.ModifiedBy = UserContext.Identity.userId;
                            AdminBAL.AddCustomerAuditTrail(objAudit);
                            RouteData.Values.Remove("id");
                            return RedirectToAction("CustomersList", "Admin");
                        }
                    }
                }
                List<Customer> lstCustomer = db.Customers.OrderByDescending(x => x.DateCreated).ToList();
                return View(lstCustomer);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "CustomersList_GET", ex.ToString());
            }
            return View();
        }
        #endregion
        #region Customer Details
        public ActionResult CustomerDetails(long? id)
        {
            try
            {
                if (id.HasValue)
                {
                    Customer objCustomer = db.Customers.SingleOrDefault(x => x.Customer_id == id);
                    ViewBag.RoleName = db.Customer_Roles.Single(x => x.Customer_RoleId == objCustomer.Customer_Role).Customer_RoleName;
                    List<Lnk_Customers_CustomerTypes> lstCustCustTypes = db.Lnk_Customers_CustomerTypes.Where(x => x.Customer_id == objCustomer.Customer_id).ToList();
                    List<CustomerType> lstCustomerTypes = db.CustomerTypes.Where(x => x.IsActive == true && x.IsDeleted == false).ToList();
                    foreach (var item in lstCustCustTypes)
                    {
                        lstCustomerTypes.Find(x => x.CustomerType_id == item.CustomerType_id).IsSelected = true;
                    }
                    lstCustomerTypes = lstCustomerTypes.Where(x => x.IsSelected == true).ToList();
                    var tplCustomer = new Tuple<Customer, List<CustomerType>>(objCustomer, lstCustomerTypes) { };
                    return View(tplCustomer);
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "CustomerDetails_GET", ex.ToString());
            }
            return View();
        }
        #endregion
        #region Add Customer Employee/Department
        /// <summary>
        /// Add or Update customer's employee or department
        /// </summary>
        /// <returns></returns>
        public ActionResult AddCustomerEmp(long? custId, long? id)
        {
            try
            {
                Employee objEmp = new Employee();
                if (id.HasValue)
                {
                    objEmp = db.Employees.SingleOrDefault(x => x.Emp_id == id);
                }
                if (custId.HasValue)
                {
                    objEmp.Emp_Customer_id = custId;
                    ViewBag.custName = AdminBAL.GetCustomerNameById(custId);//db.Customers.SingleOrDefault(x => x.Customer_id == custId).Customer_FirstName;
                }
                return View(objEmp);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "AddCustomerEmp_GET", ex.ToString());
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
                    ViewBag.custName = db.Customers.SingleOrDefault(x => x.Customer_id == objEmp.Emp_Customer_id).Customer_FirstName;
                    objEmp.Emp_IsActive = true;
                    objEmp.Emp_IsDeleted = false;
                    objEmp.Emp_DateCreated = DateTime.Now;
                    objEmp.ModifiedBy = UserContext.Identity.userId;
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
                return RedirectToAction("AddCustomerEmp", "Admin", new { custId = objEmp.Emp_Customer_id }); //Preserve query string
            }
            catch (Exception ex)
            {
                TempData["msg"] = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Admin", "AddCustomerEmp_GET", ex.ToString());
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
        public ActionResult CustomerEmpList(long? id, long? empId, string status)
        {
            try
            {
                if (empId.HasValue)
                {
                    if (!string.IsNullOrEmpty(status))
                    {
                        Employee objEmployee = db.Employees.SingleOrDefault(x => x.Emp_id == empId);
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
                            objEmployee.ModifiedBy = UserContext.Identity.userId;
                            AdminBAL.AddUpdateCustomerEmp(objEmployee);
                            //RouteData.Values.Remove("id");
                            //RedirectToAction("CustomerEmpList", "Admin");
                        }
                    }
                }
                if (id.HasValue)
                {
                    List<Employee> lstEmployees = db.Employees.Where(x => x.Emp_Customer_id == id).OrderByDescending(x => x.Emp_DateCreated).ToList();
                    ViewBag.custId = id;
                    ViewBag.custName = AdminBAL.GetCustomerNameById(id);//db.Customers.SingleOrDefault(x => x.Customer_id == id).Customer_FirstName;
                    return View(lstEmployees);
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "CustomerEmpList_GET", ex.ToString());
            }
            return View();
        }
        #endregion
        #region AssignCardstoEmp
        /// <summary>
        /// Assign Cards to Employees related to customer
        /// </summary>
        /// <param name="id">Customer Id</param>
        /// <returns></returns>
        public ActionResult AssignCardstoEmp(long? id, long? empId)
        {
            try
            {
                if (id.HasValue)
                {
                    Employee objEmployee = db.Employees.SingleOrDefault(x => x.Emp_id == empId && x.Emp_Customer_id == id && x.Emp_IsActive == true && x.Emp_IsDeleted == false); //Employee of Customer
                    if (objEmployee != null)
                    {
                        TempData["custId"] = id;
                        TempData["empId"] = empId;
                        TempData["employee"] = objEmployee.Emp_Name;
                        ViewBag.msg = _AppContext.Messages.ChangeStatus;
                        Cards objCard = new Cards();
                        List<Cards> lstCards = db.Cards.Where(x => x.Card_IsDeleted == false && x.Card_IsActive == true && x.Card_Owner == id && x.Card_IsAssignedtoEmp == false).OrderByDescending(x => x.Card_UpdateDate).ToList();
                        var tplCards = new Tuple<Cards, List<Cards>>(objCard, lstCards) { };
                        return View(tplCards);
                    }
                }
                ViewBag.msg = _AppContext.Messages.NotExist;
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "AssignCardstoEmp_GET", ex.ToString());
            }
            return View();
        }
        [HttpPost]
        public ActionResult AssignCardstoEmp(Cards item1, FormCollection frm)
        {
            try
            {
                List<long> Card_Ids = string.IsNullOrEmpty(frm["hdnCardId"]) ? new List<long>() : frm["hdnCardId"].Split(',').Select(long.Parse).ToList();
                long empId = Convert.ToInt64(frm["hdnEmpId"]);
                long custId = Convert.ToInt64(frm["hdnCustId"]);
                foreach (long item in Card_Ids)
                {
                    Cards objCard = db.Cards.Single(x => x.Card_id == item);
                    objCard.Card_Owner_Employee = empId;
                    objCard.Card_PIN = CryptorEngine.Encrypt(_AppContext.GetRandomNumbers());
                    objCard.Card_PrepaidAmt = item1.Card_PrepaidAmt;
                    objCard.Card_OverDraftValue = item1.Card_OverDraftValue;
                    objCard.Card_IsAssignedtoEmp = true;
                    objCard.Card_IsDeleted = false;
                    objCard.Card_IsActive = true;
                    objCard.Card_DateAssigned = DateTime.Now;
                    objCard.Card_UpdateDate = DateTime.Now;
                    objCard.ModifiedBy = UserContext.Identity.userId;
                    AdminBAL.AddUpdateCards(objCard);
                    ViewBag.msg = _AppContext.Messages.Success;
                }
                TempData["custId"] = custId;
                Employee objEmployee = db.Employees.Single(x => x.Emp_id == empId);
                TempData["employee"] = objEmployee.Emp_Name;
                TempData["empId"] = objEmployee.Emp_id;
                ModelState.Clear();
                Cards obj_Card = new Cards();
                List<Cards> lstCards = db.Cards.Where(x => x.Card_IsDeleted == false && x.Card_IsActive == true && x.Card_IsAssignedtoEmp == false && x.Card_Owner == custId).OrderByDescending(x => x.Card_UpdateDate).ToList();
                var tplCards = new Tuple<Cards, List<Cards>>(obj_Card, lstCards) { };
                return View(tplCards);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "AssignCardstoEmp_POST", ex.ToString());
            }
            return View();
        }
        #endregion
        #region Assign Accounts to Employees
        /// <summary>
        /// Assign Cards to Employees related to customer
        /// </summary>
        /// <param name="id">Customer Id</param>
        /// <returns></returns>
        public ActionResult AssignAccountstoEmp(long? id, long? empId)
        {
            try
            {
                if (id.HasValue)
                {
                    Employee objEmployee = db.Employees.SingleOrDefault(x => x.Emp_id == empId && x.Emp_Customer_id == id && x.Emp_IsActive == true && x.Emp_IsDeleted == false); //Employee of Customer
                    if (objEmployee != null)
                    {
                        TempData["custId"] = id;
                        TempData["empId"] = empId;
                        TempData["employee"] = objEmployee.Emp_Name;
                        ViewBag.msg = _AppContext.Messages.ChangeStatus;
                        Customer_Account objCard = new Customer_Account();
                        List<Customer_Account> lstCards = db.Customer_Account.Where(x => x.IsDeleted == false && x.Customer_id == id && x.Employee_id == null).OrderByDescending(x => x.DateCreated).ToList();
                        var tplCards = new Tuple<Customer_Account, List<Customer_Account>>(objCard, lstCards) { };
                        return View(tplCards);
                    }
                }
                ViewBag.msg = _AppContext.Messages.NotExist;
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "AssignAccountstoEmp_GET", ex.ToString());
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
                    objAccount.ModifiedBy = UserContext.Identity.userId;
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
                _AppContext.WriteLogFile("Admin", "AssignAccountstoEmp_POST", ex.ToString());
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
                        objAccount.ModifiedBy = UserContext.Identity.userId;
                        AdminBAL.AddUpdateCustomerAccount(objAccount);
                        return RedirectToAction("ViewEmpAccounts", "Admin", new { id = empid });
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
                _AppContext.WriteLogFile("Admin", "ViewEmpCards_GET", ex.ToString());
            }
            return View();
        }
        #endregion
        #region ViewEmpCards
        public ActionResult ViewEmpCards(long? id, string status)
        {
            try
            {
                if (id.HasValue && !string.IsNullOrEmpty(status)) //id = Card Id
                {
                    Cards objCard = db.Cards.SingleOrDefault(x => x.Card_id == id);
                    if (objCard != null)
                    {
                        if (status.Equals("assign"))
                        {
                            if (objCard.Card_IsAssignedtoEmp == true)
                                objCard.Card_IsAssignedtoEmp = false;
                            else
                                objCard.Card_IsAssignedtoEmp = true;
                        }
                        objCard.Card_UpdateDate = DateTime.Now;
                        objCard.ModifiedBy = UserContext.Identity.userId;
                        AdminBAL.AddUpdateCards(objCard);
                        return RedirectToAction("ViewEmpCards", "Admin", new { id = objCard.Card_Owner_Employee });
                    }
                }
                else if (id.HasValue) //id = Employee id
                {
                    List<Cards> lstCards = db.Cards.Where(x => x.Card_Owner_Employee == id).OrderByDescending(x => x.Card_UpdateDate).ToList();
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
                _AppContext.WriteLogFile("Admin", "ViewEmpCards_GET", ex.ToString());
            }
            return View();
        }
        #endregion
        #region EditEmpCard
        public ActionResult EditEmpCard(long? id)
        {
            try
            {
                Cards objCard = db.Cards.SingleOrDefault(x => x.Card_id == id);
                objCard.Card_PIN = CryptorEngine.Decrypt(objCard.Card_PIN);
                objCard.Card_SNO = CryptorEngine.Decrypt(objCard.Card_SNO);
                ViewBag.msg = _AppContext.Messages.ChangeStatus;
                return View(objCard);
            }
            catch (Exception ex)
            {
                ViewBag.msg = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Admin", "EditEmpCard_GET", ex.ToString());
            }
            ViewBag.msg = _AppContext.Messages.Error;
            return View();
        }
        [HttpPost]
        public ActionResult EditEmpCard(Cards objCard, long? id)
        {
            try
            {
                Cards objEmpCard = db.Cards.SingleOrDefault(x => x.Card_id == id);
                objEmpCard.Card_PIN = CryptorEngine.Encrypt(objCard.Card_PIN);
                objEmpCard.Card_OverDraftValue = objCard.Card_OverDraftValue;
                objEmpCard.Card_PrepaidAmt = objCard.Card_PrepaidAmt;
                objEmpCard.ModifiedBy = UserContext.Identity.userId;
                AdminBAL.AddUpdateCards(objEmpCard);
                ViewBag.msg = _AppContext.Messages.Success;
                objEmpCard.Card_PIN = CryptorEngine.Decrypt(objEmpCard.Card_PIN);
                objEmpCard.Card_SNO = CryptorEngine.Decrypt(objEmpCard.Card_SNO);
                return View(objEmpCard);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "EditEmpCard_POST", ex.ToString());
            }
            return View();
        }
        #endregion
        #region ViewEmpCardDetails
        public ActionResult ViewEmpCardDetails(long? id)
        {
            try
            {
                if (id.HasValue)
                {
                    Cards objCard = db.Cards.SingleOrDefault(x => x.Card_id == id);
                    if (objCard != null)
                    {
                        objCard.Card_SNO = CryptorEngine.Decrypt(objCard.Card_SNO);
                        objCard.Card_UID = CryptorEngine.Decrypt(objCard.Card_UID);
                        objCard.Card_PIN = CryptorEngine.Decrypt(objCard.Card_PIN);
                        return View(objCard);
                    }
                }
            }
            catch (Exception ex)
            {
                ViewBag.msg = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Admin", "ViewEmpCardDetails_GET", ex.ToString());
            }
            ViewBag.msg = _AppContext.Messages.Error;
            return View();
        }
        #endregion
        /******Accounts********/
        #region Assign Accounts
        public ActionResult AssignAccounts(long? id, long? accno)
        {
            try
            {
                List<MaskType> lstMaskType = db.MaskType.Where(x => x.Mask_IsDeleted == false).ToList();
                List<AccountType> lstAccType = db.AccountType.Where(x => x.AccIsDeleted == false).ToList();
                ViewBag.masktypes = new SelectList(lstMaskType, "Mask_Type", "Mask_Type");
                ViewBag.acctypes = new SelectList(lstAccType, "id", "AccType");
                Customer objCust = db.Customers.SingleOrDefault(x => x.Customer_id == id);
                ViewBag.custname = objCust.Customer_FirstName;
                Customer_Account objAcc = new Customer_Account();
                objAcc.Customer_id = id;
                if (accno.HasValue)
                {
                    objAcc = db.Customer_Account.SingleOrDefault(x => x.AccountNumber == accno);
                }
                return View(objAcc);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "AssignAccounts_GET", ex.ToString());
            }
            return View();
        }
        [HttpPost]
        public ActionResult AssignAccounts(Customer_Account objCustAcc)
        {
            try
            {
                List<MaskType> lstMaskType = db.MaskType.Where(x => x.Mask_IsDeleted == false).ToList();
                List<AccountType> lstAccType = db.AccountType.Where(x => x.AccIsDeleted == false).ToList();
                ViewBag.masktypes = new SelectList(lstMaskType, "Mask_Type", "Mask_Type");
                ViewBag.acctypes = new SelectList(lstAccType, "id", "AccType");
                Customer objCust = db.Customers.SingleOrDefault(x => x.Customer_id == objCustAcc.Customer_id);
                ViewBag.custname = objCust.Customer_FirstName;
                GeneralSetting objGen = db.GeneralSettings.FirstOrDefault();
                if (objGen != null)
                {
                    if (objGen.IndividualMultipleAccounts == false)
                    {
                        List<Customer_Account> lstCustomerAccounts = db.Customer_Account.Where(x => x.Customer_id == objCustAcc.Customer_id).ToList();
                        if (lstCustomerAccounts.Count > 0 && objCust.CustomerDesignation == "Individual")
                        {
                            TempData["msg"] = _AppContext.Messages.limitexceed;
                            return View(objCustAcc);
                        }
                    }
                }
                bool flag = true;
                if (objCustAcc.AccountNumber > 0) //Being Edited
                {
                    flag = false;
                }
                objCustAcc.IsDeleted = false;
                objCustAcc.IsActive = true;
                objCustAcc.DateCreated = DateTime.Now;
                Customer_Account objCollection = db.Customer_Account.FirstOrDefault(x => x.IsCollection == true && x.Customer_id == objCustAcc.Customer_id);
                if (objCollection != null)
                {
                    if (objCustAcc.CreditType == 0 && objCustAcc.IsCollection == true)
                    {
                        if (objCustAcc.AccountNumber > 0)//if is being edited, prepaid and isCollection=true
                        {
                            if (objCollection.AccountNumber != objCustAcc.AccountNumber)
                                objCustAcc.IsCollection = false;
                        }
                        else
                            objCustAcc.IsCollection = false;
                        TempData["message"] = _AppContext.Messages.AllreadyAssigned;
                    }
                }
                if (objCustAcc.AccountNumber > 0)
                {
                    Customer_Account objBalance = db.Customer_Account.Single(x => x.AccountNumber == objCustAcc.AccountNumber);
                    objCustAcc.Balance = objBalance.Balance;
                    objCustAcc.CreditType = objBalance.CreditType;
                }
                objCustAcc.ModifiedBy = UserContext.Identity.userId;
                AdminBAL.AddUpdateCustomerAccount(objCustAcc);
                //Add Chart of Accounts
                if (flag == true)
                {
                    //ChartofAccounts cc = new ChartofAccounts { ChartofAccountsSubTypes=db.ChartofAccountsSubTypes.Single(x=>x.ChartofAccountsSubType_id==2)};
                    ChartofAccounts objChart = new ChartofAccounts();
                    objChart.Account_Name = Convert.ToString(objCustAcc.AccountNumber);
                    objChart.ChartofAccountsSubType_id = 2; //db.ChartofAccountsSubTypes.Single(x=>x.Subtype_Name.Equals("Accounts Receivable",StringComparison.CurrentCultureIgnoreCase)).ChartofAccountsSubType_id;
                    objChart.ModifiedBy = UserContext.Identity.userId;
                    AdminBAL.AddChartofAccounts(objChart);
                }
                //end adding Chart of Accounts
                string card_sno = objCustAcc.Mask;
                Cards objCards = db.Cards.SingleOrDefault(x => x.Card_SNO == card_sno);
                if (objCards != null)
                {
                    objCards.Card_IsAssigned = true;
                    objCards.Card_Owner = objCustAcc.Customer_id;
                    objCards.Card_UpdateDate = DateTime.Now;
                    objCards.ModifiedBy = UserContext.Identity.userId;
                    AdminBAL.AddUpdateCards(objCards);
                }
                TempData["msg"] = _AppContext.Messages.Success;
                return RedirectToAction("AssignAccounts", "Admin");
                //return View(objCustAcc);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "AssignAccounts_POST", ex.ToString());
            }
            return View();
        }
        #endregion
        #region IsCardNumberValid
        public JsonResult IsCardNumberValid(string Data)
        {
            JsonResult objJR = Json(new { Status = "failed" }, JsonRequestBehavior.AllowGet);
            try
            {
                JavaScriptSerializer oSerializer = new JavaScriptSerializer();
                Dictionary<string, object> card = (Dictionary<string, object>)oSerializer.Deserialize(Data, typeof(object));
                string mask = Convert.ToString(card["mask"]);
                long AccountNumber = Convert.ToInt64(card["AccountNumber"]);
                JsonResult objBR = Json(new { Status = "Success", Result = Convert.ToBoolean(db.Cards.Where(x => x.Card_SNO.Trim().ToLower() == mask.Trim().ToLower() && x.Card_IsAssigned == false && x.Card_IsActive == true && x.Card_IsDeleted == false).Select(y => y.Card_SNO).ToList().Count) }, JsonRequestBehavior.AllowGet);
                if (AccountNumber > 0) //Acc is being edited 
                {
                    if (mask != db.Customer_Account.Single(x => x.AccountNumber == AccountNumber).Mask) //Acc is being edited and mask changed then check whether it exists or not
                    {
                        return objBR;
                    }
                    else
                    {
                        return Json(new { Status = "Success", Result = true }, JsonRequestBehavior.AllowGet);//Acc is being edited and mask is not changed then return false
                    }
                }
                else
                {
                    return objBR;
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "IsVehicleExists_JSON", ex.ToString());
            }
            return objJR;
        }
        #endregion
        #region IsPhoneNumberValid
        public JsonResult IsPhoneNumberValid(string Data)
        {
            JsonResult objJR = Json(new { Status = "failed" }, JsonRequestBehavior.AllowGet);
            try
            {
                JavaScriptSerializer oSerializer = new JavaScriptSerializer();
                Dictionary<string, object> phone = (Dictionary<string, object>)oSerializer.Deserialize(Data, typeof(object));
                string mask = Convert.ToString(phone["mask"]);
                long AccountNumber = Convert.ToInt64(phone["AccountNumber"]);
                long Customer_id = Convert.ToInt64(phone["Customer_id"]);
                JsonResult objBR = Json(new { Status = "Success", Result = Convert.ToBoolean(db.Customers.Where(x => x.Customer_Phone == mask && x.Customer_id == Customer_id).Select(y => y.Customer_Phone).ToList().Count) }, JsonRequestBehavior.AllowGet);
                if (AccountNumber > 0) //Acc is being edited 
                {
                    if (mask != db.Customer_Account.Single(x => x.AccountNumber == AccountNumber).Mask) //Acc is being edited and mask changed then check whether it exists or not
                    {
                        return objBR;
                    }
                    else
                    {
                        return Json(new { Status = "Success", Result = true }, JsonRequestBehavior.AllowGet);//Acc is being edited and mask is not changed then return false
                    }
                }
                else
                {
                    return objBR;
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "IsVehicleExists_JSON", ex.ToString());
            }
            return objJR;
        }
        #endregion
        #region CustomerAccountDetails
        public ActionResult CustomerAccountDetails(long? id, long? accno, string status)
        {
            try
            {

                if (!string.IsNullOrEmpty(status) && accno.HasValue)
                {
                    Customer_Account objCustAcc = db.Customer_Account.SingleOrDefault(x => x.AccountNumber == accno);
                    if (objCustAcc != null)
                    {
                        if (status.Equals("active"))
                        {
                            if (objCustAcc.IsActive == true)
                                objCustAcc.IsActive = false;
                            else
                                objCustAcc.IsActive = true;
                        }
                        //else if (status.Equals("type"))
                        //{
                        //    if (objCustAcc.CreditType == 0 && objCustAcc.IsCollection == false)
                        //    {
                        //        objCustAcc.CreditType = 1;
                        //        PostpaidCustCreditLimits objCustomerCreditLimit = new PostpaidCustCreditLimits();
                        //        objCustomerCreditLimit.CreditLimit = objCustAcc.Balance;
                        //        objCustomerCreditLimit.Cust_id = objCustAcc.Customer_id;
                        //        objCustomerCreditLimit.CreditLimit_Expiration = DateTime.Now.AddMonths(6);
                        //        objCustomerCreditLimit.IsActive = true;
                        //        AdminBAL.AddCreditLimitPostpaidCust(objCustomerCreditLimit);
                        //        PostpaidAccountCreditLimit objPostAcc = new PostpaidAccountCreditLimit();
                        //        objPostAcc.Account_CreditLimit = objCustAcc.Balance;
                        //        objPostAcc.AccountNumber = objCustAcc.AccountNumber;
                        //        objPostAcc.Credit_id = objCustomerCreditLimit.Credit_id;
                        //        objPostAcc.IsActive = true;
                        //        objPostAcc.DateCreated = DateTime.Now;
                        //        AdminBAL.AddUpdateAccountPostpaidLimit(objPostAcc);
                        //    }
                        //}
                        objCustAcc.DateCreated = DateTime.Now;
                        objCustAcc.ModifiedBy = UserContext.Identity.userId;
                        AdminBAL.AddUpdateCustomerAccount(objCustAcc);
                        return RedirectToAction("CustomerAccountDetails", "Admin", new { id = objCustAcc.Customer_id });
                    }
                }
                if (id.HasValue)
                {
                    ViewBag.id = id;
                    ViewBag.custname = AdminBAL.GetCustomerNameById(id);

                    List<Customer_Account> lst = db.Customer_Account.Where(x => x.Customer_id == id).OrderByDescending(x => x.DateCreated).ToList();
                    return View(lst);
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "CustomerAccountDetails_GET", ex.ToString());
            }
            return View();
        }
        #endregion
        #region Topup Customer Account
        public ActionResult TopupCustomerAccount(long? id, string status)
        {
            try
            {
                ViewBag.Channels = new SelectList(AdminBAL.GetAllChannels(), "Channel_id", "Channel_Name");
                ViewBag.Paymentmode = new SelectList(AdminBAL.GetAllPaymentmodes(), "PaymentMode_Name", "PaymentMode_Name");
                if (id.HasValue && !string.IsNullOrEmpty(status))
                {
                    if (status.Equals("edit"))
                    {
                        Customer_AccountTopup objAccTopup = db.Customer_AccountTopup.SingleOrDefault(x => x.AccountTopup_id == id);
                        if (objAccTopup != null)
                        {
                            ViewBag.custid = db.Customer_Account.SingleOrDefault(x => x.AccountNumber == objAccTopup.AccountNumber).Customer_id;
                            ViewBag.msg = _AppContext.Messages.ChangeStatus;
                            return View(objAccTopup);
                        }
                    }
                }
                else if (id.HasValue)
                {
                    Customer_Account objAcc = db.Customer_Account.SingleOrDefault(x => x.AccountNumber == id);
                    ViewBag.custid = objAcc.Customer_id;
                    if (objAcc == null)
                    {
                        ViewBag.msg = _AppContext.Messages.NotExist;
                        return View();
                    }
                    else
                    {
                        Customer_AccountTopup objCustAccTopup = new Customer_AccountTopup();
                        objCustAccTopup.AccountNumber = id;
                        ViewBag.msg = _AppContext.Messages.ChangeStatus;
                        return View(objCustAccTopup);
                    }
                }
            }
            catch (Exception ex)
            {
                ViewBag.msg = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Admin", "TopupCustomerAccount_GET", ex.ToString());
            }
            return View();
        }
        [HttpPost]
        public ActionResult TopupCustomerAccount(Customer_AccountTopup objAccTopup, long? id)
        {
            try
            {
                if (objAccTopup.AccountTopup_id > 0) //Topup being edited
                {
                    //Commented on 07 Nov, 2015 - Not Needed

                    //Customer_Account objCr = db.Customer_Account.SingleOrDefault(x => x.AccountNumber == objAccTopup.AccountNumber);
                    //Customer_AccountTopup objCardTopup = db.Customer_AccountTopup.SingleOrDefault(x => x.AccountTopup_id == objAccTopup.AccountTopup_id);
                    //if (objCr != null && objCardTopup != null)
                    //{

                    //            objCr.Balance += objAccTopup.Amount - objCardTopup.Amount;
                    //            objCr.DateCreated = DateTime.Now;
                    //            objAccTopup.Topupdate = DateTime.Now;
                    //            objAccTopup.Topupby = UserContext.Identity.userId;
                    //            if (AdminBAL.AddUpdateCustomerAccTopup(objAccTopup) == 1)
                    //            {
                    //                if (AdminBAL.AddUpdateCustomerAccount(objCr) == 1)
                    //                {
                    //                    TempData["msg"] = _AppContext.Messages.Success;
                    //                    return RedirectToAction("CustomerAccountDetails", "Admin", new { id = objCr.Customer_id });
                    //                }
                    //            }

                    //}

                }
                else if (id.HasValue) //Top up
                {
                    //TopupAccount(objAccTopup, id);
                    Customer_Account objAccount = db.Customer_Account.SingleOrDefault(x => x.AccountNumber == id);
                    if (objAccount != null)
                    {
                        Customer objCust = db.Customers.SingleOrDefault(x => x.Customer_id == objAccount.Customer_id);
                        if (objAccount.IsCollection == true && objCust.AutoRedistributeFunds == true)
                        {
                            TopupAccount(objAccTopup, id);//Save to the Customer_AccountTopup
                            List<Customer_Account> lstAccount = db.Customer_Account.Where(x => x.Customer_id == objAccount.Customer_id && x.CreditType == 0 && x.AccountNumber != id).ToList();
                            decimal balance = objAccTopup.Amount ?? 0;
                            foreach (var item in lstAccount)
                            {
                                objAccTopup.AccountTopup_id = 0;
                                objAccTopup.Amount = Math.Round(balance / lstAccount.Count);
                                objAccTopup.AccountNumber = item.AccountNumber;
                                TopupAccount(objAccTopup, item.AccountNumber);
                            }
                            TempData["msg"] = _AppContext.Messages.Success;
                            return RedirectToAction("CustomerAccountDetails", "Admin", new { @id = objAccount.Customer_id });
                        }
                        else
                        {
                            TopupAccount(objAccTopup, id);
                            TempData["msg"] = _AppContext.Messages.Success;
                            return RedirectToAction("CustomerAccountDetails", "Admin", new { @id = objAccount.Customer_id });
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                TempData["msg"] = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Admin", "TopupCard_POST", ex.ToString());
            }
            return RedirectToAction("CustomersList", "Admin");
        }
        private int TopupAccount(Customer_AccountTopup objAccTopup, long? id)
        {
            Customer_Account objCrd = db.Customer_Account.SingleOrDefault(x => x.AccountNumber == id);
            if (objCrd != null)
            {
                Finance_Transaction objFin = new Finance_Transaction();
                AccoutingDocTypes objDocType = db.AccoutingDocTypes.FirstOrDefault(x => x.Doc_Type_Name.Equals("Customer deposit"));
                if (objDocType != null)
                    objFin.Doc_Type_id = objDocType.Doc_Type_id;
                objFin.Finance_Trans_description = "Topup";
                objFin.Transaction_Code = Convert.ToString(UserContext.Identity.userId) + DateTime.Now.ToString("MMddyyyyHHmmssffff"); //Guid.NewGuid().ToString();
                objFin.IsPosted = true;
                objFin.Transaction_DateCreated = DateTime.Now;
                objFin.ModifiedBy = UserContext.Identity.userId;
                if (AdminBAL.AddFinanceTransaction(objFin) == 1)
                {
                    int? currency_id = db.GeneralSettings.SingleOrDefault().BaseCurrency;
                    string currency = db.Currencies.SingleOrDefault(x => x.Currency_id == currency_id).CurrencySymbol;
                    GLTransactions objGL = new GLTransactions();
                    objGL.Finance_Transaction_id = objFin.Finance_Transaction_id;
                    objGL.Amount = -Convert.ToInt64(objAccTopup.Amount);
                    objGL.Currency = currency;
                    objGL.Memo = "Topup";
                    objGL.GlTrans_DateCreated = DateTime.Now;
                    string AccountNum = objAccTopup.AccountNumber.ToString();
                    ChartofAccounts objChartsofAccount = db.ChartofAccounts.SingleOrDefault(x => x.Account_Name == AccountNum);
                    if (objChartsofAccount != null)
                        objGL.ChartofAccount_id = objChartsofAccount.ChartofAccount_id;
                    objGL.GLTrans_Actual_DateCreated = DateTime.Now;
                    Periods objPeriods = db.Periods.FirstOrDefault(x => x.LastDate_In_Period.Value.Year == DateTime.Now.Year && x.LastDate_In_Period.Value.Month == DateTime.Now.Month);
                    if (objPeriods != null)
                        objGL.Period_id = objPeriods.Period_id;
                    objGL.ModifiedBy = UserContext.Identity.userId;
                    if (AdminBAL.AddGLTransactions(objGL) == 1)
                    {
                        objGL.ChartofAccount_id = 33; //The id of "Prepaid Card Liability Account" is 33
                        if (AdminBAL.AddGLTransactions(objGL) == 1)
                        {
                            if (objCrd.Balance == null)
                                objCrd.Balance = 0;
                            objCrd.Balance += objAccTopup.Amount;
                            objCrd.DateCreated = DateTime.Now;
                            objCrd.ModifiedBy = UserContext.Identity.userId;
                            objAccTopup.AccountNumber = id;
                            objAccTopup.Topupby = UserContext.Identity.userId;
                            objAccTopup.Topupdate = DateTime.Now;
                            objAccTopup.UpdateDate = DateTime.Now;
                            objAccTopup.Finance_Transaction_id = objFin.Finance_Transaction_id;
                            objAccTopup.ModifiedBy = UserContext.Identity.userId;
                            if (AdminBAL.AddUpdateCustomerAccTopup(objAccTopup) == 1)
                            {
                                Customer objCust = db.Customers.SingleOrDefault(x => x.Customer_id == objCrd.Customer_id);
                                if (objCrd.IsCollection == true && objCust.AutoRedistributeFunds == true)
                                {
                                    objCrd.Balance = 0;
                                }
                                if (AdminBAL.AddUpdateCustomerAccount(objCrd) == 1)
                                {
                                    //TempData["msg"] = _AppContext.Messages.Success;
                                    //return RedirectToAction("CustomerAccountDetails", "Admin", new { id = objCrd.Customer_id });
                                    return 1;
                                }
                            }
                        }
                    }
                }
            }//end first if
            return 0;
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
                _AppContext.WriteLogFile("Admin", "SetLimitCustomerAccount_GET", ex.ToString());
            }
            return View();
        }
        [HttpPost]
        public ActionResult SetLimitCustomerAccount(PostpaidAccountCreditLimit item1)
        {
            try
            {
                ViewBag.accno = item1.AccountNumber;
                ViewBag.custid = db.Customer_Account.SingleOrDefault(x => x.AccountNumber == item1.AccountNumber).Customer_id;
                item1.DateCreated = DateTime.Now;
                item1.IsActive = true;
                PostpaidAccountCreditLimit objPostPaid = db.PostpaidAccountCreditLimit.FirstOrDefault(x => x.AccountNumber == item1.AccountNumber && x.IsActive == true);
                if (objPostPaid != null)
                {
                    objPostPaid.IsActive = false; //make the active limit to false
                    objPostPaid.ModifiedBy = UserContext.Identity.userId;
                    AdminBAL.AddUpdateAccountPostpaidLimit(objPostPaid);
                }
                PostpaidCustCreditLimits objPostpaidCreditLimit = db.PostpaidCustCreditLimits.SingleOrDefault(x => x.Credit_id == item1.Credit_id);
                if (objPostpaidCreditLimit != null)
                {
                    //ViewBag.custid = objPostpaidCreditLimit.Cust_id;
                    decimal? credit = 0;
                    List<PostpaidAccountCreditLimit> lstCreditLimit = db.PostpaidAccountCreditLimit.Where(x => x.Credit_id == item1.Credit_id && x.IsActive == true).ToList();
                    foreach (var item in lstCreditLimit)
                    {
                        credit += item.Account_CreditLimit;
                    }
                    credit += item1.Account_CreditLimit;
                    if (credit <= objPostpaidCreditLimit.CreditLimit)
                    {
                        item1.ModifiedBy = UserContext.Identity.userId;
                        AdminBAL.AddUpdateAccountPostpaidLimit(item1);
                        Customer_Account objCustomerAccount = db.Customer_Account.SingleOrDefault(x => x.AccountNumber == item1.AccountNumber);
                        if (objCustomerAccount != null)
                        {
                            objCustomerAccount.Balance = item1.Account_CreditLimit;
                            objCustomerAccount.ModifiedBy = UserContext.Identity.userId;
                            AdminBAL.AddUpdateCustomerAccount(objCustomerAccount);
                            ViewBag.msg = _AppContext.Messages.Success;
                        }
                    }
                    else
                    {
                        ViewBag.msg = _AppContext.Messages.limitexceed;
                        objPostPaid.IsActive = true; //make the active limit to true
                        objPostPaid.ModifiedBy = UserContext.Identity.userId;
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
                _AppContext.WriteLogFile("Admin", "SetLimitCustomerAccount_POST", ex.ToString());
            }
            return View();
        }
        #endregion
        #region Setup Account Usage Limit
        public ActionResult SetupAccountUsageLimit(long? id, long? custid, string status)
        {
            try
            {
                if (id.HasValue && custid.HasValue)
                {
                    ViewBag.accno = id;
                    ViewBag.custid = custid;
                    List<Product> lst = AdminBAL.GetAllProducts().OrderBy(x => x.Product_Name).ToList();
                    lst.Insert(0, new Product { Product_id = -1, Product_Name = "Overall" });
                    ViewBag.products = new SelectList(lst, "Product_id", "Product_Name", -1);
                    ViewBag.time = new SelectList(db.TimeDurations.Where(x => x.Type == "LongDuration").OrderBy(x => x.Value).ToList(), "TimeDuration_id", "Value");
                    ViewBag.msg = _AppContext.Messages.ChangeStatus;
                    return View();
                }
            }
            catch (Exception ex)
            {
                ViewBag.msg = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Admin", "SetupAccountUsageLimit_GET", ex.ToString());
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
                    ViewBag.custid = db.Customer_Account.First(x => x.AccountNumber == id).Customer_id;
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
                    objUsageLimit.ModifiedBy = UserContext.Identity.userId;
                    AdminBAL.AddUpdateAccUsageLimit(objUsageLimit);
                    List<Product> lst = AdminBAL.GetAllProducts().OrderBy(x => x.Product_Name).ToList();
                    lst.Insert(0, new Product { Product_id = -1, Product_Name = "Overall" });
                    ViewBag.products = new SelectList(lst, "Product_id", "Product_Name", -1);
                    ViewBag.time = new SelectList(db.TimeDurations.Where(x => x.Type == "LongDuration").OrderBy(x => x.Value).ToList(), "TimeDuration_id", "Value");
                    ViewBag.msg = _AppContext.Messages.Success;
                    return View();
                }
            }
            catch (Exception ex)
            {
                ViewBag.msg = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Admin", "SetUsageLimit_POST", ex.ToString());
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
                        objCUL.ModifiedBy = UserContext.Identity.userId;
                        AdminBAL.AddUpdateAccUsageLimit(objCUL);
                        RouteData.Values.Remove("id");
                        return RedirectToAction("ViewAccountUsageLimits", "Admin", new { id = objCUL.UsageLimit_AccountNumber });
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
                _AppContext.WriteLogFile("Admin", "CardUsageLimitList_GET", ex.ToString());
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
                _AppContext.WriteLogFile("Admin", "EditAccUsageLimit_GET", ex.ToString());
            }
            ViewBag.msg = _AppContext.Messages.NotExist;
            return View();
        }
        [HttpPost]
        public ActionResult EditAccUsageLimit(Customer_AccountUsageLimit objUsage)
        {
            try
            {
                //Customer_AccountUsageLimit objUsageLimit = new Customer_AccountUsageLimit();
                //objUsageLimit = db.Customer_AccountUsageLimit.SingleOrDefault(x => x.Card_UsageLimit_Card_id == objUsage.Card_UsageLimit_Card_id && x.Card_UsageLimit_Product_id == objUsage.Card_UsageLimit_Product_id);
                //if (objUsageLimit == null)
                //{
                //    objUsageLimit = new CardUsageLimit();
                //    objUsageLimit.Card_UsageLimit_Card_id = objUsage.Card_UsageLimit_Card_id;
                //    objUsageLimit.Card_UsageLimit_Product_id = objUsage.Card_UsageLimit_Product_id;
                //    objUsageLimit.Card_UsageLimit_IsActive = objUsage.Card_UsageLimit_IsActive;
                //    objUsageLimit.Card_UsageLimit_IsDeleted = objUsage.Card_UsageLimit_IsDeleted;
                //    objUsageLimit.Card_UsageLimit_IsOverall = objUsage.Card_UsageLimit_IsOverall;
                //}
                //objUsageLimit.Card_UsageLimit_Type = objUsage.Card_UsageLimit_Type;
                //objUsageLimit.Card_UsageLimit_Value = objUsage.Card_UsageLimit_Value;
                //objUsageLimit.Card_UsageLimit_DateCreated = DateTime.Now;
                objUsage.UsageLimit_DateCreated = DateTime.Now;
                AdminBAL.AddUpdateAccUsageLimit(objUsage);
                List<Product> lst = AdminBAL.GetAllProducts().OrderBy(x => x.Product_Name).ToList();
                lst.Insert(0, new Product { Product_id = -1, Product_Name = "Overall" });
                ViewBag.products = new SelectList(lst, "Product_id", "Product_Name", -1);
                ViewBag.time = new SelectList(db.TimeDurations.Where(x => x.Type == "LongDuration").ToList(), "TimeDuration_id", "Value");
                ViewBag.msg = _AppContext.Messages.Success;
                return RedirectToAction("ViewAccountUsageLimits", "Admin", new { id = objUsage.UsageLimit_AccountNumber });
            }
            catch (Exception ex)
            {
                ViewBag.msg = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Admin", "SetUsageLimit_POST", ex.ToString());
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
                List<Customer_Account> lstCustomerAccounts = db.Customer_Account.Where(x => x.Customer_id == id && x.AccountNumber != accno && x.IsDeleted == false && x.CreditType == objAccount.CreditType).ToList();
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
                _AppContext.WriteLogFile("Admin", "TransferAccount_GET", ex.ToString());
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
                if (fromAcc.CreditType != toAcc.CreditType) //allow trasfer from postpaid to postpaid or prepaid to prepaid
                {
                    TempData["msg"] = _AppContext.Messages.Blocked;
                    return RedirectToAction("TransferAccount", "Customer", new { @id = fromAcc.Customer_id, @accno = accno });
                }
                else
                {
                    if (item1.CreditType == 1) //if fromAccount is post paid then make toAccount postpaid
                    {
                        //if(toAcc.IsCollection==false)
                        //toAcc.CreditType = 1;
                        PostpaidAccountCreditLimit objPostpaidFrom = db.PostpaidAccountCreditLimit.FirstOrDefault(x => x.AccountNumber == accno && x.IsActive == true);
                        PostpaidAccountCreditLimit objTo = new PostpaidAccountCreditLimit();
                        objTo.Credit_id = objPostpaidFrom.Credit_id;
                        ViewBag.Creditlimit = objPostpaidFrom.Account_CreditLimit;
                        objTo.AccountNumber = item1.AccountNumber;
                        if (objPostpaidFrom.Account_CreditLimit >= item1.Balance)
                        {
                            objTo.Account_CreditLimit = item1.Balance;
                            objPostpaidFrom.Account_CreditLimit -= item1.Balance;
                        }
                        else
                        {
                            TempData["msg"] = _AppContext.Messages.limitexceed;
                            return RedirectToAction("TransferAccount", "Admin", new { @id = fromAcc.Customer_id, @accno = accno });
                        }
                        objTo.IsActive = false;
                        objTo.DateCreated = DateTime.Now;
                        AdminBAL.AddUpdateAccountPostpaidLimit(objTo);

                        //objPostpaidFrom.Account_CreditLimit = 0;
                        objPostpaidFrom.DateCreated = DateTime.Now;
                        objPostpaidFrom.IsActive = true;
                        objPostpaidFrom.ModifiedBy = UserContext.Identity.userId;
                        AdminBAL.AddUpdateAccountPostpaidLimit(objPostpaidFrom);
                    }
                    else
                    {
                        Finance_Transaction objFin = new Finance_Transaction();
                        AccoutingDocTypes objDocType = db.AccoutingDocTypes.FirstOrDefault(x => x.Doc_Type_Name.Equals("Misc voucher"));
                        if (objDocType != null)
                            objFin.Doc_Type_id = objDocType.Doc_Type_id;
                        objFin.Finance_Trans_description = "Transfer";
                        objFin.Transaction_Code = Convert.ToString(UserContext.Identity.userId) + DateTime.Now.ToString();
                        objFin.IsPosted = true;
                        objFin.Transaction_DateCreated = DateTime.Now;
                        objFin.ModifiedBy = UserContext.Identity.userId;
                        if (AdminBAL.AddFinanceTransaction(objFin) == 1)
                        {
                            int? currency_id = db.GeneralSettings.SingleOrDefault().BaseCurrency;
                            string currency = db.Currencies.SingleOrDefault(x => x.Currency_id == currency_id).CurrencySymbol;
                            GLTransactions objGL = new GLTransactions();
                            objGL.Finance_Transaction_id = objFin.Finance_Transaction_id;
                            objGL.Amount = Convert.ToInt64(item1.Balance);
                            objGL.Currency = currency;
                            objGL.Memo = "Transfer";
                            objGL.GlTrans_DateCreated = DateTime.Now;
                            objGL.ModifiedBy = UserContext.Identity.userId;
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

                        toAcc.ModifiedBy = UserContext.Identity.userId;
                        AdminBAL.AddUpdateCustomerAccount(toAcc);
                        fromAcc.ModifiedBy = UserContext.Identity.userId;
                        AdminBAL.AddUpdateCustomerAccount(fromAcc);
                    }
                    else
                    {
                        TempData["msg"] = _AppContext.Messages.limitexceed;
                        return RedirectToAction("TransferAccount", "Admin", new { @id = fromAcc.Customer_id, @accno = accno });
                    }
                }
                return RedirectToAction("CustomerAccountDetails", "Admin", new { id = fromAcc.Customer_id });
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "TransferAccount_POST", ex.ToString());
            }
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
                //if (id.HasValue && !string.IsNullOrEmpty(status)) //id=card_topup_id
                //{
                //    Customer_AccountTopup objCardTopup = db.Customer_AccountTopup.SingleOrDefault(x => x.AccountTopup_id == id);
                //    Customer_Account objCard = db.Customer_Account.SingleOrDefault(x => x.AccountNumber == objCardTopup.AccountNumber);
                //    ViewBag.custid = objCard.Customer_id;
                //    if (objCardTopup != null && objCard != null && status.Equals("delete"))
                //    {
                //        if (objCardTopup.IsDeleted == true)
                //        {
                //            objCardTopup.IsDeleted = false;
                //            objCard.Balance += objCardTopup.Amount;
                //        }
                //        else
                //        {
                //            objCardTopup.IsDeleted = true;
                //            objCard.Balance -= objCardTopup.Amount;

                //        }
                //        objCard.DateCreated = DateTime.Now;
                //        objCardTopup.UpdateDate = DateTime.Now;
                //        AdminBAL.AddUpdateCustomerAccTopup(objCardTopup);
                //        AdminBAL.AddUpdateCustomerAccount(objCard);
                //        ViewBag.msg = _AppContext.Messages.Success;
                //        List<Customer_AccountTopup> lstCards = db.Customer_AccountTopup.Where(x => x.AccountNumber == objCardTopup.AccountNumber).OrderByDescending(x => x.UpdateDate).ToList();
                //        return View(lstCards);
                //    }
                //}
                //else if (id.HasValue)
                //{
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
                //}
            }
            catch (Exception ex)
            {
                ViewBag.msg = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Admin", "ViewTopup_GET", ex.ToString());
            }
            ViewBag.msg = _AppContext.Messages.NotExist;
            return View();
        }
        #endregion
        #region ViewAllAccounts
        public ActionResult ViewAllAccounts(long? accno, string status)
        {
            try
            {
                if (!string.IsNullOrEmpty(status) && accno.HasValue)
                {
                    Customer_Account objCustAcc = db.Customer_Account.SingleOrDefault(x => x.AccountNumber == accno);
                    if (objCustAcc != null)
                    {
                        if (status.Equals("active"))
                        {
                            if (objCustAcc.IsActive == true)
                                objCustAcc.IsActive = false;
                            else
                                objCustAcc.IsActive = true;
                        }
                        objCustAcc.DateCreated = DateTime.Now;
                        objCustAcc.ModifiedBy = UserContext.Identity.userId;
                        AdminBAL.AddUpdateCustomerAccount(objCustAcc);
                        return RedirectToAction("ViewAllAccounts", "Admin");
                    }
                }
                List<VwCustomerAccount> lstCustomerAccounts = db.VwCustomerAccount.OrderBy(x => x.Customer_Name).ToList();
                return View(lstCustomerAccounts);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "ViewAllAccounts_GET", ex.ToString());
            }
            return View();
        }
        #endregion
        /**********************/
        #region AssignCardstoCustomer
        public ActionResult AssignCardstoCustomer(long? id)
        {
            try
            {
                if (id.HasValue)
                {
                    Customer objCustomer = db.Customers.SingleOrDefault(x => x.Customer_id == id);
                    if (objCustomer != null)
                    {
                        TempData["custId"] = id;
                        TempData["customer"] = objCustomer.Customer_FirstName;
                        ViewBag.msg = _AppContext.Messages.ChangeStatus;
                        Cards objCard = new Cards();
                        List<Cards> lstCards = db.Cards.Where(x => x.Card_IsDeleted == false && x.Card_IsActive == true && x.Card_IsAssigned == false).Take(100).OrderByDescending(x => x.Card_UpdateDate).ToList();
                        var tplCards = new Tuple<Cards, List<Cards>>(objCard, lstCards) { };
                        return View(tplCards);
                    }
                }
                ViewBag.msg = _AppContext.Messages.NotExist;
            }
            catch (Exception ex)
            {
                ViewBag.msg = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Admin", "AssignCardstoCustomer_GET", ex.ToString());
            }
            return View();
        }
        [HttpPost]
        public ActionResult AssignCardstoCustomer(Cards item1, FormCollection frm)
        {
            try
            {
                List<long> Card_Ids = string.IsNullOrEmpty(frm["hdnCardId"]) ? new List<long>() : frm["hdnCardId"].Split(',').Select(long.Parse).ToList();
                long custId = Convert.ToInt64(frm["custId"]);
                foreach (long item in Card_Ids)
                {
                    Cards objCard = db.Cards.Single(x => x.Card_id == item);
                    objCard.Card_Owner = custId;
                    objCard.Card_PIN = CryptorEngine.Encrypt(_AppContext.GetRandomNumbers());
                    objCard.Card_PrepaidAmt = item1.Card_PrepaidAmt;
                    objCard.Card_OverDraftValue = item1.Card_OverDraftValue;
                    objCard.Card_IsAssigned = true;
                    objCard.Card_IsDeleted = false;
                    objCard.Card_IsAssignedtoEmp = false;
                    objCard.Card_DateAssigned = DateTime.Now;
                    objCard.Card_UpdateDate = DateTime.Now;
                    objCard.ModifiedBy = UserContext.Identity.userId;
                    AdminBAL.AddUpdateCards(objCard);
                    ViewBag.msg = _AppContext.Messages.Success;
                }
                TempData["custId"] = custId;
                Customer objCustomer = db.Customers.Single(x => x.Customer_id == custId);
                TempData["customer"] = objCustomer.Customer_FirstName;
                Cards obj_Card = new Cards();
                List<Cards> lstCards = db.Cards.Where(x => x.Card_IsDeleted == false && x.Card_IsActive == true && x.Card_IsAssigned == false).Take(100).OrderByDescending(x => x.Card_UpdateDate).ToList();
                var tplCards = new Tuple<Cards, List<Cards>>(obj_Card, lstCards) { };
                return View(tplCards);
            }
            catch (Exception ex)
            {
                ViewBag.msg = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Admin", "AssignCardstoCustomer_POST", ex.ToString());
            }
            return View();
        }
        #endregion
        #region ViewCustomerCards
        public ActionResult ViewCustomerCards(long? id, string status)
        {
            try
            {
                if (id.HasValue && string.IsNullOrEmpty(status))
                {
                    List<Cards> lstCards = db.Cards.Where(x => x.Card_Owner == id).ToList();
                    if (lstCards != null && lstCards.Count > 0)
                        ViewBag.msg = _AppContext.Messages.Success;
                    else
                        ViewBag.msg = _AppContext.Messages.NotExist;
                    return View(lstCards);
                }
                else if (id.HasValue && !string.IsNullOrEmpty(status))
                {
                    Cards objCard = db.Cards.SingleOrDefault(x => x.Card_id == id);
                    if (objCard != null)
                    {
                        if (status.Equals("cardtype"))
                        {
                            if (objCard.Card_Type == 0)
                                objCard.Card_Type = 1;
                            else
                                objCard.Card_Type = 0;
                        }
                        else if (status.Equals("assign"))
                        {
                            if (objCard.Card_IsAssigned == true)
                                objCard.Card_IsAssigned = false;
                            else
                                objCard.Card_IsAssigned = true;
                        }
                        objCard.Card_UpdateDate = DateTime.Now;
                        objCard.ModifiedBy = UserContext.Identity.userId;
                        AdminBAL.AddUpdateCards(objCard);
                        List<Cards> lstCards = db.Cards.Where(x => x.Card_Owner == objCard.Card_Owner).ToList();
                        if (lstCards != null && lstCards.Count > 0)
                            ViewBag.msg = _AppContext.Messages.Success;
                        else
                            ViewBag.msg = _AppContext.Messages.NotExist;
                        return View(lstCards);
                    }
                }
            }
            catch (Exception ex)
            {
                ViewBag.msg = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Admin", "ViewCustomerCards_GET", ex.ToString());
            }
            ViewBag.msg = _AppContext.Messages.Error;
            return View();
        }
        #endregion
        #region EditCustomerCard
        public ActionResult EditCustomerCard(long? id)
        {
            try
            {
                if (id.HasValue)
                {
                    Cards objCard = db.Cards.SingleOrDefault(x => x.Card_id == id);
                    objCard.Card_PIN = CryptorEngine.Decrypt(objCard.Card_PIN);
                    objCard.Card_SNO = CryptorEngine.Decrypt(objCard.Card_SNO);
                    ViewBag.msg = _AppContext.Messages.ChangeStatus;
                    return View(objCard);
                }
            }
            catch (Exception ex)
            {
                ViewBag.msg = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Admin", "EditCustomerCard_GET", ex.ToString());
            }
            return View();
        }
        [HttpPost]
        public ActionResult EditCustomerCard(Cards objCard, long id)
        {
            try
            {
                Cards objCustCard = db.Cards.SingleOrDefault(x => x.Card_id == id);
                objCustCard.Card_PIN = CryptorEngine.Encrypt(objCard.Card_PIN);
                objCustCard.Card_OverDraftValue = objCard.Card_OverDraftValue;
                objCustCard.Card_PrepaidAmt = objCard.Card_PrepaidAmt;
                objCustCard.ModifiedBy = UserContext.Identity.userId;
                AdminBAL.AddUpdateCards(objCustCard);
                ViewBag.msg = _AppContext.Messages.Success;
                objCustCard.Card_PIN = CryptorEngine.Decrypt(objCustCard.Card_PIN);
                objCustCard.Card_SNO = CryptorEngine.Decrypt(objCustCard.Card_SNO);
                return View(objCustCard);
            }
            catch (Exception ex)
            {
                ViewBag.msg = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Admin", "EditCustomerCard_GET", ex.ToString());
            }
            return View();
        }
        #endregion
        #region ViewCustomerCardDetails
        public ActionResult ViewCustomerCardDetails(long? id)
        {
            try
            {
                if (id.HasValue)
                {
                    Cards objCard = db.Cards.SingleOrDefault(x => x.Card_id == id);
                    if (objCard != null)
                    {
                        objCard.Card_SNO = CryptorEngine.Decrypt(objCard.Card_SNO);
                        objCard.Card_UID = CryptorEngine.Decrypt(objCard.Card_UID);
                        objCard.Card_PIN = CryptorEngine.Decrypt(objCard.Card_PIN);
                        return View(objCard);
                    }
                }
            }
            catch (Exception ex)
            {
                ViewBag.msg = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Admin", "ViewCustomerCardDetails_GET", ex.ToString());
            }
            ViewBag.msg = _AppContext.Messages.Error;
            return View();
        }
        #endregion
        #region ChangeCardType
        public ActionResult ChangeCardType(long? id, long? custId)
        {
            try
            {
                if (id.HasValue && custId.HasValue)
                {
                    Cards objCard = db.Cards.SingleOrDefault(x => x.Card_id == id);
                    if (objCard != null)
                    {
                        if (objCard.Card_Type == 0)
                            objCard.Card_Type = 1;
                        else
                            objCard.Card_Type = 0;
                        objCard.Card_UpdateDate = DateTime.Now;
                        objCard.ModifiedBy = UserContext.Identity.userId;
                        AdminBAL.AddUpdateCards(objCard);
                        return RedirectToAction("AssignCardstoCustomer", "Admin", new { id = custId });
                    }
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "ChangeCardType_GET", ex.ToString());
            }
            return View();
        }
        #endregion
        #region PostPaidCustomers
        public ActionResult PostPaidCustomers()
        {
            try
            {
                //List<Cards> lstCards = db.Cards.Where(x => x.Card_Type == 1 && x.Card_IsActive == true && x.Card_IsAssigned == true).GroupBy(x => x.Card_Owner).Select(grp => grp.FirstOrDefault()).ToList();
                List<Customer_Account> lstCards = db.Customer_Account.Where(x => x.CreditType == 1 && x.IsDeleted == false).GroupBy(x => x.Customer_id).Select(grp => grp.FirstOrDefault()).ToList();
                return View(lstCards);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "PostPaidCustomers_GET", ex.ToString());
            }
            return View();
        }


        #endregion
        #region Credit Limit for Postpaid Customers
        /// <summary>
        /// 
        /// </summary>
        /// <param name="id">Customer Id</param>
        /// <returns></returns>
        public ActionResult CreditLimitPostpaidCust(long? id)
        {
            try
            {
                if (id.HasValue)
                {
                    PostpaidCustCreditLimits objCard = new PostpaidCustCreditLimits();
                    objCard.Cust_id = id;
                    List<PostpaidCustCreditLimits> lstCredit = db.PostpaidCustCreditLimits.Where(x => x.Cust_id == id).OrderByDescending(x => x.DateCreated).ToList();
                    var tpl = new Tuple<PostpaidCustCreditLimits, List<PostpaidCustCreditLimits>>(objCard, lstCredit) { };
                    return View(tpl);
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "CreditLimitPostpaidCust_GET", ex.ToString());
            }
            return View();
        }
        [HttpPost]
        public ActionResult CreditLimitPostpaidCust(PostpaidCustCreditLimits item1)
        {
            try
            {
                PostpaidCustCreditLimits objLimit = new PostpaidCustCreditLimits();
                objLimit.Cust_id = item1.Cust_id;
                objLimit.CreditLimit = item1.CreditLimit;
                objLimit.CreditLimit_Expiration = item1.CreditLimit_Expiration;
                objLimit.DateCreated = DateTime.Now;
                objLimit.ModifiedBy = UserContext.Identity.userId;
                if (AdminBAL.AddCreditLimitPostpaidCust(objLimit) == 1)
                {
                    List<Customer_Account> lstCustomerAccount = db.Customer_Account.Where(x => x.CreditType == 1 && x.Customer_id == item1.Cust_id).ToList();
                    bool? isAutoDist = db.Customers.Single(x => x.Customer_id == item1.Cust_id).AutoRedistributeFunds;
                    int count = lstCustomerAccount.Count;
                    
                    foreach (Customer_Account item in lstCustomerAccount)
                    {
                        if (isAutoDist == true)
                        {
                            decimal x = item1.CreditLimit ?? 0;
                            item.Balance = Math.Round(x / count);
                            foreach (PostpaidAccountCreditLimit accItem in db.PostpaidAccountCreditLimit.Where(a => a.AccountNumber == item.AccountNumber).ToList())
                            {
                                accItem.IsActive = false;
                                accItem.ModifiedBy = UserContext.Identity.userId;
                                AdminBAL.AddUpdateAccountPostpaidLimit(accItem);
                            }
                            PostpaidAccountCreditLimit objPostpaid = new PostpaidAccountCreditLimit();
                            objPostpaid.Account_CreditLimit = item.Balance;
                            objPostpaid.AccountNumber = item.AccountNumber;
                            objPostpaid.Credit_id = objLimit.Credit_id;
                            objPostpaid.DateCreated = DateTime.Now;
                            objPostpaid.IsActive = true;
                            objPostpaid.ModifiedBy = UserContext.Identity.userId;
                            AdminBAL.AddUpdateAccountPostpaidLimit(objPostpaid);
                        }
                        else
                            item.Balance = 0;
                        item.ModifiedBy = UserContext.Identity.userId;
                        AdminBAL.AddUpdateCustomerAccount(item);
                    }
                    
                    ModelState.Clear();
                    ViewBag.msg = _AppContext.Messages.Success;
                }
                List<PostpaidCustCreditLimits> lstCredit = db.PostpaidCustCreditLimits.Where(x => x.Cust_id == item1.Cust_id).OrderByDescending(x => x.DateCreated).ToList();
                item1 = new PostpaidCustCreditLimits();
                item1.Cust_id = objLimit.Cust_id;
                var tpl = new Tuple<PostpaidCustCreditLimits, List<PostpaidCustCreditLimits>>(item1, lstCredit) { };
                return View(tpl);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "CreditLimitPostpaidCust_GET", ex.ToString());
            }
            return View();
        }
        #endregion

        #region VehicleMake
        public ActionResult AddVehicle(long? id, string status)
        {
            try
            {
                Vehicle objVehicle = new Vehicle();
                if (id.HasValue)
                {
                    objVehicle = db.Vehicle.SingleOrDefault(x => x.Vehicle_Id == id);
                    if (!string.IsNullOrEmpty(status))
                    {
                        if (status.Equals("active"))
                        {
                            if (objVehicle.VehicleIsActive == true)
                                objVehicle.VehicleIsActive = false;
                            else
                                objVehicle.VehicleIsActive = true;
                        }
                        else if (status.Equals("delete"))
                        {
                            if (objVehicle.VehicleIsDeleted == true)
                                objVehicle.VehicleIsDeleted = false;
                            else
                                objVehicle.VehicleIsDeleted = true;
                        }
                        objVehicle.VehicleDateCreated = DateTime.Now;
                        objVehicle.ModifiedBy = UserContext.Identity.userId;
                        AdminBAL.AddUpdateVehicle(objVehicle);
                        RouteData.Values.Remove("id");
                        return RedirectToAction("AddVehicle", "Admin");
                    }
                }
                List<Vehicle> lstVehicles = db.Vehicle.OrderByDescending(x => x.VehicleDateCreated).ToList();
                var tplVehicle = new Tuple<Vehicle, List<Vehicle>>(objVehicle, lstVehicles) { };
                return View(tplVehicle);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "Vehicle_GET", ex.ToString());
            }
            return View();
        }
        [HttpPost]
        public ActionResult AddVehicle(Vehicle item1)
        {
            try
            {
                item1.VehicleIsActive = true;
                item1.VehicleIsDeleted = false;
                item1.VehicleDateCreated = DateTime.Now;
                item1.ModifiedBy = UserContext.Identity.userId;
                AdminBAL.AddUpdateVehicle(item1);
                ModelState.Clear();
                List<Vehicle> lstVehicles = db.Vehicle.OrderByDescending(x => x.VehicleDateCreated).ToList();
                var tplVehicle = new Tuple<Vehicle, List<Vehicle>>(null, lstVehicles) { };
                return View(tplVehicle);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "Vehicle_POST", ex.ToString());
            }
            return View();
        }
        #endregion
        #region IsVehicleExists
        public JsonResult IsVehicleExists(string Data)
        {
            JsonResult objJR = Json(new { Status = "failed" }, JsonRequestBehavior.AllowGet);
            try
            {
                JavaScriptSerializer oSerializer = new JavaScriptSerializer();
                Dictionary<string, object> vehicle = (Dictionary<string, object>)oSerializer.Deserialize(Data, typeof(object));
                string Vehicle_Make = Convert.ToString(vehicle["Vehicle_Make"]);
                long id = Convert.ToInt64(vehicle["id"]);
                JsonResult objBR = Json(new { Status = "Success", Result = Convert.ToBoolean(db.Vehicle.Where(x => x.Vehicle_Make.Trim().ToLower() == Vehicle_Make.Trim().ToLower()).Select(y => y.Vehicle_Make).ToList().Count) }, JsonRequestBehavior.AllowGet);
                if (id > 0) //vehicle is being edited 
                {
                    if (Vehicle_Make != db.Vehicle.Single(x => x.Vehicle_Id == id).Vehicle_Make) //vehicle is being edited and vehicle name changed then check whether it exists or not
                    {
                        return objBR;
                    }
                    else
                    {
                        return Json(new { Status = "Success", Result = false }, JsonRequestBehavior.AllowGet);//vehicle is being edited and vehicle name is not changed then return false
                    }
                }
                else
                {
                    return objBR;
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "IsVehicleExists_JSON", ex.ToString());
            }
            return objJR;
        }
        #endregion
        #region AddVehicleModel
        public ActionResult AddVehicleModel(long? id, string status)
        {
            try
            {
                VehicleModel objModel = new VehicleModel();
                if (id.HasValue)
                {
                    objModel = db.VehicleModel.SingleOrDefault(x => x.VehicleModel_Id == id);
                }
                ViewBag.vehicles = new SelectList(db.Vehicle.Where(x => x.VehicleIsActive == true && x.VehicleIsDeleted == false).OrderBy(x => x.Vehicle_Make).ToList(), "Vehicle_Id", "Vehicle_Make");
                return View(objModel);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "AddVehicleModel_GET", ex.ToString());
            }
            return View();
        }
        [HttpPost]
        public ActionResult AddVehicleModel(VehicleModel objModel)
        {
            try
            {
                ViewBag.vehicles = new SelectList(db.Vehicle.Where(x => x.VehicleIsActive == true && x.VehicleIsDeleted == false).OrderBy(x => x.Vehicle_Make).ToList(), "Vehicle_Id", "Vehicle_Make");
                objModel.VehicleModelIsActive = true;
                objModel.VehicleModelIsDeleted = false;
                objModel.VehicleModelDateCreated = DateTime.Now;
                objModel.ModifiedBy = UserContext.Identity.userId;
                if (AdminBAL.AddUpdateVehicleModel(objModel) == 1)
                {
                    ModelState.Clear();
                    ViewBag.msg = _AppContext.Messages.Success;
                }
            }
            catch (Exception ex)
            {
                ViewBag.msg = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Admin", "AddVehicleModel_GET", ex.ToString());
            }
            return View();
        }
        #endregion
        #region IsVehicleModelExists
        public JsonResult IsVehicleModelExists(string Data)
        {
            JsonResult objJR = Json(new { Status = "failed" }, JsonRequestBehavior.AllowGet);
            try
            {
                JavaScriptSerializer oSerializer = new JavaScriptSerializer();
                Dictionary<string, object> vehicle = (Dictionary<string, object>)oSerializer.Deserialize(Data, typeof(object));
                string VehicleModel_Name = Convert.ToString(vehicle["VehicleModel_Name"]);
                long id = Convert.ToInt64(vehicle["id"]);
                JsonResult objBR = Json(new { Status = "Success", Result = Convert.ToBoolean(db.VehicleModel.Where(x => x.VehicleModel_Name.Trim().ToLower() == VehicleModel_Name.Trim().ToLower()).Select(y => y.VehicleModel_Name).ToList().Count) }, JsonRequestBehavior.AllowGet);
                if (id > 0) //vehicle is being edited 
                {
                    if (VehicleModel_Name != db.VehicleModel.Single(x => x.VehicleModel_Id == id).VehicleModel_Name) //vehicle is being edited and vehicle name changed then check whether it exists or not
                    {
                        return objBR;
                    }
                    else
                    {
                        return Json(new { Status = "Success", Result = false }, JsonRequestBehavior.AllowGet);//vehicle is being edited and vehicle name is not changed then return false
                    }
                }
                else
                {
                    return objBR;
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "IsVehicleModelExists_JSON", ex.ToString());
            }
            return objJR;
        }
        #endregion
        #region VehicleModelsList
        public ActionResult VehicleModelsList(long? id, string status)
        {
            try
            {
                if (id.HasValue)
                {
                    VehicleModel objVehicleModel = db.VehicleModel.SingleOrDefault(x => x.VehicleModel_Id == id);
                    if (objVehicleModel != null && !string.IsNullOrEmpty(status))
                    {
                        if (status.Equals("active"))
                        {
                            if (objVehicleModel.VehicleModelIsActive == true)
                                objVehicleModel.VehicleModelIsActive = false;
                            else
                                objVehicleModel.VehicleModelIsActive = true;
                        }
                        else if (status.Equals("delete"))
                        {
                            if (objVehicleModel.VehicleModelIsDeleted == true)
                                objVehicleModel.VehicleModelIsDeleted = false;
                            else
                                objVehicleModel.VehicleModelIsDeleted = true;
                        }
                        objVehicleModel.VehicleModelDateCreated = DateTime.Now;
                        objVehicleModel.ModifiedBy = UserContext.Identity.userId;
                        AdminBAL.AddUpdateVehicleModel(objVehicleModel);
                        RouteData.Values.Remove("id");
                        RedirectToAction("VehicleModelsList", "Admin");
                    }
                }
                List<VwVehicle_VehicleModel> lstVehicleModels = db.VwVehicle_VehicleModel.OrderByDescending(x => x.VehicleModelDateCreated).ToList();
                return View(lstVehicleModels);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "VehicleModelsList_GET", ex.ToString());
            }
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
        public ActionResult CustomerVehicleList(long? custid, long? id, long? accountnumber, string status)
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
                        objVehicle.ModifiedBy = UserContext.Identity.userId;
                        AdminBAL.AddUpdateCustomerVehicle(objVehicle);
                    }
                    if (accountnumber.HasValue)
                    {
                        AdminBAL.UnassignVehicleFromAccount(id, accountnumber);
                    }
                }
                if (custid.HasValue)
                {
                    List<Customer_Vehicle> lstVehicles = db.Customer_Vehicle.Where(x => x.Customer_Id == custid).OrderByDescending(x => x.DateCreated).ToList();
                    ViewBag.customer = AdminBAL.GetCustomerNameById(custid);
                    ViewBag.custid = custid;
                    return View(lstVehicles);
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "CustomerVehicleList_GET", ex.ToString());
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
        public ActionResult AddCustomerVehicle(long? id, long? custid)
        {
            try
            {
                List<Vehicle> lstVehicles = db.Vehicle.Where(x => x.VehicleIsActive == true && x.VehicleIsDeleted == false).OrderBy(x => x.Vehicle_Make).ToList();
                lstVehicles.Insert(0, new Vehicle { Vehicle_Id = -1, Vehicle_Make = "Please Select Vehicle..." });
                ViewBag.vehicles = new SelectList(lstVehicles, "Vehicle_Id", "Vehicle_Make");
                ViewBag.fueltype = new SelectList(db.Products.Where(x => x.Product_IsActive == true && x.Product_IsDeleted == false).OrderBy(x => x.Product_Type).ToList(), "Product_id", "Product_Name");
                //List<Customer_Account> lstAccount = db.Customer_Account.Where(x => x.Customer_id == custid && x.IsDeleted == false).ToList();
                var accounts = db.VwCustomerEmpAccount.Where(x => x.Customer_id == custid && x.IsDeleted == false).ToList().Select(x => new { AccountNumber = x.AccountNumber, Description = string.Format("{0}, Customer({1}), Employee({2})",x.AccountNumber, x.Customer_FirstName+" "+x.Customer_MiddleName+" "+x.Customer_LastName,string.IsNullOrEmpty(x.Emp_Name)?"none":x.Emp_Name) });
                if (accounts != null && accounts.Select(x=>x.AccountNumber).ToList().Count>0)
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
                ViewBag.custid = custid;
                objVehicle.Customer_Id = custid;

                var tpl = new Tuple<Customer_Vehicle, List<WeekDays>, Lnk_CustomerVehicle_Account>(objVehicle, lstWeekDays, objVehicleAccount) { };
                return View(tpl);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "AddCustomerVehicle_GET", ex.ToString());
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
                item1.ModifiedBy = UserContext.Identity.userId;
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
                        item3.ModifiedBy = UserContext.Identity.userId;
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
                return RedirectToAction("CustomerVehicleList", "Admin", new { custid = item1.Customer_Id });
            }
            catch (Exception ex)
            {
                ViewBag.msg = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Admin", "AddCustomerVehicle_GET", ex.ToString());
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
                _AppContext.WriteLogFile("Admin", "GetModelsFromVehicleID_JSON", ex.ToString());
            }
            return objJR;
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
                _AppContext.WriteLogFile("Admin", "IsCustomerExists_JSON", ex.ToString());
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
                _AppContext.WriteLogFile("Admin", "IsCustomerExists_JSON", ex.ToString());
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
                _AppContext.WriteLogFile("Admin", "IsCustomerExists_JSON", ex.ToString());
            }
            return objJR;
        }
        #endregion
        #region IsCustomerExists
        /// <summary>
        /// Checking is customer email already exists
        /// </summary>
        /// <param name="Data"></param>
        /// <returns></returns>
        public JsonResult IsCustomerExists(string Data)
        {
            JsonResult objJR = Json(new { Status = "failed" }, JsonRequestBehavior.AllowGet);
            try
            {
                JavaScriptSerializer oSerializer = new JavaScriptSerializer();
                Dictionary<string, object> custDetails = (Dictionary<string, object>)oSerializer.Deserialize(Data, typeof(object));
                string customerEmail = Convert.ToString(custDetails["Customer_Email"]);
                long customerId = Convert.ToInt64(custDetails["Customer_id"]);
                JsonResult objBR = Json(new { Status = "Success", Result = Convert.ToBoolean(db.Customers.Where(x => x.Customer_Email == customerEmail).Select(x => x.Customer_Email).ToList().Count) }, JsonRequestBehavior.AllowGet);
                if (customerId > 0)
                {
                    if (customerEmail != db.Customers.Single(x => x.Customer_id == customerId).Customer_Email)
                    {
                        return objBR;
                    }
                    else
                    {
                        return Json(new { Status = "Success", Result = false }, JsonRequestBehavior.AllowGet);
                    }
                }
                else
                {
                    return objBR;
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "IsCustomerExists_JSON", ex.ToString());
            }
            return objJR;
        }
        #endregion
        #region IsCustomerPhoneNoExists
        public JsonResult IsCustomerPhoneNoExists(string Data)
        {
            JsonResult objJR = Json(new { Status = "failed" }, JsonRequestBehavior.AllowGet);
            try
            {
                JavaScriptSerializer oSerializer = new JavaScriptSerializer();
                Dictionary<string, object> custDetails = (Dictionary<string, object>)oSerializer.Deserialize(Data, typeof(object));
                string customerPhone = Convert.ToString(custDetails["Customer_Phone"]);
                long customerId = Convert.ToInt64(custDetails["Customer_id"]);
                JsonResult objBR = Json(new { Status = "Success", Result = Convert.ToBoolean(db.Customers.Where(x => x.Customer_Phone == customerPhone).Select(x => x.Customer_Phone).ToList().Count) }, JsonRequestBehavior.AllowGet);
                if (customerId > 0)
                {
                    if (customerPhone != db.Customers.Single(x => x.Customer_id == customerId).Customer_Phone)
                    {
                        return objBR;
                    }
                    else
                    {
                        return Json(new { Status = "Success", Result = false }, JsonRequestBehavior.AllowGet);
                    }
                }
                else
                {
                    return objBR;
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "IsCustomerPhoneNoExists_JSON", ex.ToString());
            }
            return objJR;
        }
        #endregion
        #region IsCustomerMobileNoExists
        public JsonResult IsCustomerMobileNoExists(string Data)
        {
            JsonResult objJR = Json(new { Status = "failed" }, JsonRequestBehavior.AllowGet);
            try
            {
                JavaScriptSerializer oSerializer = new JavaScriptSerializer();
                Dictionary<string, object> custDetails = (Dictionary<string, object>)oSerializer.Deserialize(Data, typeof(object));
                string customerMobile = Convert.ToString(custDetails["Customer_Mobile"]);
                long customerId = Convert.ToInt64(custDetails["Customer_id"]);
                JsonResult objBR = Json(new { Status = "Success", Result = Convert.ToBoolean(db.Customers.Where(x => x.Customer_Mobile == customerMobile).Select(x => x.Customer_Phone).ToList().Count) }, JsonRequestBehavior.AllowGet);
                if (customerId > 0)
                {
                    if (customerMobile != db.Customers.Single(x => x.Customer_id == customerId).Customer_Mobile)
                    {
                        return objBR;
                    }
                    else
                    {
                        return Json(new { Status = "Success", Result = false }, JsonRequestBehavior.AllowGet);
                    }
                }
                else
                {
                    return objBR;
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "IsCustomerPhoneNoExists_JSON", ex.ToString());
            }
            return objJR;
        }
        #endregion

        #region Add Staff
        public ActionResult AddStaff(long? id)
        {
            try
            {
                Staff objStaff = new Staff();
                if (id.HasValue)
                    objStaff = db.Staffs.SingleOrDefault(x => x.Staff_id == id);
                ViewBag.Channels = new SelectList(db.Channels.Where(x => x.Channel_Name != "All Channels").ToList(), "Channel_id", "Channel_Name");
                ViewBag.Roles = new SelectList(AdminBAL.GetAllRoles(), "Role_id", "RoleName");
                ViewBag.time = new SelectList(db.TimeDurations.Where(x => x.Type == "LongDuration").ToList(), "TimeDuration_id", "Value");
                ViewBag.tables = db.CustomTableFields.Where(x => x.TableName == "Staff" && x.IsActive == true).ToList();
                //var tpl = new Tuple<Staff, List<CustomTableFields>>(objStaff, lstCustomTableFields) { };
                return View(objStaff);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "AddStaff_GET", ex.ToString());
            }
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult AddStaff(Staff objStaff)
        {
            try
            {
                bool flag = false;
                if (objStaff.Staff_id == 0)
                    flag = true;//New Staff
                ViewBag.Channels = new SelectList(db.Channels.Where(x => x.Channel_Name != "All Channels").ToList(), "Channel_id", "Channel_Name");
                ViewBag.Roles = new SelectList(AdminBAL.GetAllRoles(), "Role_id", "RoleName");
                ViewBag.time = new SelectList(db.TimeDurations.Where(x => x.Type == "LongDuration").ToList(), "TimeDuration_id", "Value");
                ViewBag.tables = db.CustomTableFields.Where(x => x.TableName == "Staff" && x.IsActive == true).ToList();
                objStaff.IsActive = true;
                objStaff.IsDeleted = false;
                objStaff.DateCreated = DateTime.Now;
                objStaff.ModifiedBy = UserContext.Identity.userId;
                if (objStaff.Staff_id > 0)
                {
                    TempData["msg"] = _AppContext.Messages.Update;
                    Staff staff = db.Staffs.SingleOrDefault(x => x.Staff_id == objStaff.Staff_id);
                    objStaff.Staff_Password = staff.Staff_Password;
                    objStaff.Staff_PIN = staff.Staff_PIN;
                }
                else
                {
                    TempData["msg"] = _AppContext.Messages.Insert;
                    objStaff.Staff_Password = EncryptDecrypt.Encrypt(_AppContext.GetRandomNumbers(), "@#Df4190^");
                    objStaff.Staff_PIN = EncryptDecrypt.Encrypt(_AppContext.GetFourDigitRandomNumbers(), "@#Df4190^");
                }

                if (AdminBAL.AddUpdateStaff(objStaff) == 1)
                {
                    if (flag) //If new Staff
                    {
                        if (_AppContext.SendStaffPasswordResetMail(objStaff, "Staff Registration Email"))//Send Password Reset Mail
                        {
                            objStaff.PasswordResetExpDate = DateTime.Now.AddDays(5);
                            AdminBAL.AddUpdateStaff(objStaff);
                            _AppContext.SendStaffPINMail(objStaff);
                        }
                    }
                }
                ModelState.Clear();
            }
            catch (Exception ex)
            {
                TempData["msg"] = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Admin", "AddStaff_POST", ex.ToString());
            }
            return View();
        }
        #endregion
        #region List of Staff
        public ActionResult StaffList(long? id, string status)
        {
            try
            {
                if (id.HasValue)
                {
                    Staff objStaff = db.Staffs.SingleOrDefault(x => x.Staff_id == id);
                    if (objStaff != null)
                    {
                        objStaff.ModifiedBy = UserContext.Identity.userId;
                        if (!string.IsNullOrEmpty(status))
                        {
                            if (status.Equals("active"))
                            {
                                if (objStaff.IsActive == true)
                                    objStaff.IsActive = false;
                                else
                                    objStaff.IsActive = true;
                                objStaff.DateCreated = DateTime.Now;
                                AdminBAL.AddUpdateStaff(objStaff);
                            }
                            else if (status.Equals("delete"))
                            {
                                if (objStaff.IsDeleted == true)
                                    objStaff.IsDeleted = false;
                                else
                                    objStaff.IsDeleted = true;
                                objStaff.DateCreated = DateTime.Now;
                                AdminBAL.AddUpdateStaff(objStaff);
                            }
                            else if (status.Equals("resetpassword"))
                            {
                                objStaff.Staff_Password = EncryptDecrypt.Encrypt(_AppContext.GetRandomNumbers(), "@#Df4190^");
                                objStaff.DateCreated = DateTime.Now;
                                if (AdminBAL.AddUpdateStaff(objStaff) == 1)
                                {
                                    if (_AppContext.SendStaffPasswordResetMail(objStaff, "Staff Password"))//Send Password Reset Mail
                                    {
                                        objStaff.PasswordResetExpDate = DateTime.Now.AddDays(5);
                                        AdminBAL.AddUpdateStaff(objStaff);
                                        TempData["msg"] = "Password reset link is sent via mail to " + objStaff.Staff_Name;
                                    }
                                }
                            }
                            else if (status.Equals("resetpin"))
                            {
                                objStaff.Staff_PIN = EncryptDecrypt.Encrypt(_AppContext.GetFourDigitRandomNumbers(), "@#Df4190^");
                                objStaff.DateCreated = DateTime.Now;
                                if (AdminBAL.AddUpdateStaff(objStaff) == 1)
                                {
                                    _AppContext.SendStaffPINMail(objStaff);
                                    TempData["msg"] = "PIN is sent via mail to " + objStaff.Staff_Name;
                                }
                            }

                            RouteData.Values.Remove("id");
                            return RedirectToAction("StaffList", "Admin");
                        }
                    }
                }
                List<Staff> lstStaff = db.Staffs.OrderByDescending(x => x.DateCreated).ToList();
                return View(lstStaff);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "StaffList_GET", ex.ToString());
            }
            return View();
        }
        #endregion
        #region IsStaffEmailExists
        /// <summary>
        /// Checking is Staff email already exists
        /// </summary>
        /// <param name="Data"></param>
        /// <returns></returns>
        public JsonResult IsStaffEmailExists(string Data)
        {
            JsonResult objJR = Json(new { Status = "failed" }, JsonRequestBehavior.AllowGet);
            try
            {
                JavaScriptSerializer oSerializer = new JavaScriptSerializer();
                Dictionary<string, object> staffDetails = (Dictionary<string, object>)oSerializer.Deserialize(Data, typeof(object));
                string staffEmail = Convert.ToString(staffDetails["Staff_Email"]);
                long staffId = Convert.ToInt64(staffDetails["Staff_id"]);
                JsonResult objBR = Json(new { Status = "Success", Result = Convert.ToBoolean(db.Staffs.Where(x => x.Staff_Email == staffEmail).Select(x => x.Staff_Email).ToList().Count) }, JsonRequestBehavior.AllowGet);
                if (staffId > 0)
                {
                    if (staffEmail != db.Staffs.Single(x => x.Staff_id == staffId).Staff_Email)
                    {
                        return objBR;
                    }
                    else
                    {
                        return Json(new { Status = "Success", Result = false }, JsonRequestBehavior.AllowGet);
                    }
                }
                else
                {
                    return objBR;
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "IsStaffEmailExists_JSON", ex.ToString());
            }
            return objJR;
        }
        #endregion
        #region IsStaffPhoneExists
        /// <summary>
        /// Checking is Staff Phone already exists
        /// </summary>
        /// <param name="Data"></param>
        /// <returns></returns>
        public JsonResult IsStaffPhoneExists(string Data)
        {
            JsonResult objJR = Json(new { Status = "failed" }, JsonRequestBehavior.AllowGet);
            try
            {
                JavaScriptSerializer oSerializer = new JavaScriptSerializer();
                Dictionary<string, object> staffDetails = (Dictionary<string, object>)oSerializer.Deserialize(Data, typeof(object));
                string Staff_Phone = Convert.ToString(staffDetails["Staff_Phone"]);
                long staffId = Convert.ToInt64(staffDetails["Staff_id"]);
                JsonResult objBR = Json(new { Status = "Success", Result = Convert.ToBoolean(db.Staffs.Where(x => x.Staff_Phone == Staff_Phone).Select(x => x.Staff_Email).ToList().Count) }, JsonRequestBehavior.AllowGet);
                if (staffId > 0)
                {
                    if (Staff_Phone != db.Staffs.Single(x => x.Staff_id == staffId).Staff_Phone)
                    {
                        return objBR;
                    }
                    else
                    {
                        return Json(new { Status = "Success", Result = false }, JsonRequestBehavior.AllowGet);
                    }
                }
                else
                {
                    return objBR;
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "IsStaffPhoneExists_JSON", ex.ToString());
            }
            return objJR;
        }
        #endregion

        #region UploadCards
        public ActionResult UploadCards()
        {
            try
            {

            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "UploadCards_GET", ex.ToString());
            }
            return View();
        }
        [HttpPost]
        public ActionResult UploadCards(HttpPostedFileBase FileUpload)
        {
            try
            {
                if (FileUpload.ContentLength > 0 && FileUpload.FileName.EndsWith(".csv"))
                {
                    //string fileName = Path.GetFileName(FileUpload.FileName);
                    //string path = Path.Combine(Server.MapPath("~/uploads"), fileName);
                    //FileUpload.SaveAs(path);
                    ICsvParser csvParser = new CsvParser(new StreamReader(FileUpload.InputStream));
                    CsvReader csvReader = new CsvReader(csvParser);
                    List<Cards> lstCards = db.Cards.ToList();
                    bool flag = false;
                    if (lstCards.Count > 0 && lstCards != null)
                        flag = true;
                    while (csvReader.Read())
                    {
                        Cards objCard = new Cards();
                        objCard.Card_UID = csvReader.GetField(0);
                        objCard.Card_SNO = csvReader.GetField(1);
                        objCard.Card_PIN = CryptorEngine.Encrypt(_AppContext.GetRandomNumbers());
                        objCard.Card_IsActive = true;
                        objCard.Card_IsDeleted = false;
                        objCard.Card_IsAssigned = false;
                        objCard.Card_Type = (int)_AppContext.CardType.Prepaid;
                        objCard.Card_UploadDate = DateTime.Now;
                        objCard.ModifiedBy = UserContext.Identity.userId;
                        if (flag)
                        {
                            if (lstCards.Exists(x => x.Card_SNO == objCard.Card_SNO))
                            {
                                ViewBag.msg = _AppContext.Messages.Duplicate;
                                continue;
                            }
                        }
                        if (AdminBAL.AddUpdateCards(objCard) == 1)
                        {
                            ViewBag.msg = _AppContext.Messages.Success;
                        }
                    }
                }
                else
                {
                    ViewBag.msg = _AppContext.Messages.Blocked;
                }
            }
            catch (Exception ex)
            {
                ViewBag.msg = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Admin", "UploadCards_POST", ex.ToString());
            }
            return View();
        }
        #endregion

        //#region PrepaidCards
        ///// <summary>
        ///// List of prepaid cards
        ///// </summary>
        ///// <param name="">Card_type=0 for prepaid and Card_Type=1 for postpaid cards</param>
        ///// <returns></returns>
        //public ActionResult PrepaidCards(long? id, string status)
        //{
        //    try
        //    {
        //        if (id.HasValue)
        //        {
        //            Cards objCard = db.Cards.SingleOrDefault(x => x.Card_id == id);
        //            if (objCard != null)
        //            {
        //                if (!string.IsNullOrEmpty(status))
        //                {
        //                    if (status.Equals("active"))
        //                    {
        //                        if (objCard.Card_IsActive == true)
        //                            objCard.Card_IsActive = false;
        //                        else
        //                            objCard.Card_IsActive = true;
        //                    }
        //                    else if (status.Equals("delete"))
        //                    {
        //                        if (objCard.Card_IsDeleted == true)
        //                            objCard.Card_IsDeleted = false;
        //                        else
        //                            objCard.Card_IsDeleted = true;
        //                    }
        //                    objCard.Card_UpdateDate = DateTime.Now;
        //                    AdminBAL.AddUpdateCards(objCard);
        //                    RouteData.Values.Remove("id");
        //                    return RedirectToAction("PrepaidCards", "Admin");
        //                }
        //            }
        //        }
        //        List<VwCardsCustomers> lstCards = db.VwCardsCustomers.Where(x => x.Card_Type == (int)_AppContext.CardType.Prepaid).OrderByDescending(x => x.Card_UpdateDate).ToList();
        //        return View(lstCards);
        //    }
        //    catch (Exception ex)
        //    {
        //        _AppContext.WriteLogFile("Admin", "PrepaidCards_GET", ex.ToString());
        //    }
        //    return View();
        //}
        //[HttpPost]
        //public ActionResult PrepaidCards(Cards objCard)
        //{
        //    try
        //    {

        //    }
        //    catch (Exception ex)
        //    {
        //        _AppContext.WriteLogFile("Admin", "PrepaidCards_Post", ex.ToString());
        //    }
        //    return View();
        //}
        //#endregion
        //#region TopupCard
        //public ActionResult TopupCard(long? id, string status)
        //{
        //    try
        //    {
        //        ViewBag.Channels = new SelectList(AdminBAL.GetAllChannels(), "Channel_id", "Channel_Name");
        //        ViewBag.Paymentmode = new SelectList(AdminBAL.GetAllPaymentmodes(), "PaymentMode_Name", "PaymentMode_Name");
        //        if (id.HasValue && !string.IsNullOrEmpty(status))
        //        {
        //            if (status.Equals("edit"))
        //            {
        //                CardTopup objCardsTopup = db.CardTopups.SingleOrDefault(x => x.Card_topup_id == id);
        //                if (objCardsTopup != null)
        //                {
        //                    ViewBag.msg = _AppContext.Messages.ChangeStatus;
        //                    return View(objCardsTopup);
        //                }
        //            }
        //        }
        //        else if (id.HasValue)
        //        {
        //            Cards objCard = db.Cards.SingleOrDefault(x => x.Card_id == id);
        //            if (objCard == null)
        //            {
        //                ViewBag.msg = _AppContext.Messages.NotExist;
        //                return View();
        //            }
        //            else
        //            {
        //                ViewBag.msg = _AppContext.Messages.ChangeStatus;
        //                return View();
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        ViewBag.msg = _AppContext.Messages.Error;
        //        _AppContext.WriteLogFile("Admin", "TopupCard_GET", ex.ToString());
        //    }
        //    ViewBag.msg = _AppContext.Messages.NotExist;
        //    return View();
        //}
        //[HttpPost]
        //public ActionResult TopupCard(CardTopup objCard, long? id)
        //{
        //    try
        //    {
        //        if (objCard.Card_topup_id > 0)
        //        {
        //            Cards objCr = db.Cards.SingleOrDefault(x => x.Card_id == objCard.Card_id);
        //            CardTopup objCardTopup = db.CardTopups.SingleOrDefault(x => x.Card_topup_id == objCard.Card_topup_id);
        //            if (objCr != null && objCardTopup != null)
        //            {
        //                objCr.Card_Balance += objCard.Card_Amount - objCardTopup.Card_Amount;
        //                objCr.Card_UpdateDate = DateTime.Now;
        //                objCard.Card_topupdate = DateTime.Now;
        //                objCard.Card_topupby = UserContext.Identity.userId;
        //                if (AdminBAL.AddUpdateCardTopup(objCard) == 1)
        //                {
        //                    if (AdminBAL.AddUpdateCards(objCr) == 1)
        //                    {
        //                        TempData["msg"] = _AppContext.Messages.Success;
        //                    }
        //                }
        //            }

        //        }
        //        else if (id.HasValue)
        //        {
        //            Cards objCrd = db.Cards.SingleOrDefault(x => x.Card_id == id);
        //            if (objCrd != null)
        //            {
        //                if (objCrd.Card_Balance == null)
        //                    objCrd.Card_Balance = 0;
        //                objCrd.Card_Balance += objCard.Card_Amount;
        //                objCrd.Card_UpdateDate = DateTime.Now;
        //                objCard.Card_id = id;
        //                objCard.Card_topupby = UserContext.Identity.userId;
        //                objCard.Card_topupdate = DateTime.Now;
        //                if (AdminBAL.AddUpdateCardTopup(objCard) == 1)
        //                {
        //                    if (AdminBAL.AddUpdateCards(objCrd) == 1)
        //                    {
        //                        TempData["msg"] = _AppContext.Messages.Success;
        //                    }
        //                }
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        TempData["msg"] = _AppContext.Messages.Error;
        //        _AppContext.WriteLogFile("Admin", "TopupCard_POST", ex.ToString());
        //    }
        //    return RedirectToAction("PrepaidCards", "Admin");
        //}
        //#endregion
        //#region ViewTopup
        ///// <summary>
        ///// 
        ///// </summary>
        ///// <param name="id">Card Id</param>
        ///// <returns></returns>
        //public ActionResult ViewTopup(long? id, string status)
        //{
        //    try
        //    {
        //        if (id.HasValue && !string.IsNullOrEmpty(status)) //id=card_topup_id
        //        {
        //            CardTopup objCardTopup = db.CardTopups.SingleOrDefault(x => x.Card_topup_id == id);
        //            Cards objCard = db.Cards.SingleOrDefault(x => x.Card_id == objCardTopup.Card_id);
        //            if (objCardTopup != null && objCard != null && status.Equals("delete"))
        //            {
        //                if (objCardTopup.IsDeleted == true)
        //                {
        //                    objCardTopup.IsDeleted = false;
        //                    objCard.Card_Balance += objCardTopup.Card_Amount;
        //                }
        //                else
        //                {
        //                    objCardTopup.IsDeleted = true;
        //                    objCard.Card_Balance -= objCardTopup.Card_Amount;

        //                }
        //                objCard.Card_UpdateDate = DateTime.Now;
        //                objCardTopup.UpdateDate = DateTime.Now;
        //                AdminBAL.AddUpdateCardTopup(objCardTopup);
        //                AdminBAL.AddUpdateCards(objCard);
        //                ViewBag.msg = _AppContext.Messages.Success;
        //                List<CardTopup> lstCards = db.CardTopups.Where(x => x.Card_id == objCardTopup.Card_id).OrderByDescending(x => x.UpdateDate).ToList();
        //                return View(lstCards);
        //            }
        //        }
        //        else if (id.HasValue)
        //        {
        //            List<CardTopup> lstCardtopup = db.CardTopups.Where(x => x.Card_id == id).OrderByDescending(x => x.Card_topupdate).ToList();
        //            if (lstCardtopup.Count > 0)
        //            {
        //                ViewBag.msg = _AppContext.Messages.Success;
        //                return View(lstCardtopup);
        //            }
        //            else
        //            {
        //                ViewBag.msg = _AppContext.Messages.NotExist;
        //                return View();
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        ViewBag.msg = _AppContext.Messages.Error;
        //        _AppContext.WriteLogFile("Admin", "ViewTopup_GET", ex.ToString());
        //    }
        //    ViewBag.msg = _AppContext.Messages.NotExist;
        //    return View();
        //}
        //#endregion
        //#region SetUsageLimit
        ///// <summary>
        ///// 
        ///// </summary>
        ///// <param name="id">Card_id</param>
        ///// <returns></returns>
        //public ActionResult SetUsageLimit(long? id, string status)
        //{
        //    try
        //    {
        //        if (id.HasValue)
        //        {
        //            ViewBag.sno = CryptorEngine.Decrypt(db.Cards.SingleOrDefault(x => x.Card_id == id).Card_SNO);
        //            List<Product> lst = AdminBAL.GetAllProducts().OrderBy(x => x.Product_Name).ToList();
        //            lst.Insert(0, new Product { Product_id = -1, Product_Name = "Overall" });
        //            ViewBag.products = new SelectList(lst, "Product_id", "Product_Name", -1);
        //            ViewBag.time = new SelectList(db.TimeDurations.Where(x => x.Type == "LongDuration").ToList(), "TimeDuration_id", "Value");
        //            ViewBag.msg = _AppContext.Messages.ChangeStatus;
        //            return View();
        //        }

        //    }
        //    catch (Exception ex)
        //    {
        //        ViewBag.msg = _AppContext.Messages.Error;
        //        _AppContext.WriteLogFile("Admin", "SetUsageLimit_GET", ex.ToString());
        //    }
        //    ViewBag.msg = _AppContext.Messages.NotExist;
        //    return View();
        //}
        //[HttpPost]
        //public ActionResult SetUsageLimit(CardUsageLimit objUsage, long? id)
        //{
        //    try
        //    {
        //        if (id.HasValue)
        //        {
        //            ViewBag.sno = CryptorEngine.Decrypt(db.Cards.SingleOrDefault(x => x.Card_id == id).Card_SNO);
        //            CardUsageLimit objUsageLimit = new CardUsageLimit();
        //            objUsageLimit = db.CardUsageLimits.SingleOrDefault(x => x.Card_UsageLimit_Card_id == id && x.Card_UsageLimit_Product_id == objUsage.Card_UsageLimit_Product_id);
        //            if (objUsageLimit == null)
        //            {
        //                objUsageLimit = new CardUsageLimit();
        //            }
        //            objUsageLimit.Card_UsageLimit_Card_id = id;
        //            objUsageLimit.Card_UsageLimit_Product_id = objUsage.Card_UsageLimit_Product_id;
        //            objUsageLimit.Card_UsageLimit_Type = objUsage.Card_UsageLimit_Type;
        //            objUsageLimit.Card_UsageLimit_Value = objUsage.Card_UsageLimit_Value;
        //            objUsageLimit.Card_UsageLimit_DateCreated = DateTime.Now;
        //            objUsageLimit.Card_UsageLimit_IsActive = true;
        //            objUsageLimit.Card_UsageLimit_IsDeleted = false;
        //            AdminBAL.AddUpdateCardUsageLimit(objUsageLimit);
        //            List<Product> lst = AdminBAL.GetAllProducts().OrderBy(x => x.Product_Name).ToList();
        //            lst.Insert(0, new Product { Product_id = -1, Product_Name = "Overall" });
        //            ViewBag.products = new SelectList(lst, "Product_id", "Product_Name", -1);
        //            ViewBag.time = new SelectList(db.TimeDurations.Where(x => x.Type == "LongDuration").ToList(), "TimeDuration_id", "Value");
        //            ViewBag.msg = _AppContext.Messages.Success;
        //            return View();
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        ViewBag.msg = _AppContext.Messages.Error;
        //        _AppContext.WriteLogFile("Admin", "SetUsageLimit_POST", ex.ToString());
        //    }
        //    ViewBag.msg = _AppContext.Messages.NotExist;
        //    return View();
        //}
        //#endregion
        //#region ViewCardUsageLimit
        ///// <summary>
        ///// 
        ///// </summary>
        ///// <param name="id">Card Id</param>
        ///// <returns></returns>
        //public ActionResult ViewCardUsageLimit(long? id, string status)
        //{
        //    try
        //    {
        //        if (id.HasValue && !string.IsNullOrEmpty(status))
        //        {
        //            CardUsageLimit objCUL = db.CardUsageLimits.SingleOrDefault(x => x.Card_UsageLimit_id == id);
        //            if (objCUL != null)
        //            {
        //                if (status.Equals("active"))
        //                {
        //                    if (objCUL.Card_UsageLimit_IsActive == true)
        //                        objCUL.Card_UsageLimit_IsActive = false;
        //                    else
        //                        objCUL.Card_UsageLimit_IsActive = true;
        //                }
        //                else if (status.Equals("delete"))
        //                {
        //                    if (objCUL.Card_UsageLimit_IsDeleted == true)
        //                        objCUL.Card_UsageLimit_IsDeleted = false;
        //                    else
        //                        objCUL.Card_UsageLimit_IsDeleted = true;
        //                }
        //                else if (status.Equals("overall"))
        //                {
        //                    if (objCUL.Card_UsageLimit_IsOverall == true)
        //                        objCUL.Card_UsageLimit_IsOverall = false;
        //                    else
        //                        objCUL.Card_UsageLimit_IsOverall = true;
        //                }
        //                objCUL.Card_UsageLimit_DateCreated = DateTime.Now;
        //                AdminBAL.AddUpdateCardUsageLimit(objCUL);
        //                RouteData.Values.Remove("id");
        //                return RedirectToAction("ViewCardUsageLimit", "Admin", new { id = objCUL.Card_UsageLimit_Card_id });
        //            }
        //        }
        //        else if (id.HasValue)
        //        {
        //            List<VwCardUsageLimit_Products> lstCardUsageLimit = db.VwCardUsageLimit_Products.Where(x => x.Card_UsageLimit_Card_id == id && x.Card_UsageLimit_Product_id != -1).ToList();
        //            VwCardUsageLimit_Products objOverAllUsageLimit = db.VwCardUsageLimit_Products.SingleOrDefault(x => x.Card_UsageLimit_Card_id == id && x.Card_UsageLimit_Product_id == -1);
        //            ViewBag.cardsno = CryptorEngine.Decrypt(db.Cards.SingleOrDefault(x => x.Card_id == id).Card_SNO);
        //            if (lstCardUsageLimit.Count > 0)
        //            {
        //                ViewBag.msg = _AppContext.Messages.ChangeStatus;
        //                var tplCardUsage = new Tuple<List<VwCardUsageLimit_Products>, VwCardUsageLimit_Products>(lstCardUsageLimit, objOverAllUsageLimit) { };
        //                return View(tplCardUsage);
        //            }
        //            else
        //            {
        //                ViewBag.msg = _AppContext.Messages.NotExist;
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        ViewBag.msg = _AppContext.Messages.Error;
        //        _AppContext.WriteLogFile("Admin", "CardUsageLimitList_GET", ex.ToString());
        //    }
        //    ViewBag.msg = _AppContext.Messages.NotExist;
        //    return View();
        //}
        //#endregion
        //#region EditUsageLimit
        ///// <summary>
        ///// 
        ///// </summary>
        ///// <param name="id">Card_UsageLimit_id</param>
        ///// <returns></returns>
        //public ActionResult EditUsageLimit(long? id)
        //{
        //    try
        //    {
        //        if (id.HasValue)
        //        {
        //            CardUsageLimit objUsageLimit = db.CardUsageLimits.SingleOrDefault(x => x.Card_UsageLimit_id == id);
        //            List<Product> lst = AdminBAL.GetAllProducts().OrderBy(x => x.Product_Name).ToList();
        //            lst.Insert(0, new Product { Product_id = -1, Product_Name = "Overall" });
        //            ViewBag.products = new SelectList(lst, "Product_id", "Product_Name", -1);
        //            ViewBag.time = new SelectList(db.TimeDurations.Where(x => x.Type == "LongDuration").ToList(), "TimeDuration_id", "Value");
        //            ViewBag.msg = _AppContext.Messages.ChangeStatus;
        //            return View(objUsageLimit);
        //        }

        //    }
        //    catch (Exception ex)
        //    {
        //        ViewBag.msg = _AppContext.Messages.Error;
        //        _AppContext.WriteLogFile("Admin", "SetUsageLimit_GET", ex.ToString());
        //    }
        //    ViewBag.msg = _AppContext.Messages.NotExist;
        //    return View();
        //}
        //[HttpPost]
        //public ActionResult EditUsageLimit(CardUsageLimit objUsage)
        //{
        //    try
        //    {
        //        CardUsageLimit objUsageLimit = new CardUsageLimit();
        //        objUsageLimit = db.CardUsageLimits.SingleOrDefault(x => x.Card_UsageLimit_Card_id == objUsage.Card_UsageLimit_Card_id && x.Card_UsageLimit_Product_id == objUsage.Card_UsageLimit_Product_id);
        //        if (objUsageLimit == null)
        //        {
        //            objUsageLimit = new CardUsageLimit();
        //            objUsageLimit.Card_UsageLimit_Card_id = objUsage.Card_UsageLimit_Card_id;
        //            objUsageLimit.Card_UsageLimit_Product_id = objUsage.Card_UsageLimit_Product_id;
        //            objUsageLimit.Card_UsageLimit_IsActive = objUsage.Card_UsageLimit_IsActive;
        //            objUsageLimit.Card_UsageLimit_IsDeleted = objUsage.Card_UsageLimit_IsDeleted;
        //            objUsageLimit.Card_UsageLimit_IsOverall = objUsage.Card_UsageLimit_IsOverall;
        //        }
        //        objUsageLimit.Card_UsageLimit_Type = objUsage.Card_UsageLimit_Type;
        //        objUsageLimit.Card_UsageLimit_Value = objUsage.Card_UsageLimit_Value;
        //        objUsageLimit.Card_UsageLimit_DateCreated = DateTime.Now;
        //        AdminBAL.AddUpdateCardUsageLimit(objUsageLimit);
        //        List<Product> lst = AdminBAL.GetAllProducts().OrderBy(x => x.Product_Name).ToList();
        //        lst.Insert(0, new Product { Product_id = -1, Product_Name = "Overall" });
        //        ViewBag.products = new SelectList(lst, "Product_id", "Product_Name", -1);
        //        ViewBag.time = new SelectList(db.TimeDurations.Where(x => x.Type == "LongDuration").ToList(), "TimeDuration_id", "Value");
        //        ViewBag.msg = _AppContext.Messages.Success;
        //        return RedirectToAction("ViewCardUsageLimit", "Admin", new { id = objUsage.Card_UsageLimit_Card_id });
        //    }
        //    catch (Exception ex)
        //    {
        //        ViewBag.msg = _AppContext.Messages.Error;
        //        _AppContext.WriteLogFile("Admin", "SetUsageLimit_POST", ex.ToString());
        //    }
        //    ViewBag.msg = _AppContext.Messages.NotExist;
        //    return View();
        //}
        //#endregion

        //#region PostpaidCards
        //public ActionResult PostpaidCards(long? id, string status)
        //{
        //    try
        //    {
        //        if (id.HasValue)
        //        {
        //            Cards objCard = db.Cards.SingleOrDefault(x => x.Card_id == id);
        //            if (objCard != null)
        //            {
        //                if (!string.IsNullOrEmpty(status))
        //                {
        //                    if (status.Equals("active"))
        //                    {
        //                        if (objCard.Card_IsActive == true)
        //                            objCard.Card_IsActive = false;
        //                        else
        //                            objCard.Card_IsActive = true;
        //                    }
        //                    else if (status.Equals("delete"))
        //                    {
        //                        if (objCard.Card_IsDeleted == true)
        //                            objCard.Card_IsDeleted = false;
        //                        else
        //                            objCard.Card_IsDeleted = true;
        //                    }
        //                    objCard.Card_UpdateDate = DateTime.Now;
        //                    AdminBAL.AddUpdateCards(objCard);
        //                    RouteData.Values.Remove("id");
        //                    return RedirectToAction("PostpaidCards", "Admin");
        //                }
        //            }
        //        }
        //        List<VwCardsCustomers> lstCards = db.VwCardsCustomers.Where(x => x.Card_Type == (int)_AppContext.CardType.Postpaid).OrderByDescending(x => x.Card_UpdateDate).ToList();
        //        return View(lstCards);
        //    }
        //    catch (Exception ex)
        //    {
        //        _AppContext.WriteLogFile("Admin", "PostpaidCards_GET", ex.ToString());
        //    }
        //    return View();
        //}
        //#endregion
        //#region Topup postpaid Card
        //public ActionResult TopupPostpaidCard(long? id, string status)
        //{
        //    try
        //    {
        //        ViewBag.Channels = new SelectList(AdminBAL.GetAllChannels(), "Channel_id", "Channel_Name");
        //        ViewBag.Paymentmode = new SelectList(AdminBAL.GetAllPaymentmodes(), "PaymentMode_Name", "PaymentMode_Name");
        //        if (id.HasValue && !string.IsNullOrEmpty(status))
        //        {
        //            if (status.Equals("edit"))
        //            {
        //                CardTopup objCardsTopup = db.CardTopups.SingleOrDefault(x => x.Card_topup_id == id);
        //                if (objCardsTopup != null)
        //                {
        //                    ViewBag.msg = _AppContext.Messages.ChangeStatus;
        //                    return View(objCardsTopup);
        //                }
        //            }
        //        }
        //        else if (id.HasValue)
        //        {
        //            Cards objCard = db.Cards.SingleOrDefault(x => x.Card_id == id);
        //            if (objCard == null)
        //            {
        //                ViewBag.msg = _AppContext.Messages.NotExist;
        //                return View();
        //            }
        //            else
        //            {
        //                ViewBag.msg = _AppContext.Messages.ChangeStatus;
        //                return View();
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        ViewBag.msg = _AppContext.Messages.Error;
        //        _AppContext.WriteLogFile("Admin", "TopupCard_GET", ex.ToString());
        //    }
        //    ViewBag.msg = _AppContext.Messages.NotExist;
        //    return View();
        //}
        //[HttpPost]
        //public ActionResult TopupPostpaidCard(CardTopup objCard, long? id)
        //{
        //    try
        //    {
        //        if (objCard.Card_topup_id > 0)
        //        {
        //            Cards objCr = db.Cards.SingleOrDefault(x => x.Card_id == objCard.Card_id);
        //            CardTopup objCardTopup = db.CardTopups.SingleOrDefault(x => x.Card_topup_id == objCard.Card_topup_id);
        //            if (objCr != null && objCardTopup != null)
        //            {
        //                objCr.Card_Balance += objCard.Card_Amount - objCardTopup.Card_Amount;
        //                objCr.Card_UpdateDate = DateTime.Now;
        //                objCard.Card_topupdate = DateTime.Now;
        //                objCard.Card_topupby = UserContext.Identity.userId;
        //                if (AdminBAL.AddUpdateCardTopup(objCard) == 1)
        //                {
        //                    if (AdminBAL.AddUpdateCards(objCr) == 1)
        //                    {
        //                        TempData["msg"] = _AppContext.Messages.Success;
        //                    }
        //                }
        //            }

        //        }
        //        else if (id.HasValue)
        //        {
        //            Cards objCrd = db.Cards.SingleOrDefault(x => x.Card_id == id);
        //            if (objCrd != null)
        //            {
        //                if (objCrd.Card_Balance == null)
        //                    objCrd.Card_Balance = 0;
        //                objCrd.Card_Balance += objCard.Card_Amount;
        //                objCrd.Card_UpdateDate = DateTime.Now;
        //                objCard.Card_id = id;
        //                objCard.Card_topupby = UserContext.Identity.userId;
        //                objCard.Card_topupdate = DateTime.Now;
        //                if (AdminBAL.AddUpdateCardTopup(objCard) == 1)
        //                {
        //                    if (AdminBAL.AddUpdateCards(objCrd) == 1)
        //                    {
        //                        TempData["msg"] = _AppContext.Messages.Success;
        //                    }
        //                }
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        TempData["msg"] = _AppContext.Messages.Error;
        //        _AppContext.WriteLogFile("Admin", "TopupCard_POST", ex.ToString());
        //    }
        //    return RedirectToAction("PostpaidCards", "Admin");
        //}
        //#endregion
        //#region ViewTopup Postpaid
        ///// <summary>
        ///// 
        ///// </summary>
        ///// <param name="id">Card Id</param>
        ///// <returns></returns>
        //public ActionResult ViewTopupPostpaid(long? id, string status)
        //{
        //    try
        //    {
        //        if (id.HasValue && !string.IsNullOrEmpty(status)) //id=card_topup_id
        //        {
        //            CardTopup objCardTopup = db.CardTopups.SingleOrDefault(x => x.Card_topup_id == id);
        //            Cards objCard = db.Cards.SingleOrDefault(x => x.Card_id == objCardTopup.Card_id);
        //            if (objCardTopup != null && objCard != null && status.Equals("delete"))
        //            {
        //                if (objCardTopup.IsDeleted == true)
        //                {
        //                    objCardTopup.IsDeleted = false;
        //                    objCard.Card_Balance += objCardTopup.Card_Amount;
        //                }
        //                else
        //                {
        //                    objCardTopup.IsDeleted = true;
        //                    objCard.Card_Balance -= objCardTopup.Card_Amount;

        //                }
        //                objCard.Card_UpdateDate = DateTime.Now;
        //                objCardTopup.UpdateDate = DateTime.Now;
        //                AdminBAL.AddUpdateCardTopup(objCardTopup);
        //                AdminBAL.AddUpdateCards(objCard);
        //                ViewBag.msg = _AppContext.Messages.Success;
        //                List<CardTopup> lstCards = db.CardTopups.Where(x => x.Card_id == objCardTopup.Card_id).OrderByDescending(x => x.UpdateDate).ToList();
        //                return View(lstCards);
        //            }
        //        }
        //        else if (id.HasValue)
        //        {
        //            List<CardTopup> lstCardtopup = db.CardTopups.Where(x => x.Card_id == id).OrderByDescending(x => x.Card_topupdate).ToList();
        //            if (lstCardtopup.Count > 0)
        //            {
        //                ViewBag.msg = _AppContext.Messages.Success;
        //                return View(lstCardtopup);
        //            }
        //            else
        //            {
        //                ViewBag.msg = _AppContext.Messages.NotExist;
        //                return View();
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        ViewBag.msg = _AppContext.Messages.Error;
        //        _AppContext.WriteLogFile("Admin", "ViewTopupPostpaid_GET", ex.ToString());
        //    }
        //    ViewBag.msg = _AppContext.Messages.NotExist;
        //    return View();
        //}
        //#endregion
        //#region SetUsageLimit for Postpaid Cards
        ///// <summary>
        ///// 
        ///// </summary>
        ///// <param name="id">Card_id</param>
        ///// <returns></returns>
        //public ActionResult SetUsageLimitPostpaid(long? id, string status)
        //{
        //    try
        //    {
        //        if (id.HasValue)
        //        {
        //            ViewBag.sno = CryptorEngine.Decrypt(db.Cards.SingleOrDefault(x => x.Card_id == id).Card_SNO);
        //            List<Product> lst = AdminBAL.GetAllProducts().OrderBy(x => x.Product_Name).ToList();
        //            lst.Insert(0, new Product { Product_id = -1, Product_Name = "Overall" });
        //            ViewBag.products = new SelectList(lst, "Product_id", "Product_Name", -1);
        //            ViewBag.time = new SelectList(db.TimeDurations.Where(x => x.Type == "LongDuration").ToList(), "TimeDuration_id", "Value");
        //            ViewBag.msg = _AppContext.Messages.ChangeStatus;
        //            return View();
        //        }

        //    }
        //    catch (Exception ex)
        //    {
        //        ViewBag.msg = _AppContext.Messages.Error;
        //        _AppContext.WriteLogFile("Admin", "SetUsageLimit_GET", ex.ToString());
        //    }
        //    ViewBag.msg = _AppContext.Messages.NotExist;
        //    return View();
        //}
        //[HttpPost]
        //public ActionResult SetUsageLimitPostpaid(CardUsageLimit objUsage, long? id)
        //{
        //    try
        //    {
        //        if (id.HasValue)
        //        {
        //            ViewBag.sno = CryptorEngine.Decrypt(db.Cards.SingleOrDefault(x => x.Card_id == id).Card_SNO);
        //            CardUsageLimit objUsageLimit = new CardUsageLimit();
        //            objUsageLimit = db.CardUsageLimits.SingleOrDefault(x => x.Card_UsageLimit_Card_id == id && x.Card_UsageLimit_Product_id == objUsage.Card_UsageLimit_Product_id);
        //            if (objUsageLimit == null)
        //            {
        //                objUsageLimit = new CardUsageLimit();
        //            }
        //            objUsageLimit.Card_UsageLimit_Card_id = id;
        //            objUsageLimit.Card_UsageLimit_Product_id = objUsage.Card_UsageLimit_Product_id;
        //            objUsageLimit.Card_UsageLimit_Type = objUsage.Card_UsageLimit_Type;
        //            objUsageLimit.Card_UsageLimit_Value = objUsage.Card_UsageLimit_Value;
        //            objUsageLimit.Card_UsageLimit_DateCreated = DateTime.Now;
        //            objUsageLimit.Card_UsageLimit_IsActive = true;
        //            objUsageLimit.Card_UsageLimit_IsDeleted = false;
        //            AdminBAL.AddUpdateCardUsageLimit(objUsageLimit);
        //            List<Product> lst = AdminBAL.GetAllProducts().OrderBy(x => x.Product_Name).ToList();
        //            lst.Insert(0, new Product { Product_id = -1, Product_Name = "Overall" });
        //            ViewBag.products = new SelectList(lst, "Product_id", "Product_Name", -1);
        //            ViewBag.time = new SelectList(db.TimeDurations.Where(x => x.Type == "LongDuration").ToList(), "TimeDuration_id", "Value");
        //            ViewBag.msg = _AppContext.Messages.Success;
        //            return View();
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        ViewBag.msg = _AppContext.Messages.Error;
        //        _AppContext.WriteLogFile("Admin", "SetUsageLimit_POST", ex.ToString());
        //    }
        //    ViewBag.msg = _AppContext.Messages.NotExist;
        //    return View();
        //}
        //#endregion
        //#region ViewCardUsageLimit for Postpaid Cards
        ///// <summary>
        ///// 
        ///// </summary>
        ///// <param name="id">Card Id</param>
        ///// <returns></returns>
        //public ActionResult ViewCardUsageLimitPostpaid(long? id, string status)
        //{
        //    try
        //    {
        //        if (id.HasValue && !string.IsNullOrEmpty(status))
        //        {
        //            CardUsageLimit objCUL = db.CardUsageLimits.SingleOrDefault(x => x.Card_UsageLimit_id == id);
        //            if (objCUL != null)
        //            {
        //                if (status.Equals("active"))
        //                {
        //                    if (objCUL.Card_UsageLimit_IsActive == true)
        //                        objCUL.Card_UsageLimit_IsActive = false;
        //                    else
        //                        objCUL.Card_UsageLimit_IsActive = true;
        //                }
        //                else if (status.Equals("delete"))
        //                {
        //                    if (objCUL.Card_UsageLimit_IsDeleted == true)
        //                        objCUL.Card_UsageLimit_IsDeleted = false;
        //                    else
        //                        objCUL.Card_UsageLimit_IsDeleted = true;
        //                }
        //                else if (status.Equals("overall"))
        //                {
        //                    if (objCUL.Card_UsageLimit_IsOverall == true)
        //                        objCUL.Card_UsageLimit_IsOverall = false;
        //                    else
        //                        objCUL.Card_UsageLimit_IsOverall = true;
        //                }
        //                objCUL.Card_UsageLimit_DateCreated = DateTime.Now;
        //                AdminBAL.AddUpdateCardUsageLimit(objCUL);
        //                RouteData.Values.Remove("id");
        //                return RedirectToAction("ViewCardUsageLimit", "Admin", new { id = objCUL.Card_UsageLimit_Card_id });
        //            }
        //        }
        //        else if (id.HasValue)
        //        {
        //            List<VwCardUsageLimit_Products> lstCardUsageLimit = db.VwCardUsageLimit_Products.Where(x => x.Card_UsageLimit_Card_id == id && x.Card_UsageLimit_Product_id != -1).ToList();
        //            VwCardUsageLimit_Products objOverAllUsageLimit = db.VwCardUsageLimit_Products.SingleOrDefault(x => x.Card_UsageLimit_Card_id == id && x.Card_UsageLimit_Product_id == -1);
        //            ViewBag.cardsno = CryptorEngine.Decrypt(db.Cards.SingleOrDefault(x => x.Card_id == id).Card_SNO);
        //            if (lstCardUsageLimit.Count > 0)
        //            {
        //                ViewBag.msg = _AppContext.Messages.ChangeStatus;
        //                var tplCardUsage = new Tuple<List<VwCardUsageLimit_Products>, VwCardUsageLimit_Products>(lstCardUsageLimit, objOverAllUsageLimit) { };
        //                return View(tplCardUsage);
        //            }
        //            else
        //            {
        //                ViewBag.msg = _AppContext.Messages.NotExist;
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        ViewBag.msg = _AppContext.Messages.Error;
        //        _AppContext.WriteLogFile("Admin", "CardUsageLimitList_GET", ex.ToString());
        //    }
        //    ViewBag.msg = _AppContext.Messages.NotExist;
        //    return View();
        //}
        //#endregion
        //#region EditUsageLimit for Postpaid Cards
        ///// <summary>
        ///// 
        ///// </summary>
        ///// <param name="id">Card_UsageLimit_id</param>
        ///// <returns></returns>
        //public ActionResult EditUsageLimitPostpaid(long? id)
        //{
        //    try
        //    {
        //        if (id.HasValue)
        //        {
        //            CardUsageLimit objUsageLimit = db.CardUsageLimits.SingleOrDefault(x => x.Card_UsageLimit_id == id);
        //            List<Product> lst = AdminBAL.GetAllProducts().OrderBy(x => x.Product_Name).ToList();
        //            lst.Insert(0, new Product { Product_id = -1, Product_Name = "Overall" });
        //            ViewBag.products = new SelectList(lst, "Product_id", "Product_Name", -1);
        //            ViewBag.time = new SelectList(db.TimeDurations.Where(x => x.Type == "LongDuration").ToList(), "TimeDuration_id", "Value");
        //            ViewBag.msg = _AppContext.Messages.ChangeStatus;
        //            return View(objUsageLimit);
        //        }

        //    }
        //    catch (Exception ex)
        //    {
        //        ViewBag.msg = _AppContext.Messages.Error;
        //        _AppContext.WriteLogFile("Admin", "SetUsageLimit_GET", ex.ToString());
        //    }
        //    ViewBag.msg = _AppContext.Messages.NotExist;
        //    return View();
        //}
        //[HttpPost]
        //public ActionResult EditUsageLimitPostpaid(CardUsageLimit objUsage)
        //{
        //    try
        //    {
        //        CardUsageLimit objUsageLimit = new CardUsageLimit();
        //        objUsageLimit = db.CardUsageLimits.SingleOrDefault(x => x.Card_UsageLimit_Card_id == objUsage.Card_UsageLimit_Card_id && x.Card_UsageLimit_Product_id == objUsage.Card_UsageLimit_Product_id);
        //        if (objUsageLimit == null)
        //        {
        //            objUsageLimit = new CardUsageLimit();
        //            objUsageLimit.Card_UsageLimit_Card_id = objUsage.Card_UsageLimit_Card_id;
        //            objUsageLimit.Card_UsageLimit_Product_id = objUsage.Card_UsageLimit_Product_id;
        //            objUsageLimit.Card_UsageLimit_IsActive = objUsage.Card_UsageLimit_IsActive;
        //            objUsageLimit.Card_UsageLimit_IsDeleted = objUsage.Card_UsageLimit_IsDeleted;
        //            objUsageLimit.Card_UsageLimit_IsOverall = objUsage.Card_UsageLimit_IsOverall;
        //        }
        //        objUsageLimit.Card_UsageLimit_Type = objUsage.Card_UsageLimit_Type;
        //        objUsageLimit.Card_UsageLimit_Value = objUsage.Card_UsageLimit_Value;
        //        objUsageLimit.Card_UsageLimit_DateCreated = DateTime.Now;
        //        AdminBAL.AddUpdateCardUsageLimit(objUsageLimit);
        //        List<Product> lst = AdminBAL.GetAllProducts().OrderBy(x => x.Product_Name).ToList();
        //        lst.Insert(0, new Product { Product_id = -1, Product_Name = "Overall" });
        //        ViewBag.products = new SelectList(lst, "Product_id", "Product_Name", -1);
        //        ViewBag.time = new SelectList(db.TimeDurations.Where(x => x.Type == "LongDuration").ToList(), "TimeDuration_id", "Value");
        //        ViewBag.msg = _AppContext.Messages.Success;
        //        return RedirectToAction("ViewCardUsageLimit", "Admin", new { id = objUsage.Card_UsageLimit_Card_id });
        //    }
        //    catch (Exception ex)
        //    {
        //        ViewBag.msg = _AppContext.Messages.Error;
        //        _AppContext.WriteLogFile("Admin", "SetUsageLimit_POST", ex.ToString());
        //    }
        //    ViewBag.msg = _AppContext.Messages.NotExist;
        //    return View();
        //}
        //#endregion

        #region ListofCards
        /// <summary>
        /// 
        /// </summary>
        /// <param name="id">Card ID</param>
        /// <returns></returns>
        public ActionResult ListofCards(long? id, string status)
        {
            try
            {
                if (id.HasValue && !string.IsNullOrEmpty(status))
                {
                    Cards objCard = db.Cards.SingleOrDefault(x => x.Card_id == id);
                    if (objCard != null)
                    {
                        objCard.ModifiedBy = UserContext.Identity.userId;
                        if (status.Equals("assign"))
                        {
                            if (objCard.Card_IsAssigned == true)
                                objCard.Card_IsAssigned = false;
                            else
                                objCard.Card_IsAssigned = true;
                        }
                        else if (status.Equals("active"))
                        {
                            if (objCard.Card_IsActive == true)
                                objCard.Card_IsActive = false;
                            else
                                objCard.Card_IsActive = true;
                        }
                        else if (status.Equals("delete"))
                        {
                            if (objCard.Card_IsDeleted == true)
                                objCard.Card_IsDeleted = false;
                            else
                                objCard.Card_IsDeleted = true;
                        }
                        else if (status.Equals("type"))
                        {
                            if (objCard.Card_IsAssigned == true)
                            {
                                TempData["msg"] = _AppContext.Messages.AllreadyAssigned;
                            }
                            else
                            {
                                if (objCard.Card_Type == 0)
                                    objCard.Card_Type = 1;
                                else
                                    objCard.Card_Type = 0;
                            }
                        }
                        objCard.Card_UpdateDate = DateTime.Now;
                        AdminBAL.AddUpdateCards(objCard);
                        RouteData.Values.Remove("id");
                        return RedirectToAction("ListofCards", "Admin");
                    }
                }
                List<VwCardsCustomers> lstCards = db.VwCardsCustomers.OrderByDescending(x => x.Card_UpdateDate).ToList();
                if (lstCards.Count > 0)
                {
                    if (TempData["msg"] == null)
                        TempData["msg"] = _AppContext.Messages.Success;
                    return View(lstCards);
                }
            }
            catch (Exception ex)
            {
                TempData["msg"] = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Admin", "ListofCards_GET", ex.ToString());
            }
            TempData["msg"] = _AppContext.Messages.NotExist;
            return View();
        }
        #endregion

        #region AddActivityType
        public ActionResult AddActivityType(long? id)
        {
            try
            {
                ActivityType objActivityType = new ActivityType();
                if (id.HasValue)
                {
                    objActivityType = db.ActivityType.SingleOrDefault(x => x.ActivityType_id == id);
                }
                return View(objActivityType);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "AddActivityType_GET", ex.ToString());
            }
            return View();
        }
        [HttpPost]
        public ActionResult AddActivityType(ActivityType objActivityType)
        {
            try
            {
                objActivityType.ActivityType_IsActive = true;
                objActivityType.ActivityType_IsDeleted = false;
                objActivityType.ActivityType_DateCreated = DateTime.Now;
                objActivityType.ModifiedBy = UserContext.Identity.userId;
                if (AdminBAL.AddUpdateActivityType(objActivityType) == 1)
                {
                    ViewBag.msg = _AppContext.Messages.Success;
                }
            }
            catch (Exception ex)
            {
                ViewBag.msg = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Admin", "AddActivityType_POST", ex.ToString());
            }
            return View();
        }
        #endregion
        #region IsActivityTypeExists
        public JsonResult IsActivityTypeExists(string Data)
        {
            JsonResult objJR = Json(new { Status = "failed" }, JsonRequestBehavior.AllowGet);
            try
            {
                JavaScriptSerializer oSerializer = new JavaScriptSerializer();
                Dictionary<string, object> activityTypeDetails = (Dictionary<string, object>)oSerializer.Deserialize(Data, typeof(object));
                string activityTypeName = Convert.ToString(activityTypeDetails["ActivityType_Name"]);
                long activityTypeId = Convert.ToInt64(activityTypeDetails["ActivityType_id"]);
                JsonResult objBR = Json(new { Status = "Success", Result = Convert.ToBoolean(db.ActivityType.Where(x => x.ActivityType_Name.ToLower().Trim() == activityTypeName.ToLower().Trim()).Select(x => x.ActivityType_Name).ToList().Count) }, JsonRequestBehavior.AllowGet);
                if (activityTypeId > 0)
                {
                    if (activityTypeName != db.ActivityType.Single(x => x.ActivityType_id == activityTypeId).ActivityType_Name) //if activity type name changed during edit activity type
                    {
                        return objBR;
                    }
                    else
                    {
                        return Json(new { Status = "Success", Result = false }, JsonRequestBehavior.AllowGet);
                    }
                }
                else //if new activity type is being added
                {
                    return objBR;
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "IsActivityTypeExists_Json", ex.ToString());
            }
            return objJR;
        }
        #endregion
        #region ActivityTypeList
        public ActionResult ActivityTypeList(long? id, string status)
        {
            try
            {
                if (id.HasValue)
                {
                    ActivityType objActivityType = db.ActivityType.SingleOrDefault(x => x.ActivityType_id == id);
                    if (objActivityType != null)
                    {
                        if (!string.IsNullOrEmpty(status))
                        {
                            if (status.Equals("active"))
                            {
                                if (objActivityType.ActivityType_IsActive == true)
                                    objActivityType.ActivityType_IsActive = false;
                                else
                                    objActivityType.ActivityType_IsActive = true;
                            }
                            else if (status.Equals("delete"))
                            {
                                if (objActivityType.ActivityType_IsDeleted == true)
                                    objActivityType.ActivityType_IsDeleted = false;
                                else
                                    objActivityType.ActivityType_IsDeleted = true;
                            }
                            objActivityType.ActivityType_DateCreated = DateTime.Now;
                            objActivityType.ModifiedBy = UserContext.Identity.userId;
                            AdminBAL.AddUpdateActivityType(objActivityType);
                            RouteData.Values.Remove("id");
                            return RedirectToAction("ActivityTypeList", "Admin");
                        }
                    }
                }
                List<ActivityType> lstActivityType = db.ActivityType.OrderByDescending(x => x.ActivityType_DateCreated).ToList();
                return View(lstActivityType);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "AddActivity_GET", ex.ToString());
            }
            return View();
        }
        #endregion

        #region AddActivity
        public ActionResult AddActivity(long? id)
        {
            try
            {
                Activity objActivity = new Activity();
                if (id.HasValue)
                {
                    objActivity = db.Activities.SingleOrDefault(x => x.Activity_id == id);
                }
                ViewBag.types = new SelectList(db.ActivityType.Where(x => x.ActivityType_IsActive == true && x.ActivityType_IsDeleted == false).OrderBy(x => x.ActivityType_Name).ToList(), "ActivityType_id", "ActivityType_Name");
                return View(objActivity);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "AddActivity_GET", ex.ToString());
            }
            return View();
        }
        [HttpPost]
        public ActionResult AddActivity(Activity objActivity)
        {
            try
            {
                ViewBag.types = new SelectList(db.ActivityType.Where(x => x.ActivityType_IsActive == true && x.ActivityType_IsDeleted == false).OrderBy(x => x.ActivityType_Name).ToList(), "ActivityType_id", "ActivityType_Name");
                objActivity.Activity_IsActive = true;
                objActivity.Activity_IsDeleted = false;
                objActivity.Activity_DateCreated = DateTime.Now;
                objActivity.ModifiedBy = UserContext.Identity.userId;
                if (AdminBAL.AddUpdateActivity(objActivity) == 1)
                {
                    ModelState.Clear();
                    ViewBag.msg = _AppContext.Messages.Success;
                }
            }
            catch (Exception ex)
            {
                ViewBag.msg = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Admin", "AddActivity_POST", ex.ToString());
            }
            return View();
        }
        #endregion
        #region IsActivityTypeExists
        public JsonResult IsActivityExists(string Data)
        {
            JsonResult objJR = Json(new { Status = "failed" }, JsonRequestBehavior.AllowGet);
            try
            {
                JavaScriptSerializer oSerializer = new JavaScriptSerializer();
                Dictionary<string, object> activityDetails = (Dictionary<string, object>)oSerializer.Deserialize(Data, typeof(object));
                string activityName = Convert.ToString(activityDetails["Activity_Name"]);
                long activityId = Convert.ToInt64(activityDetails["Activity_id"]);
                JsonResult objBR = Json(new { Status = "Success", Result = Convert.ToBoolean(db.Activities.Where(x => x.Activity_Name.ToLower().Trim() == activityName.ToLower().Trim()).Select(x => x.Activity_Name).ToList().Count) }, JsonRequestBehavior.AllowGet);
                if (activityId > 0)
                {
                    if (activityName != db.Activities.Single(x => x.Activity_id == activityId).Activity_Name) //if activity name changed during edit activity
                    {
                        return objBR;
                    }
                    else
                    {
                        return Json(new { Status = "Success", Result = false }, JsonRequestBehavior.AllowGet);
                    }
                }
                else //if new activity type is being added
                {
                    return objBR;
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "IsActivityExists_Json", ex.ToString());
            }
            return objJR;
        }
        #endregion
        #region ActivityList
        public ActionResult ActivityList(long? id, string status)
        {
            try
            {
                if (id.HasValue)
                {
                    Activity objActivity = db.Activities.SingleOrDefault(x => x.Activity_id == id);
                    if (objActivity != null)
                    {
                        if (!string.IsNullOrEmpty(status))
                        {
                            if (status.Equals("active"))
                            {
                                if (objActivity.Activity_IsActive == true)
                                    objActivity.Activity_IsActive = false;
                                else
                                    objActivity.Activity_IsActive = true;
                            }
                            else if (status.Equals("delete"))
                            {
                                if (objActivity.Activity_IsDeleted == true)
                                    objActivity.Activity_IsDeleted = false;
                                else
                                    objActivity.Activity_IsDeleted = true;
                            }
                            objActivity.Activity_DateCreated = DateTime.Now;
                            objActivity.ModifiedBy = UserContext.Identity.userId;
                            AdminBAL.AddUpdateActivity(objActivity);
                            RouteData.Values.Remove("id");
                            return RedirectToAction("ActivityList", "Admin");
                        }
                    }
                }
                List<VwActivity_ActivityType> lstActivity = db.VwActivity_ActivityType.OrderByDescending(x => x.Activity_DateCreated).ToList();
                return View(lstActivity);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "ActivityList_GET", ex.ToString());
            }
            return View();
        }
        #endregion

        #region AddFormula
        public ActionResult AddFormula(long? id)
        {
            try
            {
                Tierrule objTierrule = new Tierrule();
                if (id.HasValue)
                {
                    objTierrule = db.Tierrules.SingleOrDefault(x => x.id == id);
                }
                ViewBag.valuetype = new SelectList(db.FormulaValueType.ToList(), "ValueId", "Type");
                return View(objTierrule);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "AddFormula_GET", ex.ToString());
            }
            return View();
        }
        [HttpPost]
        public ActionResult AddFormula(Tierrule objTierrule)
        {
            try
            {
                objTierrule.tierrule_IsActive = true;
                objTierrule.tierrule_IsDeleted = false;
                objTierrule.date_created = DateTime.Now;
                objTierrule.ModifiedBy = UserContext.Identity.userId;
                if (AdminBAL.AddUpdateFormula(objTierrule) == 1)
                {
                    ModelState.Clear();
                    ViewBag.msg = _AppContext.Messages.Success;
                    ViewBag.valuetype = new SelectList(db.FormulaValueType.ToList(), "ValueId", "Type");
                }
            }
            catch (Exception ex)
            {
                ViewBag.msg = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Admin", "AddFormula_POST", ex.ToString());
            }
            return View();
        }
        #endregion
        #region FormulaList
        public ActionResult FormulaList(long? id, string status)
        {
            try
            {
                if (id.HasValue && !string.IsNullOrEmpty(status))
                {
                    Tierrule objTierrule = db.Tierrules.SingleOrDefault(x => x.id == id);
                    if (objTierrule != null)
                    {
                        if (status.Equals("active"))
                        {
                            if (objTierrule.tierrule_IsActive == true)
                                objTierrule.tierrule_IsActive = false;
                            else
                                objTierrule.tierrule_IsActive = true;
                        }
                        else if (status.Equals("delete"))
                        {
                            if (objTierrule.tierrule_IsDeleted == true)
                                objTierrule.tierrule_IsDeleted = false;
                            else
                                objTierrule.tierrule_IsDeleted = true;
                        }
                        objTierrule.date_created = DateTime.Now;
                        objTierrule.ModifiedBy = UserContext.Identity.userId;
                        AdminBAL.AddUpdateFormula(objTierrule);
                        RouteData.Values.Remove("id");
                        return RedirectToAction("FormulaList", "Admin");
                    }
                }
                List<Tierrule> lstTierrule = db.Tierrules.OrderByDescending(x => x.date_created).ToList();
                return View(lstTierrule);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "FormulaList_GET", ex.ToString());
            }
            return View();
        }
        #endregion
        #region IsFormulaNameExists
        public JsonResult IsFormulaNameExists(string Data)
        {
            JsonResult objJR = Json(new { Status = "failed" }, JsonRequestBehavior.AllowGet);
            try
            {
                JavaScriptSerializer oSerializer = new JavaScriptSerializer();
                Dictionary<string, object> formulaDetails = (Dictionary<string, object>)oSerializer.Deserialize(Data, typeof(object));
                string FormulaName = Convert.ToString(formulaDetails["tierrule_name"]);
                long id = Convert.ToInt64(formulaDetails["id"]);
                JsonResult objBR = Json(new { Status = "Success", Result = Convert.ToBoolean(db.Tierrules.Where(x => x.tierrule_name.Trim().ToLower() == FormulaName.Trim().ToLower()).ToList().Count) }, JsonRequestBehavior.AllowGet);
                if (id > 0)
                {
                    if (FormulaName != db.Tierrules.Single(x => x.id == id).tierrule_name)
                    {
                        return objBR;
                    }
                    else
                    {
                        return Json(new { Status = "Success", Result = false }, JsonRequestBehavior.AllowGet);
                    }
                }
                else
                {
                    return objBR;
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "IsFormulaNameExists_JSON", ex.ToString());
            }
            return objJR;
        }
        #endregion
        #region IsFormulaNameExists
        public JsonResult IsFormulaExists(string Data)
        {
            JsonResult objJR = Json(new { Status = "failed" }, JsonRequestBehavior.AllowGet);
            try
            {
                JavaScriptSerializer oSerializer = new JavaScriptSerializer();
                Dictionary<string, object> formulaDetails = (Dictionary<string, object>)oSerializer.Deserialize(Data, typeof(object));
                string FormulaName = Convert.ToString(formulaDetails["formula"]);
                long id = Convert.ToInt64(formulaDetails["id"]);
                JsonResult objBR = Json(new { Status = "Success", Result = Convert.ToBoolean(db.Tierrules.Where(x => x.formula.Trim().ToLower() == FormulaName.Trim().ToLower()).ToList().Count) }, JsonRequestBehavior.AllowGet);
                if (id > 0)
                {
                    if (FormulaName != db.Tierrules.Single(x => x.id == id).formula)
                    {
                        return objBR;
                    }
                    else
                    {
                        return Json(new { Status = "Success", Result = false }, JsonRequestBehavior.AllowGet);
                    }
                }
                else
                {
                    return objBR;
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "IsFormulaExists_JSON", ex.ToString());
            }
            return objJR;
        }
        #endregion

        #region AddAction
        public ActionResult AddAction(long? id)
        {
            try
            {
                ActionsTbl objAction = new ActionsTbl();
                if (id.HasValue)
                {
                    objAction = db.ActionsTbl.SingleOrDefault(x => x.id == id);
                }
                ViewBag.items = new SelectList(AdminBAL.GetAllActionItems(), "id", "actionitem_name");
                return View(objAction);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "AddAction_GET", ex.ToString());
            }
            return View();
        }
        [HttpPost]
        public ActionResult AddAction(ActionsTbl objAction)
        {
            try
            {
                if (objAction.exclusive == false)
                    objAction.supplementary_action = true;
                else
                {
                    objAction.supplementary_action = false;
                    if (objAction.id > 0)
                    {
                        List<supplementary_action> lst = db.supplementary_action.Where(x => x.action_id == objAction.id).ToList();
                        AdminBAL.DeleteSuppActions(lst);
                    }
                }
                objAction.Action_IsActive = true;
                objAction.Action_IsDeleted = false;
                objAction.DateCreated = DateTime.Now;
                objAction.ModifiedBy = UserContext.Identity.userId;
                if (AdminBAL.AddUpdateAction(objAction) == 1)
                {
                    ModelState.Clear();
                    ViewBag.msg = _AppContext.Messages.Success;
                    ViewBag.items = new SelectList(AdminBAL.GetAllActionItems(), "id", "actionitem_name");
                }
            }
            catch (Exception ex)
            {
                ViewBag.msg = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Admin", "AddAction_POST", ex.ToString());
            }
            return View();
        }
        #endregion
        #region ActionList
        public ActionResult ActionList(long? id, string status)
        {
            try
            {
                if (id.HasValue && !string.IsNullOrEmpty(status))
                {
                    ActionsTbl objAction = db.ActionsTbl.SingleOrDefault(x => x.id == id);
                    if (objAction != null)
                    {
                        if (status.Equals("active"))
                        {
                            if (objAction.Action_IsActive == true)
                                objAction.Action_IsActive = false;
                            else
                                objAction.Action_IsActive = true;
                        }
                        else if (status.Equals("delete"))
                        {
                            if (objAction.Action_IsDeleted == true)
                                objAction.Action_IsDeleted = false;
                            else
                                objAction.Action_IsDeleted = true;
                        }
                        objAction.DateCreated = DateTime.Now;
                        objAction.ModifiedBy = UserContext.Identity.userId;
                        AdminBAL.AddUpdateAction(objAction);
                        RouteData.Values.Remove("id");
                        return RedirectToAction("ActionList", "Admin");
                    }
                }
                List<ActionsTbl> lstActions = db.ActionsTbl.OrderByDescending(x => x.DateCreated).ToList();
                return View(lstActions);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "ActionList_GET", ex.ToString());
            }
            return View();
        }
        #endregion
        #region AddSupplementaryAction
        public ActionResult AddSupplementaryAction(long? id)
        {
            try
            {
                ViewBag.id = id;
                ActionsTbl objAct = db.ActionsTbl.SingleOrDefault(x => x.id == id);
                ViewBag.action = objAct.Action_Name;
                List<ActionsTbl> lstAction = db.ActionsTbl.Where(x => x.id != id && x.supplementary_action == true && x.Action_IsDeleted == false).ToList();
                List<supplementary_action> lstSupp = db.supplementary_action.Where(x => x.action_id == id).ToList();
                foreach (supplementary_action item in lstSupp)
                {
                    lstAction.Find(x => x.id == item.supplementary_action_id).Action_IsSelected = true;
                }
                return View(lstAction);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "AddSupplementaryAction_GET", ex.ToString());
            }
            return View();
        }
        [HttpPost]
        public ActionResult AddSupplementaryAction(FormCollection frm)
        {
            try
            {
                List<long> Action_Ids = string.IsNullOrEmpty(frm["hdnActionIds"]) ? new List<long>() : frm["hdnActionIds"].Split(',').Select(long.Parse).ToList();
                long id = Convert.ToInt64(frm["action_id"]);
                AdminBAL.AddUpdateSupplementaryAction(id, Action_Ids);
                ViewBag.msg = _AppContext.Messages.Success;

                ViewBag.id = id;
                ActionsTbl objAct = db.ActionsTbl.SingleOrDefault(x => x.id == id);
                ViewBag.action = objAct.Action_Name;
                List<ActionsTbl> lstAction = db.ActionsTbl.Where(x => x.id != id && x.supplementary_action == true && x.Action_IsDeleted == false).ToList();
                List<supplementary_action> lstSupp = db.supplementary_action.Where(x => x.action_id == id).ToList();
                foreach (supplementary_action item in lstSupp)
                {
                    lstAction.Find(x => x.id == item.supplementary_action_id).Action_IsSelected = true;
                }
                return View(lstAction);
            }
            catch (Exception ex)
            {
                ViewBag.msg = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Admin", "AddSupplementaryAction_POST", ex.ToString());
            }
            return View();
        }
        #endregion
        #region ConflictsWith
        public ActionResult ConflictsWith(long? id)
        {
            try
            {
                ViewBag.id = id;
                ActionsTbl objAct = db.ActionsTbl.SingleOrDefault(x => x.id == id);
                ViewBag.action = objAct.Action_Name;
                List<ActionsTbl> lstAction = db.ActionsTbl.Where(x => x.id != id && x.Action_IsDeleted == false).ToList();
                List<conflicting_action> lstSupp = db.conflicting_action.Where(x => x.action_id == id).ToList();
                foreach (conflicting_action item in lstSupp)
                {
                    lstAction.Find(x => x.id == item.conflicting_action_id).Action_IsSelected = true;
                }
                return View(lstAction);
            }
            catch (Exception ex)
            {
                ViewBag.msg = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Admin", "ConflictsWith_GET", ex.ToString());
            }
            return View();
        }
        [HttpPost]
        public ActionResult ConflictsWith(FormCollection frm)
        {
            try
            {
                List<long> Action_Ids = string.IsNullOrEmpty(frm["hdnActionIds"]) ? new List<long>() : frm["hdnActionIds"].Split(',').Select(long.Parse).ToList();
                long id = Convert.ToInt64(frm["action_id"]);
                AdminBAL.AddUpdateConflicAction(id, Action_Ids);
                ViewBag.msg = _AppContext.Messages.Success;

                ViewBag.id = id;
                ActionsTbl objAct = db.ActionsTbl.SingleOrDefault(x => x.id == id);
                ViewBag.action = objAct.Action_Name;
                List<ActionsTbl> lstAction = db.ActionsTbl.Where(x => x.id != id && x.Action_IsDeleted == false).ToList();
                List<conflicting_action> lstSupp = db.conflicting_action.Where(x => x.action_id == id).ToList();
                foreach (conflicting_action item in lstSupp)
                {
                    lstAction.Find(x => x.id == item.conflicting_action_id).Action_IsSelected = true;
                }
                return View(lstAction);
            }
            catch (Exception ex)
            {
                ViewBag.msg = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Admin", "ConflictsWith_GET", ex.ToString());
            }
            return View();
        }
        #endregion
        #region IsActionExists
        public JsonResult IsActionExists(string Data)
        {
            JsonResult objJR = Json(new { Status = "failed" }, JsonRequestBehavior.AllowGet);
            try
            {
                JavaScriptSerializer oSerializer = new JavaScriptSerializer();
                Dictionary<string, object> actionDetails = (Dictionary<string, object>)oSerializer.Deserialize(Data, typeof(object));
                string Action_Name = Convert.ToString(actionDetails["Action_Name"]);
                long id = Convert.ToInt64(actionDetails["id"]);
                JsonResult objBR = Json(new { Status = "Success", Result = Convert.ToBoolean(db.ActionsTbl.Where(x => x.Action_Name.Trim().ToLower() == Action_Name.Trim().ToLower()).ToList().Count) }, JsonRequestBehavior.AllowGet);
                if (id > 0)
                {
                    if (Action_Name != db.ActionsTbl.Single(x => x.id == id).Action_Name)
                    {
                        return objBR;
                    }
                    else
                    {
                        return Json(new { Status = "Success", Result = false }, JsonRequestBehavior.AllowGet);
                    }
                }
                else
                {
                    return objBR;
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "IsActionExists_JSON", ex.ToString());
            }
            return objJR;
        }
        #endregion

        #region AddEvent
        public ActionResult AddEvent(long? id)
        {
            try
            {
                EventsTbl objEvent = new EventsTbl();
                if (id.HasValue)
                {
                    objEvent = db.EventsTbl.SingleOrDefault(x => x.Event_id == id);
                }
                return View(objEvent);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "AddEvent_GET", ex.ToString());
            }
            return View();
        }
        [HttpPost]
        public ActionResult AddEvent(EventsTbl objEvent)
        {
            try
            {
                objEvent.Event_IsActive = true;
                objEvent.Event_IsDeleted = false;
                objEvent.Event_DateCreated = DateTime.Now;
                objEvent.ModifiedBy = UserContext.Identity.userId;
                if (AdminBAL.AddUpdateEvent(objEvent) == 1)
                {
                    ModelState.Clear();
                    ViewBag.msg = _AppContext.Messages.Success;
                }
            }
            catch (Exception ex)
            {
                ViewBag.msg = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Admin", "AddEvent_POST", ex.ToString());
            }
            return View();
        }
        #endregion
        #region EventList
        public ActionResult EventList(long? id, string status)
        {
            try
            {
                if (id.HasValue && !string.IsNullOrEmpty(status))
                {
                    EventsTbl objEvent = db.EventsTbl.SingleOrDefault(x => x.Event_id == id);
                    if (objEvent != null)
                    {
                        if (status.Equals("active"))
                        {
                            if (objEvent.Event_IsActive == true)
                                objEvent.Event_IsActive = false;
                            else
                                objEvent.Event_IsActive = true;
                        }
                        else if (status.Equals("delete"))
                        {
                            if (objEvent.Event_IsDeleted == true)
                                objEvent.Event_IsDeleted = false;
                            else
                                objEvent.Event_IsDeleted = true;
                        }
                        objEvent.Event_DateCreated = DateTime.Now;
                        objEvent.ModifiedBy = UserContext.Identity.userId;
                        AdminBAL.AddUpdateEvent(objEvent);
                        RouteData.Values.Remove("id");
                        return RedirectToAction("EventList", "Admin");
                    }
                }
                List<EventsTbl> lstEvent = db.EventsTbl.OrderByDescending(x => x.Event_DateCreated).ToList();
                return View(lstEvent);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "EventList_GET", ex.ToString());
            }
            return View();
        }
        #endregion
        #region IsEventExists
        public JsonResult IsEventExists(string Data)
        {
            JsonResult objJR = Json(new { Status = "failed" }, JsonRequestBehavior.AllowGet);
            try
            {
                JavaScriptSerializer oSerializer = new JavaScriptSerializer();
                Dictionary<string, object> eventDetails = (Dictionary<string, object>)oSerializer.Deserialize(Data, typeof(object));
                string Event_Name = Convert.ToString(eventDetails["Event_Name"]);
                long id = Convert.ToInt64(eventDetails["Event_id"]);
                JsonResult objBR = Json(new { Status = "Success", Result = Convert.ToBoolean(db.EventsTbl.Where(x => x.Event_Name.Trim().ToLower() == Event_Name.Trim().ToLower()).ToList().Count) }, JsonRequestBehavior.AllowGet);
                if (id > 0)
                {
                    if (Event_Name != db.EventsTbl.Single(x => x.Event_id == id).Event_Name)
                    {
                        return objBR;
                    }
                    else
                    {
                        return Json(new { Status = "Success", Result = false }, JsonRequestBehavior.AllowGet);
                    }
                }
                else
                {
                    return objBR;
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "IsEventExists_JSON", ex.ToString());
            }
            return objJR;
        }
        #endregion

        #region Add Loyalty Classification
        public ActionResult AddLoyaltyClassification(long? id)
        {
            try
            {
                Tierlevel objTierlevel = new Tierlevel();
                if (id.HasValue)
                {
                    objTierlevel = db.Tierlevels.SingleOrDefault(x => x.id == id);
                }
                List<ActivityType> lstActivity = db.ActivityType.Where(x => x.ActivityType_IsActive == true && x.ActivityType_IsDeleted == false).OrderBy(x => x.ActivityType_Name).ToList();
                lstActivity.Insert(0, new ActivityType { ActivityType_id = -1, ActivityType_Name = "All" });
                lstActivity.Insert(1, new ActivityType { ActivityType_id = -2, ActivityType_Name = "None" });
                ViewBag.ActivityTypes = new SelectList(lstActivity, "ActivityType_id", "ActivityType_Name", -1);

                List<VwProducts_ProductTypes> lstProductTypes = db.VwProducts_ProductTypes.Where(x => x.ProductType_IsActive == true && x.ProductType_IsDeleted == false && x.Product_IsActive == true && x.Product_IsDeleted == false).GroupBy(x => x.ProductType_id).Select(grp => grp.FirstOrDefault()).ToList();
                lstProductTypes.Insert(0, new VwProducts_ProductTypes { ProductType_id = -1, ProductType_Name = "All" });
                lstProductTypes.Insert(1, new VwProducts_ProductTypes { ProductType_id = -2, ProductType_Name = "None" });
                ViewBag.ProductTypes = new SelectList(lstProductTypes, "ProductType_id", "ProductType_Name", -1);

                List<VwChannels_ChannelTypes> lstChannelTypes = db.VwChannels_ChannelTypes.Where(x => x.ChannelType_IsActive == true && x.ChannelType_IsDeleted == false && x.Channel_IsActive == true && x.Channel_IsDeleted == false).GroupBy(x => x.ChannelType_id).Select(g => g.FirstOrDefault()).ToList();
                lstChannelTypes.Insert(0, new VwChannels_ChannelTypes { ChannelType_id = -1, ChannelType_Name = "All" });
                lstChannelTypes.Insert(1, new VwChannels_ChannelTypes { ChannelType_id = -2, ChannelType_Name = "None" });
                ViewBag.ChannelTypes = new SelectList(lstChannelTypes, "ChannelType_id", "ChannelType_Name", -1);

                List<AccountType> lstAccountTypes = db.AccountType.Where(x => x.AccIsDeleted == false).OrderBy(x => x.AccType).ToList();
                lstAccountTypes.Insert(0, new AccountType { id = -1, AccType = "All" });
                lstAccountTypes.Insert(1, new AccountType { id = 0, AccType = "None" });
                ViewBag.AccTypes = new SelectList(lstAccountTypes, "id", "AccType", -1);

                List<EventsTbl> lstEvents = db.EventsTbl.Where(x => x.Event_IsActive == true && x.Event_IsDeleted == false).OrderBy(x => x.Event_Name).ToList();
                lstEvents.Insert(0, new EventsTbl { Event_id = -1, Event_Name = "All" });
                lstEvents.Insert(1, new EventsTbl { Event_id = -2, Event_Name = "None" });
                ViewBag.Events = new SelectList(lstEvents, "Event_id", "Event_Name", -1);

                List<Country> lstCountries = db.Countries.Where(x => x.IsActive == true && x.IsDeleted == false).OrderBy(x => x.CountryName).ToList();
                lstCountries.Insert(0, new Country { CountryId = -1, CountryName = "All" });
                lstCountries.Insert(1, new Country { CountryId = -2, CountryName = "None" });
                ViewBag.Countries = new SelectList(lstCountries, "CountryId", "CountryName", -1);
                return View(objTierlevel);
            }
            catch (Exception ex)
            {
                ViewBag.msg = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Admin", "AddLoyaltyClassification_GET", ex.ToString());
            }
            return View();
        }
        [HttpPost]
        public ActionResult AddLoyaltyClassification(Tierlevel objTierlevel)
        {
            try
            {
                List<ActivityType> lstActivity = db.ActivityType.Where(x => x.ActivityType_IsActive == true && x.ActivityType_IsDeleted == false).OrderBy(x => x.ActivityType_Name).ToList();
                lstActivity.Insert(0, new ActivityType { ActivityType_id = -1, ActivityType_Name = "All" });
                lstActivity.Insert(1, new ActivityType { ActivityType_id = -2, ActivityType_Name = "None" });
                ViewBag.ActivityTypes = new SelectList(lstActivity, "ActivityType_id", "ActivityType_Name", -1);

                List<VwProducts_ProductTypes> lstProductTypes = db.VwProducts_ProductTypes.Where(x => x.ProductType_IsActive == true && x.ProductType_IsDeleted == false && x.Product_IsActive == true && x.Product_IsDeleted == false).GroupBy(x => x.ProductType_id).Select(grp => grp.FirstOrDefault()).ToList();
                lstProductTypes.Insert(0, new VwProducts_ProductTypes { ProductType_id = -1, ProductType_Name = "All" });
                lstProductTypes.Insert(1, new VwProducts_ProductTypes { ProductType_id = -2, ProductType_Name = "None" });
                ViewBag.ProductTypes = new SelectList(lstProductTypes, "ProductType_id", "ProductType_Name", -1);

                List<VwChannels_ChannelTypes> lstChannelTypes = db.VwChannels_ChannelTypes.Where(x => x.ChannelType_IsActive == true && x.ChannelType_IsDeleted == false && x.Channel_IsActive == true && x.Channel_IsDeleted == false).GroupBy(x => x.ChannelType_id).Select(g => g.FirstOrDefault()).ToList();
                lstChannelTypes.Insert(0, new VwChannels_ChannelTypes { ChannelType_id = -1, ChannelType_Name = "All" });
                lstChannelTypes.Insert(1, new VwChannels_ChannelTypes { ChannelType_id = -2, ChannelType_Name = "None" });
                ViewBag.ChannelTypes = new SelectList(lstChannelTypes, "ChannelType_id", "ChannelType_Name", -1);

                List<AccountType> lstAccountTypes = db.AccountType.Where(x => x.AccIsDeleted == false).OrderBy(x => x.AccType).ToList();
                lstAccountTypes.Insert(0, new AccountType { id = -1, AccType = "All" });
                lstAccountTypes.Insert(1, new AccountType { id = 0, AccType = "None" });
                ViewBag.AccTypes = new SelectList(lstAccountTypes, "id", "AccType", -1);

                List<EventsTbl> lstEvents = db.EventsTbl.Where(x => x.Event_IsActive == true && x.Event_IsDeleted == false).OrderBy(x => x.Event_Name).ToList();
                lstEvents.Insert(0, new EventsTbl { Event_id = -1, Event_Name = "All" });
                lstEvents.Insert(1, new EventsTbl { Event_id = -2, Event_Name = "None" });
                ViewBag.Events = new SelectList(lstEvents, "Event_id", "Event_Name", -1);

                List<Country> lstCountries = db.Countries.Where(x => x.IsActive == true && x.IsDeleted == false).OrderBy(x => x.CountryName).ToList();
                lstCountries.Insert(0, new Country { CountryId = -1, CountryName = "All" });
                lstCountries.Insert(1, new Country { CountryId = -2, CountryName = "None" });
                ViewBag.Countries = new SelectList(lstCountries, "CountryId", "CountryName", -1);

                objTierlevel.tierlevel_IsActive = true;
                objTierlevel.tierlevel_IsDelete = false;
                objTierlevel.date_created = DateTime.Now;
                objTierlevel.ModifiedBy = UserContext.Identity.userId;
                if (objTierlevel.activity_id == -1)
                {
                    objTierlevel.all_activities = true;
                    objTierlevel.activity_id = null;
                }
                else
                {
                    if (objTierlevel.activity_id == -2)
                    {
                        objTierlevel.activity_id = null;
                    }
                    objTierlevel.all_activities = null;
                }
                if (objTierlevel.channel_id == -1)
                {
                    objTierlevel.all_channels = true;
                    objTierlevel.channel_id = null;
                }
                else
                {
                    if (objTierlevel.channel_id == -2)
                    {
                        objTierlevel.channel_id = null;
                    }
                    objTierlevel.all_channels = null;
                }
                if (objTierlevel.product_id == -1)
                {
                    objTierlevel.all_items = true;
                    objTierlevel.product_id = null;
                }
                else
                {
                    if (objTierlevel.product_id == -2)
                    {
                        objTierlevel.product_id = null;
                    }
                    objTierlevel.all_items = null;
                }
                if (objTierlevel.activitytype_id < 0)
                {
                    objTierlevel.activitytype_id = null;
                }
                if (objTierlevel.accounttype_id < 0)
                {
                    objTierlevel.accounttype_id = null;
                }
                if (objTierlevel.channeltype_id < 0)
                {
                    objTierlevel.channeltype_id = null;
                }
                if (objTierlevel.producttype_id < 0)
                {
                    objTierlevel.producttype_id = null;
                }
                if (objTierlevel.event_id < 0)
                {
                    objTierlevel.event_id = null;
                }
                if (objTierlevel.country_id < 0)
                {
                    objTierlevel.country_id = null;
                }
                if (AdminBAL.AddUpdateClassification(objTierlevel) == 1)
                {
                    ModelState.Clear();
                    ViewBag.msg = _AppContext.Messages.Success;
                }

            }
            catch (Exception ex)
            {
                ViewBag.msg = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Admin", "AddLoyaltyClassification_POST", ex.ToString());
            }
            return View();
        }
        #endregion
        #region LoyaltyClassificationList
        public ActionResult LoyaltyClassificationList(long? id, string status)
        {
            try
            {
                if (id.HasValue && !string.IsNullOrEmpty(status))
                {
                    Tierlevel objTierlevel = db.Tierlevels.SingleOrDefault(x => x.id == id);
                    if (objTierlevel != null)
                    {
                        if (status.Equals("active"))
                        {
                            if (objTierlevel.tierlevel_IsActive == true)
                                objTierlevel.tierlevel_IsActive = false;
                            else
                                objTierlevel.tierlevel_IsActive = true;
                        }
                        else if (status.Equals("delete"))
                        {
                            if (objTierlevel.tierlevel_IsDelete == true)
                                objTierlevel.tierlevel_IsDelete = false;
                            else
                                objTierlevel.tierlevel_IsDelete = true;
                        }
                        objTierlevel.date_created = DateTime.Now;
                        objTierlevel.ModifiedBy = UserContext.Identity.userId;
                        AdminBAL.AddUpdateClassification(objTierlevel);
                        RouteData.Values.Remove("id");
                        return RedirectToAction("LoyaltyClassificationList", "Admin");
                    }
                }
                List<Tierlevel> lstTierlevel = db.Tierlevels.OrderByDescending(x => x.date_created).ToList();
                return View(lstTierlevel);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "LoyaltyClassificationList_GET", ex.ToString());
            }
            return View();
        }
        #endregion
        #region IsClassificationExists
        public JsonResult IsClassificationExists(string Data)
        {
            JsonResult objJR = Json(new { Status = "failed" }, JsonRequestBehavior.AllowGet);
            try
            {
                JavaScriptSerializer oSerializer = new JavaScriptSerializer();
                Dictionary<string, object> classDetails = (Dictionary<string, object>)oSerializer.Deserialize(Data, typeof(object));
                string tierlevel_name = Convert.ToString(classDetails["tierlevel_name"]);
                long id = Convert.ToInt64(classDetails["id"]);
                JsonResult objBR = Json(new { Status = "Success", Result = Convert.ToBoolean(db.Tierlevels.Where(x => x.tierlevel_name.Trim().ToLower() == tierlevel_name.Trim().ToLower()).ToList().Count) }, JsonRequestBehavior.AllowGet);
                if (id > 0)
                {
                    if (tierlevel_name != db.Tierlevels.Single(x => x.id == id).tierlevel_name)
                    {
                        return objBR;
                    }
                    else
                    {
                        return Json(new { Status = "Success", Result = false }, JsonRequestBehavior.AllowGet);
                    }
                }
                else
                {
                    return objBR;
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "IsClassificationExists_JSON", ex.ToString());
            }
            return objJR;
        }
        #endregion

        #region Add Loyalty Program
        public ActionResult AddLoyaltyProgram(long? id)
        {
            try
            {
                Loyalty_Program objLylty = new Loyalty_Program();
                if (id.HasValue)
                {
                    objLylty = db.Loyalty_Program.SingleOrDefault(x => x.id == id);
                }
                ViewBag.TimePeriod = new SelectList(db.TimeDurations.Where(x => x.Type == "Number").ToList(), "TimeDuration_id", "Value");
                ViewBag.PeriodType = new SelectList(db.TimeDurations.Where(x => x.Type == "Duration").ToList(), "TimeDuration_id", "Value");
                List<TimeDuration> lstDays = db.TimeDurations.Where(x => x.Type == "Weekday").ToList();
                lstDays.Insert(0, new TimeDuration { TimeDuration_id = -1, Value = "All" });
                ViewBag.Day = new SelectList(lstDays, "TimeDuration_id", "Value");
                ViewBag.Classifications = new SelectList(db.Tierlevels.Where(x => x.tierlevel_IsActive == true && x.tierlevel_IsDelete == false).OrderBy(x => x.tierlevel_name).ToList(), "id", "tierlevel_name");
                ViewBag.formula = new SelectList(db.Tierrules.Where(x => x.tierrule_IsActive == true && x.tierrule_IsDeleted == false).OrderBy(x => x.tierrule_name).ToList(), "id", "tierrule_name");
                ViewBag.Actions = new SelectList(db.ActionsTbl.Where(x => x.Action_IsActive == true && x.Action_IsDeleted == false).OrderBy(x => x.Action_Name).ToList(), "id", "Action_Name");
                ViewBag.Templates = new SelectList(db.CommunicationTemplates.Where(x => x.IsActive == true && x.IsDeleted == false).OrderBy(x => x.Template_Name).ToList(), "Template_Id", "Template_Name");
                return View(objLylty);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "AddLoyaltyProgram_GET", ex.ToString());
            }
            return View();
        }
        [HttpPost]
        public ActionResult AddLoyaltyProgram(Loyalty_Program objLylty)
        {
            try
            {
                ViewBag.TimePeriod = new SelectList(db.TimeDurations.Where(x => x.Type == "Number").ToList(), "TimeDuration_id", "Value");
                ViewBag.PeriodType = new SelectList(db.TimeDurations.Where(x => x.Type == "Duration").ToList(), "TimeDuration_id", "Value");
                List<TimeDuration> lstDays = db.TimeDurations.Where(x => x.Type == "Weekday").ToList();
                lstDays.Insert(0, new TimeDuration { TimeDuration_id = -1, Value = "All" });
                ViewBag.Day = new SelectList(lstDays, "TimeDuration_id", "Value");
                ViewBag.Classifications = new SelectList(db.Tierlevels.Where(x => x.tierlevel_IsActive == true && x.tierlevel_IsDelete == false).OrderBy(x => x.tierlevel_name).ToList(), "id", "tierlevel_name");
                ViewBag.formula = new SelectList(db.Tierrules.Where(x => x.tierrule_IsActive == true && x.tierrule_IsDeleted == false).OrderBy(x => x.tierrule_name).ToList(), "id", "tierrule_name");
                ViewBag.Actions = new SelectList(db.ActionsTbl.Where(x => x.Action_IsActive == true && x.Action_IsDeleted == false).OrderBy(x => x.Action_Name).ToList(), "id", "Action_Name");
                ViewBag.Templates = new SelectList(db.CommunicationTemplates.Where(x => x.IsActive == true && x.IsDeleted == false).OrderBy(x => x.Template_Name).ToList(), "Template_Id", "Template_Name");
                objLylty.IsApproved = false;
                objLylty.IsDiscontinued = false;
                objLylty.IsExclusive = true;
                objLylty.date_created = DateTime.Now;
                objLylty.ModifiedBy = UserContext.Identity.userId;
                if (AdminBAL.AddUpdateLoyaltyProgram(objLylty) == 1)
                {
                    ModelState.Clear();
                    ViewBag.msg = _AppContext.Messages.Success;
                }
                Tiertable objTierTable = db.Tiertables.SingleOrDefault(x => x.loyaltyprogram_id == objLylty.id);
                if (objTierTable == null)
                {
                    objTierTable = new Tiertable();
                }
                objTierTable.loyaltyprogram_id = objLylty.id;
                objTierTable.tierlevel_id = objLylty.tierlevel_id;
                objTierTable.tierrule_id = objLylty.tierrule_id;
                objTierTable.date_created = DateTime.Now;
                objTierTable.ModifiedBy = UserContext.Identity.userId;
                AdminBAL.AddUpdateLoyaltyProgram_Tiertable(objTierTable);
            }
            catch (Exception ex)
            {
                ViewBag.msg = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Admin", "AddLoyaltyProgram_GET", ex.ToString());
            }
            return View();
        }
        #endregion
        #region LoyaltyProgramsList
        public ActionResult LoyaltyProgramsList(long? id, string status)
        {
            try
            {
                if (id.HasValue && !string.IsNullOrEmpty(status))
                {
                    Loyalty_Program objLoyaltyProg = db.Loyalty_Program.SingleOrDefault(x => x.id == id);
                    if (objLoyaltyProg != null)
                    {
                        if (status.Equals("exclusive") && _AppContext.HasPermission(Parameters.Can_Make_LoyaltyProgram_Exclusive))
                        {
                            if (objLoyaltyProg.IsExclusive == true)
                                objLoyaltyProg.IsExclusive = false;
                            else
                                objLoyaltyProg.IsExclusive = true;
                        }
                        else if (status.Equals("discontinued") && _AppContext.HasPermission(Parameters.Can_Make_LoyaltyProgram_Continued))
                        {
                            if (objLoyaltyProg.IsDiscontinued == true)
                                objLoyaltyProg.IsDiscontinued = false;
                            else
                                objLoyaltyProg.IsDiscontinued = true;
                        }
                        objLoyaltyProg.date_created = DateTime.Now;
                        objLoyaltyProg.ModifiedBy = UserContext.Identity.userId;
                        AdminBAL.AddUpdateLoyaltyProgram(objLoyaltyProg);
                        RouteData.Values.Remove("id");
                        return RedirectToAction("LoyaltyProgramsList", "Admin");
                    }
                }
                List<Loyalty_Program> lstLoyaltyProg = db.Loyalty_Program.OrderByDescending(x => x.date_created).ToList();
                return View(lstLoyaltyProg);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "LoyaltyProgramsList_GET", ex.ToString());
            }
            return View();
        }
        #endregion
        #region IsLoyaltyProgramExists
        public JsonResult IsLoyaltyProgramExists(string Data)
        {
            JsonResult objJR = Json(new { Status = "failed" }, JsonRequestBehavior.AllowGet);
            try
            {
                JavaScriptSerializer oSerializer = new JavaScriptSerializer();
                Dictionary<string, object> classDetails = (Dictionary<string, object>)oSerializer.Deserialize(Data, typeof(object));
                string Loyalty_Program_Name = Convert.ToString(classDetails["Loyalty_Program_Name"]);
                long id = Convert.ToInt64(string.IsNullOrEmpty(classDetails["id"].ToString()) ? "0" : classDetails["id"]);
                JsonResult objBR = Json(new { Status = "Success", Result = Convert.ToBoolean(db.Loyalty_Program.Where(x => x.Loyalty_Program_Name.Trim().ToLower() == Loyalty_Program_Name.Trim().ToLower()).ToList().Count) }, JsonRequestBehavior.AllowGet);
                if (id > 0)
                {
                    if (Loyalty_Program_Name != db.Loyalty_Program.Single(x => x.id == id).Loyalty_Program_Name)
                    {
                        return objBR;
                    }
                    else
                    {
                        return Json(new { Status = "Success", Result = false }, JsonRequestBehavior.AllowGet);
                    }
                }
                else
                {
                    return objBR;
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "IsLoyaltyProgramExists_JSON", ex.ToString());
            }
            return objJR;
        }
        #endregion

        #region Get Activities from ActivityType id
        public JsonResult GetActivitiesFromTypeID(string id)
        {
            JsonResult objJR = Json(new { Status = "failed" }, JsonRequestBehavior.AllowGet);
            try
            {
                if (!string.IsNullOrEmpty(id))
                {
                    long typeId = Convert.ToInt64(id);
                    var act = AdminBAL.GetActivitiesFromActivityTypeId(typeId).Select(x => new Activity { Activity_id = x.Activity_id, Activity_Name = x.Activity_Name });
                    return Json(act);
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "GetActivitiesFromTypeID_JSON", ex.ToString());
            }
            return objJR;
        }
        #endregion

        #region Get Products from ProductType id
        public JsonResult GetProductsFromTypeID(string id)
        {
            JsonResult objJR = Json(new { Status = "failed" }, JsonRequestBehavior.AllowGet);
            try
            {
                if (!string.IsNullOrEmpty(id))
                {
                    long typeId = Convert.ToInt64(id);
                    return Json(AdminBAL.GetProductsFromProductTypeId(typeId));
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "GetProductsFromTypeID_JSON", ex.ToString());
            }
            return objJR;
        }
        #endregion

        #region Get Channels from Channel type id
        public JsonResult GetChannelsFromTypeID(string id)
        {
            JsonResult objJR = Json(new { Status = "failed" }, JsonRequestBehavior.AllowGet);
            try
            {
                if (!string.IsNullOrEmpty(id))
                {
                    long typeId = Convert.ToInt64(id);
                    return Json(AdminBAL.GetChannelsFromChannelTypeId(typeId));
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "GetChannelsFromTypeID_JSON", ex.ToString());
            }
            return objJR;
        }
        #endregion

        #region AddComTemplate
        public ActionResult AddComTemplate(long? id)
        {
            try
            {
                CommunicationTemplates objComTemplate = new CommunicationTemplates();
                if (id.HasValue)
                    objComTemplate = db.CommunicationTemplates.SingleOrDefault(x => x.Template_Id == id);
                return View(objComTemplate);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "AddComTemplate_GET", ex.ToString());
            }
            return View();
        }
        [HttpPost]
        public ActionResult AddComTemplate(CommunicationTemplates objComTemplate)
        {
            try
            {
                if (objComTemplate.Template_Id > 0)
                {
                    objComTemplate.IsActive = true;
                    objComTemplate.IsDeleted = false;
                    objComTemplate.DateCreated = DateTime.Now;
                    objComTemplate.ModifiedBy = UserContext.Identity.userId;
                    if (AdminBAL.AddUpdateComTemplate(objComTemplate) == 1)
                        ViewBag.msg = _AppContext.Messages.Success;
                }
            }
            catch (Exception ex)
            {
                ViewBag.msg = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Admin", "AddComTemplate_POST", ex.ToString());
            }
            return View(objComTemplate);
        }
        #endregion
        #region ComTemplateList
        public ActionResult ComTemplateList()
        {
            try
            {
                List<CommunicationTemplates> lstComTemplate = db.CommunicationTemplates.OrderByDescending(x => x.DateCreated).ToList();
                return View(lstComTemplate);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "ComTemplateList_GET", ex.ToString());
            }
            return View();
        }
        #endregion
        #region Send Message
        public ActionResult SendMessage()
        {
            try
            {
                ViewBag.msgtype = new SelectList(db.MessageTypes.Where(x => x.IsActive == true).ToList(), "message_type_id", "message_type");
                //ViewBag.custtype = new SelectList(db.CustomerTypes.Where(x => x.IsActive == true).ToList(), "CustomerType_id", "Customer_Type");
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "SendMessage_GET", ex.ToString());
            }
            return View();
        }
        [HttpPost]
        public ActionResult SendMessage(Message objMessage)
        {
            try
            {
                //List<Lnk_Customers_CustomerTypes> lst = db.Lnk_Customers_CustomerTypes.Where(x => x.CustomerType_id == objMessage.customer_type_id).ToList();
                //List<string> lstEmails = new List<string>();
                //string email;
                //if (lst != null && lst.Count > 0)
                //{
                //    foreach (var item in lst)
                //    {
                //        Customer objCustomer = db.Customers.SingleOrDefault(x => x.Customer_id == item.Customer_id);
                //        if (objCustomer != null)
                //        {
                //            email = objCustomer.Customer_Email;
                //            if (!string.IsNullOrEmpty(email))
                //                lstEmails.Add(email);
                //        }
                //    }
                //}
                //string mailids = string.Join(",", lstEmails);
                //_AppContext.SendMessageToCustomers(mailids, objMessage.message_subject, objMessage.message_body);
                //objMessage.from_id = UserContext.Identity.userId;
                //objMessage.message_date = DateTime.Now;
                //if (AdminBAL.SaveSentMsg(objMessage) > 0)
                //{
                //    ViewBag.msg = _AppContext.Messages.Success;
                //    ViewBag.msgtype = new SelectList(db.MessageTypes.Where(x => x.IsActive == true).ToList(), "message_type_id", "message_type");
                //    ViewBag.custtype = new SelectList(db.CustomerTypes.Where(x => x.IsActive == true).ToList(), "CustomerType_id", "Customer_Type");
                //    ModelState.Clear();
                //    objMessage = new Message();
                //}
                List<string> lstEmails = db.Customers.Where(x => x.IsActive == true && x.IsDeleted == false && x.CustomerDesignation.Equals(objMessage.customer_type)).Select(x => x.Customer_Email).ToList();
                string mailids = string.Join(",", lstEmails);
                _AppContext.SendMessageToCustomers(mailids, objMessage.message_subject, objMessage.message_body);
                objMessage.from_id = UserContext.Identity.userId;
                objMessage.message_date = DateTime.Now;
                objMessage.ModifiedBy = UserContext.Identity.userId;
                if (AdminBAL.SaveSentMsg(objMessage) > 0)
                {
                    ViewBag.msg = _AppContext.Messages.Success;
                    ViewBag.msgtype = new SelectList(db.MessageTypes.Where(x => x.IsActive == true).ToList(), "message_type_id", "message_type");
                    ModelState.Clear();
                    objMessage = new Message();
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "SendMessage_POST", ex.ToString());
            }
            return View();
        }
        #endregion
        #region SentMessages
        public ActionResult SentMessages()
        {
            try
            {
                List<Message> lstSentMsgs = db.Messages.OrderByDescending(x => x.message_date).ToList();
                return View(lstSentMsgs);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "SentMessages_GET", ex.ToString());
            }
            return View();
        }
        #endregion
        #region ViewMessage
        public ActionResult ViewMessage(long? id)
        {
            try
            {
                if (id.HasValue)
                {
                    Message objMessage = db.Messages.SingleOrDefault(x => x.id == id);
                    return View(objMessage);
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "ViewMessage_GET", ex.ToString());
            }
            return View();
        }
        #endregion

        #region Add Action Item
        public ActionResult AddActionItem(long? id, string status)
        {
            try
            {
                actionitem objItem = new actionitem();
                if (id.HasValue)
                {
                    objItem = db.actionitems.SingleOrDefault(x => x.id == id);
                }
                return View(objItem);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "AddActionItem_GET", ex.ToString());
            }
            return View();
        }
        [HttpPost]
        public ActionResult AddActionItem(actionitem objItem)
        {
            try
            {
                objItem.IsActive = true;
                objItem.IsDeleted = false;
                objItem.created = DateTime.Now;
                if (objItem.baseitem == true)
                {
                    List<actionitem> lstItems = db.actionitems.Where(x => x.baseitem == true).ToList();
                    if (lstItems.Count > 0 && lstItems != null)
                    {
                        foreach (actionitem item in lstItems)
                        {
                            item.baseitem = false;
                            item.ModifiedBy = UserContext.Identity.userId;
                            AdminBAL.AddUpdateActionItem(item);
                        }
                    }
                }
                objItem.ModifiedBy = UserContext.Identity.userId;
                AdminBAL.AddUpdateActionItem(objItem);
                ViewBag.msg = _AppContext.Messages.Success;
                ModelState.Clear();
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "AddActionItem_POST", ex.ToString());
                ViewBag.msg = _AppContext.Messages.Error;
            }
            return View();
        }
        #endregion
        #region ActionItemList
        public ActionResult ActionItemList(long? id, string status)
        {
            try
            {
                if (id.HasValue && !string.IsNullOrEmpty(status))
                {
                    actionitem objItem = db.actionitems.SingleOrDefault(x => x.id == id);
                    if (objItem != null)
                    {
                        if (status.Equals("baseitem") && _AppContext.HasPermission(Parameters.Can_Make_Action_Item_Default))
                        {
                            if (objItem.baseitem == false)
                            {
                                List<actionitem> lstItems = db.actionitems.Where(x => x.baseitem == true).ToList();
                                if (lstItems.Count > 0 && lstItems != null)
                                {
                                    foreach (actionitem item in lstItems)
                                    {
                                        item.baseitem = false;
                                        item.ModifiedBy = UserContext.Identity.userId;
                                        AdminBAL.AddUpdateActionItem(item);
                                    }
                                }
                                objItem.baseitem = true;
                            }
                        }
                        else if (status.Equals("active"))
                        {
                            if (objItem.IsActive == true)
                                objItem.IsActive = false;
                            else
                                objItem.IsActive = true;
                        }
                        else if (status.Equals("delete"))
                        {
                            if (objItem.IsDeleted == true)
                                objItem.IsDeleted = false;
                            else
                                objItem.IsDeleted = true;
                        }
                        objItem.created = DateTime.Now;
                        objItem.ModifiedBy = UserContext.Identity.userId;
                        AdminBAL.AddUpdateActionItem(objItem);
                        RouteData.Values.Remove("id");
                        return RedirectToAction("ActionItemList", "Admin");
                    }
                }
                List<actionitem> lstactionitems = db.actionitems.OrderByDescending(x => x.created).ToList();
                return View(lstactionitems);
            }
            catch (Exception ex)
            {
                ViewBag.msg = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Admin", "ActionItemList_GET", ex.ToString());
            }
            return View();
        }
        #endregion
        #region IsActionItemExists
        public JsonResult IsActionItemExists(string Data)
        {
            JsonResult objJR = Json(new { Status = "failed" }, JsonRequestBehavior.AllowGet);
            try
            {
                JavaScriptSerializer oSerializer = new JavaScriptSerializer();
                Dictionary<string, object> actionDetails = (Dictionary<string, object>)oSerializer.Deserialize(Data, typeof(object));
                string actionitem_name = Convert.ToString(actionDetails["actionitem_name"]);
                long id = Convert.ToInt64(actionDetails["id"]);
                JsonResult objBR = Json(new { Status = "Success", Result = Convert.ToBoolean(db.actionitems.Where(x => x.actionitem_name.Trim().ToLower() == actionitem_name.Trim().ToLower()).ToList().Count) }, JsonRequestBehavior.AllowGet);
                if (id > 0)
                {
                    if (actionitem_name != db.actionitems.Single(x => x.id == id).actionitem_name)
                    {
                        return objBR;
                    }
                    else
                    {
                        return Json(new { Status = "Success", Result = false }, JsonRequestBehavior.AllowGet);
                    }
                }
                else
                {
                    return objBR;
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "IsActionItemExists_JSON", ex.ToString());
            }
            return objJR;
        }

        #endregion

        #region Add Account Types
        public ActionResult AddAccountType(long? id)
        {
            try
            {
                AccountType objAccType = new AccountType();
                if (id.HasValue)
                {
                    objAccType = db.AccountType.SingleOrDefault(x => x.id == id);
                }
                List<ActionsTbl> lstActions = db.ActionsTbl.Where(x => x.Action_IsDeleted == false).OrderBy(x => x.Action_Name).ToList();
                if (id.HasValue)
                {
                    List<AccountType_Action> lstAccAct = db.AccountType_Action.Where(x => x.AccTypeId == id).ToList();
                    if (lstAccAct.Count > 0 && lstAccAct != null)
                    {
                        foreach (var item in lstAccAct)
                        {
                            lstActions.Find(x => x.id == item.ActionId).Action_IsSelected = true;
                        }
                    }
                }
                var tpl = new Tuple<AccountType, List<ActionsTbl>>(objAccType, lstActions) { };
                return View(tpl);
            }
            catch (Exception ex)
            {
                ViewBag.msg = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Admin", "AddAccountType_GET", ex.ToString());
            }
            return View();
        }
        [HttpPost]
        public ActionResult AddAccountType(AccountType item1, FormCollection frm)
        {
            try
            {
                List<long> Action_Ids = string.IsNullOrEmpty(frm["hdnActionIds"]) ? new List<long>() : frm["hdnActionIds"].Split(',').Select(long.Parse).ToList();
                item1.AccIsDeleted = false;
                item1.AccDateCreated = DateTime.Now;
                if (Action_Ids.Count > 0 && Action_Ids != null)
                {
                    AdminBAL.AddUpdateAccountTypes(item1, Action_Ids);
                    TempData["msg"] = _AppContext.Messages.Success;
                }
                return RedirectToAction("AccountTypeList", "Admin");
            }
            catch (Exception ex)
            {
                ViewBag.msg = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Admin", "AddAccountType_GET", ex.ToString());
            }
            return View();
        }
        #endregion
        #region AccountTypeList
        public ActionResult AccountTypeList(long? id, string status)
        {
            try
            {
                if (id.HasValue && !string.IsNullOrEmpty(status))
                {
                    AccountType objAcc = db.AccountType.SingleOrDefault(x => x.id == id);
                    if (status.Equals("delete"))
                    {
                        if (objAcc.AccIsDeleted == true)
                            objAcc.AccIsDeleted = false;
                        else
                            objAcc.AccIsDeleted = true;
                        objAcc.AccDateCreated = DateTime.Now;
                        objAcc.ModifiedBy = UserContext.Identity.userId;
                        AdminBAL.UpdateAccountTypes(objAcc);
                        RouteData.Values.Remove("id");
                        return RedirectToAction("AccountTypeList", "Admin");
                    }
                }
                List<AccountType> lstAccountType = db.AccountType.OrderByDescending(x => x.AccDateCreated).ToList();
                return View(lstAccountType);
            }
            catch (Exception ex)
            {
                ViewBag.msg = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Admin", "AccountTypeList_GET", ex.ToString());
            }
            return View();
        }
        #endregion
        #region IsAccountTypeExists
        public JsonResult IsAccountTypeExists(string Data)
        {
            JsonResult objJR = Json(new { Status = "failed" }, JsonRequestBehavior.AllowGet);
            try
            {
                JavaScriptSerializer oSerializer = new JavaScriptSerializer();
                Dictionary<string, object> accountType = (Dictionary<string, object>)oSerializer.Deserialize(Data, typeof(object));
                string AccType = Convert.ToString(accountType["AccType"]);
                long id = Convert.ToInt64(accountType["id"]);
                JsonResult objBR = Json(new { Status = "Success", Result = Convert.ToBoolean(db.AccountType.Where(x => x.AccType.Trim().ToLower() == AccType.Trim().ToLower()).ToList().Count) }, JsonRequestBehavior.AllowGet);
                if (id > 0)
                {
                    if (AccType != db.AccountType.Single(x => x.id == id).AccType)
                    {
                        return objBR;
                    }
                    else
                    {
                        return Json(new { Status = "Success", Result = false }, JsonRequestBehavior.AllowGet);
                    }
                }
                else
                {
                    return objBR;
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "IsActionItemExists_JSON", ex.ToString());
            }
            return objJR;
        }

        #endregion

        #region AddCustomFields
        public ActionResult AddCustomFields(long? id, string status)
        {
            try
            {
                CustomTableFields objCustomField = new CustomTableFields();
                if (id.HasValue)
                {
                    objCustomField = db.CustomTableFields.SingleOrDefault(x => x.id == id);
                    if (!string.IsNullOrEmpty(status) && objCustomField != null)
                    {
                        if (status.Equals("active"))
                        {
                            if (objCustomField.IsActive == true)
                                objCustomField.IsActive = false;
                            else if (objCustomField.IsActive == false)
                                objCustomField.IsActive = true;
                            objCustomField.ModifiedBy = UserContext.Identity.userId;
                            AdminBAL.EditCustomFields(objCustomField);
                            RouteData.Values.Remove("id");
                            return RedirectToAction("AddCustomFields", "Admin");
                        }
                    }
                }
                List<CustomTableFields> lst = db.CustomTableFields.OrderBy(x => x.TableName).ToList();
                var tpl = new Tuple<CustomTableFields, List<CustomTableFields>>(objCustomField, lst) { };
                return View(tpl);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "AddCustomFields_GET", ex.ToString());
            }
            return View();
        }
        [HttpPost]
        public ActionResult AddCustomFields(CustomTableFields Item1)
        {
            try
            {
                Item1.IsActive = true;
                Item1.ModifiedBy = UserContext.Identity.userId;
                if (AdminBAL.EditCustomFields(Item1) > 0)
                {
                    ViewBag.msg = _AppContext.Messages.Success;
                }
                ModelState.Clear();
                Item1 = new CustomTableFields();
                List<CustomTableFields> lst = db.CustomTableFields.OrderBy(x => x.TableName).ToList();
                var tpl = new Tuple<CustomTableFields, List<CustomTableFields>>(Item1, lst) { };
                return View(tpl);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "AddCustomFields_POST", ex.ToString());
            }
            return View();
        }
        #endregion
        /*******************Approval Process***********************/
        #region EditApproval
        public ActionResult EditApproval(long? id)
        {
            try
            {
                Approval objApproval = new Approval();
                if (id.HasValue)
                {
                    objApproval = db.Approval.SingleOrDefault(x => x.Table_id == id);
                }

                if (objApproval == null || objApproval.Table_id <= 0)
                {
                    ViewBag.msg = _AppContext.Messages.NotExist;
                }
                else
                {
                    List<Role> lstRole = AdminBAL.GetAllRoles();
                    lstRole.Insert(0, new Role { Role_id = -1, RoleName = "None" });
                    ViewBag.roles = new SelectList(lstRole, "Role_id", "RoleName");
                    return View(objApproval);
                }
            }
            catch (Exception ex)
            {
                ViewBag.msg = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Admin", "AddApproval_GET", ex.ToString());
            }
            return View();
        }
        [HttpPost]
        public ActionResult EditApproval(Approval objApproval)
        {
            try
            {
                Approval objApp = db.Approval.SingleOrDefault(x => x.Table_id == objApproval.Table_id);
                objApp.FirstApprover = objApproval.FirstApprover;
                objApp.SecondApprover = objApproval.SecondApprover;
                objApp.DateCreated = DateTime.Now;
                objApp.ModifiedBy = UserContext.Identity.userId;
                AdminBAL.EditApproval(objApp);
                return RedirectToAction("ApprovalList", "Admin");
            }
            catch (Exception ex)
            {
                ViewBag.msg = _AppContext.Messages.Error;
                _AppContext.WriteLogFile("Admin", "AddApproval_GET", ex.ToString());
            }
            return View();
        }
        #endregion
        #region ApprovalList
        public ActionResult ApprovalList(long? id, string status)
        {
            try
            {
                if (id.HasValue && !string.IsNullOrEmpty(status))
                {
                    Approval objApp = db.Approval.SingleOrDefault(x => x.Table_id == id);
                    if (objApp != null)
                    {
                        if (status.Equals("create"))
                        {
                            if (objApp.IsApprovalReqAdd == true)
                                objApp.IsApprovalReqAdd = false;
                            else
                                objApp.IsApprovalReqAdd = true;
                        }
                        else if (status.Equals("delete"))
                        {
                            if (objApp.IsApprovalReqDelete == true)
                                objApp.IsApprovalReqDelete = false;
                            else
                                objApp.IsApprovalReqDelete = true;
                        }
                        else if (status.Equals("edit"))
                        {
                            if (objApp.IsApprovalReqEdit == true)
                                objApp.IsApprovalReqEdit = false;
                            else
                                objApp.IsApprovalReqEdit = true;
                        }
                        objApp.DateCreated = DateTime.Now;
                        objApp.ModifiedBy = UserContext.Identity.userId;
                        AdminBAL.EditApproval(objApp);
                    }
                }
                List<Approval> lstApproval = db.Approval.OrderByDescending(x => x.DateCreated).ToList();
                return View(lstApproval);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "ApprovalList_GET", ex.ToString());
            }
            return View();
        }
        #endregion

        #region ProdTypeApproval
        /// <summary>
        /// Newly added product type approval
        /// </summary>
        /// <param name="id"></param>
        /// <param name="status"></param>
        /// <returns></returns>
        public ActionResult ProdTypeApproval(long? id, string status, string reason)
        {
            try
            {
                if (id.HasValue && !string.IsNullOrEmpty(status))
                {
                    ProductType objProdType = db.ProductTypes.SingleOrDefault(x => x.ProductType_id == id);
                    Approval objApp = db.Approval.SingleOrDefault(x => x.TableName == "ProductTypes");
                    if (objProdType != null)
                    {
                        if (status.Equals("apv"))
                        {
                            objProdType.IsAddApproved = true;
                            objProdType.ProductType_DateCreated = DateTime.Now;
                            objProdType.ModifiedBy = UserContext.Identity.userId;
                            if (objApp != null)
                            {
                                if (UserContext.Identity.roleType == objApp.FirstApprover)
                                {
                                    objProdType.IsAddApprovedFirstApvr = true;
                                }
                                else if (UserContext.Identity.roleType == objApp.SecondApprover)
                                {
                                    objProdType.IsAddApprovedSecondApvr = true;
                                }
                            }
                            AdminBAL.AddUpdateProductType(objProdType);
                        }
                        else if (status.Equals("rjt"))
                        {
                            objProdType.IsAddApproved = false;
                            objProdType.ProductType_DateCreated = DateTime.Now;
                            objProdType.ModifiedBy = UserContext.Identity.userId;
                            if (objApp != null)
                            {
                                if (UserContext.Identity.roleType == objApp.FirstApprover)
                                {
                                    objProdType.IsAddApprovedFirstApvr = false;
                                    objProdType.ReasonAddFirstApvr = reason;
                                }
                                else if (UserContext.Identity.roleType == objApp.SecondApprover)
                                {
                                    objProdType.IsAddApprovedSecondApvr = false;
                                    objProdType.ReasonAddSecondApvr = reason;
                                }
                            }

                            AdminBAL.AddUpdateProductType(objProdType);
                        }
                        RouteData.Values.Remove("id");//clear the querystring
                        return RedirectToAction("ProdTypeApproval", "Admin");//clear the querystring
                    }
                }
                List<ProductType> lstProdTypes = db.ProductTypes.Where(x => x.IsAddApproved == false).OrderByDescending(x => x.ProductType_DateCreated).ToList();
                return View(lstProdTypes);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "ProdTypeApproval_GET", ex.ToString());
            }
            return View();
        }
        #endregion

        #region ProdTypeEditApprovalOriginal
        /// <summary>
        /// It shows original values in Model Popup, requested by Ajax link in ProdTypeEditApproval.cshtml
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public ActionResult ProdTypeEditApprovalOriginal(long? id)
        {
            try
            {
                if (id.HasValue)
                {
                    ProductType objProdType = db.ProductTypes.SingleOrDefault(x => x.ProductType_id == id);
                    return View(objProdType);
                }
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "ProdTypeEditApprovalOriginal_GET", ex.ToString());
            }
            return View();
        }
        #endregion
        #region ProdTypeDelApproval
        /// <summary>
        /// Deleted Approval
        /// </summary>
        /// <param name="id"></param>
        /// <param name="status"></param>
        /// <returns></returns>
        public ActionResult ProdTypeDelApproval(long? id, string status)
        {
            try
            {
                if (id.HasValue && !string.IsNullOrEmpty(status))
                {
                    ProductType objProdType = db.ProductTypes.SingleOrDefault(x => x.ProductType_id == id);
                    if (objProdType != null)
                    {
                        if (status.Equals("apv"))
                        {
                            if (objProdType.ProductType_IsDeletedFlag == 1)
                            {
                                objProdType.ProductType_IsDeleted = true;
                            }
                            else if (objProdType.ProductType_IsDeletedFlag == 0)
                            {
                                objProdType.ProductType_IsDeleted = false;
                            }
                            objProdType.IsDelApproved = true;
                            objProdType.ProductType_DateCreated = DateTime.Now;
                            objProdType.ModifiedBy = UserContext.Identity.userId;
                            AdminBAL.AddUpdateProductType(objProdType);
                        }
                        else if (status.Equals("rjt"))
                        {
                            objProdType.ProductType_IsDeletedFlag = -1;
                            objProdType.IsDelApproved = true;
                            objProdType.ProductType_DateCreated = DateTime.Now;
                            objProdType.ModifiedBy = UserContext.Identity.userId;
                            AdminBAL.AddUpdateProductType(objProdType);
                        }
                        RouteData.Values.Remove("id");//clear the querystring
                        return RedirectToAction("ProdTypeDelApproval", "Admin");//clear the querystring
                    }
                }
                List<ProductType> lstProdTypes = db.ProductTypes.Where(x => x.IsDelApproved == false).OrderByDescending(x => x.ProductType_DateCreated).ToList();
                return View(lstProdTypes);
            }
            catch (Exception ex)
            {
                _AppContext.WriteLogFile("Admin", "ProdTypeDelApproval_GET", ex.ToString());
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
        /*******************End Approval Process***********************/

        #region Ajax For Cards List
        public ActionResult AjaxHandler(JQueryDataTableParamModel param)
        {
            List<VwCardsCustomers> allCards = db.VwCardsCustomers.ToList();
            IEnumerable<VwCardsCustomers> filteredCards = new List<VwCardsCustomers>();
            //Check whether the companies should be filtered by keyword
            if (!string.IsNullOrEmpty(param.sSearch))
            {
                filteredCards = db.VwCardsCustomers.Where(c => c.Customer_FirstName.ToLower().Contains(param.sSearch.ToLower()) || c.Card_SNO.ToLower().Contains(param.sSearch.ToLower()) || c.Card_UID.ToLower().Contains(param.sSearch.ToLower())).ToList();
            }
            else
            {
                filteredCards = allCards;
            }
            var sortColumnIndex = Convert.ToInt32(Request["iSortCol_0"]);
            Func<VwCardsCustomers, string> orderingFunction = (c => sortColumnIndex == 0 ? c.Card_SNO :
                                                           sortColumnIndex == 1 ? c.Card_UID :
                                                           sortColumnIndex == 2 ? c.Customer_FirstName :
                                                           sortColumnIndex == 3 ? c.Card_IsActive.ToString() :
                                                           sortColumnIndex == 4 ? c.Card_IsDeleted.ToString() :
                                                           "");
            var sortDirection = Request["sSortDir_0"]; // asc or desc

            if (sortDirection == "asc")
                filteredCards = filteredCards.OrderBy(orderingFunction);
            else
                filteredCards = filteredCards.OrderByDescending(orderingFunction);

            var displayedCompanies = filteredCards.Skip(param.iDisplayStart).Take(param.iDisplayLength);

            var result = displayedCompanies.Select(x => new string[] { x.Card_SNO, x.Card_UID, x.Customer_FirstName, x.Card_Balance.ToString(), x.Card_Points_Balance.ToString(), x.Card_IsActive.ToString(), x.Card_IsDeleted.ToString(), x.Card_Type.ToString(), x.Card_id.ToString() });
            if (_AppContext.HasPermission(Parameters.Can_Activate_Cards))
            {
                result = displayedCompanies.Select(x => new string[] { x.Card_SNO, x.Card_UID, x.Customer_FirstName, x.Card_Balance.ToString(), x.Card_Points_Balance.ToString(), x.Card_IsActive.ToString(), x.Card_IsDeleted.ToString(), x.Card_Type.ToString(), x.Card_id.ToString() });
            }
            else
            {
                result = displayedCompanies.Select(x => new string[] { x.Card_SNO, x.Card_UID, x.Customer_FirstName, x.Card_Balance.ToString(), x.Card_Points_Balance.ToString(), x.Card_Type.ToString(), x.Card_id.ToString() });
            }
            return Json(new
            {
                sEcho = param.sEcho,
                iTotalRecords = allCards.Count(),
                iTotalDisplayRecords = filteredCards.Count(),
                aaData = result
            },
                        JsonRequestBehavior.AllowGet);
        }
        #endregion

        #region Ajax Handler for Customers
        public ActionResult AjaxHandlerCustomers(JQueryDataTableParamModel param)
        {
            List<VwCustomers> allCusts = db.VwCustomers.ToList();
            IEnumerable<VwCustomers> filteredCusts = new List<VwCustomers>();
            //Check whether the companies should be filtered by keyword
            if (!string.IsNullOrEmpty(param.sSearch))
            {
                filteredCusts = db.VwCustomers.Where(c => c.Customer_Name.ToLower().Contains(param.sSearch.ToLower()) || c.CustomerDesignation.ToLower().Contains(param.sSearch.ToLower()) || c.Customer_Country.ToLower().Contains(param.sSearch.ToLower()) || c.Customer_Email.ToLower().Contains(param.sSearch.ToLower()) || c.Customer_Phone.Contains(param.sSearch)).ToList();
            }
            else
            {
                filteredCusts = allCusts;
            }
            var sortColumnIndex = Convert.ToInt32(Request["iSortCol_0"]);
            Func<VwCustomers, string> orderingFunction = (c => sortColumnIndex == 0 ? c.Customer_Name :
                                                           sortColumnIndex == 1 ? c.CustomerDesignation :
                                                           sortColumnIndex == 2 ? c.Customer_Country :
                                                           sortColumnIndex == 3 ? c.Customer_Email :
                                                           sortColumnIndex == 4 ? c.IsActive.ToString() :
                                                           sortColumnIndex == 5 ? c.IsDeleted.ToString() :
                                                           "");
            var sortDirection = Request["sSortDir_0"]; // asc or desc
            if (sortColumnIndex == 8)
            {
                filteredCusts = filteredCusts.OrderByDescending(x => x.DateCreated);
            }
            else
            {
                if (sortDirection == "asc")
                    filteredCusts = filteredCusts.OrderBy(orderingFunction);
                else
                    filteredCusts = filteredCusts.OrderByDescending(orderingFunction);
            }
            Employee objEmp = new Employee();
            foreach (var item in filteredCusts)
            {
                item.TotalEmp = db.Employees.Where(x => x.Emp_Customer_id == item.Customer_id).Count();
                item.TotalVehicles = db.Customer_Vehicle.Where(x => x.Customer_Id == item.Customer_id).Count();
            }
            var displayedCusts = filteredCusts.Skip(param.iDisplayStart).Take(param.iDisplayLength);

            var result = displayedCusts.Select(x => new string[] { x.Customer_Name, x.CustomerDesignation, x.Customer_Country, x.Customer_Email, x.Customer_Phone, x.IsActive.ToString(), x.IsDeleted.ToString(), x.Customer_id.ToString(), x.Customer_id.ToString(), x.Customer_id.ToString(), x.Customer_id.ToString(), x.TotalEmp.ToString(), x.Customer_id.ToString(), x.Customer_id.ToString(), x.AutoRedistributeFunds.ToString(), x.Customer_id.ToString(), x.CustomerDesignation, x.TotalVehicles.ToString() });
            return Json(new
            {
                sEcho = param.sEcho,
                iTotalRecords = allCusts.Count(),
                iTotalDisplayRecords = filteredCusts.Count(),
                aaData = result
            },
            JsonRequestBehavior.AllowGet);
        }
        #endregion
        
        #region Ajax Handler for Postpaid Customers
        public ActionResult AjaxHandlerPostpaidCustomers(JQueryDataTableParamModel param)
        {
            List<VwCreditLimit> allCusts = db.VwCreditLimit.GroupBy(x => x.Customer_id).Select(grp => grp.FirstOrDefault()).ToList();
            IEnumerable<VwCreditLimit> filteredCusts = new List<VwCreditLimit>();
            //Check whether the companies should be filtered by keyword
            if (!string.IsNullOrEmpty(param.sSearch))
            {
                filteredCusts = db.VwCreditLimit.Where(c => c.Customer_Name.ToLower().Contains(param.sSearch.ToLower()) || c.CompanyName.ToLower().Contains(param.sSearch.ToLower()) || c.CustomerDesignation.ToLower().Contains(param.sSearch.ToLower())).GroupBy(x => x.Customer_id).Select(grp => grp.FirstOrDefault()).ToList();
            }
            else
            {
                filteredCusts = allCusts;
            }
            var sortColumnIndex = Convert.ToInt32(Request["iSortCol_0"]);
            Func<VwCreditLimit, string> orderingFunction = (c => sortColumnIndex == 0 ? c.Customer_Name :
                                                           sortColumnIndex == 1 ? c.CustomerDesignation :
                                                           sortColumnIndex == 2 ? c.CreditLimit.ToString() :
                                                           sortColumnIndex == 3 ? c.CreditLimit_Expiration.ToString() :
                                                           "");
            var sortDirection = Request["sSortDir_0"]; // asc or desc
            if (sortColumnIndex == 3)
            {
                filteredCusts = filteredCusts.OrderByDescending(x => x.DateCreated);
            }
            else
            {
                if (sortDirection == "asc")
                    filteredCusts = filteredCusts.OrderBy(orderingFunction);
                else
                    filteredCusts = filteredCusts.OrderByDescending(orderingFunction);
            }
            if (sortDirection == "asc")
                filteredCusts = filteredCusts.OrderBy(orderingFunction);
            else
                filteredCusts = filteredCusts.OrderByDescending(orderingFunction);
            foreach (var item in filteredCusts.Where(x => x.Customer_id != null))
            {
                if (AdminBAL.GetPostpaidCustCrLimitByCustId(item.Customer_id) != null)
                {
                    item.CreditLimit = AdminBAL.GetPostpaidCustCrLimitByCustId(item.Customer_id).CreditLimit;
                    item.CreditLimit_Expiration = AdminBAL.GetPostpaidCustCrLimitByCustId(item.Customer_id).CreditLimit_Expiration;
                }
            }
            var displayedCusts = filteredCusts.Skip(param.iDisplayStart).Take(param.iDisplayLength);

            var result = displayedCusts.Select(x => new string[] { x.Customer_Name, x.CompanyName, x.CustomerDesignation, string.Format("{0:n}", x.CreditLimit), x.CreditLimit_Expiration.ToString(), x.Customer_id.ToString() });
            return Json(new
            {
                sEcho = param.sEcho,
                iTotalRecords = allCusts.Count(),
                iTotalDisplayRecords = filteredCusts.Count(),
                aaData = result
            },
            JsonRequestBehavior.AllowGet);
        }
        #endregion

        #region Ajax For Accounts List
        public ActionResult AjaxHandlerAccounts(JQueryDataTableParamModel param)
        {
            List<VwCustomerAccount> allCards = db.VwCustomerAccount.ToList();
            IEnumerable<VwCustomerAccount> filteredCards = new List<VwCustomerAccount>();
            //Check whether the companies should be filtered by keyword
            if (!string.IsNullOrEmpty(param.sSearch))
            {
                decimal balance;
                if (!decimal.TryParse(param.sSearch, out balance))
                    balance = 0;
                if (balance == 0)
                {
                    filteredCards = db.VwCustomerAccount.Where(c => c.Customer_Name.ToLower().Contains(param.sSearch.ToLower()) || c.Mask.ToLower().Contains(param.sSearch.ToLower()) || c.Mask_Type.ToLower().Contains(param.sSearch.ToLower()) || c.AccType.ToLower().Contains(param.sSearch.ToLower())).ToList();
                }
                else
                {
                    filteredCards = db.VwCustomerAccount.Where(c => c.Balance >= balance || c.AccountNumber >= balance || c.CreditType >= balance).ToList();
                }
            }
            else
            {
                filteredCards = allCards;
            }
            var sortColumnIndex = Convert.ToInt32(Request["iSortCol_0"]);
            Func<VwCustomerAccount, string> orderingFunction = (c => sortColumnIndex == 0 ? c.Customer_Name :
                                                           sortColumnIndex == 1 ? c.AccountNumber.ToString() :
                                                           sortColumnIndex == 2 ? c.AccType :
                                                           sortColumnIndex == 3 ? c.Mask_Type :
                                                           sortColumnIndex == 4 ? c.Mask :
                                                           sortColumnIndex == 5 ? c.Balance.ToString() :
                                                           sortColumnIndex == 6 ? c.CreditType.ToString() :
                                                           "");
            var sortDirection = Request["sSortDir_0"]; // asc or desc

            if (sortDirection == "asc")
                filteredCards = filteredCards.OrderBy(orderingFunction);
            else
                filteredCards = filteredCards.OrderByDescending(orderingFunction);

            var displayedCompanies = filteredCards.Skip(param.iDisplayStart).Take(param.iDisplayLength);

            var result = displayedCompanies.Select(x => new string[] { x.Customer_Name, x.AccountNumber.ToString(), x.AccType.ToString(), x.Mask_Type.ToString(), x.Mask.ToString(), string.Format("{0:n}", x.Balance), x.AccountNumber.ToString(), x.CreditType.ToString(), x.AccountNumber.ToString(), x.AccountNumber.ToString(), x.AccountNumber.ToString(), x.Customer_id.ToString(), x.AccountNumber.ToString(), x.IsActive.ToString(), x.AccountNumber.ToString(), x.Customer_id.ToString(), x.AccountNumber.ToString(), x.Customer_id.ToString(), x.CreditType.ToString(), x.CreditType.ToString(), x.AccountNumber.ToString() });

            return Json(new
            {
                sEcho = param.sEcho,
                iTotalRecords = allCards.Count(),
                iTotalDisplayRecords = filteredCards.Count(),
                aaData = result
            },
                        JsonRequestBehavior.AllowGet);
        }
        #endregion
    }
}
