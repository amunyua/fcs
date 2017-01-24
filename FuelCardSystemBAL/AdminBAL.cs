using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FuelCardSystemEntities.Models;
using FuelCardSystemDAL;

namespace FuelCardSystemBAL
{
    public class AdminBAL
    {
        #region ChangePassword
        public static int ChangePassword(Staff objUser)
        {
            try
            {
                return AdminDAL.ChangePassword(objUser);
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
                return AdminDAL.ChangeCustomerPassword(objUser);
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
                return AdminDAL.AddUpdateGenSettings(objGenSettings);
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
                return AdminDAL.GetAllTimePeriods();
            }
            catch
            {

                throw;
            }
        }
        #endregion
        #region List of Currencies
        public static List<Currency> GetAllCurrency()
        {
            try
            {
                return AdminDAL.GetAllCurrency();
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
                objCrcy.DateCreated = DateTime.Now;
                return AdminDAL.AddUpdateCurrencyConversionRates(objCrcy);
            }
            catch
            {

                throw;
            }
        }
        #endregion
        #region Add or Update Product Type
        public static int AddUpdateProductType(ProductType objProdType)
        {
            try
            {
                return AdminDAL.AddUpdateProductType(objProdType);
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
                return AdminDAL.DeleteProductType(objProdType);
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
                return AdminDAL.AddUpdateProductProperty(objProdProp);
            }
            catch
            {

                throw;
            }
        }
        #endregion
        #region List of Product Types
        public static List<ProductType> ProductTypeList()
        {
            try
            {
                return AdminDAL.ProductTypeList();
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
                return AdminDAL.AddUpdateProducts(objProduct);
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
                return AdminDAL.AddUpdateLnkProdProperties(productId, lstProp);
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
                return AdminDAL.AddUpdatePriceList(objList);
            }
            catch
            {

                throw;
            }
        }
        #endregion
        #region Add or Update Discount List
        public static int AddUpdateDiscountList(DiscountsList objList)
        {
            try
            {
                return AdminDAL.AddUpdateDiscountList(objList);
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
                return AdminDAL.AddUpdateProductPriceList(objList);
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
                return AdminDAL.AssignPriceList(id, custids);
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
                return AdminDAL.UnassignPriceList(pricelistid, custid);
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
                return AdminDAL.AddUpdateGadget(objGadget);
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
                return AdminDAL.AddUpdateChannelType(objChannelType);
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
                return AdminDAL.GetAllCountries();
            }
            catch
            {

                throw;
            }
        }
        #endregion
        #region Get all channel types
        public static List<ChannelType> GetAllChannelTypes()
        {
            try
            {
                return AdminDAL.GetAllChannelTypes();
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
                return AdminDAL.AddUpdateChannel(objChannel);
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
                return AdminDAL.GetAllChannels();
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
                return AdminDAL.GetAllProducts();
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
                return AdminDAL.GetAllGadgets();
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
                //List<Lnk_Products_Channels> lst = repChannelProduct.GetAll().Where(x => x.Product_id == objChannelProduct.Product_id).ToList();
                //if (lst != null && lst.Count > 0)
                //{
                //    foreach (Lnk_Products_Channels item in lst)
                //    {
                //        repChannelProduct.DeleteObject(item);
                //        repChannelProduct.SaveChanges();
                //    }
                //}
                //    foreach (long item in channelIds)
                //    {
                //        objChannelProduct.Channel_id = item;
                //        repChannelProduct.Add(objChannelProduct);
                //        repChannelProduct.SaveChanges();
                //    }
                //repChannelProduct.SaveChanges();
                //return 1;
                foreach (long item in channelIds)
                {
                    List<Lnk_Products_Channels> lst = repChannelProduct.GetAll().Where(x => x.Product_id == objChannelProduct.Product_id && x.Channel_id == item && x.Price_List_id == objChannelProduct.Price_List_id).ToList();
                    if (lst != null && lst.Count > 0)
                    {
                        foreach (Lnk_Products_Channels itm in lst)
                        {
                            itm.Price_List_id = objChannelProduct.Price_List_id;
                            itm.Channel_id = item;
                            itm.PriceSchedule_Id = objChannelProduct.PriceSchedule_Id == null ? itm.PriceSchedule_Id : objChannelProduct.PriceSchedule_Id;
                            itm.Scheduled_Price = objChannelProduct.Scheduled_Price == null ? itm.Scheduled_Price : objChannelProduct.Scheduled_Price;
                            itm.Product_id = objChannelProduct.Product_id;
                            if (objChannelProduct.Product_Price == null)
                            {
                                if (itm.Product_Price == null)
                                {
                                    Repository<Product> repProduct = new Repository<Product>();
                                    itm.Product_Price = repProduct.Single(x => x.Product_id == objChannelProduct.Product_id).Product_Price;
                                }
                            }
                            else
                            {
                                itm.Product_Price = objChannelProduct.Product_Price;// == null ? itm.Product_Price : objChannelProduct.Product_Price;
                            }
                            itm.Product_currency = objChannelProduct.Product_currency;
                            itm.Product_IsActive = true;
                            itm.Product_IsDeleted = false;
                            repChannelProduct.Update(itm);
                            repChannelProduct.SaveChanges();
                        }
                    }
                    else
                    {
                        if (objChannelProduct.Product_Price == null)
                        {
                            Repository<Product> repProduct1 = new Repository<Product>();
                            objChannelProduct.Product_Price = repProduct1.Single(x => x.Product_id == objChannelProduct.Product_id).Product_Price;
                        }
                        objChannelProduct.Channel_id = item;
                        repChannelProduct.Add(objChannelProduct);
                        repChannelProduct.SaveChanges();
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
        #region Add Update Product Discount(item1, Channel_ids)
        public static int AddUpdateProductDiscount(Lnk_Discount_Product item1, List<long> Channel_ids)
        {
            try
            {
                Repository<Lnk_Discount_Product> repDiscount = new Repository<Lnk_Discount_Product>();
                foreach (long item in Channel_ids)
                {
                    Lnk_Discount_Product objDiscount = repDiscount.First(x => x.Product_id == item1.Product_id && x.Discount_List_id == item1.Discount_List_id && x.Channel_id == item);
                    if (objDiscount != null)
                    {
                        objDiscount.Discount_Type = item1.Discount_Type;
                        objDiscount.Discount_Value = item1.Discount_Value;
                        objDiscount.Discount_Currency = item1.Discount_Currency;
                        repDiscount.Update(objDiscount);
                        repDiscount.SaveChanges();
                    }
                    else
                    {
                        item1.Channel_id = item;
                        repDiscount.Add(item1);
                        repDiscount.SaveChanges();
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
        #region EditProductofChannel
        public static int EditProductofChannel(Lnk_Products_Channels objProduct)
        {
            try
            {
                return AdminDAL.EditProductofChannel(objProduct);
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
                return AdminDAL.UpdateChannelProductStatus(objChannelProduct);
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
                return AdminDAL.AddUpdateChannelGadgets(objGadget);
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
                return AdminDAL.AddUpdateRole(objRole);
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
                return AdminDAL.AddUpdateRolePermissions(RoleId, lstPermissionIds);
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
                return AdminDAL.AddUpdateCustomerRole(objRole);
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
                return AdminDAL.AddUpdateCustomerRolePermissions(RoleId, lstPermissionIds);
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

                return AdminDAL.AddUpdateCustomerType(objCustomerType);
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
                return AdminDAL.AddUpdateCustomerCustomerTypes(CustId, lstCustTypeIds);
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
                return AdminDAL.GetAllCustomerRoles();
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
                return AdminDAL.AddUpdateCustomer(objCustomer);
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
                return AdminDAL.AddUpdateCustomerEmp(objEmp);
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
                return AdminDAL.AddUpdateStaff(objStaff);
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
                return AdminDAL.GetAllRoles();
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
                return AdminDAL.AddUpdateCards(objCard);
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
                return AdminDAL.GetAllPaymentmodes();
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
                return AdminDAL.AddUpdateCardTopup(objCard);
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
                return AdminDAL.AddUpdateCardUsageLimit(objCardUsage);
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
                return AdminDAL.AddUpdateCustomerAccTopup(objAcc);
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
                return AdminDAL.AddUpdateActivityType(objActivityType);
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
                return AdminDAL.AddUpdateActivity(objActivity);
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
                return AdminDAL.AddUpdateFormula(objTierrule);
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
                return AdminDAL.AddUpdateAction(objAction);
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
                return AdminDAL.AddUpdateEvent(objEvents);
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
                return AdminDAL.AddUpdateLoyaltyProgram(objLylty);
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
                return AdminDAL.AddUpdateLoyaltyProgram_Tiertable(objTiertable);
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
                return AdminDAL.AddUpdateComTemplate(objComTemplate);
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
                return AdminDAL.AddCreditLimitPostpaidCust(objCredit);
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
                return AdminDAL.GetActivitiesFromActivityTypeId(id);
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
                return AdminDAL.GetProductsFromProductTypeId(id);
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
                return AdminDAL.GetChannelsFromChannelTypeId(id);
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
                return AdminDAL.AddUpdateClassification(objTierlevel);
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
                return AdminDAL.GetProductNameById(id);
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
                return AdminDAL.GetProductTypeNameById(id);
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
                return AdminDAL.GetEventNameById(id);
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
                return AdminDAL.GetCountryNameById(id);
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
                if (id.HasValue)
                    return AdminDAL.GetCustomerTypesById(id);
                else
                    return "";
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
                return AdminDAL.GetChannelNameById(id);
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
                return AdminDAL.GetChannelTypeNameById(id);
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
                return AdminDAL.GetTimePeriodById(id);
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
                return AdminDAL.GetCommunicationNameById(id);
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
                return AdminDAL.GetClassificationNameById(id);
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
                return AdminDAL.GetFormulaById(id);
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
                return AdminDAL.GetRoleNameById(id);
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
                return AdminDAL.EditApproval(objApproval);
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
                return AdminDAL.GetCustomerNameById(id);
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
                return AdminDAL.GetStaffNameById(id);
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
                return AdminDAL.GetStaffEmailById(id);
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
                return AdminDAL.GetPostpaidCustCrLimitByCustId(id);
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
                return AdminDAL.GetAllActionItems();
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
                return AdminDAL.GetActionItemById(id);
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
                return AdminDAL.AddUpdateVehicle(objVehicle);
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
                return AdminDAL.AddUpdateVehicleModel(objVehicleModel);
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
                return AdminDAL.GetModelsFromVehicleId(id);
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
                return AdminDAL.AddUpdateCustomerVehicle(objVehicle);
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
                return AdminDAL.GetVehicleNameById(id);
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
                return AdminDAL.GetVehicleModelById(id);
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
                return AdminDAL.AddUpdateActionItem(objItem);
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
                return AdminDAL.AddUpdateSupplementaryAction(id, ActionIds);
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
                return AdminDAL.AddUpdateConflicAction(id, ActionIds);
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
                return AdminDAL.AddUpdateAccountTypes(objAccTypes, lstActionIds);
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
                return AdminDAL.GetActionsFromAccountTypeID(id);
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
                return AdminDAL.GetActionNameFromActionID(id);
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
                return AdminDAL.UpdateAccountTypes(objAccType);
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
                return AdminDAL.AddUpdateCustomerAccount(objAcc);
            }
            catch
            {

                throw;
            }
        }
        #endregion
        #region get account type by id
        public static string GetAccountTypeById(long? acctypeid)
        {
            try
            {
                if (acctypeid.HasValue)
                    return AdminDAL.GetAccountTypeById(acctypeid);
                else
                    return string.Empty;
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
                return AdminDAL.DeleteSuppActions(lst);
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
                return AdminDAL.AddUpdateAccUsageLimit(objUsage);
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
                return AdminDAL.AddUpdateVehicleAccount(objVehicle);
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
                return AdminDAL.GetCustomerAccountByVehicleId(vehid);
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
                return AdminDAL.GetEmployeeNameByAccountNo(accountno);
            }
            catch
            {
                throw;
            }
        }
        #endregion

        #region UnassignVehicleFromAccount
        public static int UnassignVehicleFromAccount(long? vehicleid, long? accountnumber)
        {
            try
            {
                if (vehicleid.HasValue && accountnumber.HasValue)
                {
                    Repository<Lnk_CustomerVehicle_Account> repAcc = new Repository<Lnk_CustomerVehicle_Account>();
                    Lnk_CustomerVehicle_Account objAcc = repAcc.Single(x => x.Lnk_AccountNumber == accountnumber && x.Lnk_CustomerVehicleId == vehicleid);
                    if (objAcc != null)
                        return AdminDAL.UnassignVehicleFromAccount(objAcc);
                    else
                        return 0;
                }
                return 0;
            }
            catch
            {

                throw;
            }
        }
        #endregion

        #region Get Customer Account Mask by Vehicle id
        public static string GetCustomerAccountMaskByVehicleId(long? vehid)
        {
            try
            {
                return AdminDAL.GetCustomerAccountMaskByVehicleId(vehid);
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
                return AdminDAL.AddUpdateAccountPostpaidLimit(objPostpaid);
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
                if (id.HasValue)
                {
                    return AdminDAL.GetFormulaValueTypefromValueTypeID(id);
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

        #region Add or Update Schedule
        public static int AddUpdateSchedule(Schedule objSchedule)
        {
            try
            {
                return AdminDAL.AddUpdateSchedule(objSchedule);
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
                return AdminDAL.GetAllSchedule();
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
                return AdminDAL.AddScheduleHistory(objHistory);
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
                return AdminDAL.AddFinanceTransaction(objFin);
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
                return AdminDAL.AddGLTransactions(objGL);
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
                return AdminDAL.AddChartofAccounts(objChart);
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
                return AdminDAL.SaveSentMsg(objMsg);
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
                return AdminDAL.EditCustomFields(objCustomFields);
            }
            catch
            {

                throw;
            }
        }
        #endregion

        #region AddCustomerAuditTrail
        public static int AddCustomerAuditTrail(Customer_AuditTrail oAuditTrail)
        {
            try
            {
                Repository<Customer_AuditTrail> repAudit = new Repository<Customer_AuditTrail>();
                repAudit.Add(oAuditTrail);
                repAudit.SaveChanges();
                return 1;
            }
            catch
            {

                throw;
            }
        }
        #endregion

        #region AddTaxCategogy
        public static int AddTaxCat(TaxCategory oTaxCategory)
        {
            try
            {
                Repository<TaxCategory> repCat = new Repository<TaxCategory>();
                if (oTaxCategory.CatID > 0)
                    repCat.Update(oTaxCategory);
                else
                    repCat.Add(oTaxCategory);
                repCat.SaveChanges();
                return 1;
            }
            catch
            {
                throw;
            }
        }
        #endregion
        #region AddTaxrate
        public static int AddTaxRate(TaxRate oTaxRate)
        {
            try
            {
                Repository<TaxRate> repTaxRate = new Repository<TaxRate>();
                if (oTaxRate.TaxRateID > 0)
                    repTaxRate.Update(oTaxRate);
                else
                    repTaxRate.Add(oTaxRate);
                repTaxRate.SaveChanges();
                return 1;
            }
            catch
            {

                throw;
            }
        }
        #endregion
        #region AddCustomerTaxCat
        public static int AddCustomerTaxCat(Customer_TaxCategory oTaxCategory)
        {
            try
            {
                Repository<Customer_TaxCategory> repCat = new Repository<Customer_TaxCategory>();
                if (oTaxCategory.CustCatID > 0)
                    repCat.Update(oTaxCategory);
                else
                    repCat.Add(oTaxCategory);
                repCat.SaveChanges();
                return 1;
            }
            catch
            {
                throw;
            }
        }
        #endregion
        #region AddTax
        public static int AddTax(Tax oTax)
        {
            try
            {
                Repository<Tax> repCat = new Repository<Tax>();
                if (oTax.TaxID > 0)
                    repCat.Update(oTax);
                else
                    repCat.Add(oTax);
                repCat.SaveChanges();
                return 1;
            }
            catch
            {
                throw;
            }
        }
        #endregion
        #region GetAllTaxCategories
        public static List<TaxCategory> GetAllTaxCategories()
        {
            try
            {
                Repository<TaxCategory> repCat = new Repository<TaxCategory>();
                return repCat.GetAll().Where(x => x.IsActive == true && x.IsDeleted == false).ToList();
            }
            catch
            {

                throw;
            }
        }
        #endregion
        #region GetAllCustomerTaxCategories
        public static List<Customer_TaxCategory> GetAllCustomerTaxCategories()
        {
            try
            {
                Repository<Customer_TaxCategory> repCat = new Repository<Customer_TaxCategory>();
                return repCat.GetAll().Where(x => x.IsActive == true && x.IsDeleted == false).ToList();
            }
            catch
            {

                throw;
            }
        }
        #endregion
        #region GetAllTaxRates
        public static List<TaxRate> GetAllTaxRates()
        {
            try
            {
                Repository<TaxRate> repCat = new Repository<TaxRate>();
                return repCat.GetAll().Where(x => x.IsActive == true && x.IsDeleted == false).ToList();
            }
            catch
            {

                throw;
            }
        }
        #endregion

        public static int AddUpdateCompany(Company objCom)
        {
            try
            {
                Repository<Company> repCompany = new Repository<Company>();
                if (objCom.Company_Id > 0)
                    repCompany.Update(objCom);
                else
                    repCompany.Add(objCom);
                repCompany.SaveChanges();
                return 1;
            }
            catch
            {
                return 0;
            }
        }

        public static int UpdatePrintSettings(long? id, long modifiedby)
        {
            try
            {
                Repository<ReceiptSettings> repReceipt = new Repository<ReceiptSettings>();
                if (id.HasValue)
                {
                    ReceiptSettings obj = repReceipt.Single(x => x.id == id);
                    if (obj != null)
                    {
                        obj.IsPrintable = obj.IsPrintable == true ? false : true;
                        obj.DateCreated = DateTime.Now;
                        obj.ModifiedBy = modifiedby;
                        repReceipt.Update(obj);
                        repReceipt.SaveChanges();
                        return 1;
                    }
                }
                return 0;
            }
            catch
            {
                return 0;
            }
        }
    }
}
