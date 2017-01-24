using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FuelCardSystemEntities.Models;

namespace FuelCardSystemDAL
{
    public class AdminDAL
    {
        #region ChangePassword
        public static int ChangePassword(Staff objUser)
        {
            try
            {
                Repository<Staff> repUser = new Repository<Staff>();
                repUser.Update(objUser);
                repUser.SaveChanges();
                return 1;
            }
            catch
            {

                throw;
            }
        }
        #endregion

        #region ChangeCustomerPassword
        public static int ChangeCustomerPassword(Customer objUser)
        {
            try
            {
                Repository<Customer> repUser = new Repository<Customer>();
                repUser.Update(objUser);
                repUser.SaveChanges();
                return 1;
            }
            catch
            {

                throw;
            }
        }
        #endregion

        #region Add or Update General Settings
        /// <summary>
        /// Add or Update General Settings
        /// </summary>
        /// <param name="objGenSettings"></param>
        /// <returns></returns>
        public static int AddUpdateGenSettings(GeneralSetting objGenSettings)
        {
            try
            {
                Repository<GeneralSetting> repGenSettings = new Repository<GeneralSetting>();
                if (objGenSettings.GenSet_id > 0)
                {
                    repGenSettings.Update(objGenSettings);
                }
                else
                {
                    repGenSettings.Add(objGenSettings);
                }
                repGenSettings.SaveChanges();
                return 1;
            }
            catch
            {
                throw;
            }
        }
        #endregion
        #region Get All Time Periods
        public static List<TimeDuration> GetAllTimePeriods()
        {
            try
            {
                Repository<TimeDuration> repTimeDuration = new Repository<TimeDuration>();
                return repTimeDuration.Find(x => x.Type != "Number").ToList();
            }
            catch
            {

                throw;
            }
        }
        #endregion
        #region Get All Currencies
        public static List<Currency> GetAllCurrency()
        {
            try
            {
                Repository<Currency> repCurr = new Repository<Currency>();
                return repCurr.GetAll().OrderBy(x => x.CurrencySymbol).ToList();
            }
            catch
            {

                throw;
            }
        }
        #endregion
        #region Add or Update Currency Conversion Rates
        public static int AddUpdateCurrencyConversionRates(Currency objCrcy)
        {
            try
            {
                Repository<Currency> repCurrency = new Repository<Currency>();
                if (objCrcy.Currency_id > 0)
                {
                    repCurrency.Update(objCrcy);
                }
                repCurrency.SaveChanges();
                return 1;
            }
            catch
            {

                throw;
            }
        }
        #endregion
        #region Add or Update Product Types
        public static int AddUpdateProductType(ProductType objProdType)
        {
            try
            {
                Repository<ProductType> repProdType = new Repository<ProductType>();
                if (objProdType.ProductType_id > 0)
                    repProdType.Update(objProdType);
                else
                    repProdType.Add(objProdType);
                repProdType.SaveChanges();
                return 1;
            }
            catch
            {

                throw;
            }
        }
        #endregion
        #region DeleteProductType
        /// <summary>
        /// deletes newly added product, if admin rejects it.
        /// </summary>
        /// <param name="objProdType"></param>
        /// <returns></returns>
        public static int DeleteProductType(ProductType objProdType)
        {
            try
            {
                Repository<ProductType> repProdType = new Repository<ProductType>();
                repProdType.DeleteObject(objProdType);
                repProdType.SaveChanges();
                return 1;
            }
            catch
            {

                throw;
            }
        }
        #endregion
        #region AddUpdateProductProperty
        public static int AddUpdateProductProperty(ProductProperty objProdProp)
        {
            try
            {
                Repository<ProductProperty> repProdType = new Repository<ProductProperty>();
                if (objProdProp.ProductProperty_id > 0)
                {
                    repProdType.Update(objProdProp);
                }
                else
                {
                    repProdType.Add(objProdProp);
                }
                repProdType.SaveChanges();
                return 1;
            }
            catch
            {

                throw;
            }
        }
        #endregion
        #region Get All Product Types
        public static List<ProductType> ProductTypeList()
        {
            try
            {
                Repository<ProductType> repProdTypes = new Repository<ProductType>();
                return repProdTypes.GetAll().ToList();
            }
            catch
            {
                throw;
            }
        }
        #endregion
        #region Add or Update Products
        public static int AddUpdateProducts(Product objProduct)
        {
            try
            {
                Repository<Product> repProduct = new Repository<Product>();
                if (objProduct.Product_id > 0)
                {
                    repProduct.Update(objProduct);
                }
                else
                {
                    repProduct.Add(objProduct);
                }
                repProduct.SaveChanges();
                return 1;
            }
            catch
            {

                throw;
            }
        }
        #endregion
        #region Add Product Properties
        public static int AddUpdateLnkProdProperties(long productId, List<long> lstProp)
        {
            try
            {
                Repository<Lnk_Products_Properties> repProp = new Repository<Lnk_Products_Properties>();
                
                    List<Lnk_Products_Properties> lstProdProp = repProp.GetAll().Where(x => x.Product_id == productId).ToList();
                    if (lstProdProp.Count() > 0 && lstProdProp != null)
                    {
                        foreach (Lnk_Products_Properties item in lstProdProp)
                        {
                            repProp.DeleteObject(item);
                            repProp.SaveChanges();
                        }
                    }
                    if (lstProp.Count() > 0 && lstProp != null)
                    {
                    foreach (long item in lstProp)
                    {
                        Lnk_Products_Properties objProperties = new Lnk_Products_Properties();
                        objProperties.Product_id = productId;
                        objProperties.Product_Property_id = item;
                        objProperties.IsActive = true;
                        objProperties.IsDeleted = false;
                        objProperties.Product_Property_DateCreated = DateTime.Now;
                        repProp.Add(objProperties);
                        repProp.SaveChanges();
                    }
                }
                return 1;
            }
            catch
            {
                throw;
            }
        }
        #endregion
        #region Add or Update Price List
        public static int AddUpdatePriceList(PriceList objList)
        {
            try
            {
                Repository<PriceList> repPriceList = new Repository<PriceList>();
                if (objList.PriceList_id > 0)
                    repPriceList.Update(objList);
                else
                    repPriceList.Add(objList);
                repPriceList.SaveChanges();
                return 1;
            }
            catch
            {
                
                throw;
            }
        }
        #endregion
        #region Add Update Discount List
        public static int AddUpdateDiscountList(DiscountsList objList)
        {
            try
            {
                Repository<DiscountsList> repList = new Repository<DiscountsList>();
                if (objList.DiscountList_id > 0)
                    repList.Update(objList);
                else
                    repList.Add(objList);
                repList.SaveChanges();
                return 1;
            }
            catch
            {
                
                throw;
            }
        }
        #endregion
        #region Add or Update Product of Price List
        public static int AddUpdateProductPriceList(Lnk_PriceList_Product objList)
        {
            try
            {
                Repository<Lnk_PriceList_Product> repList = new Repository<Lnk_PriceList_Product>();
                Lnk_PriceList_Product lst = repList.GetAll().FirstOrDefault(x => x.Price_List_id == objList.Price_List_id && x.Product_id == objList.Product_id);
                if (lst != null)//if already exists then assign id to objList so that it can be updated
                {
                    objList.id = lst.id;
                    repList = new Repository<Lnk_PriceList_Product>();
                }
                if (objList.id > 0)
                    repList.Update(objList);
                else
                    repList.Add(objList);
                repList.SaveChanges();
                return 1;
            }
            catch
            {
                
                throw;
            }
        }
        #endregion
        #region Assign Pricelist to customer
        public static int AssignPriceList(long id, List<long> custids)
        {
            try
            {
                Repository<Customer_PriceList> repList = new Repository<Customer_PriceList>();
                foreach (long item in custids)
                {
                    Customer_PriceList objPriceList = new Customer_PriceList();
                    objPriceList.Customer_id = item;
                    objPriceList.Price_List_id = id;
                    repList.Add(objPriceList);
                }
                repList.SaveChanges();
                return 1;
            }
            catch
            {
                throw;
            }
        }
        #endregion
        #region Unassign Pricelist to customer
        public static int UnassignPriceList(long? pricelistid, long? custid)
        {
            try
            {
                Repository<Customer_PriceList> repList = new Repository<Customer_PriceList>();
                Customer_PriceList obj = repList.Single(x => x.Customer_id == custid && x.Price_List_id == pricelistid);
                if (obj != null)
                {
                    repList.DeleteObject(obj);
                    repList.SaveChanges();
                }
                return 1;
            }
            catch
            {
                throw;
            }
        }
        #endregion
        #region Add or Update Gadget
        public static int AddUpdateGadget(Gadget objGadget)
        {
            try
            {
                Repository<Gadget> repGadget = new Repository<Gadget>();
                if (objGadget.Gadget_id > 0)
                    repGadget.Update(objGadget);
                else
                    repGadget.Add(objGadget);
                repGadget.SaveChanges();
                return 1;
            }
            catch
            {
                throw;
            }
        }
        #endregion
        #region Add or Update Channel Type
        public static int AddUpdateChannelType(ChannelType objChannelType)
        {
            try
            {
                Repository<ChannelType> repChannelType = new Repository<ChannelType>();
                if (objChannelType.ChannelType_id > 0)
                    repChannelType.Update(objChannelType);
                else
                    repChannelType.Add(objChannelType);
                repChannelType.SaveChanges();
                return 1;
            }
            catch
            {

                throw;
            }
        }
        #endregion
        #region Get All Countries
        public static List<Country> GetAllCountries()
        {
            try
            {
                Repository<Country> repCountry = new Repository<Country>();
                return repCountry.GetAll().ToList();
            }
            catch
            {

                throw;
            }
        }
        #endregion
        #region Get All Channel Types
        public static List<ChannelType> GetAllChannelTypes()
        {
            try
            {
                Repository<ChannelType> repChannelTypes = new Repository<ChannelType>();
                return repChannelTypes.GetAll().ToList();
            }
            catch
            {

                throw;
            }
        }
        #endregion
        #region Add or Update Channel
        public static int AddUpdateChannel(Channel objChannel)
        {
            try
            {
                Repository<Channel> repChannel = new Repository<Channel>();
                if (objChannel.Channel_id > 0)
                {
                    repChannel.Update(objChannel);
                }
                else
                {
                    repChannel.Add(objChannel);
                }
                repChannel.SaveChanges();
                return 1;
            }
            catch
            {
                throw;
            }
        }
        #endregion
        #region Get All Channels
        public static List<Channel> GetAllChannels()
        {
            try
            {
                Repository<Channel> repChannels = new Repository<Channel>();
                return repChannels.GetAll().Where(x => x.Channel_IsActive == true && x.Channel_IsDeleted == false).ToList();
            }
            catch
            {

                throw;
            }
        }
        #endregion
        #region Get All Products
        public static List<Product> GetAllProducts()
        {
            try
            {
                Repository<Product> repProducts = new Repository<Product>();
                return repProducts.GetAll().Where(x => x.Product_IsActive == true && x.Product_IsDeleted == false).ToList();
            }
            catch
            {

                throw;
            }
        }
        #endregion
        #region Get All Gadgets
        public static List<Gadget> GetAllGadgets()
        {
            try
            {
                Repository<Gadget> repGadgets = new Repository<Gadget>();
                return repGadgets.GetAll().Where(x => x.Gadget_IsActive == true && x.Gadget_IsDeleted == false).OrderByDescending(x => x.Gadget_DateCreated).ToList();
            }
            catch
            {

                throw;
            }
        }
        #endregion
        #region Add or Update Channel Products
        public static int AddUpdateChannelProducts(Lnk_Products_Channels objChannelProduct, List<long> channelIds)
        {
            try
            {
                Repository<Lnk_Products_Channels> repChannelProduct = new Repository<Lnk_Products_Channels>();
                List<Lnk_Products_Channels> lst = repChannelProduct.GetAll().Where(x => x.Product_id == objChannelProduct.Product_id).ToList();
                if (lst != null && lst.Count > 0)
                {
                    foreach (Lnk_Products_Channels item in lst)
                    {
                        repChannelProduct.Delete(item);
                        repChannelProduct.SaveChanges();
                    }
                    foreach (long item in channelIds)
                    {
                        objChannelProduct.Channel_id = item;
                        repChannelProduct.Add(objChannelProduct);
                        repChannelProduct.SaveChanges();
                    }
                }
                repChannelProduct.SaveChanges();
                return 1;
            }
            catch
            {

                throw;
            }
        }
        #endregion
        #region UpdateChannelProductStatus
        public static int UpdateChannelProductStatus(Lnk_Products_Channels objChannelProduct)
        {
            try
            {
                Repository<Lnk_Products_Channels> repProd = new Repository<Lnk_Products_Channels>();
                repProd.Update(objChannelProduct);
                repProd.SaveChanges();
                return 1;
            }
            catch
            {

                throw;
            }
        }
        #endregion
        #region Add or Update Channel Gadgets
        public static int AddUpdateChannelGadgets(Lnk_Gadgets_Channels objGadget)
        {
            try
            {
                Repository<Lnk_Gadgets_Channels> repGadget = new Repository<Lnk_Gadgets_Channels>();
                if (objGadget.Lnk_Gadgets_Channels_id > 0)
                    repGadget.Update(objGadget);
                else
                    repGadget.Add(objGadget);
                repGadget.SaveChanges();
                return 1;
            }
            catch
            {

                throw;
            }
        }
        #endregion
        #region Add or Update Role
        public static int AddUpdateRole(Role objRole)
        {
            try
            {
                Repository<Role> repRole = new Repository<Role>();
                if (objRole.Role_id > 0)
                    repRole.Update(objRole);
                else
                    repRole.Add(objRole);
                repRole.SaveChanges();
                return 1;
            }
            catch
            {
                throw;
            }
        }
        #endregion
        #region Add or Update Role Permissions
        public static int AddUpdateRolePermissions(long RoleId, List<long> lstPermissionIds)
        {
            try
            {
                Repository<Lnk_Role_Permission> repPermission = new Repository<Lnk_Role_Permission>();
                if (lstPermissionIds.Count() > 0 && lstPermissionIds != null)
                {
                    List<Lnk_Role_Permission> lstRolePermission = repPermission.GetAll().Where(x => x.Role_id == RoleId).ToList(); //Get All the Permissions Assigned to the Role and Delete
                    if (lstRolePermission.Count() > 0 && lstRolePermission != null)
                    {
                        foreach (Lnk_Role_Permission item in lstRolePermission)
                        {
                            repPermission.DeleteObject(item);
                            repPermission.SaveChanges();
                        }
                    }
                    foreach (long item in lstPermissionIds)
                    {
                        Lnk_Role_Permission objPermission = new Lnk_Role_Permission();
                        objPermission.Role_id = RoleId;
                        objPermission.Permission_id = item;
                        repPermission.Add(objPermission);
                        repPermission.SaveChanges();
                    }
                }
                return 1;
            }
            catch
            {

                throw;
            }
        }
        #endregion

        #region Add or Update Customer Role
        public static int AddUpdateCustomerRole(Customer_Roles objRole)
        {
            try
            {
                Repository<Customer_Roles> repRole = new Repository<Customer_Roles>();
                if (objRole.Customer_RoleId > 0)
                    repRole.Update(objRole);
                else
                    repRole.Add(objRole);
                repRole.SaveChanges();
                return 1;
            }
            catch
            {
                throw;
            }
        }
        #endregion
        #region Add or Update Customer Role Permissions
        public static int AddUpdateCustomerRolePermissions(long RoleId, List<long> lstPermissionIds)
        {
            try
            {
                Repository<LnkCustomer_Role_Permission> repPermission = new Repository<LnkCustomer_Role_Permission>();
                if (lstPermissionIds.Count() > 0 && lstPermissionIds != null)
                {
                    List<LnkCustomer_Role_Permission> lstRolePermission = repPermission.GetAll().Where(x => x.Role_id == RoleId).ToList(); //Get All the Permissions Assigned to the Role and Delete
                    if (lstRolePermission.Count() > 0 && lstRolePermission != null)
                    {
                        foreach (LnkCustomer_Role_Permission item in lstRolePermission)
                        {
                            repPermission.DeleteObject(item);
                            repPermission.SaveChanges();
                        }
                    }
                    foreach (long item in lstPermissionIds)
                    {
                        LnkCustomer_Role_Permission objPermission = new LnkCustomer_Role_Permission();
                        objPermission.Role_id = RoleId;
                        objPermission.Permission_id = item;
                        repPermission.Add(objPermission);
                        repPermission.SaveChanges();
                    }
                }
                return 1;
            }
            catch
            {

                throw;
            }
        }
        #endregion

        #region Add or Update Customer Types
        public static int AddUpdateCustomerType(CustomerType objCustomerType)
        {
            try
            {
                Repository<CustomerType> repCustomerType = new Repository<CustomerType>();
                if (objCustomerType.CustomerType_id > 0)
                    repCustomerType.Update(objCustomerType);
                else
                    repCustomerType.Add(objCustomerType);
                repCustomerType.SaveChanges();
                return 1;
            }
            catch
            {
                throw;
            }
        }
        #endregion
        #region Add or Update Lnk_Customers_CustomerTypes
        public static int AddUpdateCustomerCustomerTypes(long CustId, List<long> lstCustTypeIds)
        {
            try
            {
                Repository<Lnk_Customers_CustomerTypes> repCustCustType = new Repository<Lnk_Customers_CustomerTypes>();
                if (lstCustTypeIds.Count > 0 && lstCustTypeIds != null)
                {
                    //get all the customer types from Lnk_Customers_CustomerTypes for deletion
                    List<Lnk_Customers_CustomerTypes> lstCustomerCustomerTypes = repCustCustType.GetAll().Where(x => x.Customer_id == CustId).ToList();
                    if (lstCustomerCustomerTypes.Count > 0 && lstCustomerCustomerTypes != null)
                    {
                        foreach (Lnk_Customers_CustomerTypes item in lstCustomerCustomerTypes)
                        {
                            repCustCustType.DeleteObject(item);
                            repCustCustType.SaveChanges();
                        }
                    }
                    foreach (long item in lstCustTypeIds)
                    {
                        Lnk_Customers_CustomerTypes objCustCustType = new Lnk_Customers_CustomerTypes();
                        objCustCustType.Customer_id = CustId;
                        objCustCustType.CustomerType_id = item;
                        repCustCustType.Add(objCustCustType);
                        repCustCustType.SaveChanges();
                    }
                }
                return 1;
            }
            catch
            {

                throw;
            }
        }
        #endregion
        #region Get All Customer Roles
        public static List<Customer_Roles> GetAllCustomerRoles()
        {
            try
            {
                Repository<Customer_Roles> repCustRoles = new Repository<Customer_Roles>();
                return repCustRoles.GetAll().Where(x => x.Role_IsActive == true && x.Role_IsDeleted == false).ToList();
            }
            catch
            {
                throw;
            }
        }
        #endregion
        #region Add or Update Customer
        public static int AddUpdateCustomer(Customer objCustomer)
        {
            try
            {
                Repository<Customer> repCustomer = new Repository<Customer>();
                if (objCustomer.Customer_id > 0)
                    repCustomer.Update(objCustomer);
                else
                    repCustomer.Add(objCustomer);
                repCustomer.SaveChanges();
                return 1;
            }
            catch
            {

                throw;
            }
        }
        #endregion
        #region Add or Update Customer Employees or Department
        public static int AddUpdateCustomerEmp(Employee objEmp)
        {
            try
            {
                Repository<Employee> repEmp = new Repository<Employee>();
                if (objEmp.Emp_id > 0)
                    repEmp.Update(objEmp);
                else
                    repEmp.Add(objEmp);
                repEmp.SaveChanges();
                return 1;
            }
            catch
            {
                throw;
            }
        }
        #endregion
        #region Add or Update Staff
        public static int AddUpdateStaff(Staff objStaff)
        {
            try
            {
                Repository<Staff> repStaff = new Repository<Staff>();
                if (objStaff.Staff_id > 0)
                    repStaff.Update(objStaff);
                else
                    repStaff.Add(objStaff);
                repStaff.SaveChanges();
                return 1;
            }
            catch
            {

                throw;
            }
        }
        #endregion
        #region Get All Roles
        public static List<Role> GetAllRoles()
        {
            try
            {
                Repository<Role> repRole = new Repository<Role>();
                return repRole.GetAll().Where(x => x.Role_IsActive == true && x.Role_IsDeleted == false).ToList();
            }
            catch
            {

                throw;
            }
        }
        #endregion
        #region AddUpdateCards
        public static int AddUpdateCards(Cards objCard)
        {
            try
            {
                Repository<Cards> repCard = new Repository<Cards>();
                if (objCard.Card_id > 0)
                    repCard.Update(objCard);
                else
                    repCard.Add(objCard);
                repCard.SaveChanges();
                return 1;
            }
            catch
            {
                throw;
            }
        }
        #endregion
        #region GetAllPaymentmodes
        public static List<PaymentMode> GetAllPaymentmodes()
        {
            try
            {
                Repository<PaymentMode> repPaymentMode = new Repository<PaymentMode>();
                return repPaymentMode.GetAll().ToList();
            }
            catch
            {
                throw;
            }
        }
        #endregion
        #region AddUpdateCardTopup
        public static int AddUpdateCardTopup(CardTopup objCard)
        {
            try
            {
                Repository<CardTopup> repCard = new Repository<CardTopup>();
                if (objCard.Card_topup_id > 0)
                    repCard.Update(objCard);
                else
                    repCard.Add(objCard);
                repCard.SaveChanges();
                return 1;
            }
            catch
            {

                throw;
            }
        }
        #endregion
        #region AddUpdateCustomerAccTopup
        public static int AddUpdateCustomerAccTopup(Customer_AccountTopup objAcc)
        {
            try
            {
                Repository<Customer_AccountTopup> repAcc = new Repository<Customer_AccountTopup>();
                if (objAcc.AccountTopup_id > 0)
                    repAcc.Update(objAcc);
                else
                    repAcc.Add(objAcc);
                repAcc.SaveChanges();
                return 1;
            }
            catch
            {

                throw;
            }
        }
        #endregion
        #region AddUpdateCardUsageLimit
        public static int AddUpdateCardUsageLimit(CardUsageLimit objCardUsage)
        {
            try
            {
                Repository<CardUsageLimit> repCardUsage = new Repository<CardUsageLimit>();
                if (objCardUsage.Card_UsageLimit_id > 0)
                    repCardUsage.Update(objCardUsage);
                else
                    repCardUsage.Add(objCardUsage);
                repCardUsage.SaveChanges();
                return 1;
            }
            catch
            {

                throw;
            }
        }
        #endregion
        #region AddUpdateAccUsageLimit
        public static int AddUpdateAccUsageLimit(Customer_AccountUsageLimit objUsage)
        {
            try
            {
                Repository<Customer_AccountUsageLimit> repAcc = new Repository<Customer_AccountUsageLimit>();
                if (objUsage.UsageLimit_id > 0)
                    repAcc.Update(objUsage);
                else
                    repAcc.Add(objUsage);
                repAcc.SaveChanges();
                return 1;
            }
            catch
            {

                throw;
            }
        }
        #endregion
        #region AddUpdateActivityType
        public static int AddUpdateActivityType(ActivityType objActivityType)
        {
            try
            {
                Repository<ActivityType> repActivityType = new Repository<ActivityType>();
                if (objActivityType.ActivityType_id > 0)
                    repActivityType.Update(objActivityType);
                else
                    repActivityType.Add(objActivityType);
                repActivityType.SaveChanges();
                return 1;
            }
            catch
            {

                throw;
            }
        }
        #endregion
        #region AddUpdateActivity
        public static int AddUpdateActivity(Activity objActivity)
        {
            try
            {
                Repository<Activity> repActivity = new Repository<Activity>();
                if (objActivity.Activity_id > 0)
                    repActivity.Update(objActivity);
                else
                    repActivity.Add(objActivity);
                repActivity.SaveChanges();
                return 1;
            }
            catch
            {

                throw;
            }
        }
        #endregion
        #region AddUpdateFormula
        public static int AddUpdateFormula(Tierrule objTierrule)
        {
            try
            {
                Repository<Tierrule> repTierrule = new Repository<Tierrule>();
                if (objTierrule.id > 0)
                    repTierrule.Update(objTierrule);
                else
                    repTierrule.Add(objTierrule);
                repTierrule.SaveChanges();
                return 1;
            }
            catch
            {

                throw;
            }
        }
        #endregion
        #region AddUpdateAction
        public static int AddUpdateAction(ActionsTbl objAction)
        {
            try
            {
                Repository<ActionsTbl> repAction = new Repository<ActionsTbl>();
                if (objAction.id > 0)
                    repAction.Update(objAction);
                else
                    repAction.Add(objAction);
                repAction.SaveChanges();
                return 1;
            }
            catch
            {

                throw;
            }
        }
        #endregion
        #region AddUpdateEvent
        public static int AddUpdateEvent(EventsTbl objEvents)
        {
            try
            {
                Repository<EventsTbl> repEvent = new Repository<EventsTbl>();
                if (objEvents.Event_id > 0)
                    repEvent.Update(objEvents);
                else
                    repEvent.Add(objEvents);
                repEvent.SaveChanges();
                return 1;
            }
            catch
            {
                throw;
            }
        }
        #endregion

        #region AddUpdateLoyaltyProgram
        public static int AddUpdateLoyaltyProgram(Loyalty_Program objLylty)
        {
            try
            {
                Repository<Loyalty_Program> repLoyaltyProgram = new Repository<Loyalty_Program>();
                if (objLylty.id > 0)
                    repLoyaltyProgram.Update(objLylty);
                else
                    repLoyaltyProgram.Add(objLylty);
                repLoyaltyProgram.SaveChanges();
                return 1;
            }
            catch
            {

                throw;
            }
        }
        public static int AddUpdateLoyaltyProgram_Tiertable(Tiertable objTiertable)
        {
            try
            {
                Repository<Tiertable> repTiertable = new Repository<Tiertable>();
                if (objTiertable.id > 0)
                    repTiertable.Update(objTiertable);
                else
                    repTiertable.Add(objTiertable);
                repTiertable.SaveChanges();
                return 1;
            }
            catch
            {
                throw;
            }
        }
        #endregion

        #region AddUpdateComTemplate
        public static int AddUpdateComTemplate(CommunicationTemplates objComTemplate)
        {
            try
            {
                Repository<CommunicationTemplates> repComTemplate = new Repository<CommunicationTemplates>();
                if (objComTemplate.Template_Id > 0)
                    repComTemplate.Update(objComTemplate);
                else
                    repComTemplate.Add(objComTemplate);
                repComTemplate.SaveChanges();
                return 1;
            }
            catch
            {

                throw;
            }
        }
        #endregion


        #region EditProductofChannel
        public static int EditProductofChannel(Lnk_Products_Channels objProduct)
        {
            try
            {
                Repository<Lnk_Products_Channels> repProduct = new Repository<Lnk_Products_Channels>();
                //Lnk_Products_Channels obj = repProduct.Single(x => x.Channel_id == objProduct.Channel_id && x.Product_id == objProduct.Product_id);
                //if (obj != null)
                //{
                //    obj = objProduct;
                //    repProduct.Update(obj);
                //    repProduct.SaveChanges();
                //    return 1;
                //}
                //else
                //    return 0;
                repProduct.Update(objProduct);
                repProduct.SaveChanges();
                return 1;
            }
            catch
            {

                throw;
            }
        }
        #endregion

        #region AddCreditLimitPostpaidCust
        public static int AddCreditLimitPostpaidCust(PostpaidCustCreditLimits objCredit)
        {
            try
            {
                Repository<PostpaidCustCreditLimits> repCredit = new Repository<PostpaidCustCreditLimits>();
                repCredit.Add(objCredit);
                repCredit.SaveChanges();
                return 1;
            }
            catch
            {

                throw;
            }
        }
        #endregion

        #region Get Activities From ActivityType Id
        /// <summary>
        /// 
        /// </summary>
        /// <param name="id">Activity Type Id</param>
        /// <returns></returns>
        public static List<Activity> GetActivitiesFromActivityTypeId(long id)
        {
            try
            {
                Repository<Activity> repActivity = new Repository<Activity>();
                return repActivity.GetAll().Where(x => x.ActivityType_id == id && x.Activity_IsActive == true && x.Activity_IsDeleted == false).OrderBy(x => x.Activity_Name).ToList();
            }
            catch
            {

                throw;
            }
        }
        #endregion

        #region Get Products from Product type id
        /// <summary>
        /// 
        /// </summary>
        /// <param name="id">ProductType ID</param>
        /// <returns></returns>
        public static List<Product> GetProductsFromProductTypeId(long id)
        {
            try
            {
                Repository<Product> repProduct = new Repository<Product>();
                return repProduct.GetAll().Where(x => x.Product_Type == id && x.Product_IsActive == true && x.Product_IsDeleted == false).Select(x => new Product { Product_id = x.Product_id, Product_Name = x.Product_Name }).OrderBy(x => x.Product_Name).ToList();
            }
            catch
            {

                throw;
            }
        }
        #endregion

        #region Get Channels from Channel type id
        /// <summary>
        /// 
        /// </summary>
        /// <param name="id">ChannelType ID</param>
        /// <returns></returns>
        public static List<Channel> GetChannelsFromChannelTypeId(long id)
        {
            try
            {
                Repository<Channel> repChannel = new Repository<Channel>();
                return repChannel.GetAll().Where(x => x.Channel_Type == id && x.Channel_IsActive == true && x.Channel_IsDeleted == false).Select(x => new Channel { Channel_id = x.Channel_id, Channel_Name = x.Channel_Name }).OrderBy(x => x.Channel_Name).ToList();
            }
            catch
            {

                throw;
            }
        }
        #endregion

        #region AddUpdateClassification
        public static int AddUpdateClassification(Tierlevel objTierlevel)
        {
            try
            {
                Repository<Tierlevel> repTierlevel = new Repository<Tierlevel>();
                if (objTierlevel.id > 0)
                    repTierlevel.Update(objTierlevel);
                else
                    repTierlevel.Add(objTierlevel);
                repTierlevel.SaveChanges();
                return 1;
            }
            catch
            {

                throw;
            }
        }
        #endregion

        #region GetProductNameById
        public static string GetProductNameById(long? id)
        {
            try
            {
                Repository<Product> repProduct = new Repository<Product>();
                if (id == -1)
                    return "All";
                else
                    return repProduct.Single(x => x.Product_id == id).Product_Name;
            }
            catch
            {

                throw;
            }
        }
        #endregion

        #region GetProductTypeNameById
        public static string GetProductTypeNameById(long? id)
        {
            try
            {
                Repository<ProductType> repProductType = new Repository<ProductType>();
                if (id == -1)
                    return "All";
                else
                {
                    ProductType obj=repProductType.Single(x => x.ProductType_id == id);
                    if (obj != null)
                        return obj.ProductType_Name;
                    else
                        return "";
                }
            }
            catch
            {

                throw;
            }
        }
        #endregion

        #region GetEventNameById
        public static string GetEventNameById(long? id)
        {
            try
            {
                Repository<EventsTbl> repEvent = new Repository<EventsTbl>();
                if (id == -1)
                    return "All";
                else
                    return repEvent.Single(x => x.Event_id == id).Event_Name;
            }
            catch
            {

                throw;
            }
        }
        #endregion

        #region GetCountryNameById
        public static string GetCountryNameById(long? id)
        {
            try
            {
                Repository<Country> repCountry = new Repository<Country>();
                if (id == -1)
                    return "All";
                else
                    return repCountry.Single(x => x.CountryId == id).CountryName;
            }
            catch
            {

                throw;
            }
        }
        #endregion

        #region GetCustomerTypesById
        public static string GetCustomerTypesById(long? id)
        {
            try
            {
                Repository<CustomerType> repCustomerType = new Repository<CustomerType>();
                if (id == -1)
                    return "All";
                else
                    return repCustomerType.Single(x => x.CustomerType_id == id).Customer_Type;
            }
            catch
            {
                throw;
            }
        }
        #endregion

        #region GetCustomerNameById
        public static string GetCustomerNameById(long? id)
        {
            try
            {
                Repository<Customer> repCust = new Repository<Customer>();
                string name = repCust.Single(x => x.Customer_id == id).Customer_FirstName;
                if(string.IsNullOrEmpty(name))
                    name = repCust.Single(x => x.Customer_id == id).CompanyName;
                return name;
            }
            catch
            {
                throw;
            }
        }
        #endregion
        #region GetStaffNameById
        public static string GetStaffNameById(long? id)
        {
            try
            {
                Repository<Staff> repCust = new Repository<Staff>();
                Staff objStaff=repCust.Single(x => x.Staff_id == id);
                if (objStaff != null)
                    return objStaff.Staff_Name;
                else
                    return "";
            }
            catch
            {

                throw;
            }
        }
        #endregion
        #region GetCustomerEmailById
        public static string GetStaffEmailById(long? id)
        {
            try
            {
                Repository<Staff> repCust = new Repository<Staff>();
                return repCust.Single(x => x.Staff_id == id).Staff_Email;
            }
            catch
            {

                throw;
            }
        }
        #endregion
        #region GetChannelNameById
        public static string GetChannelNameById(long? id)
        {
            try
            {
                Repository<Channel> repChannel = new Repository<Channel>();
                if (id == -1)
                    return "All";
                else
                    return repChannel.Single(x => x.Channel_id == id).Channel_Name;
            }
            catch
            {

                throw;
            }
        }
        #endregion

        #region GetChannelTypeNameById
        public static string GetChannelTypeNameById(long? id)
        {
            try
            {
                Repository<ChannelType> repChannelType = new Repository<ChannelType>();
                if (id == -1)
                    return "All";
                else
                    return repChannelType.Single(x => x.ChannelType_id == id).ChannelType_Name;
            }
            catch
            {

                throw;
            }
        }
        #endregion

        #region GetTimePeriodById
        public static string GetTimePeriodById(long? id)
        {
            try
            {
                Repository<TimeDuration> repLoyaltyProg = new Repository<TimeDuration>();
                if (id == -1)
                    return "All";
                else
                    return repLoyaltyProg.Single(x => x.TimeDuration_id == id).Value;
            }
            catch
            {

                throw;
            }
        }
        #endregion

        #region GetCommunicationNameById
        public static string GetCommunicationNameById(long? id)
        {
            try
            {
                Repository<CommunicationTemplates> repCom = new Repository<CommunicationTemplates>();
                if (id.HasValue)
                {
                    return repCom.Single(x => x.Template_Id == id).Template_Name;
                }
                else
                    return "N/A";
            }
            catch
            {

                throw;
            }
        }
        #endregion

        #region GetClassificationNameById
        public static string GetClassificationNameById(long? id)
        {
            try
            {
                Repository<Tierlevel> repCom = new Repository<Tierlevel>();
                return repCom.Single(x => x.id == id).tierlevel_name;
            }
            catch
            {

                throw;
            }
        }
        #endregion

        #region GetFormulaById
        public static string GetFormulaById(long? id)
        {
            try
            {
                Repository<Tierrule> repCom = new Repository<Tierrule>();
                return repCom.Single(x => x.id == id).formula; // +" (v is " + repCom.Single(x => x.id == id).valuetype + ")";
            }
            catch
            {

                throw;
            }
        }
        #endregion

        #region GetActionItemById
        public static string GetActionItemById(long? id)
        {
            try
            {
                Repository<actionitem> repItem = new Repository<actionitem>();
                return repItem.Single(x => x.id == id).actionitem_name;
            }
            catch
            {

                throw;
            }
        }
        #endregion

        #region GetRoleNameById
        public static string GetRoleNameById(long? id)
        {
            try
            {
                Repository<Role> repRole = new Repository<Role>();
                if (id.HasValue)
                {
                    if (id > 0)
                    {
                        Role objRole = repRole.Single(x => x.Role_id == id);
                        if(objRole!=null)
                            return repRole.Single(x => x.Role_id == id).RoleName;
                        else
                            return "None";
                    }
                    else
                        return "None";
                }
                else
                    return "None";
            }
            catch
            {
                throw;
            }
        }
        #endregion

        #region EditApproval
        public static int EditApproval(Approval objApproval)
        {
            try
            {
                Repository<Approval> repApproval = new Repository<Approval>();
                if (objApproval.Table_id > 0)
                    repApproval.Update(objApproval);
                repApproval.SaveChanges();
                return 1;
            }
            catch
            {
                throw;
            }
        }
        #endregion

        #region GetPostpaidCustCrLimitByCustId
        public static PostpaidCustCreditLimits GetPostpaidCustCrLimitByCustId(long? id)
        {
            try
            {
                Repository<PostpaidCustCreditLimits> repCustCrLimit = new Repository<PostpaidCustCreditLimits>();
                return repCustCrLimit.GetAll().Where(x => x.Cust_id == id).OrderByDescending(x => x.DateCreated).FirstOrDefault();
            }
            catch
            {

                throw;
            }
        }
        #endregion

        #region Get All Action Items
        public static List<actionitem> GetAllActionItems()
        {
            try
            {
                Repository<actionitem> repItems = new Repository<actionitem>();
                return repItems.GetAll().Where(x => x.IsActive == true && x.IsDeleted == false).ToList();
            }
            catch
            {

                throw;
            }
        }
        #endregion

        #region AddUpdateVehicle
        public static int AddUpdateVehicle(Vehicle objVehicle)
        {
            try
            {
                Repository<Vehicle> repVehicle = new Repository<Vehicle>();
                if (objVehicle.Vehicle_Id > 0)
                    repVehicle.Update(objVehicle);
                else
                    repVehicle.Add(objVehicle);
                repVehicle.SaveChanges();
                return 1;
            }
            catch
            {

                throw;
            }
        }
        #endregion
        #region AddUpdateVehicleModel
        public static int AddUpdateVehicleModel(VehicleModel objVehicleModel)
        {
            try
            {
                Repository<VehicleModel> repVehicleModel = new Repository<VehicleModel>();
                if (objVehicleModel.VehicleModel_Id > 0)
                    repVehicleModel.Update(objVehicleModel);
                else
                    repVehicleModel.Add(objVehicleModel);
                repVehicleModel.SaveChanges();
                return 1;
            }
            catch
            {

                throw;
            }
        }
        #endregion

        #region Get Vehicle Models from Vehicle id
        /// <summary>
        /// 
        /// </summary>
        /// <param name="id">Vehicle ID</param>
        /// <returns></returns>
        public static List<VehicleModel> GetModelsFromVehicleId(long id)
        {
            try
            {
                Repository<VehicleModel> repChannel = new Repository<VehicleModel>();
                return repChannel.GetAll().Where(x => x.VehicleId == id && x.VehicleModelIsActive == true && x.VehicleModelIsDeleted == false).Select(x => new VehicleModel { VehicleModel_Id = x.VehicleModel_Id, VehicleModel_Name = x.VehicleModel_Name, TankCapacity = x.TankCapacity }).OrderBy(x => x.VehicleModel_Name).ToList();
            }
            catch
            {

                throw;
            }
        }
        #endregion
        #region AddUpdateCustomerVehicle
        public static int AddUpdateCustomerVehicle(Customer_Vehicle objVehicle)
        {
            try
            {
                Repository<Customer_Vehicle> repVehicle = new Repository<Customer_Vehicle>();
                if (objVehicle.CustomerVehicleId > 0)
                    repVehicle.Update(objVehicle);
                else
                    repVehicle.Add(objVehicle);
                repVehicle.SaveChanges();
                return 1;
            }
            catch
            {

                throw;
            }
        }
        #endregion
        #region GetVehicleNameById
        public static string GetVehicleNameById(long? id)
        {
            try
            {
                Repository<Vehicle> repVehicle = new Repository<Vehicle>();
                return repVehicle.Single(x => x.Vehicle_Id == id).Vehicle_Make;
            }
            catch
            {

                throw;
            }
        }
        #endregion
        #region GetVehicleModelById
        public static string GetVehicleModelById(long? id)
        {
            try
            {
                Repository<VehicleModel> repVehicle = new Repository<VehicleModel>();
                return repVehicle.Single(x => x.VehicleModel_Id == id).VehicleModel_Name;
            }
            catch
            {

                throw;
            }
        }
        #endregion

        #region AddUpdateActionItem
        public static int AddUpdateActionItem(actionitem objItem)
        {
            try
            {
                Repository<actionitem> repItem = new Repository<actionitem>();
                if (objItem.id > 0)
                    repItem.Update(objItem);
                else
                    repItem.Add(objItem);
                repItem.SaveChanges();
                return 1;
            }
            catch
            {

                throw;
            }
        }
        #endregion

        #region Add or Update Supplementary Actions
        public static int AddUpdateSupplementaryAction(long id, List<long> ActionIds)
        {
            try
            {
                Repository<supplementary_action> repSupp = new Repository<supplementary_action>();

                List<supplementary_action> lstSupp = repSupp.GetAll().Where(x => x.action_id == id).ToList();
                if (lstSupp.Count() > 0 && lstSupp != null)
                {
                    foreach (supplementary_action item in lstSupp)
                    {
                        repSupp.DeleteObject(item);
                        repSupp.SaveChanges();
                    }
                }
                if (ActionIds.Count() > 0 && ActionIds != null)
                {
                    foreach (long item in ActionIds)
                    {
                        supplementary_action objSupp = new supplementary_action();
                        objSupp.action_id = id;
                        objSupp.supplementary_action_id = item;
                        repSupp.Add(objSupp);
                        repSupp.SaveChanges();
                    }
                }
                return 1;
            }
            catch
            {

                throw;
            }
        }
        #endregion
        #region Add or Update Conflicting Actions
        public static int AddUpdateConflicAction(long id, List<long> ActionIds)
        {
            try
            {
                Repository<conflicting_action> repSupp = new Repository<conflicting_action>();

                List<conflicting_action> lstSupp = repSupp.GetAll().Where(x => x.action_id == id).ToList();
                if (lstSupp.Count() > 0 && lstSupp != null)
                {
                    foreach (conflicting_action item in lstSupp)
                    {
                        repSupp.DeleteObject(item);
                        repSupp.SaveChanges();
                    }
                }
                if (ActionIds.Count() > 0 && ActionIds != null)
                {
                    foreach (long item in ActionIds)
                    {
                        conflicting_action objSupp = new conflicting_action();
                        objSupp.action_id = id;
                        objSupp.conflicting_action_id = item;
                        repSupp.Add(objSupp);
                        repSupp.SaveChanges();
                    }
                }
                return 1;
            }
            catch
            {

                throw;
            }
        }
        #endregion

        #region Add or Update Account Types
        public static int AddUpdateAccountTypes(AccountType objAccTypes, List<long> lstActionIds)
        {
            try
            {
                Repository<AccountType> repAccType = new Repository<AccountType>();
                if (objAccTypes.id > 0)
                    repAccType.Update(objAccTypes);
                else
                    repAccType.Add(objAccTypes);
                repAccType.SaveChanges();
                Repository<AccountType_Action> repAccAct = new Repository<AccountType_Action>();
                List<AccountType_Action> lstAccAction = repAccAct.GetAll().Where(x => x.AccTypeId == objAccTypes.id).ToList();
                if (lstAccAction.Count() > 0 && lstAccAction != null)
                {
                    foreach (AccountType_Action item in lstAccAction)
                    {
                        repAccAct.DeleteObject(item);
                        repAccAct.SaveChanges();
                    }
                }
                if (lstActionIds.Count() > 0 && lstActionIds != null)
                {
                    foreach (long item in lstActionIds)
                    {
                        AccountType_Action objAccAct = new AccountType_Action();
                        objAccAct.AccTypeId = objAccTypes.id;
                        objAccAct.ActionId = item;
                        repAccAct.Add(objAccAct);
                        repAccAct.SaveChanges();
                    }
                }
                return 1;
            }
            catch
            {

                throw;
            }
        }
        #endregion

        #region Get Actions from Account Type ID
        public static List<AccountType_Action> GetActionsFromAccountTypeID(long id)
        {
            try
            {
                Repository<AccountType_Action> repAccAct = new Repository<AccountType_Action>();
                return repAccAct.GetAll().Where(x => x.AccTypeId == id).ToList();
            }
            catch
            {

                throw;
            }
        }
        #endregion

        #region Get Action Name from Action ID
        public static string GetActionNameFromActionID(long? id)
        {
            try
            {
                Repository<ActionsTbl> repAct = new Repository<ActionsTbl>();
                return repAct.Single(x => x.id == id).Action_Name;
            }
            catch
            {

                throw;
            }
        }
        #endregion
        #region UpdateAccountTypes
        public static int UpdateAccountTypes(AccountType objAccType)
        {
            try
            {
                Repository<AccountType> repAccType = new Repository<AccountType>();
                if (objAccType.id > 0)
                    repAccType.Update(objAccType);
                else
                    repAccType.Add(objAccType);
                repAccType.SaveChanges();
                return 1;
            }
            catch
            {

                throw;
            }
        }
        #endregion

        #region Add or Update Customer Account
        public static int AddUpdateCustomerAccount(Customer_Account objAcc)
        {
            try
            {
                Repository<Customer_Account> repCustAcc = new Repository<Customer_Account>();
                if (objAcc.IsCollection == true)
                {
                    List<Customer_Account> lst = repCustAcc.GetAll().Where(x => x.Customer_id == objAcc.Customer_id && x.IsCollection == true).ToList();
                    foreach (var item in lst)
                    {
                        item.IsCollection = false;
                        repCustAcc.SaveChanges();
                    }
                    repCustAcc = new Repository<Customer_Account>();
                }
                if (objAcc.AccountNumber > 0)
                    repCustAcc.Update(objAcc);
                else
                    repCustAcc.Add(objAcc);
                repCustAcc.SaveChanges();
                return 1;
            }
            catch
            {

                throw;
            }
        }
        #endregion
        #region get account type by id
        public static string GetAccountTypeById(long? id)
        {
            try
            {
                Repository<AccountType> repAcc = new Repository<AccountType>();
                AccountType oAcc=repAcc.Single(x => x.id == id);
                if (oAcc != null)
                    return oAcc.AccType;
                else
                    return "";
            }
            catch
            {

                throw;
            }
        }
        #endregion

        #region Delete Supplementary Actions
        public static int DeleteSuppActions(List<supplementary_action> lst)
        {
            try
            {
                if (lst != null && lst.Count > 0)
                {
                    Repository<supplementary_action> repSupp = new Repository<supplementary_action>();
                    foreach (supplementary_action item in lst)
                    {
                        repSupp.Delete(item);
                        repSupp.SaveChanges();
                    }
                }
                return 1;
            }
            catch
            {

                throw;
            }
        }
        #endregion

        #region Add or Update Vehicle Account
        public static int AddUpdateVehicleAccount(Lnk_CustomerVehicle_Account objVehicle)
        {
            try
            {
                Repository<Lnk_CustomerVehicle_Account> repVehicle = new Repository<Lnk_CustomerVehicle_Account>();
                if (objVehicle.Lnk_id > 0)
                    repVehicle.Update(objVehicle);
                else
                    repVehicle.Add(objVehicle);
                repVehicle.SaveChanges();
                return 1;
            }
            catch
            {

                throw;
            }
        }
        #endregion

        #region Get Customer Account Number by Vehicle id
        public static long? GetCustomerAccountByVehicleId(long? vehid)
        {
            try
            {
                Repository<Lnk_CustomerVehicle_Account> repVehAcc = new Repository<Lnk_CustomerVehicle_Account>();
                Lnk_CustomerVehicle_Account objAcc = repVehAcc.First(x => x.Lnk_CustomerVehicleId == vehid);
                long? accno = null;
                if (objAcc != null)
                    accno = objAcc.Lnk_AccountNumber;
                if (accno.HasValue)
                    return accno;
                else
                    return 0;
            }
            catch
            {

                throw;
            }
        }
        #endregion
        #region GetEmployeeNameByAccountNo(long? accountno)
        public static string GetEmployeeNameByAccountNo(long? accountno)
        {
            try
            {
                Repository<VwCustomerEmpAccount> repEmp = new Repository<VwCustomerEmpAccount>();
                VwCustomerEmpAccount objAcc = repEmp.First(x => x.AccountNumber==accountno);
                if (objAcc != null)
                    return objAcc.Emp_Name;
                else
                    return string.Empty;
            }
            catch
            {
                return string.Empty;
            }
        }
        #endregion
        #region Get Customer Account Mask by Vehicle id
        public static string GetCustomerAccountMaskByVehicleId(long? vehid)
        {
            try
            {
                Repository<Lnk_CustomerVehicle_Account> repVehAcc = new Repository<Lnk_CustomerVehicle_Account>();
                Lnk_CustomerVehicle_Account objAcc = repVehAcc.First(x => x.Lnk_CustomerVehicleId == vehid);
                long? accno = null;
                if (objAcc != null)
                    accno = objAcc.Lnk_AccountNumber;
                if (accno.HasValue)
                {
                    Repository<Customer_Account> repAcc = new Repository<Customer_Account>();
                    return repAcc.Single(x => x.AccountNumber == accno).Mask;
                }
                else
                    return string.Empty;
            }
            catch
            {

                throw;
            }
        }
        #endregion

        #region UnassignVehicleFromAccount
        public static int UnassignVehicleFromAccount(Lnk_CustomerVehicle_Account objAcc)
        {
            try
            {
                Repository<Lnk_CustomerVehicle_Account> repAcc = new Repository<Lnk_CustomerVehicle_Account>();
                if (objAcc != null)
                {
                    repAcc.DeleteObject(objAcc);
                    repAcc.SaveChanges();
                    return 1;
                }
                return 0;
            }
            catch
            {
                
                throw;
            }
        }
        #endregion

        #region AddUpdateAccountPostpaidLimit
        public static int AddUpdateAccountPostpaidLimit(PostpaidAccountCreditLimit objPostpaid)
        {
            try
            {
                Repository<PostpaidAccountCreditLimit> repPostpaid = new Repository<PostpaidAccountCreditLimit>();
                if (objPostpaid.id > 0)
                    repPostpaid.Update(objPostpaid);
                else
                    repPostpaid.Add(objPostpaid);
                repPostpaid.SaveChanges();
                return 1;
            }
            catch
            {

                throw;
            }
        }
        #endregion

        #region Get Formula Value Type from Value Type ID
        public static string GetFormulaValueTypefromValueTypeID(long? id)
        {
            try
            {
                Repository<FormulaValueType> repValuetype = new Repository<FormulaValueType>();
                return repValuetype.Single(x => x.ValueId == id).Type;
            }
            catch
            {
                throw;
            }
        }
        #endregion

        #region Add or Update Schedule
        public static int AddUpdateSchedule(Schedule objShedule)
        {
            try
            {
                Repository<Schedule> repSchedule = new Repository<Schedule>();
                if (objShedule.Schedule_Id > 0)
                    repSchedule.Update(objShedule);
                else
                    repSchedule.Add(objShedule);
                repSchedule.SaveChanges();
                return 1;
            }
            catch
            {
                
                throw;
            }
        }
        #endregion

        #region GetAllSchedule
        public static List<Schedule> GetAllSchedule()
        {
            try
            {
                Repository<Schedule> repShedule = new Repository<Schedule>();
                return repShedule.GetAll().Where(x => x.Schedule_IsActive == true && x.Schedule_IsDeleted == false).OrderBy(x => x.Schedule_Name).ToList();
            }
            catch
            {
                
                throw;
            }
        }
        #endregion

        #region AddScheduleHistory
        public static int AddScheduleHistory(Schedule_History objHistory)
        {
            try
            {
                Repository<Schedule_History> repHistory = new Repository<Schedule_History>();
                repHistory.Add(objHistory);
                repHistory.SaveChanges();
                return 1;
            }
            catch
            {
                
                throw;
            }
        }
        #endregion

        #region Add Finance Transaction
        public static int AddFinanceTransaction(Finance_Transaction objFin)
        {
            try
            {
                Repository<Finance_Transaction> repFin = new Repository<Finance_Transaction>();
                repFin.Add(objFin);
                repFin.SaveChanges();
                return 1;
            }
            catch
            {
                
                throw;
            }
        }
        #endregion
        #region AddGLTransactions
        public static int AddGLTransactions(GLTransactions objGL)
        {
            try
            {
                Repository<GLTransactions> repGL = new Repository<GLTransactions>();
                repGL.Add(objGL);
                repGL.SaveChanges();
                return 1;
            }
            catch
            {
                
                throw;
            }
        }
        #endregion
        #region AddChartofAccounts
        public static int AddChartofAccounts(ChartofAccounts objChart)
        {
            try
            {
                Repository<ChartofAccounts> repChart = new Repository<ChartofAccounts>();
                repChart.Add(objChart);
                repChart.SaveChanges();
                return 1;
            }
            catch
            {
                
                throw;
            }
        }
        #endregion

        #region SendMsg
        public static int SaveSentMsg(Message objMsg)
        {
            try
            {
                Repository<Message> repMsg = new Repository<Message>();
                repMsg.Add(objMsg);
                repMsg.SaveChanges();
                return 1;
            }
            catch
            {
                throw;
            }
        }
        #endregion

        #region EditCustomFields
        public static int EditCustomFields(CustomTableFields objCustomFields)
        {
            try
            {
                Repository<CustomTableFields> repCustom = new Repository<CustomTableFields>();
                Repository<ReceiptSettings> repReceipt = new Repository<ReceiptSettings>();
                ReceiptSettings obj = repReceipt.Single(x => x.TableName == objCustomFields.TableName && x.FieldName == objCustomFields.CustomFieldId);
                if (obj != null)
                {
                    obj.Description = objCustomFields.CustomFieldName;
                    repReceipt.Update(obj);
                    repReceipt.SaveChanges();
                }
                if (objCustomFields.id > 0)
                    repCustom.Update(objCustomFields);
                repCustom.SaveChanges();
                return 1;
            }
            catch
            {
                
                throw;
            }
        }
        #endregion
    }
}
