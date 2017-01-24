using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FuelCardSystemMVC.Library
{
    public static class Parameters
    {
        public const string Can_Create_Customer = "Can_Create_Customer";
        public const string Can_Create_CustomerEmployeeDept = "Can_Create_CustomerEmployeeDept";
        public const string Can_Define_CustomerOverallUsageLimits = "Can_Define_CustomerOverallUsageLimits";
        public const string Can_Edit_Customer = "Can_Edit_Customer";
        public const string Can_Delete_Customer = "Can_Delete_Customer";
        public const string Can_Delete_CustomerEmployeeDept = "Can_Delete_CustomerEmployeeDept";
        public const string Can_Edit_CustomerEmployeeDept = "Can_Edit_CustomerEmployeeDept";
        public const string Can_Assign_CardsToCustomer = "Can_Assign_CardsToCustomer";
        public const string Can_Assign_CardsToCustomerEmployeeDept = "Can_Assign_CardsToCustomerEmployeeDept";
        public const string Can_UnAssign_AssginCustomerCards = "Can_UnAssign_AssginCustomerCards";
        public const string Can_UnAssign_AssignedCustomerDeptCards = "Can_UnAssign_AssignedCustomerDeptCards";
        public const string Can_upload_Card_Data = "Can_upload_Card_Data";
        public const string Can_Activate_Cards = "Can_Activate_Cards";
        public const string Can_Topup_Cards = "Can_Topup_Cards";
        public const string Can_Define_CardUsageLimits = "Can_Define_CardUsageLimits";
        public const string Can_Create_Role = "Can_Create_Role";
        public const string Can_Assign_PermissionsToRoles = "Can_Assign_PermissionsToRoles";
        public const string Can_Delete_Roles = "Can_Delete_Roles";
        public const string Can_Create_Staff = "Can_Create_Staff";
        public const string Can_Edit_Staff = "Can_Edit_Staff";
        public const string Can_Delete_Staff = "Can_Delete_Staff";
        public const string Can_Create_Channel = "Can_Create_Channel";
        public const string Can_Edit_Channel = "Can_Edit_Channel";
        public const string Can_Delete_Channel = "Can_Delete_Channel";
        public const string Can_Define_ChannelProductPrices = "Can_Define_ChannelProductPrices";
        public const string Can_Edit_ChannelProductPrices = "Can_Edit_ChannelProductPrices";
        public const string Can_Delete_ChannelProductPrices = "Can_Delete_ChannelProductPrices";
        public const string Can_Create_ChannelType = "Can_Create_ChannelType";
        public const string Can_Edit_ChannelType = "Can_Edit_ChannelType";
        public const string Can_Delete_ChannelType = "Can_Delete_ChannelType";
        public const string Can_Update_GeneralSettings = "Can_Update_GeneralSettings";
        public const string Can_Update_ReceiptSettings = "Can_Update_ReceiptSettings";
        public const string Can_Create_Product = "Can_Create_Product";
        public const string Can_Edit_Product = "Can_Edit_Product";
        public const string Can_Delete_Product = "Can_Delete_Product";
        public const string Can_Create_ProductType = "Can_Create_ProductType";
        public const string Can_Edit_ProductType = "Can_Edit_ProductType";
        public const string Can_Delete_ProductType = "Can_Delete_ProductType";
        public const string Can_Create_Activity = "Can_Create_Activity";
        public const string Can_Edit_Activity = "Can_Edit_Activity";
        public const string Can_Delete_Activity = "Can_Delete_Activity";
        public const string Can_Create_ActivityType = "Can_Create_ActivityType";
        public const string Can_Edit_ActivityType = "Can_Edit_ActivityType";
        public const string Can_Delete_ActivityType = "Can_Delete_ActivityType";
        public const string Can_Create_TerminalGadgets = "Can_Create_TerminalGadgets";
        public const string Can_Edit_TerminalGadgets = "Can_Edit_TerminalGadgets";
        public const string Can_Delete_TerminalGadgets = "Can_Delete_TerminalGadgets";
        public const string Can_set_CurrencyConversionRate = "Can_set_CurrencyConversionRate";
        public const string Can_Create_Classification = "Can_Create_Classification";
        public const string Can_Edit_Classification = "Can_Edit_Classification";
        public const string Can_Delete_Classification = "Can_Delete_Classification";
        public const string Can_Create_LoyaltyProgram = "Can_Create_LoyaltyProgram";
        public const string Can_Edit_LoyaltyProgram = "Can_Edit_LoyaltyProgram";
        public const string Can_Delete_LoyaltyProgram = "Can_Delete_LoyaltyProgram";
        public const string Can_Login_to_Terminal = "Can_Login_to_Terminal";
        public const string Can_MakeASale = "Can_MakeASale";
        public const string Can_Reset_CardPIN = "Can_Reset_CardPIN";
        public const string Can_Reset_CustomerPassword = "Can_Reset_CustomerPassword";
        public const string Can_Edit_CustomerCards = "Can_Edit_CustomerCards";
        public const string Can_Create_Formula = "Can_Create_Formula";
        public const string Can_Edit_Formula = "Can_Edit_Formula";
        public const string Can_Delete_Formula = "Can_Delete_Formula";
        public const string Can_Create_Action = "Can_Create_Action";
        public const string Can_Edit_Action = "Can_Edit_Action";
        public const string Can_Delete_Action = "Can_Delete_Action";
        public const string Can_Create_Event = "Can_Create_Event";
        public const string Can_Edit_Event = "Can_Edit_Event";
        public const string Can_Delete_Event = "Can_Delete_Event";
        public const string Can_Edit_Comtemplates = "Can_Edit_Comtemplates";
        public const string Can_log_in_to_portal = "Can_log_in_to_portal";
        public const string Can_Topup_Account = "Can_Topup_Account"; //new
        public const string Can_Define_AccountUsageLimits = "Can_Define_AccountUsageLimits"; //new
        public const string Can_Login_to_CustomerPortal = "Can_Login_to_CustomerPortal"; //new
        public const string Can_Assign_AccountsToCustomerEmployeeDept = "Can_Assign_AccountsToCustomerEmployeeDept";//new
        public const string Can_Create_ProductProperties = "Can_Create_ProductProperties";
        public const string Can_Edit_ProductProperties = "Can_Edit_ProductProperties";
        public const string Can_Delete_ProductProperties = "Can_Delete_ProductProperties";
        
        public const string Can_Create_Schedule = "Can_Create_Schedule";
        public const string Can_Edit_Schedule = "Can_Edit_Schedule";
        public const string Can_Delete_Schedule = "Can_Delete_Schedule";
        public const string Can_Set_Price_Schedule_for_Channel = "Can_Set_Price_Schedule_for_Channel";

        public const string Can_Create_Account_Type = "Can_Create_Account_Type";
        public const string Can_Edit_Account_Type = "Can_Edit_Account_Type";
        public const string Can_Delete_Account_Type = "Can_Delete_Account_Type";

        public const string Can_Activate_Account = "Can_Activate_Account";
        public const string Can_Edit_Account = "Can_Edit_Account";
        public const string Can_Transfer_Account = "Can_Transfer_Account";

        public const string Can_Add_Vehicle_Make = "Can_Add_Vehicle_Make";
        public const string Can_Edit_Vehicle_Make = "Can_Edit_Vehicle_Make";
        public const string Can_Delete_Vehicle_Make = "Can_Delete_Vehicle_Make";

        public const string Can_Add_Vehicle_Model = "Can_Add_Vehicle_Model";
        public const string Can_Edit_Vehicle_Model = "Can_Edit_Vehicle_Model";
        public const string Can_Delete_Vehicle_Model = "Can_Delete_Vehicle_Model";

        public const string Can_Add_Customer_Vehicle = "Can_Add_Customer_Vehicle";
        public const string Can_Edit_Customer_Vehicle = "Can_Edit_Customer_Vehicle";
        public const string Can_Delete_Customer_Vehicle = "Can_Delete_Customer_Vehicle";

        public const string Can_Add_Supplementary_Actions = "Can_Add_Supplementary_Actions";
        public const string Can_Add_Action_Items = "Can_Add_Action_Items";
        public const string Can_Edit_Action_Items = "Can_Edit_Action_Items";
        public const string Can_Delete_Action_Items = "Can_Delete_Action_Items";
        public const string Can_Make_Action_Item_Default = "Can_Make_Action_Item_Default";

        public const string Can_Create_Customer_Type = "Can_Create_Customer_Type";
        public const string Can_Edit_Customer_Type = "Can_Edit_Customer_Type";
        public const string Can_Delete_Customer_Type = "Can_Delete_Customer_Type";

        public const string Can_Set_CreditLimit_Postpaid_Customers = "Can_Set_CreditLimit_Postpaid_Customers";

        public const string Can_Make_LoyaltyProgram_Exclusive = "Can_Make_LoyaltyProgram_Exclusive";
        public const string Can_Make_LoyaltyProgram_Continued = "Can_Make_LoyaltyProgram_Continued";

        public const string Can_Create_PriceList = "Can_Create_PriceList";
        public const string Can_Edit_PriceList = "Can_Edit_PriceList";
        public const string Can_Delete_PriceList = "Can_Delete_PriceList";
        public const string Can_Assign_PriceList = "Can_Assign_PriceList";
        public const string Can_Unassign_PriceList = "Can_Unassign_PriceList";

        public const string Can_Create_DiscountList = "Can_Create_DiscountList";
        public const string Can_Edit_DiscountList = "Can_Edit_DiscountList";
        public const string Can_Delete_DiscountList = "Can_Delete_DiscountList";

        public const string Can_Unassign_VehicleAccount = "Can_Unassign_VehicleAccount";
        public const string Can_Send_Message = "Can_Send_Message";
        public const string Can_Add_CustomFields = "Can_Add_CustomFields";
        public const string Can_Make_PriceList_Default = "Can_Make_PriceList_Default";
        public const string Can_Add_Conflicting_Actions = "Can_Add_Conflicting_Actions";

        public const string Can_Add_TaxCategory = "Can_Add_TaxCategory";
        public const string Can_Edit_TaxCategory = "Can_Edit_TaxCategory";
        public const string Can_Delete_TaxCategory = "Can_Delete_TaxCategory";

        public const string Can_Add_TaxRate = "Can_Add_TaxRate";
        public const string Can_Edit_TaxRate = "Can_Edit_TaxRate";
        public const string Can_Delete_TaxRate = "Can_Delete_TaxRate";

        public const string Can_Add_Customer_TaxCategory = "Can_Add_Customer_TaxCategory";
        public const string Can_Edit_Customer_TaxCategory = "Can_Edit_Customer_TaxCategory";
        public const string Can_Delete_Customer_TaxCategory = "Can_Delete_Customer_TaxCategory";

        public const string Can_Add_Tax = "Can_Add_Tax";
        public const string Can_Edit_Tax = "Can_Edit_Tax";
        public const string Can_Delete_Tax = "Can_Delete_Tax";

        public const string Can_Update_Company = "Can_Update_Company";
    }
}