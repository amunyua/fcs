USE [FuelCardDB]
GO
/****** Object:  View [dbo].[VwAccUsageLimit_Products]    Script Date: 11/30/2015 16:02:35 ******/
DROP VIEW [dbo].[VwAccUsageLimit_Products]
GO
/****** Object:  View [dbo].[VwActivity_ActivityType]    Script Date: 11/30/2015 16:02:35 ******/
DROP VIEW [dbo].[VwActivity_ActivityType]
GO
/****** Object:  View [dbo].[VwCardsCustomers]    Script Date: 11/30/2015 16:02:35 ******/
DROP VIEW [dbo].[VwCardsCustomers]
GO
/****** Object:  View [dbo].[VwCardUsageLimit_Products]    Script Date: 11/30/2015 16:02:35 ******/
DROP VIEW [dbo].[VwCardUsageLimit_Products]
GO
/****** Object:  View [dbo].[VwChannelGadgets]    Script Date: 11/30/2015 16:02:35 ******/
DROP VIEW [dbo].[VwChannelGadgets]
GO
/****** Object:  View [dbo].[VwChannelProducts]    Script Date: 11/30/2015 16:02:35 ******/
DROP VIEW [dbo].[VwChannelProducts]
GO
/****** Object:  View [dbo].[VwChannelProductSchedule]    Script Date: 11/30/2015 16:02:35 ******/
DROP VIEW [dbo].[VwChannelProductSchedule]
GO
/****** Object:  View [dbo].[VwChannels_ChannelTypes]    Script Date: 11/30/2015 16:02:35 ******/
DROP VIEW [dbo].[VwChannels_ChannelTypes]
GO
/****** Object:  View [dbo].[VwCreditLimit]    Script Date: 11/30/2015 16:02:35 ******/
DROP VIEW [dbo].[VwCreditLimit]
GO
/****** Object:  View [dbo].[VwCustomerAccount]    Script Date: 11/30/2015 16:02:35 ******/
DROP VIEW [dbo].[VwCustomerAccount]
GO
/****** Object:  View [dbo].[VwPriceListProducts]    Script Date: 11/30/2015 16:02:35 ******/
DROP VIEW [dbo].[VwPriceListProducts]
GO
/****** Object:  View [dbo].[VwProduct_ProductProperty]    Script Date: 11/30/2015 16:02:35 ******/
DROP VIEW [dbo].[VwProduct_ProductProperty]
GO
/****** Object:  View [dbo].[VwProducts_ProductTypes]    Script Date: 11/30/2015 16:02:35 ******/
DROP VIEW [dbo].[VwProducts_ProductTypes]
GO
/****** Object:  View [dbo].[VwTest]    Script Date: 11/30/2015 16:02:35 ******/
DROP VIEW [dbo].[VwTest]
GO
/****** Object:  View [dbo].[VwVehicle_VehicleModel]    Script Date: 11/30/2015 16:02:35 ******/
DROP VIEW [dbo].[VwVehicle_VehicleModel]
GO
/****** Object:  Table [dbo].[WeekDays]    Script Date: 11/30/2015 16:02:34 ******/
ALTER TABLE [dbo].[WeekDays] DROP CONSTRAINT [DF_WeekDays_IsSelected]
GO
DROP TABLE [dbo].[WeekDays]
GO
/****** Object:  Table [dbo].[AccountType]    Script Date: 11/30/2015 16:02:30 ******/
DROP TABLE [dbo].[AccountType]
GO
/****** Object:  Table [dbo].[AccountType_Action]    Script Date: 11/30/2015 16:02:30 ******/
DROP TABLE [dbo].[AccountType_Action]
GO
/****** Object:  Table [dbo].[AccoutingDocTypes]    Script Date: 11/30/2015 16:02:30 ******/
DROP TABLE [dbo].[AccoutingDocTypes]
GO
/****** Object:  Table [dbo].[actionitem]    Script Date: 11/30/2015 16:02:30 ******/
ALTER TABLE [dbo].[actionitem] DROP CONSTRAINT [DF_actionitem_IsActive]
GO
ALTER TABLE [dbo].[actionitem] DROP CONSTRAINT [DF_actionitem_baseitem]
GO
DROP TABLE [dbo].[actionitem]
GO
/****** Object:  Table [dbo].[ActionsTbl]    Script Date: 11/30/2015 16:02:30 ******/
ALTER TABLE [dbo].[ActionsTbl] DROP CONSTRAINT [DF_ActionsTbl_Action_IsActive]
GO
ALTER TABLE [dbo].[ActionsTbl] DROP CONSTRAINT [DF_ActionsTbl_Action_IsDeleted]
GO
ALTER TABLE [dbo].[ActionsTbl] DROP CONSTRAINT [DF_ActionsTbl_IsAddApproved]
GO
ALTER TABLE [dbo].[ActionsTbl] DROP CONSTRAINT [DF_ActionsTbl_IsDelApproved]
GO
ALTER TABLE [dbo].[ActionsTbl] DROP CONSTRAINT [DF_ActionsTbl_IsEditApproved]
GO
ALTER TABLE [dbo].[ActionsTbl] DROP CONSTRAINT [DF_ActionsTbl_Action_IsSelected]
GO
DROP TABLE [dbo].[ActionsTbl]
GO
/****** Object:  Table [dbo].[Activity]    Script Date: 11/30/2015 16:02:30 ******/
DROP TABLE [dbo].[Activity]
GO
/****** Object:  Table [dbo].[ActivityType]    Script Date: 11/30/2015 16:02:30 ******/
DROP TABLE [dbo].[ActivityType]
GO
/****** Object:  Table [dbo].[Approval]    Script Date: 11/30/2015 16:02:31 ******/
ALTER TABLE [dbo].[Approval] DROP CONSTRAINT [DF_Approval_IsApprovalReqAdd]
GO
ALTER TABLE [dbo].[Approval] DROP CONSTRAINT [DF_Approval_IsApprovalReqEdit]
GO
ALTER TABLE [dbo].[Approval] DROP CONSTRAINT [DF_Approval_IsApprovalReqDelete]
GO
DROP TABLE [dbo].[Approval]
GO
/****** Object:  Table [dbo].[Cards]    Script Date: 11/30/2015 16:02:31 ******/
ALTER TABLE [dbo].[Cards] DROP CONSTRAINT [DF_Cards_Card_Balance]
GO
ALTER TABLE [dbo].[Cards] DROP CONSTRAINT [DF_Cards_Card_IsAssigned]
GO
ALTER TABLE [dbo].[Cards] DROP CONSTRAINT [DF_Cards_Card_IsAssignedtoEmp]
GO
ALTER TABLE [dbo].[Cards] DROP CONSTRAINT [DF_Cards_Card_IsActive]
GO
ALTER TABLE [dbo].[Cards] DROP CONSTRAINT [DF_Cards_Card_IsDeleted]
GO
DROP TABLE [dbo].[Cards]
GO
/****** Object:  Table [dbo].[CardTopup]    Script Date: 11/30/2015 16:02:31 ******/
ALTER TABLE [dbo].[CardTopup] DROP CONSTRAINT [DF_CardTopup_IsDeleted]
GO
DROP TABLE [dbo].[CardTopup]
GO
/****** Object:  Table [dbo].[CardUsageLimit]    Script Date: 11/30/2015 16:02:31 ******/
ALTER TABLE [dbo].[CardUsageLimit] DROP CONSTRAINT [DF_CardUsageLimit_Card_UsageLimit_IsOverall]
GO
ALTER TABLE [dbo].[CardUsageLimit] DROP CONSTRAINT [DF_CardUsageLimit_Card_UsageLimit_IsActive]
GO
ALTER TABLE [dbo].[CardUsageLimit] DROP CONSTRAINT [DF_CardUsageLimit_Card_UsageLimit_IsDeleted]
GO
DROP TABLE [dbo].[CardUsageLimit]
GO
/****** Object:  Table [dbo].[Channels]    Script Date: 11/30/2015 16:02:31 ******/
ALTER TABLE [dbo].[Channels] DROP CONSTRAINT [DF_Channels_Channel_IsSelected]
GO
DROP TABLE [dbo].[Channels]
GO
/****** Object:  Table [dbo].[ChannelTypes]    Script Date: 11/30/2015 16:02:31 ******/
DROP TABLE [dbo].[ChannelTypes]
GO
/****** Object:  Table [dbo].[ChartofAccounts]    Script Date: 11/30/2015 16:02:31 ******/
DROP TABLE [dbo].[ChartofAccounts]
GO
/****** Object:  Table [dbo].[ChartofAccountsSubTypes]    Script Date: 11/30/2015 16:02:31 ******/
DROP TABLE [dbo].[ChartofAccountsSubTypes]
GO
/****** Object:  Table [dbo].[ChartofAccountTypes]    Script Date: 11/30/2015 16:02:31 ******/
DROP TABLE [dbo].[ChartofAccountTypes]
GO
/****** Object:  Table [dbo].[CommunicationTemplates]    Script Date: 11/30/2015 16:02:31 ******/
DROP TABLE [dbo].[CommunicationTemplates]
GO
/****** Object:  Table [dbo].[conflicting_action]    Script Date: 11/30/2015 16:02:31 ******/
DROP TABLE [dbo].[conflicting_action]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 11/30/2015 16:02:31 ******/
DROP TABLE [dbo].[Country]
GO
/****** Object:  Table [dbo].[Currency]    Script Date: 11/30/2015 16:02:31 ******/
DROP TABLE [dbo].[Currency]
GO
/****** Object:  Table [dbo].[Customer_Account]    Script Date: 11/30/2015 16:02:31 ******/
ALTER TABLE [dbo].[Customer_Account] DROP CONSTRAINT [DF_Customer_Account_Balance]
GO
ALTER TABLE [dbo].[Customer_Account] DROP CONSTRAINT [DF_Customer_Account_IsCollection]
GO
DROP TABLE [dbo].[Customer_Account]
GO
/****** Object:  Table [dbo].[Customer_AccountTopup]    Script Date: 11/30/2015 16:02:31 ******/
ALTER TABLE [dbo].[Customer_AccountTopup] DROP CONSTRAINT [DF_Customer_AccountTopup_Amount]
GO
ALTER TABLE [dbo].[Customer_AccountTopup] DROP CONSTRAINT [DF_AccountTopup_IsDeleted]
GO
DROP TABLE [dbo].[Customer_AccountTopup]
GO
/****** Object:  Table [dbo].[Customer_AccountUsageLimit]    Script Date: 11/30/2015 16:02:31 ******/
ALTER TABLE [dbo].[Customer_AccountUsageLimit] DROP CONSTRAINT [DF_Table_1_Card_UsageLimit_IsOverall]
GO
ALTER TABLE [dbo].[Customer_AccountUsageLimit] DROP CONSTRAINT [DF_Table_1_Card_UsageLimit_IsActive]
GO
ALTER TABLE [dbo].[Customer_AccountUsageLimit] DROP CONSTRAINT [DF_Table_1_Card_UsageLimit_IsDeleted]
GO
DROP TABLE [dbo].[Customer_AccountUsageLimit]
GO
/****** Object:  Table [dbo].[Customer_PriceList]    Script Date: 11/30/2015 16:02:31 ******/
DROP TABLE [dbo].[Customer_PriceList]
GO
/****** Object:  Table [dbo].[Customer_Roles]    Script Date: 11/30/2015 16:02:31 ******/
ALTER TABLE [dbo].[Customer_Roles] DROP CONSTRAINT [DF_Customer_Roles_Role_IsActive]
GO
ALTER TABLE [dbo].[Customer_Roles] DROP CONSTRAINT [DF_Customer_Roles_Role_IsDeleted]
GO
DROP TABLE [dbo].[Customer_Roles]
GO
/****** Object:  Table [dbo].[Customer_Vehicle]    Script Date: 11/30/2015 16:02:31 ******/
DROP TABLE [dbo].[Customer_Vehicle]
GO
/****** Object:  Table [dbo].[CustomerPermissions]    Script Date: 11/30/2015 16:02:31 ******/
ALTER TABLE [dbo].[CustomerPermissions] DROP CONSTRAINT [DF_CustomerPermissions_PermissionIsSelected]
GO
DROP TABLE [dbo].[CustomerPermissions]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 11/30/2015 16:02:32 ******/
DROP TABLE [dbo].[Customers]
GO
/****** Object:  Table [dbo].[CustomerTypes]    Script Date: 11/30/2015 16:02:32 ******/
ALTER TABLE [dbo].[CustomerTypes] DROP CONSTRAINT [DF_CustomerTypes_IsSelected]
GO
DROP TABLE [dbo].[CustomerTypes]
GO
/****** Object:  Table [dbo].[CustomTableFields]    Script Date: 11/30/2015 16:02:32 ******/
DROP TABLE [dbo].[CustomTableFields]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 11/30/2015 16:02:32 ******/
DROP TABLE [dbo].[Employee]
GO
/****** Object:  Table [dbo].[EventsTbl]    Script Date: 11/30/2015 16:02:32 ******/
ALTER TABLE [dbo].[EventsTbl] DROP CONSTRAINT [DF_EventsTbl_Event_IsActive]
GO
ALTER TABLE [dbo].[EventsTbl] DROP CONSTRAINT [DF_EventsTbl_Event_IsDeleted]
GO
DROP TABLE [dbo].[EventsTbl]
GO
/****** Object:  Table [dbo].[Finance_Transaction]    Script Date: 11/30/2015 16:02:32 ******/
DROP TABLE [dbo].[Finance_Transaction]
GO
/****** Object:  Table [dbo].[FormulaValueType]    Script Date: 11/30/2015 16:02:32 ******/
DROP TABLE [dbo].[FormulaValueType]
GO
/****** Object:  Table [dbo].[Gadgets]    Script Date: 11/30/2015 16:02:32 ******/
DROP TABLE [dbo].[Gadgets]
GO
/****** Object:  Table [dbo].[GeneralSettings]    Script Date: 11/30/2015 16:02:32 ******/
DROP TABLE [dbo].[GeneralSettings]
GO
/****** Object:  Table [dbo].[GLTransactions]    Script Date: 11/30/2015 16:02:32 ******/
DROP TABLE [dbo].[GLTransactions]
GO
/****** Object:  Table [dbo].[Lnk_Customers_CustomerTypes]    Script Date: 11/30/2015 16:02:32 ******/
DROP TABLE [dbo].[Lnk_Customers_CustomerTypes]
GO
/****** Object:  Table [dbo].[Lnk_CustomerVehicle_Account]    Script Date: 11/30/2015 16:02:32 ******/
DROP TABLE [dbo].[Lnk_CustomerVehicle_Account]
GO
/****** Object:  Table [dbo].[Lnk_Gadgets_Channels]    Script Date: 11/30/2015 16:02:32 ******/
DROP TABLE [dbo].[Lnk_Gadgets_Channels]
GO
/****** Object:  Table [dbo].[Lnk_PriceList_Product]    Script Date: 11/30/2015 16:02:32 ******/
DROP TABLE [dbo].[Lnk_PriceList_Product]
GO
/****** Object:  Table [dbo].[Lnk_Products_Channels]    Script Date: 11/30/2015 16:02:32 ******/
ALTER TABLE [dbo].[Lnk_Products_Channels] DROP CONSTRAINT [DF_Lnk_Products_Channels_Product_IsActive]
GO
ALTER TABLE [dbo].[Lnk_Products_Channels] DROP CONSTRAINT [DF_Lnk_Products_Channels_Product_IsDeleted]
GO
DROP TABLE [dbo].[Lnk_Products_Channels]
GO
/****** Object:  Table [dbo].[Lnk_Products_Channels_Properties]    Script Date: 11/30/2015 16:02:32 ******/
DROP TABLE [dbo].[Lnk_Products_Channels_Properties]
GO
/****** Object:  Table [dbo].[Lnk_Products_Properties]    Script Date: 11/30/2015 16:02:32 ******/
ALTER TABLE [dbo].[Lnk_Products_Properties] DROP CONSTRAINT [DF_Lnk_Products_Properties_IsActive]
GO
ALTER TABLE [dbo].[Lnk_Products_Properties] DROP CONSTRAINT [DF_Lnk_Products_Properties_IsDeleted]
GO
DROP TABLE [dbo].[Lnk_Products_Properties]
GO
/****** Object:  Table [dbo].[Lnk_Role_Permission]    Script Date: 11/30/2015 16:02:32 ******/
DROP TABLE [dbo].[Lnk_Role_Permission]
GO
/****** Object:  Table [dbo].[LnkCustomer_Role_Permission]    Script Date: 11/30/2015 16:02:32 ******/
DROP TABLE [dbo].[LnkCustomer_Role_Permission]
GO
/****** Object:  Table [dbo].[Loyalty_Program]    Script Date: 11/30/2015 16:02:33 ******/
DROP TABLE [dbo].[Loyalty_Program]
GO
/****** Object:  Table [dbo].[Loyalty_Scheme]    Script Date: 11/30/2015 16:02:33 ******/
DROP TABLE [dbo].[Loyalty_Scheme]
GO
/****** Object:  Table [dbo].[MaskType]    Script Date: 11/30/2015 16:02:33 ******/
DROP TABLE [dbo].[MaskType]
GO
/****** Object:  Table [dbo].[Message]    Script Date: 11/30/2015 16:02:33 ******/
DROP TABLE [dbo].[Message]
GO
/****** Object:  Table [dbo].[MessageTypes]    Script Date: 11/30/2015 16:02:33 ******/
DROP TABLE [dbo].[MessageTypes]
GO
/****** Object:  Table [dbo].[Payment_Terms]    Script Date: 11/30/2015 16:02:33 ******/
DROP TABLE [dbo].[Payment_Terms]
GO
/****** Object:  Table [dbo].[PaymentMode]    Script Date: 11/30/2015 16:02:33 ******/
DROP TABLE [dbo].[PaymentMode]
GO
/****** Object:  Table [dbo].[Periods]    Script Date: 11/30/2015 16:02:33 ******/
DROP TABLE [dbo].[Periods]
GO
/****** Object:  Table [dbo].[Permissions]    Script Date: 11/30/2015 16:02:33 ******/
ALTER TABLE [dbo].[Permissions] DROP CONSTRAINT [DF_Permissions_PermissionIsSelected]
GO
DROP TABLE [dbo].[Permissions]
GO
/****** Object:  Table [dbo].[PostpaidAccountCreditLimit]    Script Date: 11/30/2015 16:02:33 ******/
DROP TABLE [dbo].[PostpaidAccountCreditLimit]
GO
/****** Object:  Table [dbo].[PostpaidCustCreditLimits]    Script Date: 11/30/2015 16:02:33 ******/
DROP TABLE [dbo].[PostpaidCustCreditLimits]
GO
/****** Object:  Table [dbo].[PriceList]    Script Date: 11/30/2015 16:02:33 ******/
ALTER TABLE [dbo].[PriceList] DROP CONSTRAINT [DF_PriceList_PriceList_IsDefault]
GO
DROP TABLE [dbo].[PriceList]
GO
/****** Object:  Table [dbo].[ProductProperties]    Script Date: 11/30/2015 16:02:33 ******/
ALTER TABLE [dbo].[ProductProperties] DROP CONSTRAINT [DF_ProductProperties_ProductProperty_IsActive]
GO
ALTER TABLE [dbo].[ProductProperties] DROP CONSTRAINT [DF_ProductProperties_ProductProperty_IsDeleted]
GO
ALTER TABLE [dbo].[ProductProperties] DROP CONSTRAINT [DF_ProductProperties_IsSelected]
GO
DROP TABLE [dbo].[ProductProperties]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 11/30/2015 16:02:33 ******/
DROP TABLE [dbo].[Products]
GO
/****** Object:  Table [dbo].[ProductTypes]    Script Date: 11/30/2015 16:02:33 ******/
ALTER TABLE [dbo].[ProductTypes] DROP CONSTRAINT [DF_ProductTypes_ProductType_IsDeletedFlag]
GO
ALTER TABLE [dbo].[ProductTypes] DROP CONSTRAINT [DF_ProductTypes_ProductType_IsbeingEdited]
GO
DROP TABLE [dbo].[ProductTypes]
GO
/****** Object:  Table [dbo].[refvaluehistory]    Script Date: 11/30/2015 16:02:33 ******/
DROP TABLE [dbo].[refvaluehistory]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 11/30/2015 16:02:33 ******/
ALTER TABLE [dbo].[Roles] DROP CONSTRAINT [DF_Roles_Role_IsActive]
GO
ALTER TABLE [dbo].[Roles] DROP CONSTRAINT [DF_Roles_Role_IsDeleted]
GO
DROP TABLE [dbo].[Roles]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 11/30/2015 16:02:33 ******/
DROP TABLE [dbo].[Schedule]
GO
/****** Object:  Table [dbo].[Schedule_History]    Script Date: 11/30/2015 16:02:33 ******/
DROP TABLE [dbo].[Schedule_History]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 11/30/2015 16:02:33 ******/
DROP TABLE [dbo].[Staff]
GO
/****** Object:  Table [dbo].[supplementary_action]    Script Date: 11/30/2015 16:02:34 ******/
DROP TABLE [dbo].[supplementary_action]
GO
/****** Object:  Table [dbo].[Tierlevel]    Script Date: 11/30/2015 16:02:34 ******/
ALTER TABLE [dbo].[Tierlevel] DROP CONSTRAINT [DF_Tierlevel_tierlevel_IsActive]
GO
ALTER TABLE [dbo].[Tierlevel] DROP CONSTRAINT [DF_Tierlevel_tierlevel_IsDelete]
GO
DROP TABLE [dbo].[Tierlevel]
GO
/****** Object:  Table [dbo].[Tierrule]    Script Date: 11/30/2015 16:02:34 ******/
ALTER TABLE [dbo].[Tierrule] DROP CONSTRAINT [DF_Tierrule_tierrule_IsActive]
GO
ALTER TABLE [dbo].[Tierrule] DROP CONSTRAINT [DF_Tierrule_tierrule_IsDeleted]
GO
DROP TABLE [dbo].[Tierrule]
GO
/****** Object:  Table [dbo].[Tiertable]    Script Date: 11/30/2015 16:02:34 ******/
DROP TABLE [dbo].[Tiertable]
GO
/****** Object:  Table [dbo].[TimeDuration]    Script Date: 11/30/2015 16:02:34 ******/
DROP TABLE [dbo].[TimeDuration]
GO
/****** Object:  Table [dbo].[Vehicle]    Script Date: 11/30/2015 16:02:34 ******/
DROP TABLE [dbo].[Vehicle]
GO
/****** Object:  Table [dbo].[VehicleModel]    Script Date: 11/30/2015 16:02:34 ******/
DROP TABLE [dbo].[VehicleModel]
GO
/****** Object:  Table [dbo].[VehicleModel]    Script Date: 11/30/2015 16:02:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VehicleModel](
	[VehicleModel_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[VehicleModel_Name] [nvarchar](50) NULL,
	[VehicleModelIsActive] [bit] NULL,
	[VehicleModelIsDeleted] [bit] NULL,
	[VehicleModelDateCreated] [datetime] NULL,
	[VehicleId] [bigint] NULL,
	[TankCapacity] [decimal](18, 2) NULL,
 CONSTRAINT [PK_VehicleModel] PRIMARY KEY CLUSTERED 
(
	[VehicleModel_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[VehicleModel] ON
INSERT [dbo].[VehicleModel] ([VehicleModel_Id], [VehicleModel_Name], [VehicleModelIsActive], [VehicleModelIsDeleted], [VehicleModelDateCreated], [VehicleId], [TankCapacity]) VALUES (1, N'Dodge Charger SRT8', 1, 0, CAST(0x0000A4E000D71A51 AS DateTime), 5, CAST(5.00 AS Decimal(18, 2)))
INSERT [dbo].[VehicleModel] ([VehicleModel_Id], [VehicleModel_Name], [VehicleModelIsActive], [VehicleModelIsDeleted], [VehicleModelDateCreated], [VehicleId], [TankCapacity]) VALUES (2, N'Charger R/T', 1, 0, CAST(0x0000A4E000D6F1D3 AS DateTime), 5, CAST(5.00 AS Decimal(18, 2)))
INSERT [dbo].[VehicleModel] ([VehicleModel_Id], [VehicleModel_Name], [VehicleModelIsActive], [VehicleModelIsDeleted], [VehicleModelDateCreated], [VehicleId], [TankCapacity]) VALUES (3, N'MDX', 1, 0, CAST(0x0000A4E000D5D08C AS DateTime), 8, CAST(2.40 AS Decimal(18, 2)))
INSERT [dbo].[VehicleModel] ([VehicleModel_Id], [VehicleModel_Name], [VehicleModelIsActive], [VehicleModelIsDeleted], [VehicleModelDateCreated], [VehicleId], [TankCapacity]) VALUES (4, N'Rallye Plus', 1, 0, CAST(0x0000A4E000D6CBEB AS DateTime), 5, CAST(5.00 AS Decimal(18, 2)))
INSERT [dbo].[VehicleModel] ([VehicleModel_Id], [VehicleModel_Name], [VehicleModelIsActive], [VehicleModelIsDeleted], [VehicleModelDateCreated], [VehicleId], [TankCapacity]) VALUES (5, N'RDX', 1, 0, CAST(0x0000A4E000D5B82E AS DateTime), 8, CAST(2.40 AS Decimal(18, 2)))
INSERT [dbo].[VehicleModel] ([VehicleModel_Id], [VehicleModel_Name], [VehicleModelIsActive], [VehicleModelIsDeleted], [VehicleModelDateCreated], [VehicleId], [TankCapacity]) VALUES (6, N'RLX', 1, 0, CAST(0x0000A4E000D59D05 AS DateTime), 8, CAST(2.40 AS Decimal(18, 2)))
INSERT [dbo].[VehicleModel] ([VehicleModel_Id], [VehicleModel_Name], [VehicleModelIsActive], [VehicleModelIsDeleted], [VehicleModelDateCreated], [VehicleId], [TankCapacity]) VALUES (7, N'Dodge Charger SE / SXT', 1, 0, CAST(0x0000A4E000D69AFB AS DateTime), 5, CAST(5.00 AS Decimal(18, 2)))
INSERT [dbo].[VehicleModel] ([VehicleModel_Id], [VehicleModel_Name], [VehicleModelIsActive], [VehicleModelIsDeleted], [VehicleModelDateCreated], [VehicleId], [TankCapacity]) VALUES (8, N'TLX', 1, 0, CAST(0x0000A4E000D5677E AS DateTime), 8, CAST(2.40 AS Decimal(18, 2)))
INSERT [dbo].[VehicleModel] ([VehicleModel_Id], [VehicleModel_Name], [VehicleModelIsActive], [VehicleModelIsDeleted], [VehicleModelDateCreated], [VehicleId], [TankCapacity]) VALUES (9, N'ILX', 1, 0, CAST(0x0000A4E000D53A0F AS DateTime), 8, CAST(2.40 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[VehicleModel] OFF
/****** Object:  Table [dbo].[Vehicle]    Script Date: 11/30/2015 16:02:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehicle](
	[Vehicle_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Vehicle_Make] [nvarchar](50) NULL,
	[VehicleIsActive] [bit] NULL,
	[VehicleIsDeleted] [bit] NULL,
	[VehicleDateCreated] [datetime] NULL,
 CONSTRAINT [PK_Vehicle] PRIMARY KEY CLUSTERED 
(
	[Vehicle_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Vehicle] ON
INSERT [dbo].[Vehicle] ([Vehicle_Id], [Vehicle_Make], [VehicleIsActive], [VehicleIsDeleted], [VehicleDateCreated]) VALUES (1, N'Toyota', 1, 0, CAST(0x0000A4DD01383902 AS DateTime))
INSERT [dbo].[Vehicle] ([Vehicle_Id], [Vehicle_Make], [VehicleIsActive], [VehicleIsDeleted], [VehicleDateCreated]) VALUES (2, N'Tata', 1, 0, CAST(0x0000A4DD01383435 AS DateTime))
INSERT [dbo].[Vehicle] ([Vehicle_Id], [Vehicle_Make], [VehicleIsActive], [VehicleIsDeleted], [VehicleDateCreated]) VALUES (3, N'Mahindra', 1, 0, CAST(0x0000A4DD01382FE7 AS DateTime))
INSERT [dbo].[Vehicle] ([Vehicle_Id], [Vehicle_Make], [VehicleIsActive], [VehicleIsDeleted], [VehicleDateCreated]) VALUES (4, N'Healey', 1, 0, CAST(0x0000A4DD014177DE AS DateTime))
INSERT [dbo].[Vehicle] ([Vehicle_Id], [Vehicle_Make], [VehicleIsActive], [VehicleIsDeleted], [VehicleDateCreated]) VALUES (5, N'American Motors', 1, 0, CAST(0x0000A4DD01412AAC AS DateTime))
INSERT [dbo].[Vehicle] ([Vehicle_Id], [Vehicle_Make], [VehicleIsActive], [VehicleIsDeleted], [VehicleDateCreated]) VALUES (6, N'Aston Martin', 1, 0, CAST(0x0000A4DD01413E27 AS DateTime))
INSERT [dbo].[Vehicle] ([Vehicle_Id], [Vehicle_Make], [VehicleIsActive], [VehicleIsDeleted], [VehicleDateCreated]) VALUES (7, N'Audi', 1, 0, CAST(0x0000A4DD01415846 AS DateTime))
INSERT [dbo].[Vehicle] ([Vehicle_Id], [Vehicle_Make], [VehicleIsActive], [VehicleIsDeleted], [VehicleDateCreated]) VALUES (8, N'  Acura', 1, 0, CAST(0x0000A4DD0140C42C AS DateTime))
INSERT [dbo].[Vehicle] ([Vehicle_Id], [Vehicle_Make], [VehicleIsActive], [VehicleIsDeleted], [VehicleDateCreated]) VALUES (9, N'Alfa Romeo', 1, 0, CAST(0x0000A4DD0140F813 AS DateTime))
INSERT [dbo].[Vehicle] ([Vehicle_Id], [Vehicle_Make], [VehicleIsActive], [VehicleIsDeleted], [VehicleDateCreated]) VALUES (10, N'AM General', 1, 0, CAST(0x0000A4DD014113A0 AS DateTime))
SET IDENTITY_INSERT [dbo].[Vehicle] OFF
/****** Object:  Table [dbo].[TimeDuration]    Script Date: 11/30/2015 16:02:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeDuration](
	[TimeDuration_id] [bigint] IDENTITY(1,1) NOT NULL,
	[Value] [nvarchar](20) NULL,
	[Type] [nvarchar](20) NULL,
 CONSTRAINT [PK_TimeDuration] PRIMARY KEY CLUSTERED 
(
	[TimeDuration_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Infinity/1/2/3/4/5/6/7/8/9….Week/Month/Year/Quarter…Sun/Mon/Tue/Wed/Thu/Fri/Sat…Jan/Feb/Mar/Apr/May/Jun/Jul/Aug/Sep/Oct/Nov/Dec' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TimeDuration', @level2type=N'COLUMN',@level2name=N'Value'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Number/Long_Period/Month_Names/Week_Names' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'TimeDuration', @level2type=N'COLUMN',@level2name=N'Type'
GO
SET IDENTITY_INSERT [dbo].[TimeDuration] ON
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (1, N'Infinity', N'Number')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (2, N'1', N'Number')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (3, N'2', N'Number')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (4, N'3', N'Number')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (5, N'4', N'Number')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (6, N'5', N'Number')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (7, N'6', N'Number')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (8, N'7', N'Number')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (9, N'8', N'Number')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (10, N'9', N'Number')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (11, N'10', N'Number')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (12, N'11', N'Number')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (13, N'12', N'Number')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (14, N'13', N'Number')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (15, N'14', N'Number')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (16, N'15', N'Number')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (17, N'16', N'Number')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (18, N'17', N'Number')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (19, N'18', N'Number')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (20, N'19', N'Number')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (21, N'20', N'Number')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (22, N'21', N'Number')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (23, N'22', N'Number')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (24, N'23', N'Number')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (25, N'24', N'Number')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (26, N'25', N'Number')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (27, N'26', N'Number')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (28, N'27', N'Number')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (29, N'28', N'Number')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (30, N'29', N'Number')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (31, N'30', N'Number')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (32, N'31', N'Number')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (33, N'32', N'Number')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (34, N'33', N'Number')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (35, N'34', N'Number')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (36, N'35', N'Number')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (37, N'36', N'Number')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (38, N'37', N'Number')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (39, N'38', N'Number')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (40, N'39', N'Number')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (41, N'40', N'Number')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (42, N'41', N'Number')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (43, N'42', N'Number')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (44, N'43', N'Number')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (45, N'44', N'Number')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (46, N'45', N'Number')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (47, N'46', N'Number')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (48, N'47', N'Number')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (49, N'48', N'Number')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (50, N'49', N'Number')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (51, N'50', N'Number')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (52, N'Weekly', N'LongDuration')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (53, N'Monthly', N'LongDuration')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (54, N'Daily', N'LongDuration')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (56, N'Sunday', N'Weekday')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (57, N'Monday', N'Weekday')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (58, N'Tuesday', N'Weekday')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (59, N'Wednesday', N'Weekday')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (60, N'Thursday', N'Weekday')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (61, N'Friday', N'Weekday')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (62, N'Saturday', N'Weekday')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (63, N'January', N'MonthName')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (64, N'Febuary', N'MonthName')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (65, N'March', N'MonthName')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (66, N'April', N'MonthName')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (67, N'May', N'MonthName')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (68, N'June', N'MonthName')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (69, N'July', N'MonthName')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (70, N'August', N'MonthName')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (71, N'September', N'MonthName')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (72, N'October', N'MonthName')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (73, N'November', N'MonthName')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (74, N'December', N'MonthName')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (76, N'Days', N'Duration')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (77, N'Weeks', N'Duration')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (78, N'Months', N'Duration')
INSERT [dbo].[TimeDuration] ([TimeDuration_id], [Value], [Type]) VALUES (79, N'Years', N'Duration')
SET IDENTITY_INSERT [dbo].[TimeDuration] OFF
/****** Object:  Table [dbo].[Tiertable]    Script Date: 11/30/2015 16:02:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tiertable](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[tierlevel_id] [bigint] NULL,
	[tierrule_id] [bigint] NULL,
	[loyaltyprogram_id] [bigint] NULL,
	[date_created] [datetime] NULL,
 CONSTRAINT [PK_Tiertable] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Tiertable] ON
INSERT [dbo].[Tiertable] ([id], [tierlevel_id], [tierrule_id], [loyaltyprogram_id], [date_created]) VALUES (1, 1, 1, 8, CAST(0x0000A4EC010BD7D0 AS DateTime))
INSERT [dbo].[Tiertable] ([id], [tierlevel_id], [tierrule_id], [loyaltyprogram_id], [date_created]) VALUES (2, 1, 1, 9, CAST(0x0000A4EC010D10F6 AS DateTime))
INSERT [dbo].[Tiertable] ([id], [tierlevel_id], [tierrule_id], [loyaltyprogram_id], [date_created]) VALUES (3, 1, 1, 10, CAST(0x0000A54800F8FA3B AS DateTime))
SET IDENTITY_INSERT [dbo].[Tiertable] OFF
/****** Object:  Table [dbo].[Tierrule]    Script Date: 11/30/2015 16:02:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tierrule](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[tierrule_name] [nvarchar](250) NULL,
	[formula] [nvarchar](max) NULL,
	[tierrule_IsActive] [bit] NULL CONSTRAINT [DF_Tierrule_tierrule_IsActive]  DEFAULT ((1)),
	[tierrule_IsDeleted] [bit] NULL CONSTRAINT [DF_Tierrule_tierrule_IsDeleted]  DEFAULT ((0)),
	[date_created] [datetime] NULL,
	[IsAddApproved] [bit] NULL,
	[IsDelApproved] [bit] NULL,
	[IsEditApproved] [bit] NULL,
	[ValueId] [bigint] NULL,
 CONSTRAINT [PK_Tierrule] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Tierrule] ON
INSERT [dbo].[Tierrule] ([id], [tierrule_name], [formula], [tierrule_IsActive], [tierrule_IsDeleted], [date_created], [IsAddApproved], [IsDelApproved], [IsEditApproved], [ValueId]) VALUES (1, N'Formula1', N'r=0.5*v', 1, 0, CAST(0x0000A53D00D8AE5C AS DateTime), NULL, NULL, NULL, 1)
INSERT [dbo].[Tierrule] ([id], [tierrule_name], [formula], [tierrule_IsActive], [tierrule_IsDeleted], [date_created], [IsAddApproved], [IsDelApproved], [IsEditApproved], [ValueId]) VALUES (2, N'Formula2', N'r=0.01*v', 1, 0, CAST(0x0000A53D00D8C122 AS DateTime), NULL, NULL, NULL, 2)
INSERT [dbo].[Tierrule] ([id], [tierrule_name], [formula], [tierrule_IsActive], [tierrule_IsDeleted], [date_created], [IsAddApproved], [IsDelApproved], [IsEditApproved], [ValueId]) VALUES (3, N'Formula3', N'r=0.06*v', 1, 0, CAST(0x0000A53D00D8CA9A AS DateTime), NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Tierrule] OFF
/****** Object:  Table [dbo].[Tierlevel]    Script Date: 11/30/2015 16:02:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tierlevel](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[tierlevel_name] [nvarchar](250) NULL,
	[tierlevel_description] [nvarchar](max) NULL,
	[customertype_id] [bigint] NULL,
	[producttype_id] [bigint] NULL,
	[activity_id] [bigint] NULL,
	[event_id] [bigint] NULL,
	[channel_id] [bigint] NULL,
	[activitytype_id] [bigint] NULL,
	[channeltype_id] [bigint] NULL,
	[cardtype_id] [bigint] NULL,
	[country_id] [bigint] NULL,
	[date_created] [datetime] NULL,
	[product_id] [bigint] NULL,
	[tierlevel_IsActive] [bit] NULL CONSTRAINT [DF_Tierlevel_tierlevel_IsActive]  DEFAULT ((1)),
	[tierlevel_IsDelete] [bit] NULL CONSTRAINT [DF_Tierlevel_tierlevel_IsDelete]  DEFAULT ((0)),
	[all_items] [bit] NULL,
	[all_channels] [bit] NULL,
	[all_activities] [bit] NULL,
 CONSTRAINT [PK_tierlevel] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Tierlevel] ON
INSERT [dbo].[Tierlevel] ([id], [tierlevel_name], [tierlevel_description], [customertype_id], [producttype_id], [activity_id], [event_id], [channel_id], [activitytype_id], [channeltype_id], [cardtype_id], [country_id], [date_created], [product_id], [tierlevel_IsActive], [tierlevel_IsDelete], [all_items], [all_channels], [all_activities]) VALUES (1, N'Class one', N'Class one', 1, 1, 14, 1, 6, 6, 1, 0, 166, CAST(0x0000A4B600CA16F3 AS DateTime), 1, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[Tierlevel] ([id], [tierlevel_name], [tierlevel_description], [customertype_id], [producttype_id], [activity_id], [event_id], [channel_id], [activitytype_id], [channeltype_id], [cardtype_id], [country_id], [date_created], [product_id], [tierlevel_IsActive], [tierlevel_IsDelete], [all_items], [all_channels], [all_activities]) VALUES (2, N'Easy Taxi Drivers', N'Classification program for easy Taxi drivers', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 166, CAST(0x0000A54701377636 AS DateTime), NULL, 1, 0, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Tierlevel] OFF
/****** Object:  Table [dbo].[supplementary_action]    Script Date: 11/30/2015 16:02:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[supplementary_action](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[action_id] [bigint] NULL,
	[supplementary_action_id] [bigint] NULL,
 CONSTRAINT [PK_supplementary_action] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 11/30/2015 16:02:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Staff](
	[Staff_id] [bigint] IDENTITY(1,1) NOT NULL,
	[Staff_Name] [nvarchar](50) NULL,
	[Staff_Email] [nvarchar](50) NULL,
	[Staff_Password] [nvarchar](50) NULL,
	[Staff_PIN] [nvarchar](50) NULL,
	[Staff_Phone] [nvarchar](30) NULL,
	[Staff_TopupLimitType] [bigint] NULL,
	[Staff_TopupLimitValue] [decimal](18, 2) NULL,
	[Staff_Channel_id] [bigint] NULL,
	[Staff_Role] [bigint] NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[PasswordResetExpDate] [datetime] NULL,
	[IsAddApproved] [bit] NULL,
	[IsEditApproved] [bit] NULL,
	[IsDelApproved] [bit] NULL,
	[CF1] [varchar](50) NULL,
	[CF2] [varchar](50) NULL,
	[CF3] [varchar](50) NULL,
	[CF4] [varchar](50) NULL,
	[CF5] [varchar](50) NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[Staff_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Terminal Password 4 digit' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Staff', @level2type=N'COLUMN',@level2name=N'Staff_PIN'
GO
SET IDENTITY_INSERT [dbo].[Staff] ON
INSERT [dbo].[Staff] ([Staff_id], [Staff_Name], [Staff_Email], [Staff_Password], [Staff_PIN], [Staff_Phone], [Staff_TopupLimitType], [Staff_TopupLimitValue], [Staff_Channel_id], [Staff_Role], [IsActive], [IsDeleted], [DateCreated], [PasswordResetExpDate], [IsAddApproved], [IsEditApproved], [IsDelApproved], [CF1], [CF2], [CF3], [CF4], [CF5]) VALUES (1, N'Admin', N'admin@fcs.com', N'6F7nyIgPwCUxYMUZVJZYbg==', NULL, NULL, 1, NULL, NULL, 1, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Staff] ([Staff_id], [Staff_Name], [Staff_Email], [Staff_Password], [Staff_PIN], [Staff_Phone], [Staff_TopupLimitType], [Staff_TopupLimitValue], [Staff_Channel_id], [Staff_Role], [IsActive], [IsDeleted], [DateCreated], [PasswordResetExpDate], [IsAddApproved], [IsEditApproved], [IsDelApproved], [CF1], [CF2], [CF3], [CF4], [CF5]) VALUES (2, N'Surendra', N'surendra@fcs.com', N'6F7nyIgPwCUxYMUZVJZYbg==', NULL, N'+91(9348)394-348', 1, CAST(2000.00 AS Decimal(18, 2)), 1, 11, 1, 0, CAST(0x0000A4BB00BE7F77 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Staff] ([Staff_id], [Staff_Name], [Staff_Email], [Staff_Password], [Staff_PIN], [Staff_Phone], [Staff_TopupLimitType], [Staff_TopupLimitValue], [Staff_Channel_id], [Staff_Role], [IsActive], [IsDeleted], [DateCreated], [PasswordResetExpDate], [IsAddApproved], [IsEditApproved], [IsDelApproved], [CF1], [CF2], [CF3], [CF4], [CF5]) VALUES (3, N'Suresh', N'surensh@yahoo.com', N'BEulIxjmoRSfHjQa/i0Mig==', NULL, N'+298-239-239', 1, CAST(25000.00 AS Decimal(18, 2)), 1, 9, 1, 0, CAST(0x0000A4CF012FD069 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Staff] ([Staff_id], [Staff_Name], [Staff_Email], [Staff_Password], [Staff_PIN], [Staff_Phone], [Staff_TopupLimitType], [Staff_TopupLimitValue], [Staff_Channel_id], [Staff_Role], [IsActive], [IsDeleted], [DateCreated], [PasswordResetExpDate], [IsAddApproved], [IsEditApproved], [IsDelApproved], [CF1], [CF2], [CF3], [CF4], [CF5]) VALUES (4, N'Surendra Yadav', N'surendra1@mtoag.com', N'6F7nyIgPwCUxYMUZVJZYbg==', NULL, N'+382-93-293-234', 1, CAST(25000.00 AS Decimal(18, 2)), 2, 10, 1, 0, CAST(0x0000A4BB00BEB580 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Staff] ([Staff_id], [Staff_Name], [Staff_Email], [Staff_Password], [Staff_PIN], [Staff_Phone], [Staff_TopupLimitType], [Staff_TopupLimitValue], [Staff_Channel_id], [Staff_Role], [IsActive], [IsDeleted], [DateCreated], [PasswordResetExpDate], [IsAddApproved], [IsEditApproved], [IsDelApproved], [CF1], [CF2], [CF3], [CF4], [CF5]) VALUES (5, N'Ravindra', N'surendra2@mtoag.com', N'6F7nyIgPwCUxYMUZVJZYbg==', NULL, N'+91(9238)293-823', 1, CAST(2500.00 AS Decimal(18, 2)), 1, 2, 1, 0, CAST(0x0000A4CF01251BB3 AS DateTime), CAST(0x0000A4D4012522C0 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Staff] ([Staff_id], [Staff_Name], [Staff_Email], [Staff_Password], [Staff_PIN], [Staff_Phone], [Staff_TopupLimitType], [Staff_TopupLimitValue], [Staff_Channel_id], [Staff_Role], [IsActive], [IsDeleted], [DateCreated], [PasswordResetExpDate], [IsAddApproved], [IsEditApproved], [IsDelApproved], [CF1], [CF2], [CF3], [CF4], [CF5]) VALUES (6, N'Mahendra', N'surendra3@mtoag.com', N'6F7nyIgPwCUxYMUZVJZYbg==', N'iskr8vdZqxow5RzkCGr5KA==', N'+91(9928)392-382', 52, CAST(2500.00 AS Decimal(18, 2)), 5, 2, 1, 0, CAST(0x0000A53E00CA10D6 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Staff] ([Staff_id], [Staff_Name], [Staff_Email], [Staff_Password], [Staff_PIN], [Staff_Phone], [Staff_TopupLimitType], [Staff_TopupLimitValue], [Staff_Channel_id], [Staff_Role], [IsActive], [IsDeleted], [DateCreated], [PasswordResetExpDate], [IsAddApproved], [IsEditApproved], [IsDelApproved], [CF1], [CF2], [CF3], [CF4], [CF5]) VALUES (7, N'SurendraS', N'surendra@mtoag1.com', N'6F7nyIgPwCUxYMUZVJZYbg==', N'2T7fljdYsHP7IgEVoPWjnw==', N'+91(2372)837-283', 53, CAST(3000.00 AS Decimal(18, 2)), 1, 2, 1, 0, CAST(0x0000A5470143BD9A AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Staff] ([Staff_id], [Staff_Name], [Staff_Email], [Staff_Password], [Staff_PIN], [Staff_Phone], [Staff_TopupLimitType], [Staff_TopupLimitValue], [Staff_Channel_id], [Staff_Role], [IsActive], [IsDeleted], [DateCreated], [PasswordResetExpDate], [IsAddApproved], [IsEditApproved], [IsDelApproved], [CF1], [CF2], [CF3], [CF4], [CF5]) VALUES (8, N'Test', N'test@test.com', N'nXtccUywNCr0hCyj2fvfLg==', N'HmBwqqVbNaYW8mQANXWrmQ==', N'+998-39-389-3839', 52, CAST(25000.00 AS Decimal(18, 2)), 1, 1, 1, 0, CAST(0x0000A55D013EC458 AS DateTime), CAST(0x0000A562013EC9E0 AS DateTime), NULL, NULL, NULL, N'c1', N'c2', N'c3', N'c4', N'c5')
SET IDENTITY_INSERT [dbo].[Staff] OFF
/****** Object:  Table [dbo].[Schedule_History]    Script Date: 11/30/2015 16:02:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Schedule_History](
	[History_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Original_Price] [decimal](18, 2) NULL,
	[Scheduled_Price] [decimal](18, 2) NULL,
	[Scheduled_Date] [datetime] NULL,
	[Product_Name] [varchar](50) NULL,
	[Channel_Name] [varchar](50) NULL,
 CONSTRAINT [PK_Schedule_History] PRIMARY KEY CLUSTERED 
(
	[History_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Schedule_History] ON
INSERT [dbo].[Schedule_History] ([History_Id], [Original_Price], [Scheduled_Price], [Scheduled_Date], [Product_Name], [Channel_Name]) VALUES (45, CAST(3433.00 AS Decimal(18, 2)), CAST(888.00 AS Decimal(18, 2)), CAST(0x0000A54600C892E1 AS DateTime), N'Product3', N'Channel one')
INSERT [dbo].[Schedule_History] ([History_Id], [Original_Price], [Scheduled_Price], [Scheduled_Date], [Product_Name], [Channel_Name]) VALUES (46, CAST(3433.00 AS Decimal(18, 2)), CAST(888.00 AS Decimal(18, 2)), CAST(0x0000A54600C892ED AS DateTime), N'Product3', N'Channel Two')
INSERT [dbo].[Schedule_History] ([History_Id], [Original_Price], [Scheduled_Price], [Scheduled_Date], [Product_Name], [Channel_Name]) VALUES (47, CAST(3433.00 AS Decimal(18, 2)), CAST(888.00 AS Decimal(18, 2)), CAST(0x0000A54600C892EF AS DateTime), N'Product3', N'Channel Three')
INSERT [dbo].[Schedule_History] ([History_Id], [Original_Price], [Scheduled_Price], [Scheduled_Date], [Product_Name], [Channel_Name]) VALUES (48, CAST(3433.00 AS Decimal(18, 2)), CAST(888.00 AS Decimal(18, 2)), CAST(0x0000A54600C892F2 AS DateTime), N'Product3', N'Channel Five')
INSERT [dbo].[Schedule_History] ([History_Id], [Original_Price], [Scheduled_Price], [Scheduled_Date], [Product_Name], [Channel_Name]) VALUES (49, CAST(3433.00 AS Decimal(18, 2)), CAST(888.00 AS Decimal(18, 2)), CAST(0x0000A54600C892F5 AS DateTime), N'Product3', N'Channel Four')
INSERT [dbo].[Schedule_History] ([History_Id], [Original_Price], [Scheduled_Price], [Scheduled_Date], [Product_Name], [Channel_Name]) VALUES (50, CAST(3433.00 AS Decimal(18, 2)), CAST(888.00 AS Decimal(18, 2)), CAST(0x0000A54600C892F7 AS DateTime), N'Product3', N'Channel 1')
INSERT [dbo].[Schedule_History] ([History_Id], [Original_Price], [Scheduled_Price], [Scheduled_Date], [Product_Name], [Channel_Name]) VALUES (51, CAST(980.00 AS Decimal(18, 2)), CAST(1234.00 AS Decimal(18, 2)), CAST(0x0000A54600D1BF97 AS DateTime), N'Product x', N'Channel one')
INSERT [dbo].[Schedule_History] ([History_Id], [Original_Price], [Scheduled_Price], [Scheduled_Date], [Product_Name], [Channel_Name]) VALUES (52, CAST(980.00 AS Decimal(18, 2)), CAST(1234.00 AS Decimal(18, 2)), CAST(0x0000A54600D20264 AS DateTime), N'Product x', N'Channel Two')
INSERT [dbo].[Schedule_History] ([History_Id], [Original_Price], [Scheduled_Price], [Scheduled_Date], [Product_Name], [Channel_Name]) VALUES (53, CAST(4637.00 AS Decimal(18, 2)), CAST(111.00 AS Decimal(18, 2)), CAST(0x0000A54601325A32 AS DateTime), N'product11', N'Channel one')
INSERT [dbo].[Schedule_History] ([History_Id], [Original_Price], [Scheduled_Price], [Scheduled_Date], [Product_Name], [Channel_Name]) VALUES (54, CAST(4637.00 AS Decimal(18, 2)), CAST(111.00 AS Decimal(18, 2)), CAST(0x0000A54601325A3D AS DateTime), N'product11', N'Channel Two')
INSERT [dbo].[Schedule_History] ([History_Id], [Original_Price], [Scheduled_Price], [Scheduled_Date], [Product_Name], [Channel_Name]) VALUES (55, CAST(4637.00 AS Decimal(18, 2)), CAST(111.00 AS Decimal(18, 2)), CAST(0x0000A54601325A3F AS DateTime), N'product11', N'Channel Three')
INSERT [dbo].[Schedule_History] ([History_Id], [Original_Price], [Scheduled_Price], [Scheduled_Date], [Product_Name], [Channel_Name]) VALUES (56, CAST(8999.00 AS Decimal(18, 2)), CAST(333.00 AS Decimal(18, 2)), CAST(0x0000A54601325A41 AS DateTime), N'product9', N'Channel one')
INSERT [dbo].[Schedule_History] ([History_Id], [Original_Price], [Scheduled_Price], [Scheduled_Date], [Product_Name], [Channel_Name]) VALUES (57, CAST(8999.00 AS Decimal(18, 2)), CAST(333.00 AS Decimal(18, 2)), CAST(0x0000A54601325A44 AS DateTime), N'product9', N'Channel Two')
INSERT [dbo].[Schedule_History] ([History_Id], [Original_Price], [Scheduled_Price], [Scheduled_Date], [Product_Name], [Channel_Name]) VALUES (58, CAST(8999.00 AS Decimal(18, 2)), CAST(333.00 AS Decimal(18, 2)), CAST(0x0000A54601325A46 AS DateTime), N'product9', N'Channel Three')
INSERT [dbo].[Schedule_History] ([History_Id], [Original_Price], [Scheduled_Price], [Scheduled_Date], [Product_Name], [Channel_Name]) VALUES (59, CAST(980.00 AS Decimal(18, 2)), CAST(909.00 AS Decimal(18, 2)), CAST(0x0000A54601325A53 AS DateTime), N'Product x', N'Channel Three')
INSERT [dbo].[Schedule_History] ([History_Id], [Original_Price], [Scheduled_Price], [Scheduled_Date], [Product_Name], [Channel_Name]) VALUES (60, CAST(2500.00 AS Decimal(18, 2)), CAST(777.00 AS Decimal(18, 2)), CAST(0x0000A546014596C5 AS DateTime), N'Testing', N'Channel one')
INSERT [dbo].[Schedule_History] ([History_Id], [Original_Price], [Scheduled_Price], [Scheduled_Date], [Product_Name], [Channel_Name]) VALUES (61, CAST(1800.00 AS Decimal(18, 2)), CAST(444.00 AS Decimal(18, 2)), CAST(0x0000A54700FD54F8 AS DateTime), N'Product1', N'Channel one')
SET IDENTITY_INSERT [dbo].[Schedule_History] OFF
/****** Object:  Table [dbo].[Schedule]    Script Date: 11/30/2015 16:02:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Schedule](
	[Schedule_Id] [bigint] IDENTITY(3434,1) NOT NULL,
	[Schedule_Name] [varchar](50) NULL,
	[Effective_Date] [datetime] NULL,
	[Schedule_IsActive] [bit] NULL,
	[Schedule_IsDeleted] [bit] NULL,
	[Schedule_DateCreated] [datetime] NULL,
 CONSTRAINT [PK_Schedule] PRIMARY KEY CLUSTERED 
(
	[Schedule_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Schedule] ON
INSERT [dbo].[Schedule] ([Schedule_Id], [Schedule_Name], [Effective_Date], [Schedule_IsActive], [Schedule_IsDeleted], [Schedule_DateCreated]) VALUES (3437, N'schedule-one', CAST(0x0000A5DB018A2270 AS DateTime), 1, 0, CAST(0x0000A53F011F6058 AS DateTime))
INSERT [dbo].[Schedule] ([Schedule_Id], [Schedule_Name], [Effective_Date], [Schedule_IsActive], [Schedule_IsDeleted], [Schedule_DateCreated]) VALUES (3438, N'schedule-two', CAST(0x0000A646012741F0 AS DateTime), 1, 0, CAST(0x0000A53F011FBC9E AS DateTime))
INSERT [dbo].[Schedule] ([Schedule_Id], [Schedule_Name], [Effective_Date], [Schedule_IsActive], [Schedule_IsDeleted], [Schedule_DateCreated]) VALUES (3439, N'schedule-three', CAST(0x0000A6ED018A2270 AS DateTime), 1, 0, CAST(0x0000A53F0120340F AS DateTime))
INSERT [dbo].[Schedule] ([Schedule_Id], [Schedule_Name], [Effective_Date], [Schedule_IsActive], [Schedule_IsDeleted], [Schedule_DateCreated]) VALUES (3440, N'schedule-four', CAST(0x0000A6DA0167CD60 AS DateTime), 1, 0, CAST(0x0000A53F01207899 AS DateTime))
INSERT [dbo].[Schedule] ([Schedule_Id], [Schedule_Name], [Effective_Date], [Schedule_IsActive], [Schedule_IsDeleted], [Schedule_DateCreated]) VALUES (3441, N'schedule-five', CAST(0x0000A54700F9F060 AS DateTime), 1, 0, CAST(0x0000A54700F8BEB7 AS DateTime))
INSERT [dbo].[Schedule] ([Schedule_Id], [Schedule_Name], [Effective_Date], [Schedule_IsActive], [Schedule_IsDeleted], [Schedule_DateCreated]) VALUES (3442, N'schedule-six', CAST(0x0000A5F8017B0740 AS DateTime), 1, 0, CAST(0x0000A54000B11A57 AS DateTime))
SET IDENTITY_INSERT [dbo].[Schedule] OFF
/****** Object:  Table [dbo].[Roles]    Script Date: 11/30/2015 16:02:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Role_id] [bigint] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
	[RoleDescription] [nvarchar](250) NULL,
	[Role_IsActive] [bit] NULL CONSTRAINT [DF_Roles_Role_IsActive]  DEFAULT ((1)),
	[Role_IsDeleted] [bit] NULL CONSTRAINT [DF_Roles_Role_IsDeleted]  DEFAULT ((0)),
	[Role_DateCreated] [datetime] NULL,
	[IsAddApproved] [bit] NULL,
	[IsDelApproved] [bit] NULL,
	[IsEditApproved] [bit] NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Role_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Roles] ON
INSERT [dbo].[Roles] ([Role_id], [RoleName], [RoleDescription], [Role_IsActive], [Role_IsDeleted], [Role_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (1, N'SysAdmin', N'System Admin', 1, 0, CAST(0x0000A56000F6BB36 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Roles] ([Role_id], [RoleName], [RoleDescription], [Role_IsActive], [Role_IsDeleted], [Role_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (2, N'Staff1', N'Staff group one', 1, 0, CAST(0x0000A4D80104D0C5 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Roles] ([Role_id], [RoleName], [RoleDescription], [Role_IsActive], [Role_IsDeleted], [Role_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (9, N'Staff2', N'Staff group two role', 1, 0, CAST(0x0000A54600FD56FD AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Roles] ([Role_id], [RoleName], [RoleDescription], [Role_IsActive], [Role_IsDeleted], [Role_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (10, N'Test', N'Test Role', 1, 0, CAST(0x0000A54600FD1029 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Roles] ([Role_id], [RoleName], [RoleDescription], [Role_IsActive], [Role_IsDeleted], [Role_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (11, N'Manager', N'Manager', 1, 0, CAST(0x0000A4B900E34E8A AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Roles] ([Role_id], [RoleName], [RoleDescription], [Role_IsActive], [Role_IsDeleted], [Role_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (12, N'Rolex', N'Rolex', 1, 0, CAST(0x0000A4D000C7BCE0 AS DateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Roles] OFF
/****** Object:  Table [dbo].[refvaluehistory]    Script Date: 11/30/2015 16:02:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[refvaluehistory](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[actionitem_id] [bigint] NULL,
	[ref_value] [float] NULL,
	[created] [datetime] NULL,
 CONSTRAINT [PK_refvaluehistory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductTypes]    Script Date: 11/30/2015 16:02:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductTypes](
	[ProductType_id] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductType_Name] [nvarchar](50) NULL,
	[ProductType_Description] [nvarchar](250) NULL,
	[ProductType_IsActive] [bit] NULL,
	[ProductType_IsDeleted] [bit] NULL,
	[ProductType_DateCreated] [datetime] NULL,
	[IsAddApproved] [bit] NULL,
	[IsDelApproved] [bit] NULL,
	[IsEditApproved] [bit] NULL,
	[ProductType_IsDeletedFlag] [int] NULL CONSTRAINT [DF_ProductTypes_ProductType_IsDeletedFlag]  DEFAULT ((-1)),
	[ProductType_IsbeingDeleted] [bit] NULL,
	[ProductType_IsbeingEdited] [bit] NULL CONSTRAINT [DF_ProductTypes_ProductType_IsbeingEdited]  DEFAULT ((0)),
	[ProductType_IsbeingAdded] [bit] NULL,
	[IsAddApprovedFirstApvr] [bit] NULL,
	[IsAddApprovedSecondApvr] [bit] NULL,
	[IsDelApprovedFirstApvr] [bit] NULL,
	[IsDelApprovedSecondApvr] [bit] NULL,
	[IsEditApprovedFirstApvr] [bit] NULL,
	[IsEditApprovedSecondApvr] [bit] NULL,
	[ReasonEditFirstApvr] [nvarchar](500) NULL,
	[ReasonEditSecondApvr] [nvarchar](500) NULL,
	[ReasonDelFirstApvr] [nvarchar](500) NULL,
	[ReasonDelSecondApvr] [nvarchar](500) NULL,
	[ReasonAddFirstApvr] [nvarchar](500) NULL,
	[ReasonAddSecondApvr] [nvarchar](500) NULL,
	[CF1] [varchar](50) NULL,
	[CF2] [varchar](50) NULL,
	[CF3] [varchar](50) NULL,
	[CF4] [varchar](50) NULL,
	[CF5] [varchar](50) NULL,
 CONSTRAINT [PK_ProductTypes] PRIMARY KEY CLUSTERED 
(
	[ProductType_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ProductTypes] ON
INSERT [dbo].[ProductTypes] ([ProductType_id], [ProductType_Name], [ProductType_Description], [ProductType_IsActive], [ProductType_IsDeleted], [ProductType_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [ProductType_IsDeletedFlag], [ProductType_IsbeingDeleted], [ProductType_IsbeingEdited], [ProductType_IsbeingAdded], [IsAddApprovedFirstApvr], [IsAddApprovedSecondApvr], [IsDelApprovedFirstApvr], [IsDelApprovedSecondApvr], [IsEditApprovedFirstApvr], [IsEditApprovedSecondApvr], [ReasonEditFirstApvr], [ReasonEditSecondApvr], [ReasonDelFirstApvr], [ReasonDelSecondApvr], [ReasonAddFirstApvr], [ReasonAddSecondApvr], [CF1], [CF2], [CF3], [CF4], [CF5]) VALUES (1, N'Fuels', N'Products related to fuel.', 1, 0, CAST(0x0000A4D200B565C9 AS DateTime), 1, 1, 1, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ProductTypes] ([ProductType_id], [ProductType_Name], [ProductType_Description], [ProductType_IsActive], [ProductType_IsDeleted], [ProductType_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [ProductType_IsDeletedFlag], [ProductType_IsbeingDeleted], [ProductType_IsbeingEdited], [ProductType_IsbeingAdded], [IsAddApprovedFirstApvr], [IsAddApprovedSecondApvr], [IsDelApprovedFirstApvr], [IsDelApprovedSecondApvr], [IsEditApprovedFirstApvr], [IsEditApprovedSecondApvr], [ReasonEditFirstApvr], [ReasonEditSecondApvr], [ReasonDelFirstApvr], [ReasonDelSecondApvr], [ReasonAddFirstApvr], [ReasonAddSecondApvr], [CF1], [CF2], [CF3], [CF4], [CF5]) VALUES (4, N'Car wash', N'Car wash related products.', 1, 0, CAST(0x0000A4CD01357FA3 AS DateTime), 1, 1, 1, -1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ProductTypes] ([ProductType_id], [ProductType_Name], [ProductType_Description], [ProductType_IsActive], [ProductType_IsDeleted], [ProductType_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [ProductType_IsDeletedFlag], [ProductType_IsbeingDeleted], [ProductType_IsbeingEdited], [ProductType_IsbeingAdded], [IsAddApprovedFirstApvr], [IsAddApprovedSecondApvr], [IsDelApprovedFirstApvr], [IsDelApprovedSecondApvr], [IsEditApprovedFirstApvr], [IsEditApprovedSecondApvr], [ReasonEditFirstApvr], [ReasonEditSecondApvr], [ReasonDelFirstApvr], [ReasonDelSecondApvr], [ReasonAddFirstApvr], [ReasonAddSecondApvr], [CF1], [CF2], [CF3], [CF4], [CF5]) VALUES (9, N'Product', N'sadsd sdaskds', 1, 0, CAST(0x0000A4B901425127 AS DateTime), 1, 0, 1, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ProductTypes] ([ProductType_id], [ProductType_Name], [ProductType_Description], [ProductType_IsActive], [ProductType_IsDeleted], [ProductType_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [ProductType_IsDeletedFlag], [ProductType_IsbeingDeleted], [ProductType_IsbeingEdited], [ProductType_IsbeingAdded], [IsAddApprovedFirstApvr], [IsAddApprovedSecondApvr], [IsDelApprovedFirstApvr], [IsDelApprovedSecondApvr], [IsEditApprovedFirstApvr], [IsEditApprovedSecondApvr], [ReasonEditFirstApvr], [ReasonEditSecondApvr], [ReasonDelFirstApvr], [ReasonDelSecondApvr], [ReasonAddFirstApvr], [ReasonAddSecondApvr], [CF1], [CF2], [CF3], [CF4], [CF5]) VALUES (10, N'test', N'This is test', 1, 0, CAST(0x0000A4BB00B92A16 AS DateTime), 1, 0, 0, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ProductTypes] ([ProductType_id], [ProductType_Name], [ProductType_Description], [ProductType_IsActive], [ProductType_IsDeleted], [ProductType_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [ProductType_IsDeletedFlag], [ProductType_IsbeingDeleted], [ProductType_IsbeingEdited], [ProductType_IsbeingAdded], [IsAddApprovedFirstApvr], [IsAddApprovedSecondApvr], [IsDelApprovedFirstApvr], [IsDelApprovedSecondApvr], [IsEditApprovedFirstApvr], [IsEditApprovedSecondApvr], [ReasonEditFirstApvr], [ReasonEditSecondApvr], [ReasonDelFirstApvr], [ReasonDelSecondApvr], [ReasonAddFirstApvr], [ReasonAddSecondApvr], [CF1], [CF2], [CF3], [CF4], [CF5]) VALUES (12, N'Product Type x', N'Product type x description', 1, 0, CAST(0x0000A4CD012F8F80 AS DateTime), 1, 1, 0, 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ProductTypes] ([ProductType_id], [ProductType_Name], [ProductType_Description], [ProductType_IsActive], [ProductType_IsDeleted], [ProductType_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [ProductType_IsDeletedFlag], [ProductType_IsbeingDeleted], [ProductType_IsbeingEdited], [ProductType_IsbeingAdded], [IsAddApprovedFirstApvr], [IsAddApprovedSecondApvr], [IsDelApprovedFirstApvr], [IsDelApprovedSecondApvr], [IsEditApprovedFirstApvr], [IsEditApprovedSecondApvr], [ReasonEditFirstApvr], [ReasonEditSecondApvr], [ReasonDelFirstApvr], [ReasonDelSecondApvr], [ReasonAddFirstApvr], [ReasonAddSecondApvr], [CF1], [CF2], [CF3], [CF4], [CF5]) VALUES (13, N'Product Type y', N'product type y description', 1, 0, CAST(0x0000A4D200B562C7 AS DateTime), 1, 1, 0, -1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ProductTypes] ([ProductType_id], [ProductType_Name], [ProductType_Description], [ProductType_IsActive], [ProductType_IsDeleted], [ProductType_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [ProductType_IsDeletedFlag], [ProductType_IsbeingDeleted], [ProductType_IsbeingEdited], [ProductType_IsbeingAdded], [IsAddApprovedFirstApvr], [IsAddApprovedSecondApvr], [IsDelApprovedFirstApvr], [IsDelApprovedSecondApvr], [IsEditApprovedFirstApvr], [IsEditApprovedSecondApvr], [ReasonEditFirstApvr], [ReasonEditSecondApvr], [ReasonDelFirstApvr], [ReasonDelSecondApvr], [ReasonAddFirstApvr], [ReasonAddSecondApvr], [CF1], [CF2], [CF3], [CF4], [CF5]) VALUES (14, N'JK', N'JKJKJK 123', 1, 0, CAST(0x0000A4CD00C90B50 AS DateTime), 1, 1, 0, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ProductTypes] ([ProductType_id], [ProductType_Name], [ProductType_Description], [ProductType_IsActive], [ProductType_IsDeleted], [ProductType_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [ProductType_IsDeletedFlag], [ProductType_IsbeingDeleted], [ProductType_IsbeingEdited], [ProductType_IsbeingAdded], [IsAddApprovedFirstApvr], [IsAddApprovedSecondApvr], [IsDelApprovedFirstApvr], [IsDelApprovedSecondApvr], [IsEditApprovedFirstApvr], [IsEditApprovedSecondApvr], [ReasonEditFirstApvr], [ReasonEditSecondApvr], [ReasonDelFirstApvr], [ReasonDelSecondApvr], [ReasonAddFirstApvr], [ReasonAddSecondApvr], [CF1], [CF2], [CF3], [CF4], [CF5]) VALUES (15, N'new type', N'new type', 1, 0, CAST(0x0000A4CD00C9078C AS DateTime), 1, 1, 0, -1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ProductTypes] ([ProductType_id], [ProductType_Name], [ProductType_Description], [ProductType_IsActive], [ProductType_IsDeleted], [ProductType_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [ProductType_IsDeletedFlag], [ProductType_IsbeingDeleted], [ProductType_IsbeingEdited], [ProductType_IsbeingAdded], [IsAddApprovedFirstApvr], [IsAddApprovedSecondApvr], [IsDelApprovedFirstApvr], [IsDelApprovedSecondApvr], [IsEditApprovedFirstApvr], [IsEditApprovedSecondApvr], [ReasonEditFirstApvr], [ReasonEditSecondApvr], [ReasonDelFirstApvr], [ReasonDelSecondApvr], [ReasonAddFirstApvr], [ReasonAddSecondApvr], [CF1], [CF2], [CF3], [CF4], [CF5]) VALUES (16, N'My Type', N'sdhsj sjdhsjd sj', 1, 1, CAST(0x0000A4CD00C9038E AS DateTime), 1, 0, 1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ProductTypes] ([ProductType_id], [ProductType_Name], [ProductType_Description], [ProductType_IsActive], [ProductType_IsDeleted], [ProductType_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [ProductType_IsDeletedFlag], [ProductType_IsbeingDeleted], [ProductType_IsbeingEdited], [ProductType_IsbeingAdded], [IsAddApprovedFirstApvr], [IsAddApprovedSecondApvr], [IsDelApprovedFirstApvr], [IsDelApprovedSecondApvr], [IsEditApprovedFirstApvr], [IsEditApprovedSecondApvr], [ReasonEditFirstApvr], [ReasonEditSecondApvr], [ReasonDelFirstApvr], [ReasonDelSecondApvr], [ReasonAddFirstApvr], [ReasonAddSecondApvr], [CF1], [CF2], [CF3], [CF4], [CF5]) VALUES (17, N'Product Type 1', N'Product Type one description.', 1, 0, CAST(0x0000A4CE00E1506D AS DateTime), 0, 1, 1, -1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ProductTypes] ([ProductType_id], [ProductType_Name], [ProductType_Description], [ProductType_IsActive], [ProductType_IsDeleted], [ProductType_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [ProductType_IsDeletedFlag], [ProductType_IsbeingDeleted], [ProductType_IsbeingEdited], [ProductType_IsbeingAdded], [IsAddApprovedFirstApvr], [IsAddApprovedSecondApvr], [IsDelApprovedFirstApvr], [IsDelApprovedSecondApvr], [IsEditApprovedFirstApvr], [IsEditApprovedSecondApvr], [ReasonEditFirstApvr], [ReasonEditSecondApvr], [ReasonDelFirstApvr], [ReasonDelSecondApvr], [ReasonAddFirstApvr], [ReasonAddSecondApvr], [CF1], [CF2], [CF3], [CF4], [CF5]) VALUES (18, N'Product Type 2', N'Product Type 2 description', 1, 0, CAST(0x0000A4CE00E16775 AS DateTime), 0, 1, 1, -1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ProductTypes] ([ProductType_id], [ProductType_Name], [ProductType_Description], [ProductType_IsActive], [ProductType_IsDeleted], [ProductType_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [ProductType_IsDeletedFlag], [ProductType_IsbeingDeleted], [ProductType_IsbeingEdited], [ProductType_IsbeingAdded], [IsAddApprovedFirstApvr], [IsAddApprovedSecondApvr], [IsDelApprovedFirstApvr], [IsDelApprovedSecondApvr], [IsEditApprovedFirstApvr], [IsEditApprovedSecondApvr], [ReasonEditFirstApvr], [ReasonEditSecondApvr], [ReasonDelFirstApvr], [ReasonDelSecondApvr], [ReasonAddFirstApvr], [ReasonAddSecondApvr], [CF1], [CF2], [CF3], [CF4], [CF5]) VALUES (19, N'Product Type 3', N'Product Type three description.', 1, 0, CAST(0x0000A4CE00E182F6 AS DateTime), 0, 1, 1, -1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ProductTypes] ([ProductType_id], [ProductType_Name], [ProductType_Description], [ProductType_IsActive], [ProductType_IsDeleted], [ProductType_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [ProductType_IsDeletedFlag], [ProductType_IsbeingDeleted], [ProductType_IsbeingEdited], [ProductType_IsbeingAdded], [IsAddApprovedFirstApvr], [IsAddApprovedSecondApvr], [IsDelApprovedFirstApvr], [IsDelApprovedSecondApvr], [IsEditApprovedFirstApvr], [IsEditApprovedSecondApvr], [ReasonEditFirstApvr], [ReasonEditSecondApvr], [ReasonDelFirstApvr], [ReasonDelSecondApvr], [ReasonAddFirstApvr], [ReasonAddSecondApvr], [CF1], [CF2], [CF3], [CF4], [CF5]) VALUES (20, N'Product Type 4', N'Product Type four description.', 1, 0, CAST(0x0000A4CE0138DCD9 AS DateTime), 0, 1, 1, -1, 0, 0, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'this is rejection', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ProductTypes] ([ProductType_id], [ProductType_Name], [ProductType_Description], [ProductType_IsActive], [ProductType_IsDeleted], [ProductType_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [ProductType_IsDeletedFlag], [ProductType_IsbeingDeleted], [ProductType_IsbeingEdited], [ProductType_IsbeingAdded], [IsAddApprovedFirstApvr], [IsAddApprovedSecondApvr], [IsDelApprovedFirstApvr], [IsDelApprovedSecondApvr], [IsEditApprovedFirstApvr], [IsEditApprovedSecondApvr], [ReasonEditFirstApvr], [ReasonEditSecondApvr], [ReasonDelFirstApvr], [ReasonDelSecondApvr], [ReasonAddFirstApvr], [ReasonAddSecondApvr], [CF1], [CF2], [CF3], [CF4], [CF5]) VALUES (21, N'Product Type 5', N'Product Type five description.', 1, 0, CAST(0x0000A4CE012D3341 AS DateTime), 0, 1, 0, -1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ProductTypes] ([ProductType_id], [ProductType_Name], [ProductType_Description], [ProductType_IsActive], [ProductType_IsDeleted], [ProductType_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [ProductType_IsDeletedFlag], [ProductType_IsbeingDeleted], [ProductType_IsbeingEdited], [ProductType_IsbeingAdded], [IsAddApprovedFirstApvr], [IsAddApprovedSecondApvr], [IsDelApprovedFirstApvr], [IsDelApprovedSecondApvr], [IsEditApprovedFirstApvr], [IsEditApprovedSecondApvr], [ReasonEditFirstApvr], [ReasonEditSecondApvr], [ReasonDelFirstApvr], [ReasonDelSecondApvr], [ReasonAddFirstApvr], [ReasonAddSecondApvr], [CF1], [CF2], [CF3], [CF4], [CF5]) VALUES (22, N'saasa', N'asasas dasds', 1, 0, CAST(0x0000A4D1014E8CC1 AS DateTime), 1, 1, 1, -1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ProductTypes] ([ProductType_id], [ProductType_Name], [ProductType_Description], [ProductType_IsActive], [ProductType_IsDeleted], [ProductType_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [ProductType_IsDeletedFlag], [ProductType_IsbeingDeleted], [ProductType_IsbeingEdited], [ProductType_IsbeingAdded], [IsAddApprovedFirstApvr], [IsAddApprovedSecondApvr], [IsDelApprovedFirstApvr], [IsDelApprovedSecondApvr], [IsEditApprovedFirstApvr], [IsEditApprovedSecondApvr], [ReasonEditFirstApvr], [ReasonEditSecondApvr], [ReasonDelFirstApvr], [ReasonDelSecondApvr], [ReasonAddFirstApvr], [ReasonAddSecondApvr], [CF1], [CF2], [CF3], [CF4], [CF5]) VALUES (23, N'Fuel Type', N'Types of fuel - Petrol, Diesel etc ', 1, 0, CAST(0x0000A53D00C6E80A AS DateTime), 1, 1, 1, -1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ProductTypes] ([ProductType_id], [ProductType_Name], [ProductType_Description], [ProductType_IsActive], [ProductType_IsDeleted], [ProductType_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [ProductType_IsDeletedFlag], [ProductType_IsbeingDeleted], [ProductType_IsbeingEdited], [ProductType_IsbeingAdded], [IsAddApprovedFirstApvr], [IsAddApprovedSecondApvr], [IsDelApprovedFirstApvr], [IsDelApprovedSecondApvr], [IsEditApprovedFirstApvr], [IsEditApprovedSecondApvr], [ReasonEditFirstApvr], [ReasonEditSecondApvr], [ReasonDelFirstApvr], [ReasonDelSecondApvr], [ReasonAddFirstApvr], [ReasonAddSecondApvr], [CF1], [CF2], [CF3], [CF4], [CF5]) VALUES (24, N'dasd', N'sds', 1, 0, CAST(0x0000A55D014577B6 AS DateTime), 1, 1, 1, -1, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'sdsd', N'sdd', N'sd', N'sd', N'sd')
SET IDENTITY_INSERT [dbo].[ProductTypes] OFF
/****** Object:  Table [dbo].[Products]    Script Date: 11/30/2015 16:02:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Products](
	[Product_id] [bigint] IDENTITY(1,1) NOT NULL,
	[Product_Name] [nvarchar](50) NULL,
	[Product_Description] [nvarchar](250) NULL,
	[Product_Type] [bigint] NULL,
	[Product_Price] [decimal](18, 2) NULL,
	[Product_currency] [nvarchar](5) NULL,
	[Product_IsActive] [bit] NULL,
	[Product_IsDeleted] [bit] NULL,
	[Product_DateCreated] [datetime] NULL,
	[IsAddApproved] [bit] NULL,
	[IsDelApproved] [bit] NULL,
	[IsEditApproved] [bit] NULL,
	[IsDeletedFlag] [int] NULL,
	[IsbeingDeleted] [bit] NULL,
	[IsbeingAdded] [bit] NULL,
	[IsbeingEdited] [bit] NULL,
	[CF1] [varchar](50) NULL,
	[CF2] [varchar](50) NULL,
	[CF3] [varchar](50) NULL,
	[CF4] [varchar](50) NULL,
	[CF5] [varchar](50) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Product_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON
INSERT [dbo].[Products] ([Product_id], [Product_Name], [Product_Description], [Product_Type], [Product_Price], [Product_currency], [Product_IsActive], [Product_IsDeleted], [Product_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [IsDeletedFlag], [IsbeingDeleted], [IsbeingAdded], [IsbeingEdited], [CF1], [CF2], [CF3], [CF4], [CF5]) VALUES (1, N'Product1', N'Description for Product1', 1, CAST(1800.00 AS Decimal(18, 2)), N'USD', 1, 0, CAST(0x0000A49300EDAE9A AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([Product_id], [Product_Name], [Product_Description], [Product_Type], [Product_Price], [Product_currency], [Product_IsActive], [Product_IsDeleted], [Product_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [IsDeletedFlag], [IsbeingDeleted], [IsbeingAdded], [IsbeingEdited], [CF1], [CF2], [CF3], [CF4], [CF5]) VALUES (2, N'Product2', N'This is product2', 1, CAST(1234.00 AS Decimal(18, 2)), N'USD', 1, 0, CAST(0x0000A49300F3B49E AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([Product_id], [Product_Name], [Product_Description], [Product_Type], [Product_Price], [Product_currency], [Product_IsActive], [Product_IsDeleted], [Product_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [IsDeletedFlag], [IsbeingDeleted], [IsbeingAdded], [IsbeingEdited], [CF1], [CF2], [CF3], [CF4], [CF5]) VALUES (3, N'Product3', N'asdasd', 1, CAST(3433.00 AS Decimal(18, 2)), N'USD', 1, 0, CAST(0x0000A49800F4DDD5 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([Product_id], [Product_Name], [Product_Description], [Product_Type], [Product_Price], [Product_currency], [Product_IsActive], [Product_IsDeleted], [Product_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [IsDeletedFlag], [IsbeingDeleted], [IsbeingAdded], [IsbeingEdited], [CF1], [CF2], [CF3], [CF4], [CF5]) VALUES (4, N'test', N'dhas sdjashdas jd', 1, CAST(823.00 AS Decimal(18, 2)), N'USD', 1, 0, CAST(0x0000A49C00C1330A AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([Product_id], [Product_Name], [Product_Description], [Product_Type], [Product_Price], [Product_currency], [Product_IsActive], [Product_IsDeleted], [Product_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [IsDeletedFlag], [IsbeingDeleted], [IsbeingAdded], [IsbeingEdited], [CF1], [CF2], [CF3], [CF4], [CF5]) VALUES (5, N'test', N'dhas sdjashdas jd', 1, CAST(823.00 AS Decimal(18, 2)), N'USD', 1, 0, CAST(0x0000A49C00C1332E AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([Product_id], [Product_Name], [Product_Description], [Product_Type], [Product_Price], [Product_currency], [Product_IsActive], [Product_IsDeleted], [Product_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [IsDeletedFlag], [IsbeingDeleted], [IsbeingAdded], [IsbeingEdited], [CF1], [CF2], [CF3], [CF4], [CF5]) VALUES (6, N'Testing', N'testing', 1, CAST(2500.00 AS Decimal(18, 2)), N'USD', 1, 0, CAST(0x0000A49C00FA2857 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([Product_id], [Product_Name], [Product_Description], [Product_Type], [Product_Price], [Product_currency], [Product_IsActive], [Product_IsDeleted], [Product_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [IsDeletedFlag], [IsbeingDeleted], [IsbeingAdded], [IsbeingEdited], [CF1], [CF2], [CF3], [CF4], [CF5]) VALUES (7, N'dasda', N'sdsad', 1, CAST(2323.00 AS Decimal(18, 2)), N'USD', 1, 0, CAST(0x0000A49C00FB9855 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([Product_id], [Product_Name], [Product_Description], [Product_Type], [Product_Price], [Product_currency], [Product_IsActive], [Product_IsDeleted], [Product_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [IsDeletedFlag], [IsbeingDeleted], [IsbeingAdded], [IsbeingEdited], [CF1], [CF2], [CF3], [CF4], [CF5]) VALUES (8, N'dsdf', N'dfdf', 1, CAST(345.00 AS Decimal(18, 2)), N'AED', 1, 0, CAST(0x0000A49C01091532 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([Product_id], [Product_Name], [Product_Description], [Product_Type], [Product_Price], [Product_currency], [Product_IsActive], [Product_IsDeleted], [Product_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [IsDeletedFlag], [IsbeingDeleted], [IsbeingAdded], [IsbeingEdited], [CF1], [CF2], [CF3], [CF4], [CF5]) VALUES (9, N'dsdf', N'dfdf', 1, CAST(345.00 AS Decimal(18, 2)), N'AED', 1, 0, CAST(0x0000A49C0109150A AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([Product_id], [Product_Name], [Product_Description], [Product_Type], [Product_Price], [Product_currency], [Product_IsActive], [Product_IsDeleted], [Product_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [IsDeletedFlag], [IsbeingDeleted], [IsbeingAdded], [IsbeingEdited], [CF1], [CF2], [CF3], [CF4], [CF5]) VALUES (10, N'sdsa', N'sdsd', 1, CAST(1223.00 AS Decimal(18, 2)), N'AED', 1, 0, CAST(0x0000A49C010AA5ED AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([Product_id], [Product_Name], [Product_Description], [Product_Type], [Product_Price], [Product_currency], [Product_IsActive], [Product_IsDeleted], [Product_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [IsDeletedFlag], [IsbeingDeleted], [IsbeingAdded], [IsbeingEdited], [CF1], [CF2], [CF3], [CF4], [CF5]) VALUES (11, N'sdsa1', N'sdsd', 1, CAST(1223.00 AS Decimal(18, 2)), N'AED', 1, 0, CAST(0x0000A49C010ACE91 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([Product_id], [Product_Name], [Product_Description], [Product_Type], [Product_Price], [Product_currency], [Product_IsActive], [Product_IsDeleted], [Product_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [IsDeletedFlag], [IsbeingDeleted], [IsbeingAdded], [IsbeingEdited], [CF1], [CF2], [CF3], [CF4], [CF5]) VALUES (12, N'dasd', N'sdsd', 1, CAST(234234.00 AS Decimal(18, 2)), N'AED', 1, 0, CAST(0x0000A49C010B09CD AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([Product_id], [Product_Name], [Product_Description], [Product_Type], [Product_Price], [Product_currency], [Product_IsActive], [Product_IsDeleted], [Product_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [IsDeletedFlag], [IsbeingDeleted], [IsbeingAdded], [IsbeingEdited], [CF1], [CF2], [CF3], [CF4], [CF5]) VALUES (13, N'sdasd', N'sdasd', 1, CAST(343.00 AS Decimal(18, 2)), N'AED', 1, 0, CAST(0x0000A49C010C1912 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([Product_id], [Product_Name], [Product_Description], [Product_Type], [Product_Price], [Product_currency], [Product_IsActive], [Product_IsDeleted], [Product_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [IsDeletedFlag], [IsbeingDeleted], [IsbeingAdded], [IsbeingEdited], [CF1], [CF2], [CF3], [CF4], [CF5]) VALUES (14, N'sdasdd', N'sdssdsd', 1, CAST(333.00 AS Decimal(18, 2)), N'AED', 1, 0, CAST(0x0000A49C010C2FCC AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([Product_id], [Product_Name], [Product_Description], [Product_Type], [Product_Price], [Product_currency], [Product_IsActive], [Product_IsDeleted], [Product_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [IsDeletedFlag], [IsbeingDeleted], [IsbeingAdded], [IsbeingEdited], [CF1], [CF2], [CF3], [CF4], [CF5]) VALUES (15, N'sdds', N'dfsdf', 1, CAST(454.00 AS Decimal(18, 2)), N'AED', 1, 0, CAST(0x0000A49C010D0913 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([Product_id], [Product_Name], [Product_Description], [Product_Type], [Product_Price], [Product_currency], [Product_IsActive], [Product_IsDeleted], [Product_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [IsDeletedFlag], [IsbeingDeleted], [IsbeingAdded], [IsbeingEdited], [CF1], [CF2], [CF3], [CF4], [CF5]) VALUES (16, N'asdasd999', N'sdasd', 1, CAST(343.00 AS Decimal(18, 2)), N'AED', 1, 0, CAST(0x0000A49C010D1EAE AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([Product_id], [Product_Name], [Product_Description], [Product_Type], [Product_Price], [Product_currency], [Product_IsActive], [Product_IsDeleted], [Product_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [IsDeletedFlag], [IsbeingDeleted], [IsbeingAdded], [IsbeingEdited], [CF1], [CF2], [CF3], [CF4], [CF5]) VALUES (17, N'dadasdsdsa', N'sdsd', 1, CAST(3434.00 AS Decimal(18, 2)), N'AED', 1, 0, CAST(0x0000A49C010D5C75 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([Product_id], [Product_Name], [Product_Description], [Product_Type], [Product_Price], [Product_currency], [Product_IsActive], [Product_IsDeleted], [Product_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [IsDeletedFlag], [IsbeingDeleted], [IsbeingAdded], [IsbeingEdited], [CF1], [CF2], [CF3], [CF4], [CF5]) VALUES (18, N'product11', N'dfhasdf ', 1, CAST(4637.00 AS Decimal(18, 2)), N'AED', 1, 0, CAST(0x0000A49D00B61C0F AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([Product_id], [Product_Name], [Product_Description], [Product_Type], [Product_Price], [Product_currency], [Product_IsActive], [Product_IsDeleted], [Product_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [IsDeletedFlag], [IsbeingDeleted], [IsbeingAdded], [IsbeingEdited], [CF1], [CF2], [CF3], [CF4], [CF5]) VALUES (19, N'Product x', N'hdfj dfjdhf', 8, CAST(980.00 AS Decimal(18, 2)), N'USD', 1, 0, CAST(0x0000A4B5010D0533 AS DateTime), NULL, 0, 0, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([Product_id], [Product_Name], [Product_Description], [Product_Type], [Product_Price], [Product_currency], [Product_IsActive], [Product_IsDeleted], [Product_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [IsDeletedFlag], [IsbeingDeleted], [IsbeingAdded], [IsbeingEdited], [CF1], [CF2], [CF3], [CF4], [CF5]) VALUES (20, N'product9', N'fhdf dfdfjdj', 1, CAST(8999.00 AS Decimal(18, 2)), N'USD', 1, 0, CAST(0x0000A49D00BC4BBB AS DateTime), NULL, 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([Product_id], [Product_Name], [Product_Description], [Product_Type], [Product_Price], [Product_currency], [Product_IsActive], [Product_IsDeleted], [Product_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [IsDeletedFlag], [IsbeingDeleted], [IsbeingAdded], [IsbeingEdited], [CF1], [CF2], [CF3], [CF4], [CF5]) VALUES (21, N'Test Product', N'Test Product description', 1, CAST(500.00 AS Decimal(18, 2)), N'USD', 1, 0, CAST(0x0000A4BB0134947A AS DateTime), 1, NULL, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([Product_id], [Product_Name], [Product_Description], [Product_Type], [Product_Price], [Product_currency], [Product_IsActive], [Product_IsDeleted], [Product_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [IsDeletedFlag], [IsbeingDeleted], [IsbeingAdded], [IsbeingEdited], [CF1], [CF2], [CF3], [CF4], [CF5]) VALUES (22, N'Product xyz', N'shd sdjsdhsjd jsd', 1, CAST(120.00 AS Decimal(18, 2)), N'USD', 1, 0, CAST(0x0000A54400BE70AF AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([Product_id], [Product_Name], [Product_Description], [Product_Type], [Product_Price], [Product_currency], [Product_IsActive], [Product_IsDeleted], [Product_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [IsDeletedFlag], [IsbeingDeleted], [IsbeingAdded], [IsbeingEdited], [CF1], [CF2], [CF3], [CF4], [CF5]) VALUES (23, N'dsds', N'dsdsd', 1, CAST(250.00 AS Decimal(18, 2)), N'KES', 1, 0, CAST(0x0000A54400BE43AC AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([Product_id], [Product_Name], [Product_Description], [Product_Type], [Product_Price], [Product_currency], [Product_IsActive], [Product_IsDeleted], [Product_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [IsDeletedFlag], [IsbeingDeleted], [IsbeingAdded], [IsbeingEdited], [CF1], [CF2], [CF3], [CF4], [CF5]) VALUES (24, N'sdsd', N'dsd', 1, CAST(500.00 AS Decimal(18, 2)), N'USD', 1, 0, CAST(0x0000A54400D02819 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Products] ([Product_id], [Product_Name], [Product_Description], [Product_Type], [Product_Price], [Product_currency], [Product_IsActive], [Product_IsDeleted], [Product_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [IsDeletedFlag], [IsbeingDeleted], [IsbeingAdded], [IsbeingEdited], [CF1], [CF2], [CF3], [CF4], [CF5]) VALUES (25, N'Gaga', N'Gagagaga', 1, CAST(900.00 AS Decimal(18, 2)), N'USD', 1, 0, CAST(0x0000A54400D00861 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Products] OFF
/****** Object:  Table [dbo].[ProductProperties]    Script Date: 11/30/2015 16:02:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductProperties](
	[ProductProperty_id] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductProperty_Name] [nvarchar](50) NULL,
	[ProductProperty_Description] [nvarchar](250) NULL,
	[ProductProperty_DateCreated] [datetime] NULL,
	[ProductProperty_IsActive] [bit] NULL CONSTRAINT [DF_ProductProperties_ProductProperty_IsActive]  DEFAULT ((1)),
	[ProductProperty_IsDeleted] [bit] NULL CONSTRAINT [DF_ProductProperties_ProductProperty_IsDeleted]  DEFAULT ((0)),
	[IsAddApproved] [bit] NULL,
	[IsDelApproved] [bit] NULL,
	[IsEditApproved] [bit] NULL,
	[IsDeletedFlag] [int] NULL,
	[IsbeingDeleted] [bit] NULL,
	[IsbeingEdited] [bit] NULL,
	[IsbeingAdded] [bit] NULL,
	[IsSelected] [bit] NOT NULL CONSTRAINT [DF_ProductProperties_IsSelected]  DEFAULT ((0)),
 CONSTRAINT [PK_ProductProperties] PRIMARY KEY CLUSTERED 
(
	[ProductProperty_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ProductProperties] ON
INSERT [dbo].[ProductProperties] ([ProductProperty_id], [ProductProperty_Name], [ProductProperty_Description], [ProductProperty_DateCreated], [ProductProperty_IsActive], [ProductProperty_IsDeleted], [IsAddApproved], [IsDelApproved], [IsEditApproved], [IsDeletedFlag], [IsbeingDeleted], [IsbeingEdited], [IsbeingAdded], [IsSelected]) VALUES (1, N'Vehicle Reg Number n1', N'Vehicle Registration Numbers z1', CAST(0x0000A4BB00E0B575 AS DateTime), 1, 0, 1, 1, 0, -1, 0, 0, 0, 0)
INSERT [dbo].[ProductProperties] ([ProductProperty_id], [ProductProperty_Name], [ProductProperty_Description], [ProductProperty_DateCreated], [ProductProperty_IsActive], [ProductProperty_IsDeleted], [IsAddApproved], [IsDelApproved], [IsEditApproved], [IsDeletedFlag], [IsbeingDeleted], [IsbeingEdited], [IsbeingAdded], [IsSelected]) VALUES (2, N'Vehicle Odometer reading', N'Vehicle Odometer reading
', CAST(0x0000A4BB00E0B575 AS DateTime), 1, 0, 1, 1, 1, -1, 0, 0, 0, 0)
INSERT [dbo].[ProductProperties] ([ProductProperty_id], [ProductProperty_Name], [ProductProperty_Description], [ProductProperty_DateCreated], [ProductProperty_IsActive], [ProductProperty_IsDeleted], [IsAddApproved], [IsDelApproved], [IsEditApproved], [IsDeletedFlag], [IsbeingDeleted], [IsbeingEdited], [IsbeingAdded], [IsSelected]) VALUES (4, N'test', N'this is test', CAST(0x0000A4D200B580BC AS DateTime), 1, 0, 0, 0, 0, 0, 0, 0, 0, 0)
SET IDENTITY_INSERT [dbo].[ProductProperties] OFF
/****** Object:  Table [dbo].[PriceList]    Script Date: 11/30/2015 16:02:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PriceList](
	[PriceList_id] [bigint] IDENTITY(1,1) NOT NULL,
	[PriceList_Name] [nvarchar](50) NULL,
	[PriceList_Description] [nvarchar](250) NULL,
	[PriceList_IsActive] [bit] NULL,
	[PriceList_IsDeleted] [bit] NULL,
	[PriceList_DateCreated] [datetime] NULL,
	[PriceList_IsDefault] [bit] NOT NULL CONSTRAINT [DF_PriceList_PriceList_IsDefault]  DEFAULT ((0)),
 CONSTRAINT [PK_PriceList] PRIMARY KEY CLUSTERED 
(
	[PriceList_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PriceList] ON
INSERT [dbo].[PriceList] ([PriceList_id], [PriceList_Name], [PriceList_Description], [PriceList_IsActive], [PriceList_IsDeleted], [PriceList_DateCreated], [PriceList_IsDefault]) VALUES (2, N'Price List One', N'sadjs skdjskd', 1, 0, CAST(0x0000A56000F9EF75 AS DateTime), 1)
INSERT [dbo].[PriceList] ([PriceList_id], [PriceList_Name], [PriceList_Description], [PriceList_IsActive], [PriceList_IsDeleted], [PriceList_DateCreated], [PriceList_IsDefault]) VALUES (3, N'Price List two', N'sdj sdhsd sjdhjsdjs jsdhjsd dffdfd', 1, 0, CAST(0x0000A56000F9F5F8 AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[PriceList] OFF
/****** Object:  Table [dbo].[PostpaidCustCreditLimits]    Script Date: 11/30/2015 16:02:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostpaidCustCreditLimits](
	[Credit_id] [bigint] IDENTITY(1,1) NOT NULL,
	[Cust_id] [bigint] NULL,
	[CreditLimit] [decimal](18, 2) NULL,
	[CreditLimit_Expiration] [datetime] NULL,
	[DateCreated] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_PostpaidCustCreditLimits] PRIMARY KEY CLUSTERED 
(
	[Credit_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Current Credit Limit' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'PostpaidCustCreditLimits', @level2type=N'COLUMN',@level2name=N'IsActive'
GO
SET IDENTITY_INSERT [dbo].[PostpaidCustCreditLimits] ON
INSERT [dbo].[PostpaidCustCreditLimits] ([Credit_id], [Cust_id], [CreditLimit], [CreditLimit_Expiration], [DateCreated], [IsActive]) VALUES (19, 8, CAST(5000.00 AS Decimal(18, 2)), CAST(0x0000A5BB00000000 AS DateTime), CAST(0x0000A5440127FC31 AS DateTime), NULL)
INSERT [dbo].[PostpaidCustCreditLimits] ([Credit_id], [Cust_id], [CreditLimit], [CreditLimit_Expiration], [DateCreated], [IsActive]) VALUES (20, 13, CAST(12000.00 AS Decimal(18, 2)), CAST(0x0000A5DA00000000 AS DateTime), CAST(0x0000A5480128FD2E AS DateTime), NULL)
INSERT [dbo].[PostpaidCustCreditLimits] ([Credit_id], [Cust_id], [CreditLimit], [CreditLimit_Expiration], [DateCreated], [IsActive]) VALUES (21, 8, CAST(1000.00 AS Decimal(18, 2)), CAST(0x0000A5DA00000000 AS DateTime), CAST(0x0000A55C011CDE6D AS DateTime), NULL)
INSERT [dbo].[PostpaidCustCreditLimits] ([Credit_id], [Cust_id], [CreditLimit], [CreditLimit_Expiration], [DateCreated], [IsActive]) VALUES (22, 8, CAST(2000.00 AS Decimal(18, 2)), CAST(0x0000A59D00000000 AS DateTime), CAST(0x0000A55C011D58F9 AS DateTime), NULL)
INSERT [dbo].[PostpaidCustCreditLimits] ([Credit_id], [Cust_id], [CreditLimit], [CreditLimit_Expiration], [DateCreated], [IsActive]) VALUES (23, 8, CAST(500.00 AS Decimal(18, 2)), CAST(0x0000A57200000000 AS DateTime), CAST(0x0000A55C011EA1CB AS DateTime), NULL)
INSERT [dbo].[PostpaidCustCreditLimits] ([Credit_id], [Cust_id], [CreditLimit], [CreditLimit_Expiration], [DateCreated], [IsActive]) VALUES (24, 8, CAST(6000.00 AS Decimal(18, 2)), CAST(0x0000A56000000000 AS DateTime), CAST(0x0000A55C011F8D9A AS DateTime), NULL)
INSERT [dbo].[PostpaidCustCreditLimits] ([Credit_id], [Cust_id], [CreditLimit], [CreditLimit_Expiration], [DateCreated], [IsActive]) VALUES (25, 8, CAST(9000.00 AS Decimal(18, 2)), CAST(0x0000A56000000000 AS DateTime), CAST(0x0000A55C012085B4 AS DateTime), NULL)
INSERT [dbo].[PostpaidCustCreditLimits] ([Credit_id], [Cust_id], [CreditLimit], [CreditLimit_Expiration], [DateCreated], [IsActive]) VALUES (26, 8, CAST(9000.00 AS Decimal(18, 2)), CAST(0x0000A56100000000 AS DateTime), CAST(0x0000A55C0120DE9B AS DateTime), NULL)
INSERT [dbo].[PostpaidCustCreditLimits] ([Credit_id], [Cust_id], [CreditLimit], [CreditLimit_Expiration], [DateCreated], [IsActive]) VALUES (27, 8, CAST(8000.00 AS Decimal(18, 2)), CAST(0x0000A56200000000 AS DateTime), CAST(0x0000A55C0121A7E9 AS DateTime), NULL)
INSERT [dbo].[PostpaidCustCreditLimits] ([Credit_id], [Cust_id], [CreditLimit], [CreditLimit_Expiration], [DateCreated], [IsActive]) VALUES (28, 8, CAST(9000.00 AS Decimal(18, 2)), CAST(0x0000A56500000000 AS DateTime), CAST(0x0000A55C0121E7C4 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[PostpaidCustCreditLimits] OFF
/****** Object:  Table [dbo].[PostpaidAccountCreditLimit]    Script Date: 11/30/2015 16:02:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostpaidAccountCreditLimit](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[Credit_id] [bigint] NULL,
	[AccountNumber] [bigint] NULL,
	[Account_CreditLimit] [decimal](18, 2) NULL,
	[DateCreated] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_PostpaidCreditLimit] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PostpaidAccountCreditLimit] ON
INSERT [dbo].[PostpaidAccountCreditLimit] ([id], [Credit_id], [AccountNumber], [Account_CreditLimit], [DateCreated], [IsActive]) VALUES (41, 19, 4857264, CAST(0.00 AS Decimal(18, 2)), CAST(0x0000A5440128930C AS DateTime), 0)
INSERT [dbo].[PostpaidAccountCreditLimit] ([id], [Credit_id], [AccountNumber], [Account_CreditLimit], [DateCreated], [IsActive]) VALUES (43, 19, 4857264, CAST(500.00 AS Decimal(18, 2)), CAST(0x0000A5440128A3C1 AS DateTime), 0)
INSERT [dbo].[PostpaidAccountCreditLimit] ([id], [Credit_id], [AccountNumber], [Account_CreditLimit], [DateCreated], [IsActive]) VALUES (44, 19, 4857264, CAST(300.00 AS Decimal(18, 2)), CAST(0x0000A544012E1CD1 AS DateTime), 0)
INSERT [dbo].[PostpaidAccountCreditLimit] ([id], [Credit_id], [AccountNumber], [Account_CreditLimit], [DateCreated], [IsActive]) VALUES (45, 19, 4857264, CAST(500.00 AS Decimal(18, 2)), CAST(0x0000A544012FCDD8 AS DateTime), 0)
INSERT [dbo].[PostpaidAccountCreditLimit] ([id], [Credit_id], [AccountNumber], [Account_CreditLimit], [DateCreated], [IsActive]) VALUES (46, 19, 4857264, CAST(450.00 AS Decimal(18, 2)), CAST(0x0000A5440130C108 AS DateTime), 0)
INSERT [dbo].[PostpaidAccountCreditLimit] ([id], [Credit_id], [AccountNumber], [Account_CreditLimit], [DateCreated], [IsActive]) VALUES (47, 19, 4857264, CAST(150.00 AS Decimal(18, 2)), CAST(0x0000A5440130D300 AS DateTime), 0)
INSERT [dbo].[PostpaidAccountCreditLimit] ([id], [Credit_id], [AccountNumber], [Account_CreditLimit], [DateCreated], [IsActive]) VALUES (48, 19, 4857264, CAST(500.00 AS Decimal(18, 2)), CAST(0x0000A5440132E482 AS DateTime), 0)
INSERT [dbo].[PostpaidAccountCreditLimit] ([id], [Credit_id], [AccountNumber], [Account_CreditLimit], [DateCreated], [IsActive]) VALUES (49, 19, 4857264, CAST(300.00 AS Decimal(18, 2)), CAST(0x0000A5440132FEC5 AS DateTime), 0)
INSERT [dbo].[PostpaidAccountCreditLimit] ([id], [Credit_id], [AccountNumber], [Account_CreditLimit], [DateCreated], [IsActive]) VALUES (50, 19, 4857264, CAST(500.00 AS Decimal(18, 2)), CAST(0x0000A5440133C2D2 AS DateTime), 0)
INSERT [dbo].[PostpaidAccountCreditLimit] ([id], [Credit_id], [AccountNumber], [Account_CreditLimit], [DateCreated], [IsActive]) VALUES (51, 19, 4857264, CAST(350.00 AS Decimal(18, 2)), CAST(0x0000A5440135F835 AS DateTime), 0)
INSERT [dbo].[PostpaidAccountCreditLimit] ([id], [Credit_id], [AccountNumber], [Account_CreditLimit], [DateCreated], [IsActive]) VALUES (52, 19, 4857264, CAST(500.00 AS Decimal(18, 2)), CAST(0x0000A5440136146B AS DateTime), 0)
INSERT [dbo].[PostpaidAccountCreditLimit] ([id], [Credit_id], [AccountNumber], [Account_CreditLimit], [DateCreated], [IsActive]) VALUES (53, 19, 4857264, CAST(500.00 AS Decimal(18, 2)), CAST(0x0000A5440137C48C AS DateTime), 0)
INSERT [dbo].[PostpaidAccountCreditLimit] ([id], [Credit_id], [AccountNumber], [Account_CreditLimit], [DateCreated], [IsActive]) VALUES (54, 19, 4857264, CAST(500.00 AS Decimal(18, 2)), CAST(0x0000A5440138EA82 AS DateTime), 0)
INSERT [dbo].[PostpaidAccountCreditLimit] ([id], [Credit_id], [AccountNumber], [Account_CreditLimit], [DateCreated], [IsActive]) VALUES (55, 19, 4857264, CAST(500.00 AS Decimal(18, 2)), CAST(0x0000A54401392C08 AS DateTime), 0)
INSERT [dbo].[PostpaidAccountCreditLimit] ([id], [Credit_id], [AccountNumber], [Account_CreditLimit], [DateCreated], [IsActive]) VALUES (56, 19, 4857264, CAST(500.00 AS Decimal(18, 2)), CAST(0x0000A5440139CFA4 AS DateTime), 0)
INSERT [dbo].[PostpaidAccountCreditLimit] ([id], [Credit_id], [AccountNumber], [Account_CreditLimit], [DateCreated], [IsActive]) VALUES (57, 19, 4857264, CAST(1.00 AS Decimal(18, 2)), CAST(0x0000A54601266874 AS DateTime), 0)
INSERT [dbo].[PostpaidAccountCreditLimit] ([id], [Credit_id], [AccountNumber], [Account_CreditLimit], [DateCreated], [IsActive]) VALUES (58, 19, 4857264, CAST(499.00 AS Decimal(18, 2)), CAST(0x0000A546012672A6 AS DateTime), 0)
INSERT [dbo].[PostpaidAccountCreditLimit] ([id], [Credit_id], [AccountNumber], [Account_CreditLimit], [DateCreated], [IsActive]) VALUES (59, 19, 4857264, CAST(0.00 AS Decimal(18, 2)), CAST(0x0000A54800CA773B AS DateTime), 0)
INSERT [dbo].[PostpaidAccountCreditLimit] ([id], [Credit_id], [AccountNumber], [Account_CreditLimit], [DateCreated], [IsActive]) VALUES (64, 19, 4857251, CAST(0.00 AS Decimal(18, 2)), CAST(0x0000A548012DAACF AS DateTime), 1)
INSERT [dbo].[PostpaidAccountCreditLimit] ([id], [Credit_id], [AccountNumber], [Account_CreditLimit], [DateCreated], [IsActive]) VALUES (65, 19, 4857264, CAST(500.00 AS Decimal(18, 2)), CAST(0x0000A54800C98A84 AS DateTime), 0)
INSERT [dbo].[PostpaidAccountCreditLimit] ([id], [Credit_id], [AccountNumber], [Account_CreditLimit], [DateCreated], [IsActive]) VALUES (66, 19, 4857264, CAST(500.00 AS Decimal(18, 2)), CAST(0x0000A54800C9FB5D AS DateTime), 0)
INSERT [dbo].[PostpaidAccountCreditLimit] ([id], [Credit_id], [AccountNumber], [Account_CreditLimit], [DateCreated], [IsActive]) VALUES (67, 19, 4857251, CAST(300.00 AS Decimal(18, 2)), CAST(0x0000A54800CA7739 AS DateTime), 0)
INSERT [dbo].[PostpaidAccountCreditLimit] ([id], [Credit_id], [AccountNumber], [Account_CreditLimit], [DateCreated], [IsActive]) VALUES (68, 19, 4857264, CAST(0.00 AS Decimal(18, 2)), CAST(0x0000A548012C70D0 AS DateTime), 0)
INSERT [dbo].[PostpaidAccountCreditLimit] ([id], [Credit_id], [AccountNumber], [Account_CreditLimit], [DateCreated], [IsActive]) VALUES (69, 19, 4857251, CAST(500.00 AS Decimal(18, 2)), CAST(0x0000A54800CAFA76 AS DateTime), 0)
INSERT [dbo].[PostpaidAccountCreditLimit] ([id], [Credit_id], [AccountNumber], [Account_CreditLimit], [DateCreated], [IsActive]) VALUES (70, 19, 4857264, CAST(300.00 AS Decimal(18, 2)), CAST(0x0000A54800CB4638 AS DateTime), 0)
INSERT [dbo].[PostpaidAccountCreditLimit] ([id], [Credit_id], [AccountNumber], [Account_CreditLimit], [DateCreated], [IsActive]) VALUES (71, 19, 4857251, CAST(100.00 AS Decimal(18, 2)), CAST(0x0000A54800CB5B98 AS DateTime), 0)
INSERT [dbo].[PostpaidAccountCreditLimit] ([id], [Credit_id], [AccountNumber], [Account_CreditLimit], [DateCreated], [IsActive]) VALUES (72, 19, 4857264, CAST(100.00 AS Decimal(18, 2)), CAST(0x0000A5480120B89B AS DateTime), 0)
INSERT [dbo].[PostpaidAccountCreditLimit] ([id], [Credit_id], [AccountNumber], [Account_CreditLimit], [DateCreated], [IsActive]) VALUES (73, 20, 4857270, CAST(5000.00 AS Decimal(18, 2)), CAST(0x0000A54801291783 AS DateTime), 1)
INSERT [dbo].[PostpaidAccountCreditLimit] ([id], [Credit_id], [AccountNumber], [Account_CreditLimit], [DateCreated], [IsActive]) VALUES (74, 19, 4857264, CAST(3000.00 AS Decimal(18, 2)), CAST(0x0000A548012C56E6 AS DateTime), 0)
INSERT [dbo].[PostpaidAccountCreditLimit] ([id], [Credit_id], [AccountNumber], [Account_CreditLimit], [DateCreated], [IsActive]) VALUES (75, 19, 4857251, CAST(300.00 AS Decimal(18, 2)), CAST(0x0000A548012C70CE AS DateTime), 0)
INSERT [dbo].[PostpaidAccountCreditLimit] ([id], [Credit_id], [AccountNumber], [Account_CreditLimit], [DateCreated], [IsActive]) VALUES (76, 19, 4857264, CAST(3000.00 AS Decimal(18, 2)), CAST(0x0000A548012CF81B AS DateTime), 1)
INSERT [dbo].[PostpaidAccountCreditLimit] ([id], [Credit_id], [AccountNumber], [Account_CreditLimit], [DateCreated], [IsActive]) VALUES (77, 19, 4857264, CAST(100.00 AS Decimal(18, 2)), CAST(0x0000A548012DA959 AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[PostpaidAccountCreditLimit] OFF
/****** Object:  Table [dbo].[Permissions]    Script Date: 11/30/2015 16:02:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permissions](
	[Permission_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[PermissionName] [nvarchar](50) NULL,
	[PermissionDescription] [nvarchar](250) NULL,
	[PermissionIsSelected] [bit] NOT NULL CONSTRAINT [DF_Permissions_PermissionIsSelected]  DEFAULT ((0)),
	[IsAddApproved] [bit] NULL,
	[IsEditApproved] [bit] NULL,
	[IsDelApproved] [bit] NULL,
 CONSTRAINT [PK_Permissions] PRIMARY KEY CLUSTERED 
(
	[Permission_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Permissions] ON
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (1, N'Can_Create_Customer', N'Can be able to register new customers', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (2, N'Can_Edit_Customer', N'Can be able to modify details of customer', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (3, N'Can_Delete_Customer', N'Can be able to delete a customer', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (4, N'Can_Create_CustomerEmployeeDept', N'Can be able to create department of employee', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (5, N'Can_Delete_CustomerEmployeeDept', N'Can be able to delete department of employee', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (6, N'Can_Edit_CustomerEmployeeDept', N'Can be able to modify department of employee', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (7, N'Can_Assign_CardsToCustomer', N'Can be able to assign cards to customer', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (8, N'Can_Assign_CardsToCustomerEmployeeDept', N'Can be able to assign cards to department of employee', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (9, N'Can_UnAssign_AssginCustomerCards', N'Can be able to unassign cards to customer', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (10, N'Can_UnAssign_AssignedCustomerDeptCards', N'Can be able to unassign cards to department of employee', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (11, N'Can_Define_CustomerOverallUsageLimits', N'Can be able to define overall usage limit ', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (12, N'Can_upload_Card_Data', N'Can be able to upload card data', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (13, N'Can_Activate_Cards', N'Can be able to activate cards', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (14, N'Can_Topup_Cards', N'Can be able to topup cards', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (15, N'Can_Define_CardUsageLimits', N'Can be able to define card usage limit', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (16, N'Can_Create_Role', N'Can be able to create roles', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (17, N'Can_Assign_PermissionsToRoles', N'Can be able to assign permissions to roles', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (18, N'Can_Delete_Roles', N'Can be able to delete roles', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (19, N'Can_Create_Staff', N'Can be able to register new staff', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (20, N'Can_Edit_Staff', N'Can be able to modify details of staff', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (21, N'Can_Delete_Staff', N'Can be able to delete staff', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (22, N'Can_Create_Channel', N'Can be able to create channel', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (23, N'Can_Edit_Channel', N'Can be able to modify details of a channel', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (24, N'Can_Delete_Channel', N'Can be able to delete channel', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (25, N'Can_Define_ChannelProductPrices', N'Can be able to define prices of products', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (26, N'Can_Edit_ChannelProductPrices', N'Can be able to modify prices of products', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (27, N'Can_Delete_ChannelProductPrices', N'Can be able to delete product prices', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (28, N'Can_Create_ChannelType', N'Can be able create channel types', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (29, N'Can_Edit_ChannelType', N'Can be able to modify type of channel', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (30, N'Can_Delete_ChannelType', N'Can be able to delete channel types', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (31, N'Can_Update_GeneralSettings', N'Can be able to update general settings', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (32, N'Can_Create_Product', N'Can be able to create product', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (33, N'Can_Edit_Product', N'Can be able to modify product', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (34, N'Can_Delete_Product', N'Can be able to delete product', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (35, N'Can_Create_ProductType', N'Can be able to create product types', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (36, N'Can_Edit_ProductType', N'Can be able to modify product type', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (37, N'Can_Delete_ProductType', N'Can be able to delete product type', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (38, N'Can_Create_Activity', N'Can be able to create activity', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (39, N'Can_Edit_Activity', N'Can be able to modify activity', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (40, N'Can_Delete_Activity', N'Can be able to delete activity', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (41, N'Can_Create_ActivityType', N'Can be able to create activity types', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (42, N'Can_Edit_ActivityType', N'Can be able to modify activity types', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (43, N'Can_Delete_ActivityType', N'Can be able to delete activity type', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (44, N'Can_Create_TerminalGadgets', N'Can be able to create terminal gadgets', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (45, N'Can_Edit_TerminalGadgets', N'Can be able to modify terminal gadgets', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (46, N'Can_Delete_TerminalGadgets', N'Can be able to delete terminal gadgets', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (47, N'Can_set_CurrencyConversionRate', N'Can be able to set currency conversion rate', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (48, N'Can_Create_Classification', N'Can be able to create classification', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (49, N'Can_Edit_Classification', N'Can be able to modify classification', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (50, N'Can_Delete_Classification', N'Can be able to delete classification', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (51, N'Can_Create_LoyaltyProgram', N'Can be able to create loyalty program', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (52, N'Can_Edit_LoyaltyProgram', N'Can be able to modify loyalty program', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (53, N'Can_Delete_LoyaltyProgram', N'Can be able to delete loyalty program', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (54, N'Can_Login_to_Terminal', N'Can be able to login terminal software', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (55, N'Can_MakeASale', N'Can be able to make a sale', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (56, N'Can_Reset_CardPIN', N'Can be able to reset PIN of card', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (57, N'Can_Reset_CustomerPassword', N'Can be able to reset password of customer', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (1002, N'Can_Edit_Role', N'Can edit the role name and description but not permissions', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (1003, N'Can_Edit_CustomerCards', N'Can edit customer cards', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (1004, N'Can_Delete_Formula', N'Can_Delete_Formula', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (1005, N'Can_Edit_Formula', N'Can_Edit_Formula', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (1006, N'Can_Create_Formula', N'Can_Create_Formula', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (1007, N'Can_Create_Action', N'Can_Create_Action', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (1008, N'Can_Edit_Action', N'Can_Edit_Action', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (1009, N'Can_Delete_Action', N'Can_Delete_Action', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (1010, N'Can_Create_Event', N'Can_Create_Event', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (1011, N'Can_Edit_Event', N'Can_Edit_Event', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (1012, N'Can_Delete_Event', N'Can_Delete_Event', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (1013, N'Can_Edit_Comtemplates', N'Can Edit Communication Templates', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (1014, N'Can_log_in_to_portal', N'Can be able to log in to portal', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (1015, N'Can_Topup_Account', N'Can be able to topup accounts', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (1016, N'Can_Define_AccountUsageLimits', N'Can Define Account Usage Limits', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (1017, N'Can_Login_to_CustomerPortal', N'Can login to Customer Portal', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (1018, N'Can_Assign_AccountsToCustomerEmployeeDept', N'Can Assign Accounts to Customer''s Employee', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (1019, N'Can_Create_ProductProperties', N'Can Create Product Properties', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (1020, N'Can_Edit_ProductProperties', N'Can Edit Product Properties', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (1021, N'Can_Delete_ProductProperties', N'Can Delete Product Properties', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (1022, N'Can_Create_Schedule', N'Can_Create_Schedule', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (1023, N'Can_Edit_Schedule', N'Can_Edit_Schedule', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (1024, N'Can_Delete_Schedule', N'Can_Delete_Schedule', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (1028, N'Can_Set_Price_Schedule_for_Channel', N'Can_Set_Price_Schedule_for_Channel', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (1029, N'Can_Create_Account_Type', N'Can_Create_Account_Type', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (1030, N'Can_Edit_Account_Type', N'Can_Edit_Account_Type', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (1031, N'Can_Delete_Account_Type', N'Can_Delete_Account_Type', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (1032, N'Can_Activate_Account', N'Can_Activate_Account', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (1033, N'Can_Edit_Account', N'Can_Edit_Account', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (1034, N'Can_Transfer_Account', N'Can_Transfer_Account', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (1035, N'Can_Add_Vehicle_Make', N'Can_Add_Vehicle_Make', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (1036, N'Can_Edit_Vehicle_Make', N'Can_Edit_Vehicle_Make', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (1037, N'Can_Delete_Vehicle_Make', N'Can_Delete_Vehicle_Make', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (1038, N'Can_Add_Vehicle_Model', N'Can_Add_Vehicle_Model', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (1039, N'Can_Edit_Vehicle_Model', N'Can_Edit_Vehicle_Model', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (1040, N'Can_Delete_Vehicle_Model', N'Can_Delete_Vehicle_Model', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (1041, N'Can_Add_Customer_Vehicle', N'Can_Add_Customer_Vehicle', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (1042, N'Can_Edit_Customer_Vehicle', N'Can_Edit_Customer_Vehicle', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (1043, N'Can_Delete_Customer_Vehicle', N'Can_Delete_Customer_Vehicle', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (1044, N'Can_Add_Supplementary_Actions', N'Can_Add_Supplementary_Actions', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (1045, N'Can_Add_Action_Items', N'Can_Add_Action_Items', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (1046, N'Can_Edit_Action_Items', N'Can_Edit_Action_Items', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (1047, N'Can_Delete_Action_Items', N'Can_Delete_Action_Items', 0, NULL, NULL, NULL)
GO
print 'Processed 100 total records'
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (1048, N'Can_Create_Customer_Type', N'Can_Create_Customer_Type', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (1049, N'Can_Edit_Customer_Type', N'Can_Edit_Customer_Type', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (1050, N'Can_Delete_Customer_Type', N'Can_Delete_Customer_Type', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (1051, N'Can_Set_CreditLimit_Postpaid_Customers', N'Can_Set_CreditLimit_Postpaid_Customers', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (1052, N'Can_Make_Action_Item_Default', N'Can_Make_Action_Item_Default', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (1053, N'Can_Make_LoyaltyProgram_Exclusive', N'Can_Make_LoyaltyProgram_Exclusive', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (1054, N'Can_Make_LoyaltyProgram_Continued', N'Can_Make_LoyaltyProgram_Continued', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (1055, N'Can_Create_PriceList', N'Can_Create_PriceList', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (1056, N'Can_Edit_PriceList', N'Can_Edit_PriceList', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (1057, N'Can_Delete_PriceList', N'Can_Delete_PriceList', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (1058, N'Can_Assign_PriceList', N'Can_Assign_PriceList', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (1059, N'Can_Unassign_PriceList', N'Can_Unassign_PriceList', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (1060, N'Can_Unassign_VehicleAccount', N'Can Unassign Account from Vehicle', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (1061, N'Can_Send_Message', N'Can send message to customers', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (1062, N'Can_Add_CustomFields', N'Can_Add_CustomFields', 0, NULL, NULL, NULL)
INSERT [dbo].[Permissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (1063, N'Can_Make_PriceList_Default', N'Can_Make_PriceList_Default', 0, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Permissions] OFF
/****** Object:  Table [dbo].[Periods]    Script Date: 11/30/2015 16:02:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Periods](
	[Period_id] [bigint] IDENTITY(1,1) NOT NULL,
	[LastDate_In_Period] [datetime] NULL,
 CONSTRAINT [PK_Periods] PRIMARY KEY CLUSTERED 
(
	[Period_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Periods] ON
INSERT [dbo].[Periods] ([Period_id], [LastDate_In_Period]) VALUES (1, CAST(0x0000A54200000000 AS DateTime))
INSERT [dbo].[Periods] ([Period_id], [LastDate_In_Period]) VALUES (2, CAST(0x0000A56000000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[Periods] OFF
/****** Object:  Table [dbo].[PaymentMode]    Script Date: 11/30/2015 16:02:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentMode](
	[PaymentMode_id] [bigint] IDENTITY(1,1) NOT NULL,
	[PaymentMode_Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_PaymentMode] PRIMARY KEY CLUSTERED 
(
	[PaymentMode_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[PaymentMode] ON
INSERT [dbo].[PaymentMode] ([PaymentMode_id], [PaymentMode_Name]) VALUES (1, N'Cheque')
INSERT [dbo].[PaymentMode] ([PaymentMode_id], [PaymentMode_Name]) VALUES (2, N'Cash')
INSERT [dbo].[PaymentMode] ([PaymentMode_id], [PaymentMode_Name]) VALUES (3, N'MPesa')
SET IDENTITY_INSERT [dbo].[PaymentMode] OFF
/****** Object:  Table [dbo].[Payment_Terms]    Script Date: 11/30/2015 16:02:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Payment_Terms](
	[PaymentTerm_id] [bigint] IDENTITY(1,1) NOT NULL,
	[PaymentTerm_Name] [varchar](50) NULL,
	[DayInFollowingMonth] [int] NULL,
	[DaysBeforeDue] [int] NULL,
 CONSTRAINT [PK_Payment_Terms] PRIMARY KEY CLUSTERED 
(
	[PaymentTerm_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Payment_Terms] ON
INSERT [dbo].[Payment_Terms] ([PaymentTerm_id], [PaymentTerm_Name], [DayInFollowingMonth], [DaysBeforeDue]) VALUES (1, N'Cash Only', 1, 0)
INSERT [dbo].[Payment_Terms] ([PaymentTerm_id], [PaymentTerm_Name], [DayInFollowingMonth], [DaysBeforeDue]) VALUES (2, N'Payment due within 7 days', 7, 0)
INSERT [dbo].[Payment_Terms] ([PaymentTerm_id], [PaymentTerm_Name], [DayInFollowingMonth], [DaysBeforeDue]) VALUES (3, N'Due By End Of The Following Month', 0, 30)
INSERT [dbo].[Payment_Terms] ([PaymentTerm_id], [PaymentTerm_Name], [DayInFollowingMonth], [DaysBeforeDue]) VALUES (4, N'Due 20th Of the Following Month', 0, 20)
SET IDENTITY_INSERT [dbo].[Payment_Terms] OFF
/****** Object:  Table [dbo].[MessageTypes]    Script Date: 11/30/2015 16:02:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MessageTypes](
	[message_type_id] [bigint] IDENTITY(1,1) NOT NULL,
	[message_type] [varchar](10) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_MessageTypes] PRIMARY KEY CLUSTERED 
(
	[message_type_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[MessageTypes] ON
INSERT [dbo].[MessageTypes] ([message_type_id], [message_type], [IsActive]) VALUES (1, N'Email', 1)
INSERT [dbo].[MessageTypes] ([message_type_id], [message_type], [IsActive]) VALUES (2, N'SMS', 1)
SET IDENTITY_INSERT [dbo].[MessageTypes] OFF
/****** Object:  Table [dbo].[Message]    Script Date: 11/30/2015 16:02:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Message](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[from_id] [bigint] NULL,
	[customer_type_id] [bigint] NULL,
	[message_subject] [varchar](50) NULL,
	[message_body] [text] NULL,
	[message_date] [datetime] NULL,
	[message_type] [bigint] NULL,
 CONSTRAINT [PK_message] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Message] ON
INSERT [dbo].[Message] ([id], [from_id], [customer_type_id], [message_subject], [message_body], [message_date], [message_type]) VALUES (1, 1, 1, N'This is test message', N'This is test', CAST(0x0000A55D012CC718 AS DateTime), 1)
INSERT [dbo].[Message] ([id], [from_id], [customer_type_id], [message_subject], [message_body], [message_date], [message_type]) VALUES (2, 1, 1, N'Test', N'This is another test', CAST(0x0000A55D01350780 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Message] OFF
/****** Object:  Table [dbo].[MaskType]    Script Date: 11/30/2015 16:02:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MaskType](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[Mask_Type] [varchar](50) NULL,
	[Mask_IsDeleted] [bit] NULL,
 CONSTRAINT [PK_MaskType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[MaskType] ON
INSERT [dbo].[MaskType] ([id], [Mask_Type], [Mask_IsDeleted]) VALUES (1, N'Card Number', 0)
INSERT [dbo].[MaskType] ([id], [Mask_Type], [Mask_IsDeleted]) VALUES (2, N'Telephone Number', 0)
SET IDENTITY_INSERT [dbo].[MaskType] OFF
/****** Object:  Table [dbo].[Loyalty_Scheme]    Script Date: 11/30/2015 16:02:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loyalty_Scheme](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[Loyalty_Scheme_Name] [nvarchar](50) NULL,
	[loyaltyprogram_id] [bigint] NULL,
	[commprotocol_id] [bigint] NULL,
	[IsApproved] [bit] NULL,
	[IsExclusive] [bit] NULL,
	[IsDiscontinued] [bit] NULL,
 CONSTRAINT [PK_loyalty_scheme] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Loyalty_Program]    Script Date: 11/30/2015 16:02:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loyalty_Program](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[Loyalty_Program_Name] [nvarchar](50) NULL,
	[time_period] [bigint] NULL,
	[period_type] [bigint] NULL,
	[date_created] [datetime] NULL,
	[day] [bigint] NULL,
	[start_time] [time](7) NULL,
	[end_time] [time](7) NULL,
	[action_id] [bigint] NULL,
	[commprotocol_id] [bigint] NULL,
	[tierlevel_id] [bigint] NULL,
	[tierrule_id] [bigint] NULL,
	[IsApproved] [bit] NULL,
	[IsExclusive] [bit] NULL,
	[IsDiscontinued] [bit] NULL,
	[IsAddApproved] [bit] NULL,
	[IsDelApproved] [bit] NULL,
	[IsEditApproved] [bit] NULL,
 CONSTRAINT [PK_Loyalty_Program] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Day/Week/Month/Year' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Loyalty_Program', @level2type=N'COLUMN',@level2name=N'period_type'
GO
SET IDENTITY_INSERT [dbo].[Loyalty_Program] ON
INSERT [dbo].[Loyalty_Program] ([id], [Loyalty_Program_Name], [time_period], [period_type], [date_created], [day], [start_time], [end_time], [action_id], [commprotocol_id], [tierlevel_id], [tierrule_id], [IsApproved], [IsExclusive], [IsDiscontinued], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (1, N'Loyal one', 11, 76, CAST(0x0000A4B6010809A5 AS DateTime), 56, NULL, NULL, 1, NULL, 2, 1, 0, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[Loyalty_Program] ([id], [Loyalty_Program_Name], [time_period], [period_type], [date_created], [day], [start_time], [end_time], [action_id], [commprotocol_id], [tierlevel_id], [tierrule_id], [IsApproved], [IsExclusive], [IsDiscontinued], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (2, N'fsddsf', 1, 76, CAST(0x0000A4B601091423 AS DateTime), 56, NULL, NULL, 1, NULL, 1, 1, 0, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[Loyalty_Program] ([id], [Loyalty_Program_Name], [time_period], [period_type], [date_created], [day], [start_time], [end_time], [action_id], [commprotocol_id], [tierlevel_id], [tierrule_id], [IsApproved], [IsExclusive], [IsDiscontinued], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (3, N'Test', 1, 76, CAST(0x0000A4B800C25A74 AS DateTime), 56, NULL, NULL, 1, NULL, 1, 1, 0, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[Loyalty_Program] ([id], [Loyalty_Program_Name], [time_period], [period_type], [date_created], [day], [start_time], [end_time], [action_id], [commprotocol_id], [tierlevel_id], [tierrule_id], [IsApproved], [IsExclusive], [IsDiscontinued], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (4, N'xyz', 1, 76, CAST(0x0000A4B800C30A91 AS DateTime), 56, NULL, NULL, 1, NULL, 1, 1, 0, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[Loyalty_Program] ([id], [Loyalty_Program_Name], [time_period], [period_type], [date_created], [day], [start_time], [end_time], [action_id], [commprotocol_id], [tierlevel_id], [tierrule_id], [IsApproved], [IsExclusive], [IsDiscontinued], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (5, N'final', 1, 76, CAST(0x0000A4B800C4C1FA AS DateTime), 56, CAST(0x070008D6E8290000 AS Time), CAST(0x0700E03495640000 AS Time), 1, NULL, 1, 1, 0, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[Loyalty_Program] ([id], [Loyalty_Program_Name], [time_period], [period_type], [date_created], [day], [start_time], [end_time], [action_id], [commprotocol_id], [tierlevel_id], [tierrule_id], [IsApproved], [IsExclusive], [IsDiscontinued], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (6, N'Jaasdhs', 1, 76, CAST(0x0000A4B800C56169 AS DateTime), 56, CAST(0x070048F9F66C0000 AS Time), CAST(0x0700E80A7E8E0000 AS Time), 1, NULL, 1, 1, 0, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[Loyalty_Program] ([id], [Loyalty_Program_Name], [time_period], [period_type], [date_created], [day], [start_time], [end_time], [action_id], [commprotocol_id], [tierlevel_id], [tierrule_id], [IsApproved], [IsExclusive], [IsDiscontinued], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (7, N'sdsad', 1, 76, CAST(0x0000A4B800E4C2E1 AS DateTime), 56, CAST(0x07005CE1547C0000 AS Time), CAST(0x0700BAB1077D0000 AS Time), 1, NULL, 1, 1, 0, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[Loyalty_Program] ([id], [Loyalty_Program_Name], [time_period], [period_type], [date_created], [day], [start_time], [end_time], [action_id], [commprotocol_id], [tierlevel_id], [tierrule_id], [IsApproved], [IsExclusive], [IsDiscontinued], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (8, N'wsdasd', 2, 79, CAST(0x0000A4EC010BC70F AS DateTime), -1, CAST(0x0700E2525B420000 AS Time), CAST(0x0700F2FE2C960000 AS Time), 1, 3, 1, 1, 0, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[Loyalty_Program] ([id], [Loyalty_Program_Name], [time_period], [period_type], [date_created], [day], [start_time], [end_time], [action_id], [commprotocol_id], [tierlevel_id], [tierrule_id], [IsApproved], [IsExclusive], [IsDiscontinued], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (9, N'PogramX', 2, 76, CAST(0x0000A4EC010D10EF AS DateTime), -1, CAST(0x07005A9426450000 AS Time), CAST(0x070032F3D27F0000 AS Time), 1, 3, 1, 1, 0, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[Loyalty_Program] ([id], [Loyalty_Program_Name], [time_period], [period_type], [date_created], [day], [start_time], [end_time], [action_id], [commprotocol_id], [tierlevel_id], [tierrule_id], [IsApproved], [IsExclusive], [IsDiscontinued], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (10, N'ProgramX', 1, 76, CAST(0x0000A54800F8FA35 AS DateTime), -1, CAST(0x0700DCC9A04F0000 AS Time), CAST(0x0700E49F89790000 AS Time), 7, NULL, 1, 1, 0, 1, 0, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Loyalty_Program] OFF
/****** Object:  Table [dbo].[LnkCustomer_Role_Permission]    Script Date: 11/30/2015 16:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LnkCustomer_Role_Permission](
	[Lnk_Role_Permission_id] [bigint] IDENTITY(1,1) NOT NULL,
	[Role_id] [bigint] NULL,
	[Permission_id] [bigint] NULL,
	[Lnk_DateCreated] [datetime] NULL,
 CONSTRAINT [PK_LnkCustomer_Role_Permission] PRIMARY KEY CLUSTERED 
(
	[Lnk_Role_Permission_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[LnkCustomer_Role_Permission] ON
INSERT [dbo].[LnkCustomer_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1, 3, 9846, NULL)
INSERT [dbo].[LnkCustomer_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (2, 3, 9847, NULL)
INSERT [dbo].[LnkCustomer_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3, 3, 9848, NULL)
INSERT [dbo].[LnkCustomer_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (4, 3, 9849, NULL)
INSERT [dbo].[LnkCustomer_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (5, 3, 9850, NULL)
INSERT [dbo].[LnkCustomer_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (6, 3, 9851, NULL)
INSERT [dbo].[LnkCustomer_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (7, 4, 9850, NULL)
SET IDENTITY_INSERT [dbo].[LnkCustomer_Role_Permission] OFF
/****** Object:  Table [dbo].[Lnk_Role_Permission]    Script Date: 11/30/2015 16:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lnk_Role_Permission](
	[Lnk_Role_Permission_id] [bigint] IDENTITY(1,1) NOT NULL,
	[Role_id] [bigint] NULL,
	[Permission_id] [bigint] NULL,
	[Lnk_DateCreated] [datetime] NULL,
 CONSTRAINT [PK_Lnk_Role_Permission] PRIMARY KEY CLUSTERED 
(
	[Lnk_Role_Permission_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Link between Role and Permission tables' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Lnk_Role_Permission'
GO
SET IDENTITY_INSERT [dbo].[Lnk_Role_Permission] ON
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (217, 0, 1, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (218, 0, 2, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (219, 0, 3, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (238, 11, 1, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (239, 11, 2, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (240, 11, 3, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (241, 11, 4, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (242, 11, 5, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (243, 11, 6, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (244, 11, 7, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (245, 11, 8, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (246, 11, 9, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (247, 11, 10, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (248, 11, 11, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (249, 11, 12, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (250, 11, 13, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (251, 11, 14, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (252, 11, 15, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (253, 11, 16, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (254, 11, 17, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (255, 11, 18, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (256, 11, 19, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (257, 11, 20, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (258, 11, 21, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (259, 11, 22, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (260, 11, 23, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (261, 11, 24, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (262, 11, 25, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (263, 11, 26, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (264, 11, 27, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (265, 11, 28, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (266, 11, 29, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (267, 11, 30, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (268, 11, 31, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (269, 11, 32, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (270, 11, 33, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (271, 11, 34, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (272, 11, 35, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (273, 11, 36, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (274, 11, 37, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (275, 11, 38, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (276, 11, 39, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (277, 11, 40, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (278, 11, 41, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (279, 11, 42, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (280, 11, 43, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (281, 11, 44, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (282, 11, 45, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (283, 11, 46, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (284, 11, 47, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (285, 11, 48, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (286, 11, 49, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (287, 11, 50, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (288, 11, 51, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (289, 11, 52, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (290, 11, 53, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (291, 11, 54, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (292, 11, 55, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (293, 11, 56, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (294, 11, 57, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (295, 11, 1002, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (948, 12, 3, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1268, 2, 1, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1269, 2, 2, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1270, 2, 3, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1271, 2, 4, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1272, 2, 5, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1273, 2, 6, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1274, 2, 7, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1275, 2, 8, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1276, 2, 9, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1277, 2, 10, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1278, 2, 11, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1279, 2, 12, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1280, 2, 13, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1281, 2, 14, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1282, 2, 15, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1283, 2, 16, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1284, 2, 17, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1285, 2, 18, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1286, 2, 19, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1287, 2, 20, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1288, 2, 21, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1289, 2, 22, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1290, 2, 23, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1291, 2, 24, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1292, 2, 25, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1293, 2, 26, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1294, 2, 27, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1295, 2, 28, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1296, 2, 29, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1297, 2, 30, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1298, 2, 31, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1299, 2, 32, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1300, 2, 33, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1301, 2, 34, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1302, 2, 35, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1303, 2, 36, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1304, 2, 37, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1305, 2, 38, NULL)
GO
print 'Processed 100 total records'
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1306, 2, 39, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1307, 2, 40, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1308, 2, 41, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1309, 2, 42, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1310, 2, 43, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1311, 2, 44, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1312, 2, 45, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1313, 2, 46, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1314, 2, 47, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1315, 2, 48, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1316, 2, 49, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1317, 2, 50, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1318, 2, 51, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1319, 2, 52, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1320, 2, 53, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1321, 2, 54, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1322, 2, 55, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1323, 2, 56, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1324, 2, 57, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1325, 2, 1002, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1326, 2, 1003, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1327, 2, 1004, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1328, 2, 1005, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1329, 2, 1006, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1330, 2, 1007, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1331, 2, 1008, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1332, 2, 1009, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1333, 2, 1010, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1334, 2, 1011, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1335, 2, 1012, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1336, 2, 1013, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1337, 2, 1014, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1568, 13, 1016, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1569, 13, 1015, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1570, 13, 1018, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1571, 13, 4, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1572, 13, 5, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1573, 13, 6, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1574, 13, 1017, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1731, 10, 2, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1732, 10, 3, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1733, 10, 4, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1734, 10, 1002, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1735, 10, 1017, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1736, 9, 1, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1737, 9, 4, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (1738, 9, 11, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (2961, 1, 1, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (2962, 1, 2, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (2963, 1, 3, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (2964, 1, 4, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (2965, 1, 5, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (2966, 1, 6, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (2967, 1, 7, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (2968, 1, 8, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (2969, 1, 9, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (2970, 1, 10, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (2971, 1, 11, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (2972, 1, 12, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (2973, 1, 13, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (2974, 1, 14, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (2975, 1, 15, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (2976, 1, 16, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (2977, 1, 17, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (2978, 1, 18, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (2979, 1, 19, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (2980, 1, 20, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (2981, 1, 21, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (2982, 1, 22, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (2983, 1, 23, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (2984, 1, 24, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (2985, 1, 25, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (2986, 1, 26, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (2987, 1, 27, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (2988, 1, 28, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (2989, 1, 29, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (2990, 1, 30, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (2991, 1, 31, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (2992, 1, 32, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (2993, 1, 33, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (2994, 1, 34, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (2995, 1, 35, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (2996, 1, 36, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (2997, 1, 37, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (2998, 1, 38, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (2999, 1, 39, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3000, 1, 40, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3001, 1, 41, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3002, 1, 42, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3003, 1, 43, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3004, 1, 44, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3005, 1, 45, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3006, 1, 46, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3007, 1, 47, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3008, 1, 48, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3009, 1, 49, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3010, 1, 50, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3011, 1, 51, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3012, 1, 52, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3013, 1, 53, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3014, 1, 54, NULL)
GO
print 'Processed 200 total records'
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3015, 1, 55, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3016, 1, 56, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3017, 1, 57, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3018, 1, 1002, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3019, 1, 1003, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3020, 1, 1004, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3021, 1, 1005, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3022, 1, 1006, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3023, 1, 1007, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3024, 1, 1008, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3025, 1, 1009, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3026, 1, 1010, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3027, 1, 1011, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3028, 1, 1012, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3029, 1, 1013, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3030, 1, 1014, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3031, 1, 1015, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3032, 1, 1016, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3033, 1, 1017, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3034, 1, 1018, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3035, 1, 1019, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3036, 1, 1020, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3037, 1, 1021, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3038, 1, 1022, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3039, 1, 1023, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3040, 1, 1024, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3041, 1, 1028, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3042, 1, 1029, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3043, 1, 1030, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3044, 1, 1031, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3045, 1, 1032, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3046, 1, 1033, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3047, 1, 1034, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3048, 1, 1035, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3049, 1, 1036, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3050, 1, 1037, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3051, 1, 1038, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3052, 1, 1039, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3053, 1, 1040, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3054, 1, 1041, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3055, 1, 1042, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3056, 1, 1043, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3057, 1, 1044, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3058, 1, 1045, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3059, 1, 1046, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3060, 1, 1047, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3061, 1, 1048, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3062, 1, 1049, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3063, 1, 1050, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3064, 1, 1051, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3065, 1, 1052, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3066, 1, 1053, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3067, 1, 1054, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3068, 1, 1055, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3069, 1, 1056, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3070, 1, 1057, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3071, 1, 1058, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3072, 1, 1059, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3073, 1, 1060, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3074, 1, 1061, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3075, 1, 1062, NULL)
INSERT [dbo].[Lnk_Role_Permission] ([Lnk_Role_Permission_id], [Role_id], [Permission_id], [Lnk_DateCreated]) VALUES (3076, 1, 1063, NULL)
SET IDENTITY_INSERT [dbo].[Lnk_Role_Permission] OFF
/****** Object:  Table [dbo].[Lnk_Products_Properties]    Script Date: 11/30/2015 16:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lnk_Products_Properties](
	[Lnk_Products_Properties_id] [bigint] IDENTITY(1,1) NOT NULL,
	[Product_id] [bigint] NULL,
	[Product_Property_id] [bigint] NULL,
	[Product_Property_DateCreated] [datetime] NULL,
	[IsActive] [bit] NULL CONSTRAINT [DF_Lnk_Products_Properties_IsActive]  DEFAULT ((1)),
	[IsDeleted] [bit] NULL CONSTRAINT [DF_Lnk_Products_Properties_IsDeleted]  DEFAULT ((0)),
 CONSTRAINT [PK_Lnk_Products_Properties] PRIMARY KEY CLUSTERED 
(
	[Lnk_Products_Properties_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Lnk_Products_Properties] ON
INSERT [dbo].[Lnk_Products_Properties] ([Lnk_Products_Properties_id], [Product_id], [Product_Property_id], [Product_Property_DateCreated], [IsActive], [IsDeleted]) VALUES (6, 1, 1, CAST(0x0000A49300EDAED9 AS DateTime), 1, 0)
INSERT [dbo].[Lnk_Products_Properties] ([Lnk_Products_Properties_id], [Product_id], [Product_Property_id], [Product_Property_DateCreated], [IsActive], [IsDeleted]) VALUES (7, 1, 2, CAST(0x0000A49300EDAEE2 AS DateTime), 1, 0)
INSERT [dbo].[Lnk_Products_Properties] ([Lnk_Products_Properties_id], [Product_id], [Product_Property_id], [Product_Property_DateCreated], [IsActive], [IsDeleted]) VALUES (9, 2, 1, CAST(0x0000A49300F3B4AD AS DateTime), 1, 0)
INSERT [dbo].[Lnk_Products_Properties] ([Lnk_Products_Properties_id], [Product_id], [Product_Property_id], [Product_Property_DateCreated], [IsActive], [IsDeleted]) VALUES (10, 2, 2, CAST(0x0000A49300F3B4B0 AS DateTime), 1, 0)
INSERT [dbo].[Lnk_Products_Properties] ([Lnk_Products_Properties_id], [Product_id], [Product_Property_id], [Product_Property_DateCreated], [IsActive], [IsDeleted]) VALUES (13, 3, 1, CAST(0x0000A49800F4DE4D AS DateTime), 1, 0)
INSERT [dbo].[Lnk_Products_Properties] ([Lnk_Products_Properties_id], [Product_id], [Product_Property_id], [Product_Property_DateCreated], [IsActive], [IsDeleted]) VALUES (14, 3, 2, CAST(0x0000A49800F4DE5C AS DateTime), 1, 0)
INSERT [dbo].[Lnk_Products_Properties] ([Lnk_Products_Properties_id], [Product_id], [Product_Property_id], [Product_Property_DateCreated], [IsActive], [IsDeleted]) VALUES (15, 5, 1, CAST(0x0000A49C00C13348 AS DateTime), 1, 0)
INSERT [dbo].[Lnk_Products_Properties] ([Lnk_Products_Properties_id], [Product_id], [Product_Property_id], [Product_Property_DateCreated], [IsActive], [IsDeleted]) VALUES (16, 4, 1, CAST(0x0000A49C00C13348 AS DateTime), 1, 0)
INSERT [dbo].[Lnk_Products_Properties] ([Lnk_Products_Properties_id], [Product_id], [Product_Property_id], [Product_Property_DateCreated], [IsActive], [IsDeleted]) VALUES (17, 4, 2, CAST(0x0000A49C00C13349 AS DateTime), 1, 0)
INSERT [dbo].[Lnk_Products_Properties] ([Lnk_Products_Properties_id], [Product_id], [Product_Property_id], [Product_Property_DateCreated], [IsActive], [IsDeleted]) VALUES (18, 5, 2, CAST(0x0000A49C00C13349 AS DateTime), 1, 0)
INSERT [dbo].[Lnk_Products_Properties] ([Lnk_Products_Properties_id], [Product_id], [Product_Property_id], [Product_Property_DateCreated], [IsActive], [IsDeleted]) VALUES (19, 6, 1, CAST(0x0000A49C00FA288A AS DateTime), 1, 0)
INSERT [dbo].[Lnk_Products_Properties] ([Lnk_Products_Properties_id], [Product_id], [Product_Property_id], [Product_Property_DateCreated], [IsActive], [IsDeleted]) VALUES (20, 6, 2, CAST(0x0000A49C00FA288B AS DateTime), 1, 0)
INSERT [dbo].[Lnk_Products_Properties] ([Lnk_Products_Properties_id], [Product_id], [Product_Property_id], [Product_Property_DateCreated], [IsActive], [IsDeleted]) VALUES (21, 7, 1, CAST(0x0000A49C00FB9857 AS DateTime), 1, 0)
INSERT [dbo].[Lnk_Products_Properties] ([Lnk_Products_Properties_id], [Product_id], [Product_Property_id], [Product_Property_DateCreated], [IsActive], [IsDeleted]) VALUES (22, 7, 2, CAST(0x0000A49C00FB9857 AS DateTime), 1, 0)
INSERT [dbo].[Lnk_Products_Properties] ([Lnk_Products_Properties_id], [Product_id], [Product_Property_id], [Product_Property_DateCreated], [IsActive], [IsDeleted]) VALUES (23, 9, 1, CAST(0x0000A49C01091547 AS DateTime), 1, 0)
INSERT [dbo].[Lnk_Products_Properties] ([Lnk_Products_Properties_id], [Product_id], [Product_Property_id], [Product_Property_DateCreated], [IsActive], [IsDeleted]) VALUES (24, 8, 1, CAST(0x0000A49C01091547 AS DateTime), 1, 0)
INSERT [dbo].[Lnk_Products_Properties] ([Lnk_Products_Properties_id], [Product_id], [Product_Property_id], [Product_Property_DateCreated], [IsActive], [IsDeleted]) VALUES (25, 8, 2, CAST(0x0000A49C01091548 AS DateTime), 1, 0)
INSERT [dbo].[Lnk_Products_Properties] ([Lnk_Products_Properties_id], [Product_id], [Product_Property_id], [Product_Property_DateCreated], [IsActive], [IsDeleted]) VALUES (26, 9, 2, CAST(0x0000A49C01091548 AS DateTime), 1, 0)
INSERT [dbo].[Lnk_Products_Properties] ([Lnk_Products_Properties_id], [Product_id], [Product_Property_id], [Product_Property_DateCreated], [IsActive], [IsDeleted]) VALUES (27, 10, 1, CAST(0x0000A49C010AA5EE AS DateTime), 1, 0)
INSERT [dbo].[Lnk_Products_Properties] ([Lnk_Products_Properties_id], [Product_id], [Product_Property_id], [Product_Property_DateCreated], [IsActive], [IsDeleted]) VALUES (28, 10, 2, CAST(0x0000A49C010AA5EF AS DateTime), 1, 0)
INSERT [dbo].[Lnk_Products_Properties] ([Lnk_Products_Properties_id], [Product_id], [Product_Property_id], [Product_Property_DateCreated], [IsActive], [IsDeleted]) VALUES (29, 11, 1, CAST(0x0000A49C010ACE92 AS DateTime), 1, 0)
INSERT [dbo].[Lnk_Products_Properties] ([Lnk_Products_Properties_id], [Product_id], [Product_Property_id], [Product_Property_DateCreated], [IsActive], [IsDeleted]) VALUES (30, 11, 2, CAST(0x0000A49C010ACE93 AS DateTime), 1, 0)
INSERT [dbo].[Lnk_Products_Properties] ([Lnk_Products_Properties_id], [Product_id], [Product_Property_id], [Product_Property_DateCreated], [IsActive], [IsDeleted]) VALUES (31, 12, 1, CAST(0x0000A49C010B09CE AS DateTime), 1, 0)
INSERT [dbo].[Lnk_Products_Properties] ([Lnk_Products_Properties_id], [Product_id], [Product_Property_id], [Product_Property_DateCreated], [IsActive], [IsDeleted]) VALUES (32, 12, 2, CAST(0x0000A49C010B09CE AS DateTime), 1, 0)
INSERT [dbo].[Lnk_Products_Properties] ([Lnk_Products_Properties_id], [Product_id], [Product_Property_id], [Product_Property_DateCreated], [IsActive], [IsDeleted]) VALUES (33, 13, 1, CAST(0x0000A49C010C1913 AS DateTime), 1, 0)
INSERT [dbo].[Lnk_Products_Properties] ([Lnk_Products_Properties_id], [Product_id], [Product_Property_id], [Product_Property_DateCreated], [IsActive], [IsDeleted]) VALUES (34, 13, 2, CAST(0x0000A49C010C1913 AS DateTime), 1, 0)
INSERT [dbo].[Lnk_Products_Properties] ([Lnk_Products_Properties_id], [Product_id], [Product_Property_id], [Product_Property_DateCreated], [IsActive], [IsDeleted]) VALUES (35, 14, 1, CAST(0x0000A49C010C2FCE AS DateTime), 1, 0)
INSERT [dbo].[Lnk_Products_Properties] ([Lnk_Products_Properties_id], [Product_id], [Product_Property_id], [Product_Property_DateCreated], [IsActive], [IsDeleted]) VALUES (36, 14, 2, CAST(0x0000A49C010C2FCE AS DateTime), 1, 0)
INSERT [dbo].[Lnk_Products_Properties] ([Lnk_Products_Properties_id], [Product_id], [Product_Property_id], [Product_Property_DateCreated], [IsActive], [IsDeleted]) VALUES (37, 15, 1, CAST(0x0000A49C010D0914 AS DateTime), 1, 0)
INSERT [dbo].[Lnk_Products_Properties] ([Lnk_Products_Properties_id], [Product_id], [Product_Property_id], [Product_Property_DateCreated], [IsActive], [IsDeleted]) VALUES (38, 15, 2, CAST(0x0000A49C010D0915 AS DateTime), 1, 0)
INSERT [dbo].[Lnk_Products_Properties] ([Lnk_Products_Properties_id], [Product_id], [Product_Property_id], [Product_Property_DateCreated], [IsActive], [IsDeleted]) VALUES (39, 16, 1, CAST(0x0000A49C010D1EAF AS DateTime), 1, 0)
INSERT [dbo].[Lnk_Products_Properties] ([Lnk_Products_Properties_id], [Product_id], [Product_Property_id], [Product_Property_DateCreated], [IsActive], [IsDeleted]) VALUES (40, 16, 2, CAST(0x0000A49C010D1EAF AS DateTime), 1, 0)
INSERT [dbo].[Lnk_Products_Properties] ([Lnk_Products_Properties_id], [Product_id], [Product_Property_id], [Product_Property_DateCreated], [IsActive], [IsDeleted]) VALUES (41, 17, 1, CAST(0x0000A49C010D5C76 AS DateTime), 1, 0)
INSERT [dbo].[Lnk_Products_Properties] ([Lnk_Products_Properties_id], [Product_id], [Product_Property_id], [Product_Property_DateCreated], [IsActive], [IsDeleted]) VALUES (42, 17, 2, CAST(0x0000A49C010D5C77 AS DateTime), 1, 0)
INSERT [dbo].[Lnk_Products_Properties] ([Lnk_Products_Properties_id], [Product_id], [Product_Property_id], [Product_Property_DateCreated], [IsActive], [IsDeleted]) VALUES (43, 18, 1, CAST(0x0000A49D00B61C49 AS DateTime), 1, 0)
INSERT [dbo].[Lnk_Products_Properties] ([Lnk_Products_Properties_id], [Product_id], [Product_Property_id], [Product_Property_DateCreated], [IsActive], [IsDeleted]) VALUES (44, 18, 2, CAST(0x0000A49D00B61C4B AS DateTime), 1, 0)
INSERT [dbo].[Lnk_Products_Properties] ([Lnk_Products_Properties_id], [Product_id], [Product_Property_id], [Product_Property_DateCreated], [IsActive], [IsDeleted]) VALUES (47, 20, 1, CAST(0x0000A49D00BC4BBC AS DateTime), 1, 0)
INSERT [dbo].[Lnk_Products_Properties] ([Lnk_Products_Properties_id], [Product_id], [Product_Property_id], [Product_Property_DateCreated], [IsActive], [IsDeleted]) VALUES (48, 20, 2, CAST(0x0000A49D00BC4BBD AS DateTime), 1, 0)
INSERT [dbo].[Lnk_Products_Properties] ([Lnk_Products_Properties_id], [Product_id], [Product_Property_id], [Product_Property_DateCreated], [IsActive], [IsDeleted]) VALUES (53, 19, 1, CAST(0x0000A4BB012E8C9E AS DateTime), 1, 0)
INSERT [dbo].[Lnk_Products_Properties] ([Lnk_Products_Properties_id], [Product_id], [Product_Property_id], [Product_Property_DateCreated], [IsActive], [IsDeleted]) VALUES (54, 19, 2, CAST(0x0000A4BB012E8CA4 AS DateTime), 1, 0)
INSERT [dbo].[Lnk_Products_Properties] ([Lnk_Products_Properties_id], [Product_id], [Product_Property_id], [Product_Property_DateCreated], [IsActive], [IsDeleted]) VALUES (61, 21, 2, CAST(0x0000A4BB0134947F AS DateTime), 1, 0)
INSERT [dbo].[Lnk_Products_Properties] ([Lnk_Products_Properties_id], [Product_id], [Product_Property_id], [Product_Property_DateCreated], [IsActive], [IsDeleted]) VALUES (62, 21, 4, CAST(0x0000A4BB0134947F AS DateTime), 1, 0)
INSERT [dbo].[Lnk_Products_Properties] ([Lnk_Products_Properties_id], [Product_id], [Product_Property_id], [Product_Property_DateCreated], [IsActive], [IsDeleted]) VALUES (68, 23, 4, CAST(0x0000A53901400A3D AS DateTime), 1, 0)
INSERT [dbo].[Lnk_Products_Properties] ([Lnk_Products_Properties_id], [Product_id], [Product_Property_id], [Product_Property_DateCreated], [IsActive], [IsDeleted]) VALUES (69, 22, 2, CAST(0x0000A54400BE666B AS DateTime), 1, 0)
INSERT [dbo].[Lnk_Products_Properties] ([Lnk_Products_Properties_id], [Product_id], [Product_Property_id], [Product_Property_DateCreated], [IsActive], [IsDeleted]) VALUES (71, 24, 1, CAST(0x0000A54400D0281A AS DateTime), 1, 0)
SET IDENTITY_INSERT [dbo].[Lnk_Products_Properties] OFF
/****** Object:  Table [dbo].[Lnk_Products_Channels_Properties]    Script Date: 11/30/2015 16:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lnk_Products_Channels_Properties](
	[Lnk_Products_Ch_Properties_id] [bigint] IDENTITY(1,1) NOT NULL,
	[Product_id] [bigint] NULL,
	[Channel_id] [bigint] NULL,
	[Product_Property_id] [bigint] NULL,
	[Product_Property_Value] [nvarchar](50) NULL,
 CONSTRAINT [PK_Lnk_Products_Channels_Properties] PRIMARY KEY CLUSTERED 
(
	[Lnk_Products_Ch_Properties_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lnk_Products_Channels]    Script Date: 11/30/2015 16:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lnk_Products_Channels](
	[Lnk_Products_Channels_id] [bigint] IDENTITY(1,1) NOT NULL,
	[Product_id] [bigint] NULL,
	[Channel_id] [bigint] NULL,
	[Product_Price] [decimal](18, 2) NULL,
	[Product_currency] [nvarchar](5) NULL,
	[Product_IsActive] [bit] NULL CONSTRAINT [DF_Lnk_Products_Channels_Product_IsActive]  DEFAULT ((1)),
	[Product_IsDeleted] [bit] NULL CONSTRAINT [DF_Lnk_Products_Channels_Product_IsDeleted]  DEFAULT ((0)),
	[Product_DateCreated] [datetime] NULL,
	[PriceSchedule_Id] [bigint] NULL,
	[Scheduled_Price] [decimal](18, 2) NULL,
	[Price_List_id] [bigint] NULL,
 CONSTRAINT [PK_Lnk_Products_Channels] PRIMARY KEY CLUSTERED 
(
	[Lnk_Products_Channels_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Lnk_Products_Channels] ON
INSERT [dbo].[Lnk_Products_Channels] ([Lnk_Products_Channels_id], [Product_id], [Channel_id], [Product_Price], [Product_currency], [Product_IsActive], [Product_IsDeleted], [Product_DateCreated], [PriceSchedule_Id], [Scheduled_Price], [Price_List_id]) VALUES (55, 7, NULL, CAST(900.00 AS Decimal(18, 2)), N'USD', 1, 0, CAST(0x0000A4DC0140D071 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Lnk_Products_Channels] ([Lnk_Products_Channels_id], [Product_id], [Channel_id], [Product_Price], [Product_currency], [Product_IsActive], [Product_IsDeleted], [Product_DateCreated], [PriceSchedule_Id], [Scheduled_Price], [Price_List_id]) VALUES (87, 24, 1, CAST(500.00 AS Decimal(18, 2)), N'USD', 1, 0, CAST(0x0000A54400CDD87D AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Lnk_Products_Channels] ([Lnk_Products_Channels_id], [Product_id], [Channel_id], [Product_Price], [Product_currency], [Product_IsActive], [Product_IsDeleted], [Product_DateCreated], [PriceSchedule_Id], [Scheduled_Price], [Price_List_id]) VALUES (88, 24, 2, CAST(500.00 AS Decimal(18, 2)), N'USD', 1, 0, CAST(0x0000A54400CDD87D AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Lnk_Products_Channels] ([Lnk_Products_Channels_id], [Product_id], [Channel_id], [Product_Price], [Product_currency], [Product_IsActive], [Product_IsDeleted], [Product_DateCreated], [PriceSchedule_Id], [Scheduled_Price], [Price_List_id]) VALUES (104, 18, 1, CAST(111.00 AS Decimal(18, 2)), N'USD', 1, 0, CAST(0x0000A54600CFAC04 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Lnk_Products_Channels] ([Lnk_Products_Channels_id], [Product_id], [Channel_id], [Product_Price], [Product_currency], [Product_IsActive], [Product_IsDeleted], [Product_DateCreated], [PriceSchedule_Id], [Scheduled_Price], [Price_List_id]) VALUES (105, 18, 2, CAST(111.00 AS Decimal(18, 2)), N'USD', 1, 0, CAST(0x0000A54600CFAC04 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Lnk_Products_Channels] ([Lnk_Products_Channels_id], [Product_id], [Channel_id], [Product_Price], [Product_currency], [Product_IsActive], [Product_IsDeleted], [Product_DateCreated], [PriceSchedule_Id], [Scheduled_Price], [Price_List_id]) VALUES (106, 18, 5, CAST(111.00 AS Decimal(18, 2)), N'USD', 1, 0, CAST(0x0000A54600CFAC04 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Lnk_Products_Channels] ([Lnk_Products_Channels_id], [Product_id], [Channel_id], [Product_Price], [Product_currency], [Product_IsActive], [Product_IsDeleted], [Product_DateCreated], [PriceSchedule_Id], [Scheduled_Price], [Price_List_id]) VALUES (107, 20, 1, CAST(333.00 AS Decimal(18, 2)), N'USD', 1, 0, CAST(0x0000A54600D00C9E AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Lnk_Products_Channels] ([Lnk_Products_Channels_id], [Product_id], [Channel_id], [Product_Price], [Product_currency], [Product_IsActive], [Product_IsDeleted], [Product_DateCreated], [PriceSchedule_Id], [Scheduled_Price], [Price_List_id]) VALUES (108, 20, 2, CAST(333.00 AS Decimal(18, 2)), N'USD', 1, 0, CAST(0x0000A54600D00C9E AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Lnk_Products_Channels] ([Lnk_Products_Channels_id], [Product_id], [Channel_id], [Product_Price], [Product_currency], [Product_IsActive], [Product_IsDeleted], [Product_DateCreated], [PriceSchedule_Id], [Scheduled_Price], [Price_List_id]) VALUES (109, 20, 5, CAST(333.00 AS Decimal(18, 2)), N'USD', 1, 0, CAST(0x0000A54600D00C9E AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Lnk_Products_Channels] ([Lnk_Products_Channels_id], [Product_id], [Channel_id], [Product_Price], [Product_currency], [Product_IsActive], [Product_IsDeleted], [Product_DateCreated], [PriceSchedule_Id], [Scheduled_Price], [Price_List_id]) VALUES (116, 19, 1, CAST(980.00 AS Decimal(18, 2)), N'USD', 1, 0, CAST(0x0000A54B00D93A7D AS DateTime), 3437, CAST(800.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Lnk_Products_Channels] ([Lnk_Products_Channels_id], [Product_id], [Channel_id], [Product_Price], [Product_currency], [Product_IsActive], [Product_IsDeleted], [Product_DateCreated], [PriceSchedule_Id], [Scheduled_Price], [Price_List_id]) VALUES (117, 19, 2, CAST(980.00 AS Decimal(18, 2)), N'USD', 1, 0, CAST(0x0000A54B00D93A7D AS DateTime), 3437, CAST(800.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Lnk_Products_Channels] ([Lnk_Products_Channels_id], [Product_id], [Channel_id], [Product_Price], [Product_currency], [Product_IsActive], [Product_IsDeleted], [Product_DateCreated], [PriceSchedule_Id], [Scheduled_Price], [Price_List_id]) VALUES (118, 19, 5, CAST(980.00 AS Decimal(18, 2)), N'USD', 1, 0, CAST(0x0000A54B00D93A7D AS DateTime), 3437, CAST(800.00 AS Decimal(18, 2)), NULL)
INSERT [dbo].[Lnk_Products_Channels] ([Lnk_Products_Channels_id], [Product_id], [Channel_id], [Product_Price], [Product_currency], [Product_IsActive], [Product_IsDeleted], [Product_DateCreated], [PriceSchedule_Id], [Scheduled_Price], [Price_List_id]) VALUES (119, 13, 1, CAST(343.00 AS Decimal(18, 2)), N'AED', 1, 0, CAST(0x0000A5540128A090 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Lnk_Products_Channels] ([Lnk_Products_Channels_id], [Product_id], [Channel_id], [Product_Price], [Product_currency], [Product_IsActive], [Product_IsDeleted], [Product_DateCreated], [PriceSchedule_Id], [Scheduled_Price], [Price_List_id]) VALUES (120, 3, 1, CAST(3433.00 AS Decimal(18, 2)), N'USD', 1, 0, CAST(0x0000A55500B758E4 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Lnk_Products_Channels] ([Lnk_Products_Channels_id], [Product_id], [Channel_id], [Product_Price], [Product_currency], [Product_IsActive], [Product_IsDeleted], [Product_DateCreated], [PriceSchedule_Id], [Scheduled_Price], [Price_List_id]) VALUES (132, 5, 6, CAST(823.00 AS Decimal(18, 2)), N'USD', 1, 0, CAST(0x0000A56000DFA676 AS DateTime), NULL, NULL, 3)
INSERT [dbo].[Lnk_Products_Channels] ([Lnk_Products_Channels_id], [Product_id], [Channel_id], [Product_Price], [Product_currency], [Product_IsActive], [Product_IsDeleted], [Product_DateCreated], [PriceSchedule_Id], [Scheduled_Price], [Price_List_id]) VALUES (133, 5, 9, CAST(823.00 AS Decimal(18, 2)), N'USD', 1, 0, CAST(0x0000A56000DFA676 AS DateTime), NULL, NULL, 3)
INSERT [dbo].[Lnk_Products_Channels] ([Lnk_Products_Channels_id], [Product_id], [Channel_id], [Product_Price], [Product_currency], [Product_IsActive], [Product_IsDeleted], [Product_DateCreated], [PriceSchedule_Id], [Scheduled_Price], [Price_List_id]) VALUES (134, 6, 7, CAST(2500.00 AS Decimal(18, 2)), N'USD', 1, 0, CAST(0x0000A56000DFEC1A AS DateTime), NULL, NULL, 3)
INSERT [dbo].[Lnk_Products_Channels] ([Lnk_Products_Channels_id], [Product_id], [Channel_id], [Product_Price], [Product_currency], [Product_IsActive], [Product_IsDeleted], [Product_DateCreated], [PriceSchedule_Id], [Scheduled_Price], [Price_List_id]) VALUES (136, 2, 6, CAST(123.00 AS Decimal(18, 2)), N'USD', 1, 0, CAST(0x0000A56000E08F71 AS DateTime), NULL, NULL, 3)
INSERT [dbo].[Lnk_Products_Channels] ([Lnk_Products_Channels_id], [Product_id], [Channel_id], [Product_Price], [Product_currency], [Product_IsActive], [Product_IsDeleted], [Product_DateCreated], [PriceSchedule_Id], [Scheduled_Price], [Price_List_id]) VALUES (137, 1, 1, CAST(1800.00 AS Decimal(18, 2)), N'USD', 1, 0, CAST(0x0000A56000E1E4A4 AS DateTime), NULL, NULL, 3)
SET IDENTITY_INSERT [dbo].[Lnk_Products_Channels] OFF
/****** Object:  Table [dbo].[Lnk_PriceList_Product]    Script Date: 11/30/2015 16:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lnk_PriceList_Product](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[Price_List_id] [bigint] NULL,
	[Product_id] [bigint] NULL,
	[Product_Price] [decimal](18, 2) NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[DateCreated] [datetime] NULL,
 CONSTRAINT [PK_Lnk_PriceList_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Lnk_PriceList_Product] ON
INSERT [dbo].[Lnk_PriceList_Product] ([id], [Price_List_id], [Product_id], [Product_Price], [IsActive], [IsDeleted], [DateCreated]) VALUES (1, 3, 1, CAST(1800.00 AS Decimal(18, 2)), 1, 0, CAST(0x0000A56000BCE3CC AS DateTime))
INSERT [dbo].[Lnk_PriceList_Product] ([id], [Price_List_id], [Product_id], [Product_Price], [IsActive], [IsDeleted], [DateCreated]) VALUES (2, 3, 2, CAST(1234.00 AS Decimal(18, 2)), 1, 0, CAST(0x0000A55B013E9ECA AS DateTime))
INSERT [dbo].[Lnk_PriceList_Product] ([id], [Price_List_id], [Product_id], [Product_Price], [IsActive], [IsDeleted], [DateCreated]) VALUES (3, 3, 3, CAST(2000.00 AS Decimal(18, 2)), 1, 0, CAST(0x0000A55B013769B1 AS DateTime))
INSERT [dbo].[Lnk_PriceList_Product] ([id], [Price_List_id], [Product_id], [Product_Price], [IsActive], [IsDeleted], [DateCreated]) VALUES (4, 3, 6, CAST(2500.00 AS Decimal(18, 2)), 1, 0, CAST(0x0000A56000BCF250 AS DateTime))
SET IDENTITY_INSERT [dbo].[Lnk_PriceList_Product] OFF
/****** Object:  Table [dbo].[Lnk_Gadgets_Channels]    Script Date: 11/30/2015 16:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lnk_Gadgets_Channels](
	[Lnk_Gadgets_Channels_id] [bigint] IDENTITY(1,1) NOT NULL,
	[Gadget_id] [bigint] NULL,
	[Channel_id] [bigint] NULL,
	[Lnk_Gadget_IsActive] [bit] NULL,
	[Lnk_Gadget_IsDeleted] [bit] NULL,
	[Lnk_Gadget_DateCreated] [datetime] NULL,
 CONSTRAINT [PK_Lnk_Gadgets_Channels] PRIMARY KEY CLUSTERED 
(
	[Lnk_Gadgets_Channels_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Lnk_Gadgets_Channels] ON
INSERT [dbo].[Lnk_Gadgets_Channels] ([Lnk_Gadgets_Channels_id], [Gadget_id], [Channel_id], [Lnk_Gadget_IsActive], [Lnk_Gadget_IsDeleted], [Lnk_Gadget_DateCreated]) VALUES (1, 1, 1, 1, 0, CAST(0x0000A496014C84C7 AS DateTime))
INSERT [dbo].[Lnk_Gadgets_Channels] ([Lnk_Gadgets_Channels_id], [Gadget_id], [Channel_id], [Lnk_Gadget_IsActive], [Lnk_Gadget_IsDeleted], [Lnk_Gadget_DateCreated]) VALUES (2, 7, 1, 1, 0, CAST(0x0000A4E600F8D321 AS DateTime))
INSERT [dbo].[Lnk_Gadgets_Channels] ([Lnk_Gadgets_Channels_id], [Gadget_id], [Channel_id], [Lnk_Gadget_IsActive], [Lnk_Gadget_IsDeleted], [Lnk_Gadget_DateCreated]) VALUES (3, 5, 2, 1, 0, CAST(0x0000A4E600F937D9 AS DateTime))
INSERT [dbo].[Lnk_Gadgets_Channels] ([Lnk_Gadgets_Channels_id], [Gadget_id], [Channel_id], [Lnk_Gadget_IsActive], [Lnk_Gadget_IsDeleted], [Lnk_Gadget_DateCreated]) VALUES (4, 4, 7, 1, 0, CAST(0x0000A4E600F9630E AS DateTime))
INSERT [dbo].[Lnk_Gadgets_Channels] ([Lnk_Gadgets_Channels_id], [Gadget_id], [Channel_id], [Lnk_Gadget_IsActive], [Lnk_Gadget_IsDeleted], [Lnk_Gadget_DateCreated]) VALUES (5, 6, 7, 1, 0, CAST(0x0000A4E90113B20C AS DateTime))
INSERT [dbo].[Lnk_Gadgets_Channels] ([Lnk_Gadgets_Channels_id], [Gadget_id], [Channel_id], [Lnk_Gadget_IsActive], [Lnk_Gadget_IsDeleted], [Lnk_Gadget_DateCreated]) VALUES (6, 9, 7, 1, 0, CAST(0x0000A54400BC57E3 AS DateTime))
SET IDENTITY_INSERT [dbo].[Lnk_Gadgets_Channels] OFF
/****** Object:  Table [dbo].[Lnk_CustomerVehicle_Account]    Script Date: 11/30/2015 16:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lnk_CustomerVehicle_Account](
	[Lnk_id] [bigint] IDENTITY(1,1) NOT NULL,
	[Lnk_CustomerVehicleId] [bigint] NULL,
	[Lnk_AccountNumber] [bigint] NULL,
	[Lnk_IsDeleted] [bit] NULL,
	[Lnk_IsActive] [bit] NULL,
	[Lnk_DateCreated] [datetime] NULL,
 CONSTRAINT [PK_Lnk_CustomerVehicle_Account] PRIMARY KEY CLUSTERED 
(
	[Lnk_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Lnk_CustomerVehicle_Account] ON
INSERT [dbo].[Lnk_CustomerVehicle_Account] ([Lnk_id], [Lnk_CustomerVehicleId], [Lnk_AccountNumber], [Lnk_IsDeleted], [Lnk_IsActive], [Lnk_DateCreated]) VALUES (1, 9, 4857247, 0, 1, NULL)
INSERT [dbo].[Lnk_CustomerVehicle_Account] ([Lnk_id], [Lnk_CustomerVehicleId], [Lnk_AccountNumber], [Lnk_IsDeleted], [Lnk_IsActive], [Lnk_DateCreated]) VALUES (2, 10, 4857247, 0, 1, NULL)
INSERT [dbo].[Lnk_CustomerVehicle_Account] ([Lnk_id], [Lnk_CustomerVehicleId], [Lnk_AccountNumber], [Lnk_IsDeleted], [Lnk_IsActive], [Lnk_DateCreated]) VALUES (3, 11, 4857247, 0, 1, NULL)
INSERT [dbo].[Lnk_CustomerVehicle_Account] ([Lnk_id], [Lnk_CustomerVehicleId], [Lnk_AccountNumber], [Lnk_IsDeleted], [Lnk_IsActive], [Lnk_DateCreated]) VALUES (5, 13, 4857249, 0, 1, NULL)
INSERT [dbo].[Lnk_CustomerVehicle_Account] ([Lnk_id], [Lnk_CustomerVehicleId], [Lnk_AccountNumber], [Lnk_IsDeleted], [Lnk_IsActive], [Lnk_DateCreated]) VALUES (6, 14, 4857247, 0, 1, NULL)
INSERT [dbo].[Lnk_CustomerVehicle_Account] ([Lnk_id], [Lnk_CustomerVehicleId], [Lnk_AccountNumber], [Lnk_IsDeleted], [Lnk_IsActive], [Lnk_DateCreated]) VALUES (7, 15, 4857247, 0, 1, NULL)
INSERT [dbo].[Lnk_CustomerVehicle_Account] ([Lnk_id], [Lnk_CustomerVehicleId], [Lnk_AccountNumber], [Lnk_IsDeleted], [Lnk_IsActive], [Lnk_DateCreated]) VALUES (12, 13, 4857249, 0, 1, NULL)
INSERT [dbo].[Lnk_CustomerVehicle_Account] ([Lnk_id], [Lnk_CustomerVehicleId], [Lnk_AccountNumber], [Lnk_IsDeleted], [Lnk_IsActive], [Lnk_DateCreated]) VALUES (13, 5, 4857260, 0, 1, NULL)
INSERT [dbo].[Lnk_CustomerVehicle_Account] ([Lnk_id], [Lnk_CustomerVehicleId], [Lnk_AccountNumber], [Lnk_IsDeleted], [Lnk_IsActive], [Lnk_DateCreated]) VALUES (14, 6, 4857260, 0, 1, NULL)
INSERT [dbo].[Lnk_CustomerVehicle_Account] ([Lnk_id], [Lnk_CustomerVehicleId], [Lnk_AccountNumber], [Lnk_IsDeleted], [Lnk_IsActive], [Lnk_DateCreated]) VALUES (15, 8, 4857260, 0, 1, NULL)
INSERT [dbo].[Lnk_CustomerVehicle_Account] ([Lnk_id], [Lnk_CustomerVehicleId], [Lnk_AccountNumber], [Lnk_IsDeleted], [Lnk_IsActive], [Lnk_DateCreated]) VALUES (16, 12, 4857248, 0, 1, NULL)
INSERT [dbo].[Lnk_CustomerVehicle_Account] ([Lnk_id], [Lnk_CustomerVehicleId], [Lnk_AccountNumber], [Lnk_IsDeleted], [Lnk_IsActive], [Lnk_DateCreated]) VALUES (18, 17, 4857251, 0, 1, NULL)
INSERT [dbo].[Lnk_CustomerVehicle_Account] ([Lnk_id], [Lnk_CustomerVehicleId], [Lnk_AccountNumber], [Lnk_IsDeleted], [Lnk_IsActive], [Lnk_DateCreated]) VALUES (20, 16, 4857251, 0, 1, NULL)
SET IDENTITY_INSERT [dbo].[Lnk_CustomerVehicle_Account] OFF
/****** Object:  Table [dbo].[Lnk_Customers_CustomerTypes]    Script Date: 11/30/2015 16:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lnk_Customers_CustomerTypes](
	[Lnk_Cust_CustType_id] [bigint] IDENTITY(1,1) NOT NULL,
	[Customer_id] [bigint] NULL,
	[CustomerType_id] [bigint] NULL,
 CONSTRAINT [PK_Lnk_Customers_CustomerTypes] PRIMARY KEY CLUSTERED 
(
	[Lnk_Cust_CustType_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Link between Customer and CustomerTypes' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Lnk_Customers_CustomerTypes'
GO
SET IDENTITY_INSERT [dbo].[Lnk_Customers_CustomerTypes] ON
INSERT [dbo].[Lnk_Customers_CustomerTypes] ([Lnk_Cust_CustType_id], [Customer_id], [CustomerType_id]) VALUES (3, 2, 1)
INSERT [dbo].[Lnk_Customers_CustomerTypes] ([Lnk_Cust_CustType_id], [Customer_id], [CustomerType_id]) VALUES (14, 3, 2)
INSERT [dbo].[Lnk_Customers_CustomerTypes] ([Lnk_Cust_CustType_id], [Customer_id], [CustomerType_id]) VALUES (15, 1, 1)
INSERT [dbo].[Lnk_Customers_CustomerTypes] ([Lnk_Cust_CustType_id], [Customer_id], [CustomerType_id]) VALUES (16, 1, 2)
INSERT [dbo].[Lnk_Customers_CustomerTypes] ([Lnk_Cust_CustType_id], [Customer_id], [CustomerType_id]) VALUES (20, 6, 1)
INSERT [dbo].[Lnk_Customers_CustomerTypes] ([Lnk_Cust_CustType_id], [Customer_id], [CustomerType_id]) VALUES (21, 5, 1)
INSERT [dbo].[Lnk_Customers_CustomerTypes] ([Lnk_Cust_CustType_id], [Customer_id], [CustomerType_id]) VALUES (26, 9, 1)
INSERT [dbo].[Lnk_Customers_CustomerTypes] ([Lnk_Cust_CustType_id], [Customer_id], [CustomerType_id]) VALUES (28, 4, 1)
INSERT [dbo].[Lnk_Customers_CustomerTypes] ([Lnk_Cust_CustType_id], [Customer_id], [CustomerType_id]) VALUES (31, 7, 1)
INSERT [dbo].[Lnk_Customers_CustomerTypes] ([Lnk_Cust_CustType_id], [Customer_id], [CustomerType_id]) VALUES (32, 10, 1)
INSERT [dbo].[Lnk_Customers_CustomerTypes] ([Lnk_Cust_CustType_id], [Customer_id], [CustomerType_id]) VALUES (34, 11, 1)
INSERT [dbo].[Lnk_Customers_CustomerTypes] ([Lnk_Cust_CustType_id], [Customer_id], [CustomerType_id]) VALUES (35, 12, 1)
INSERT [dbo].[Lnk_Customers_CustomerTypes] ([Lnk_Cust_CustType_id], [Customer_id], [CustomerType_id]) VALUES (42, 14, 1)
INSERT [dbo].[Lnk_Customers_CustomerTypes] ([Lnk_Cust_CustType_id], [Customer_id], [CustomerType_id]) VALUES (43, 13, 3)
INSERT [dbo].[Lnk_Customers_CustomerTypes] ([Lnk_Cust_CustType_id], [Customer_id], [CustomerType_id]) VALUES (45, 8, 1)
INSERT [dbo].[Lnk_Customers_CustomerTypes] ([Lnk_Cust_CustType_id], [Customer_id], [CustomerType_id]) VALUES (46, 15, 1)
INSERT [dbo].[Lnk_Customers_CustomerTypes] ([Lnk_Cust_CustType_id], [Customer_id], [CustomerType_id]) VALUES (47, 16, 1)
INSERT [dbo].[Lnk_Customers_CustomerTypes] ([Lnk_Cust_CustType_id], [Customer_id], [CustomerType_id]) VALUES (48, 17, 1)
SET IDENTITY_INSERT [dbo].[Lnk_Customers_CustomerTypes] OFF
/****** Object:  Table [dbo].[GLTransactions]    Script Date: 11/30/2015 16:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GLTransactions](
	[GlTrans_id] [bigint] IDENTITY(1,1) NOT NULL,
	[Finance_Transaction_id] [bigint] NULL,
	[Amount] [bigint] NULL,
	[Currency] [nvarchar](5) NULL,
	[Memo] [varchar](50) NULL,
	[GlTrans_DateCreated] [datetime] NULL,
	[ChartofAccount_id] [bigint] NULL,
	[Period_id] [bigint] NULL,
	[GLTrans_Actual_DateCreated] [datetime] NULL,
 CONSTRAINT [PK_GLTransactions] PRIMARY KEY CLUSTERED 
(
	[GlTrans_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[GLTransactions] ON
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (7, 21, 100, N'Kes', N'Memo', CAST(0x0000A54200F80E02 AS DateTime), 1, 1, NULL)
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (8, 21, 100, N'Kes', N'Memeo', CAST(0x0000A54200F80E02 AS DateTime), 1, NULL, NULL)
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (9, 21, 100, N'Kes', N'Memeo', CAST(0x0000A54200F80E02 AS DateTime), 1, NULL, NULL)
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (10, 22, 100, N'Kes', N'Memo', CAST(0x0000A54200F97F9D AS DateTime), 1, 1, NULL)
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (11, 22, 100, N'Kes', N'Memeo', CAST(0x0000A54200F97F9E AS DateTime), 1, NULL, NULL)
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (12, 22, 100, N'Kes', N'Memeo', CAST(0x0000A54200F97F9E AS DateTime), 1, NULL, NULL)
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (13, 25, 100, N'Kes', N'Memo', CAST(0x0000A54200FEC098 AS DateTime), 1, 1, NULL)
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (14, 25, 100, N'Kes', N'Memeo', CAST(0x0000A54200FEC099 AS DateTime), 1, NULL, NULL)
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (15, 25, 100, N'Kes', N'Memeo', CAST(0x0000A54200FEC099 AS DateTime), 1, NULL, NULL)
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (16, 27, 100, N'Kes', N'', CAST(0x0000A54400BFE237 AS DateTime), 1, NULL, NULL)
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (17, 27, 100, N'Kes', N'', CAST(0x0000A54400BFE237 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (18, 29, 900, N'KES', N'Topup', CAST(0x0000A549012ED9E0 AS DateTime), 90, 2, CAST(0x0000A549012EDCD0 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (19, 29, 900, N'KES', N'Topup', CAST(0x0000A549012ED9E0 AS DateTime), 33, 2, CAST(0x0000A549012EDCD0 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (20, 30, 1000, N'KES', N'Topup', CAST(0x0000A549012F7643 AS DateTime), NULL, 2, CAST(0x0000A549012F8CD8 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (21, 30, 1000, N'KES', N'Topup', CAST(0x0000A549012F7643 AS DateTime), 33, 2, CAST(0x0000A549012F8CD8 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (22, 31, 100, N'KES', N'Transfer', CAST(0x0000A5490135F94B AS DateTime), NULL, 2, CAST(0x0000A5490135FC74 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (23, 31, 100, N'KES', N'Transfer', CAST(0x0000A5490135F94B AS DateTime), NULL, 2, CAST(0x0000A5490135FC74 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (24, 32, 100, N'KES', N'Transfer', CAST(0x0000A54901366336 AS DateTime), 90, 2, CAST(0x0000A5490136645D AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (25, 32, 100, N'KES', N'Transfer', CAST(0x0000A54901366336 AS DateTime), 90, 2, CAST(0x0000A5490136645D AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (26, 33, 50, N'KES', N'Transfer by Customer', CAST(0x0000A5490137DD36 AS DateTime), NULL, 2, CAST(0x0000A5490137DD39 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (27, 33, 50, N'KES', N'Transfer by Customer', CAST(0x0000A5490137DD36 AS DateTime), NULL, 2, CAST(0x0000A5490137DD39 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (28, 34, -1234, N'KES', N'Topup', CAST(0x0000A55B00D0EB4C AS DateTime), NULL, 2, CAST(0x0000A55B00D0EB4F AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (29, 34, -1234, N'KES', N'Topup', CAST(0x0000A55B00D0EB4C AS DateTime), 33, 2, CAST(0x0000A55B00D0EB4F AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (30, 35, -111, N'KES', N'Topup', CAST(0x0000A55B00D4F29A AS DateTime), 90, 2, CAST(0x0000A55B00D4F29B AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (31, 35, -111, N'KES', N'Topup', CAST(0x0000A55B00D4F29A AS DateTime), 33, 2, CAST(0x0000A55B00D4F29B AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (32, 36, 111, N'KES', N'Transfer', CAST(0x0000A55B00D9EEBA AS DateTime), 90, 2, CAST(0x0000A55B00D9EEBA AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (33, 36, 111, N'KES', N'Transfer', CAST(0x0000A55B00D9EEBA AS DateTime), 91, 2, CAST(0x0000A55B00D9EEBA AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (34, 37, 99, N'KES', N'Transfer', CAST(0x0000A55B00DB3FC9 AS DateTime), 90, 2, CAST(0x0000A55B00DB3FCC AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (35, 37, -99, N'KES', N'Transfer', CAST(0x0000A55B00DB3FC9 AS DateTime), 91, 2, CAST(0x0000A55B00DB3FCC AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (36, 38, -900, N'KES', N'Topup', CAST(0x0000A55C01317505 AS DateTime), NULL, 2, CAST(0x0000A55C01317508 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (37, 38, -900, N'KES', N'Topup', CAST(0x0000A55C01317505 AS DateTime), 33, 2, CAST(0x0000A55C01317508 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (38, 39, -1111, N'KES', N'Topup', CAST(0x0000A55C013C5716 AS DateTime), NULL, 2, CAST(0x0000A55C013C571A AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (39, 39, -1111, N'KES', N'Topup', CAST(0x0000A55C013C5716 AS DateTime), 33, 2, CAST(0x0000A55C013C571A AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (40, 40, -5555, N'KES', N'Topup', CAST(0x0000A55C013DE936 AS DateTime), NULL, 2, CAST(0x0000A55C013DEA36 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (41, 40, -5555, N'KES', N'Topup', CAST(0x0000A55C013DE936 AS DateTime), 33, 2, CAST(0x0000A55C013DEA36 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (42, 41, -1000, N'KES', N'Topup', CAST(0x0000A55C013F123D AS DateTime), NULL, 2, CAST(0x0000A55C013F123E AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (43, 41, -1000, N'KES', N'Topup', CAST(0x0000A55C013F123D AS DateTime), 33, 2, CAST(0x0000A55C013F123E AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (44, 42, -1000, N'KES', N'Topup', CAST(0x0000A55C013F48BE AS DateTime), NULL, 2, CAST(0x0000A55C013F48BE AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (45, 42, -1000, N'KES', N'Topup', CAST(0x0000A55C013F48BE AS DateTime), 33, 2, CAST(0x0000A55C013F48BE AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (46, 43, -1000, N'KES', N'Topup', CAST(0x0000A55C013F4A6D AS DateTime), NULL, 2, CAST(0x0000A55C013F4A6D AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (47, 43, -1000, N'KES', N'Topup', CAST(0x0000A55C013F4A6D AS DateTime), 33, 2, CAST(0x0000A55C013F4A6D AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (48, 44, -1000, N'KES', N'Topup', CAST(0x0000A55C013F4BE9 AS DateTime), NULL, 2, CAST(0x0000A55C013F4BEA AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (49, 44, -1000, N'KES', N'Topup', CAST(0x0000A55C013F4BE9 AS DateTime), 33, 2, CAST(0x0000A55C013F4BEA AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (50, 45, -1000, N'KES', N'Topup', CAST(0x0000A55C013F4D77 AS DateTime), NULL, 2, CAST(0x0000A55C013F4D78 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (51, 45, -1000, N'KES', N'Topup', CAST(0x0000A55C013F4D77 AS DateTime), 33, 2, CAST(0x0000A55C013F4D78 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (52, 46, -1000, N'KES', N'Topup', CAST(0x0000A55C013F4EEE AS DateTime), NULL, 2, CAST(0x0000A55C013F4EEF AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (53, 46, -1000, N'KES', N'Topup', CAST(0x0000A55C013F4EEE AS DateTime), 33, 2, CAST(0x0000A55C013F4EEF AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (54, 47, -1000, N'KES', N'Topup', CAST(0x0000A55C013F5064 AS DateTime), NULL, 2, CAST(0x0000A55C013F5065 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (55, 47, -1000, N'KES', N'Topup', CAST(0x0000A55C013F5064 AS DateTime), 33, 2, CAST(0x0000A55C013F5065 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (56, 48, -1000, N'KES', N'Topup', CAST(0x0000A55C013F51D2 AS DateTime), NULL, 2, CAST(0x0000A55C013F51D2 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (57, 48, -1000, N'KES', N'Topup', CAST(0x0000A55C013F51D2 AS DateTime), 33, 2, CAST(0x0000A55C013F51D2 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (58, 49, -1000, N'KES', N'Topup', CAST(0x0000A55C013F533A AS DateTime), NULL, 2, CAST(0x0000A55C013F533A AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (59, 49, -1000, N'KES', N'Topup', CAST(0x0000A55C013F533A AS DateTime), 33, 2, CAST(0x0000A55C013F533A AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (60, 50, -1000, N'KES', N'Topup', CAST(0x0000A55C013F54A1 AS DateTime), NULL, 2, CAST(0x0000A55C013F54A2 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (61, 50, -1000, N'KES', N'Topup', CAST(0x0000A55C013F54A1 AS DateTime), 33, 2, CAST(0x0000A55C013F54A2 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (62, 51, -900, N'KES', N'Topup', CAST(0x0000A55C0141C909 AS DateTime), NULL, 2, CAST(0x0000A55C0141C90B AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (63, 51, -900, N'KES', N'Topup', CAST(0x0000A55C0141C909 AS DateTime), 33, 2, CAST(0x0000A55C0141C90B AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (64, 52, -789, N'KES', N'Topup', CAST(0x0000A55C01424FAB AS DateTime), NULL, 2, CAST(0x0000A55C01424FAE AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (65, 52, -789, N'KES', N'Topup', CAST(0x0000A55C01424FAB AS DateTime), 33, 2, CAST(0x0000A55C01424FAE AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (66, 53, -67, N'KES', N'Topup', CAST(0x0000A55C014279C6 AS DateTime), NULL, 2, CAST(0x0000A55C014279C6 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (67, 53, -67, N'KES', N'Topup', CAST(0x0000A55C014279C6 AS DateTime), 33, 2, CAST(0x0000A55C014279C6 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (68, 54, -500, N'KES', N'Topup', CAST(0x0000A55C014294F6 AS DateTime), NULL, 2, CAST(0x0000A55C014294F7 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (69, 54, -500, N'KES', N'Topup', CAST(0x0000A55C014294F6 AS DateTime), 33, 2, CAST(0x0000A55C014294F7 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (70, 55, -10, N'KES', N'Topup', CAST(0x0000A55C01443803 AS DateTime), NULL, 2, CAST(0x0000A55C01443804 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (71, 55, -10, N'KES', N'Topup', CAST(0x0000A55C01443803 AS DateTime), 33, 2, CAST(0x0000A55C01443804 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (72, 56, -10, N'KES', N'Topup', CAST(0x0000A55C01445A39 AS DateTime), NULL, 2, CAST(0x0000A55C01445A39 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (73, 56, -10, N'KES', N'Topup', CAST(0x0000A55C01445A39 AS DateTime), 33, 2, CAST(0x0000A55C01445A39 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (74, 57, -10, N'KES', N'Topup', CAST(0x0000A55C01445DC8 AS DateTime), NULL, 2, CAST(0x0000A55C01445DC9 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (75, 57, -10, N'KES', N'Topup', CAST(0x0000A55C01445DC8 AS DateTime), 33, 2, CAST(0x0000A55C01445DC9 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (76, 58, -10, N'KES', N'Topup', CAST(0x0000A55C01446194 AS DateTime), NULL, 2, CAST(0x0000A55C01446195 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (77, 58, -10, N'KES', N'Topup', CAST(0x0000A55C01446194 AS DateTime), 33, 2, CAST(0x0000A55C01446195 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (78, 59, -10, N'KES', N'Topup', CAST(0x0000A55C014464F1 AS DateTime), NULL, 2, CAST(0x0000A55C014464F2 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (79, 59, -10, N'KES', N'Topup', CAST(0x0000A55C014464F1 AS DateTime), 33, 2, CAST(0x0000A55C014464F2 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (80, 60, -10, N'KES', N'Topup', CAST(0x0000A55C014467AF AS DateTime), NULL, 2, CAST(0x0000A55C014467AF AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (81, 60, -10, N'KES', N'Topup', CAST(0x0000A55C014467AF AS DateTime), 33, 2, CAST(0x0000A55C014467AF AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (82, 61, -10, N'KES', N'Topup', CAST(0x0000A55C014469BD AS DateTime), NULL, 2, CAST(0x0000A55C014469BD AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (83, 61, -10, N'KES', N'Topup', CAST(0x0000A55C014469BD AS DateTime), 33, 2, CAST(0x0000A55C014469BD AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (84, 62, -10, N'KES', N'Topup', CAST(0x0000A55C01446BC0 AS DateTime), NULL, 2, CAST(0x0000A55C01446BC0 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (85, 62, -10, N'KES', N'Topup', CAST(0x0000A55C01446BC0 AS DateTime), 33, 2, CAST(0x0000A55C01446BC0 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (86, 63, -10, N'KES', N'Topup', CAST(0x0000A55C01446E08 AS DateTime), NULL, 2, CAST(0x0000A55C01446E08 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (87, 63, -10, N'KES', N'Topup', CAST(0x0000A55C01446E08 AS DateTime), 33, 2, CAST(0x0000A55C01446E08 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (88, 64, -10, N'KES', N'Topup', CAST(0x0000A55C01448744 AS DateTime), NULL, 2, CAST(0x0000A55C01448744 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (89, 64, -10, N'KES', N'Topup', CAST(0x0000A55C01448744 AS DateTime), 33, 2, CAST(0x0000A55C01448744 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (90, 65, -889, N'KES', N'Topup', CAST(0x0000A55C0146374D AS DateTime), NULL, 2, CAST(0x0000A55C01463750 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (91, 65, -889, N'KES', N'Topup', CAST(0x0000A55C0146374D AS DateTime), 33, 2, CAST(0x0000A55C01463750 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (92, 66, -889, N'KES', N'Topup', CAST(0x0000A55C01463769 AS DateTime), NULL, 2, CAST(0x0000A55C01463769 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (93, 66, -889, N'KES', N'Topup', CAST(0x0000A55C01463769 AS DateTime), 33, 2, CAST(0x0000A55C01463769 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (94, 68, -778, N'KES', N'Topup', CAST(0x0000A55C0146F6D9 AS DateTime), NULL, 2, CAST(0x0000A55C0146F6DB AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (95, 68, -778, N'KES', N'Topup', CAST(0x0000A55C0146F6D9 AS DateTime), 33, 2, CAST(0x0000A55C0146F6DB AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (96, 70, -67, N'KES', N'Topup', CAST(0x0000A55C01475354 AS DateTime), NULL, 2, CAST(0x0000A55C014754D1 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (97, 70, -67, N'KES', N'Topup', CAST(0x0000A55C01475354 AS DateTime), 33, 2, CAST(0x0000A55C014754D1 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (98, 71, -67, N'KES', N'Topup', CAST(0x0000A55C0147A019 AS DateTime), NULL, 2, CAST(0x0000A55C0147A019 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (99, 71, -67, N'KES', N'Topup', CAST(0x0000A55C0147A019 AS DateTime), 33, 2, CAST(0x0000A55C0147A019 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (100, 72, -67, N'KES', N'Topup', CAST(0x0000A55C0147A46B AS DateTime), NULL, 2, CAST(0x0000A55C0147A46C AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (101, 72, -67, N'KES', N'Topup', CAST(0x0000A55C0147A46B AS DateTime), 33, 2, CAST(0x0000A55C0147A46C AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (102, 73, -67, N'KES', N'Topup', CAST(0x0000A55C0147A7F6 AS DateTime), NULL, 2, CAST(0x0000A55C0147A7F6 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (103, 73, -67, N'KES', N'Topup', CAST(0x0000A55C0147A7F6 AS DateTime), 33, 2, CAST(0x0000A55C0147A7F6 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (104, 74, -67, N'KES', N'Topup', CAST(0x0000A55C0147AAA8 AS DateTime), NULL, 2, CAST(0x0000A55C0147AAA8 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (105, 74, -67, N'KES', N'Topup', CAST(0x0000A55C0147AAA8 AS DateTime), 33, 2, CAST(0x0000A55C0147AAA8 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (106, 75, -67, N'KES', N'Topup', CAST(0x0000A55C0147AD5B AS DateTime), NULL, 2, CAST(0x0000A55C0147AD5B AS DateTime))
GO
print 'Processed 100 total records'
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (107, 75, -67, N'KES', N'Topup', CAST(0x0000A55C0147AD5B AS DateTime), 33, 2, CAST(0x0000A55C0147AD5B AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (108, 76, -67, N'KES', N'Topup', CAST(0x0000A55C0147B002 AS DateTime), NULL, 2, CAST(0x0000A55C0147B002 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (109, 76, -67, N'KES', N'Topup', CAST(0x0000A55C0147B002 AS DateTime), 33, 2, CAST(0x0000A55C0147B002 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (110, 77, -67, N'KES', N'Topup', CAST(0x0000A55C0147B291 AS DateTime), NULL, 2, CAST(0x0000A55C0147B291 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (111, 77, -67, N'KES', N'Topup', CAST(0x0000A55C0147B291 AS DateTime), 33, 2, CAST(0x0000A55C0147B291 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (112, 78, -67, N'KES', N'Topup', CAST(0x0000A55C0147B4F7 AS DateTime), NULL, 2, CAST(0x0000A55C0147B4F8 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (113, 78, -67, N'KES', N'Topup', CAST(0x0000A55C0147B4F7 AS DateTime), 33, 2, CAST(0x0000A55C0147B4F8 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (114, 79, -67, N'KES', N'Topup', CAST(0x0000A55C0147B73C AS DateTime), NULL, 2, CAST(0x0000A55C0147B73C AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (115, 79, -67, N'KES', N'Topup', CAST(0x0000A55C0147B73C AS DateTime), 33, 2, CAST(0x0000A55C0147B73C AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (116, 80, -100, N'KES', N'Topup', CAST(0x0000A55C014804E1 AS DateTime), NULL, 2, CAST(0x0000A55C014805D6 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (117, 80, -100, N'KES', N'Topup', CAST(0x0000A55C014804E1 AS DateTime), 33, 2, CAST(0x0000A55C014805D6 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (118, 81, -222, N'KES', N'Topup', CAST(0x0000A55C0148A007 AS DateTime), NULL, 2, CAST(0x0000A55C0148A009 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (119, 81, -222, N'KES', N'Topup', CAST(0x0000A55C0148A007 AS DateTime), 33, 2, CAST(0x0000A55C0148A009 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (120, 83, -89, N'KES', N'Topup', CAST(0x0000A55C014BC92E AS DateTime), NULL, 2, CAST(0x0000A55C014BC931 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (121, 83, -89, N'KES', N'Topup', CAST(0x0000A55C014BC92E AS DateTime), 33, 2, CAST(0x0000A55C014BC931 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (122, 84, -89, N'KES', N'Topup', CAST(0x0000A55C014BC946 AS DateTime), NULL, 2, CAST(0x0000A55C014BC947 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (123, 84, -89, N'KES', N'Topup', CAST(0x0000A55C014BC946 AS DateTime), 33, 2, CAST(0x0000A55C014BC947 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (124, 85, -89, N'KES', N'Topup', CAST(0x0000A55C014BC94D AS DateTime), NULL, 2, CAST(0x0000A55C014BC94D AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (125, 85, -89, N'KES', N'Topup', CAST(0x0000A55C014BC94D AS DateTime), 33, 2, CAST(0x0000A55C014BC94D AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (126, 86, -89, N'KES', N'Topup', CAST(0x0000A55C014BC952 AS DateTime), NULL, 2, CAST(0x0000A55C014BC95A AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (127, 86, -89, N'KES', N'Topup', CAST(0x0000A55C014BC952 AS DateTime), 33, 2, CAST(0x0000A55C014BC95A AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (128, 87, -89, N'KES', N'Topup', CAST(0x0000A55C014BC95F AS DateTime), NULL, 2, CAST(0x0000A55C014BC960 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (129, 87, -89, N'KES', N'Topup', CAST(0x0000A55C014BC95F AS DateTime), 33, 2, CAST(0x0000A55C014BC960 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (130, 88, -89, N'KES', N'Topup', CAST(0x0000A55C014BC965 AS DateTime), NULL, 2, CAST(0x0000A55C014BC965 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (131, 88, -89, N'KES', N'Topup', CAST(0x0000A55C014BC965 AS DateTime), 33, 2, CAST(0x0000A55C014BC965 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (132, 89, -89, N'KES', N'Topup', CAST(0x0000A55C014BC96F AS DateTime), NULL, 2, CAST(0x0000A55C014BC96F AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (133, 89, -89, N'KES', N'Topup', CAST(0x0000A55C014BC96F AS DateTime), 33, 2, CAST(0x0000A55C014BC96F AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (134, 90, -89, N'KES', N'Topup', CAST(0x0000A55C014BC974 AS DateTime), NULL, 2, CAST(0x0000A55C014BC974 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (135, 90, -89, N'KES', N'Topup', CAST(0x0000A55C014BC974 AS DateTime), 33, 2, CAST(0x0000A55C014BC974 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (136, 91, -89, N'KES', N'Topup', CAST(0x0000A55C014BC97F AS DateTime), NULL, 2, CAST(0x0000A55C014BC97F AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (137, 91, -89, N'KES', N'Topup', CAST(0x0000A55C014BC97F AS DateTime), 33, 2, CAST(0x0000A55C014BC97F AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (138, 92, -89, N'KES', N'Topup', CAST(0x0000A55C014BC984 AS DateTime), NULL, 2, CAST(0x0000A55C014BC984 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (139, 92, -89, N'KES', N'Topup', CAST(0x0000A55C014BC984 AS DateTime), 33, 2, CAST(0x0000A55C014BC984 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (140, 93, -222, N'KES', N'Topup', CAST(0x0000A55C014C30E1 AS DateTime), NULL, 2, CAST(0x0000A55C014C30E4 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (141, 93, -222, N'KES', N'Topup', CAST(0x0000A55C014C30E1 AS DateTime), 33, 2, CAST(0x0000A55C014C30E4 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (142, 94, -222, N'KES', N'Topup', CAST(0x0000A55C014C30F4 AS DateTime), NULL, 2, CAST(0x0000A55C014C30F5 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (143, 94, -222, N'KES', N'Topup', CAST(0x0000A55C014C30F4 AS DateTime), 33, 2, CAST(0x0000A55C014C30F5 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (144, 95, -222, N'KES', N'Topup', CAST(0x0000A55C014C3100 AS DateTime), NULL, 2, CAST(0x0000A55C014C3100 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (145, 95, -222, N'KES', N'Topup', CAST(0x0000A55C014C3100 AS DateTime), 33, 2, CAST(0x0000A55C014C3100 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (146, 96, -222, N'KES', N'Topup', CAST(0x0000A55C014C3105 AS DateTime), NULL, 2, CAST(0x0000A55C014C3105 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (147, 96, -222, N'KES', N'Topup', CAST(0x0000A55C014C3105 AS DateTime), 33, 2, CAST(0x0000A55C014C3105 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (148, 97, -222, N'KES', N'Topup', CAST(0x0000A55C014C310F AS DateTime), NULL, 2, CAST(0x0000A55C014C310F AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (149, 97, -222, N'KES', N'Topup', CAST(0x0000A55C014C310F AS DateTime), 33, 2, CAST(0x0000A55C014C310F AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (150, 98, -222, N'KES', N'Topup', CAST(0x0000A55C014C3114 AS DateTime), NULL, 2, CAST(0x0000A55C014C3114 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (151, 98, -222, N'KES', N'Topup', CAST(0x0000A55C014C3114 AS DateTime), 33, 2, CAST(0x0000A55C014C3114 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (152, 99, -222, N'KES', N'Topup', CAST(0x0000A55C014C3119 AS DateTime), NULL, 2, CAST(0x0000A55C014C3119 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (153, 99, -222, N'KES', N'Topup', CAST(0x0000A55C014C3119 AS DateTime), 33, 2, CAST(0x0000A55C014C3119 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (154, 100, -222, N'KES', N'Topup', CAST(0x0000A55C014C3121 AS DateTime), NULL, 2, CAST(0x0000A55C014C3121 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (155, 100, -222, N'KES', N'Topup', CAST(0x0000A55C014C3121 AS DateTime), 33, 2, CAST(0x0000A55C014C3121 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (156, 101, -222, N'KES', N'Topup', CAST(0x0000A55C014C3126 AS DateTime), NULL, 2, CAST(0x0000A55C014C3127 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (157, 101, -222, N'KES', N'Topup', CAST(0x0000A55C014C3126 AS DateTime), 33, 2, CAST(0x0000A55C014C3127 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (158, 102, -222, N'KES', N'Topup', CAST(0x0000A55C014C3131 AS DateTime), NULL, 2, CAST(0x0000A55C014C3132 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (159, 102, -222, N'KES', N'Topup', CAST(0x0000A55C014C3131 AS DateTime), 33, 2, CAST(0x0000A55C014C3132 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (160, 103, -800, N'KES', N'Topup', CAST(0x0000A55D00C845F0 AS DateTime), NULL, 2, CAST(0x0000A55D00C845F4 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (161, 103, -800, N'KES', N'Topup', CAST(0x0000A55D00C845F0 AS DateTime), 33, 2, CAST(0x0000A55D00C845F4 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (162, 105, -700, N'KES', N'Topup', CAST(0x0000A55D00C9ECAE AS DateTime), NULL, 2, CAST(0x0000A55D00C9ECB1 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (163, 105, -700, N'KES', N'Topup', CAST(0x0000A55D00C9ECAE AS DateTime), 33, 2, CAST(0x0000A55D00C9ECB1 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (164, 106, -700, N'KES', N'Topup', CAST(0x0000A55D00C9ECC2 AS DateTime), NULL, 2, CAST(0x0000A55D00C9ECC2 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (165, 106, -700, N'KES', N'Topup', CAST(0x0000A55D00C9ECC2 AS DateTime), 33, 2, CAST(0x0000A55D00C9ECC2 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (166, 107, -700, N'KES', N'Topup', CAST(0x0000A55D00C9ECC8 AS DateTime), NULL, 2, CAST(0x0000A55D00C9ECC8 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (167, 107, -700, N'KES', N'Topup', CAST(0x0000A55D00C9ECC8 AS DateTime), 33, 2, CAST(0x0000A55D00C9ECC8 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (168, 108, -700, N'KES', N'Topup', CAST(0x0000A55D00C9ECCE AS DateTime), NULL, 2, CAST(0x0000A55D00C9ECCE AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (169, 108, -700, N'KES', N'Topup', CAST(0x0000A55D00C9ECCE AS DateTime), 33, 2, CAST(0x0000A55D00C9ECCE AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (170, 109, -700, N'KES', N'Topup', CAST(0x0000A55D00C9ECD4 AS DateTime), NULL, 2, CAST(0x0000A55D00C9ECD4 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (171, 109, -700, N'KES', N'Topup', CAST(0x0000A55D00C9ECD4 AS DateTime), 33, 2, CAST(0x0000A55D00C9ECD4 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (172, 110, -700, N'KES', N'Topup', CAST(0x0000A55D00C9ECDD AS DateTime), NULL, 2, CAST(0x0000A55D00C9ECDD AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (173, 110, -700, N'KES', N'Topup', CAST(0x0000A55D00C9ECDD AS DateTime), 33, 2, CAST(0x0000A55D00C9ECDD AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (174, 111, -700, N'KES', N'Topup', CAST(0x0000A55D00C9ECE3 AS DateTime), NULL, 2, CAST(0x0000A55D00C9ECE3 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (175, 111, -700, N'KES', N'Topup', CAST(0x0000A55D00C9ECE3 AS DateTime), 33, 2, CAST(0x0000A55D00C9ECE3 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (176, 112, -700, N'KES', N'Topup', CAST(0x0000A55D00C9ECED AS DateTime), NULL, 2, CAST(0x0000A55D00C9ECED AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (177, 112, -700, N'KES', N'Topup', CAST(0x0000A55D00C9ECED AS DateTime), 33, 2, CAST(0x0000A55D00C9ECED AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (178, 113, -700, N'KES', N'Topup', CAST(0x0000A55D00C9ECF3 AS DateTime), NULL, 2, CAST(0x0000A55D00C9ECF3 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (179, 113, -700, N'KES', N'Topup', CAST(0x0000A55D00C9ECF3 AS DateTime), 33, 2, CAST(0x0000A55D00C9ECF3 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (180, 114, -700, N'KES', N'Topup', CAST(0x0000A55D00C9ECF8 AS DateTime), NULL, 2, CAST(0x0000A55D00C9ECF8 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (181, 114, -700, N'KES', N'Topup', CAST(0x0000A55D00C9ECF8 AS DateTime), 33, 2, CAST(0x0000A55D00C9ECF8 AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (182, 115, -400, N'KES', N'Topup', CAST(0x0000A55D00CAB38C AS DateTime), NULL, 2, CAST(0x0000A55D00CAB38F AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (183, 115, -400, N'KES', N'Topup', CAST(0x0000A55D00CAB38C AS DateTime), 33, 2, CAST(0x0000A55D00CAB38F AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (184, 116, -167, N'KES', N'Topup', CAST(0x0000A55D00CB2CBC AS DateTime), NULL, 2, CAST(0x0000A55D00CB2CBF AS DateTime))
INSERT [dbo].[GLTransactions] ([GlTrans_id], [Finance_Transaction_id], [Amount], [Currency], [Memo], [GlTrans_DateCreated], [ChartofAccount_id], [Period_id], [GLTrans_Actual_DateCreated]) VALUES (185, 116, -167, N'KES', N'Topup', CAST(0x0000A55D00CB2CBC AS DateTime), 33, 2, CAST(0x0000A55D00CB2CBF AS DateTime))
SET IDENTITY_INSERT [dbo].[GLTransactions] OFF
/****** Object:  Table [dbo].[GeneralSettings]    Script Date: 11/30/2015 16:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GeneralSettings](
	[GenSet_id] [bigint] IDENTITY(1,1) NOT NULL,
	[PostPaidExpValue] [int] NULL,
	[PostPaidExpPeriod] [nvarchar](20) NULL,
	[MinRedeemPoints] [int] NULL,
	[BaseCurrency] [int] NULL,
	[MaxTopupPerDay] [int] NULL,
	[MaxPrepaidBalance] [int] NULL,
	[DefaultUsageLimit] [int] NULL,
	[IsAddApproved] [bit] NULL,
	[IsDelApproved] [bit] NULL,
	[IsEditApproved] [bit] NULL,
 CONSTRAINT [PK_GeneralSettings] PRIMARY KEY CLUSTERED 
(
	[GenSet_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Expire Post Paid Credit limits Every' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GeneralSettings', @level2type=N'COLUMN',@level2name=N'PostPaidExpValue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Expire Post Paid Credit limits Every Day/Week/Month/Year' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GeneralSettings', @level2type=N'COLUMN',@level2name=N'PostPaidExpPeriod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Minimum redeemable points' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GeneralSettings', @level2type=N'COLUMN',@level2name=N'MinRedeemPoints'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Base currency id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GeneralSettings', @level2type=N'COLUMN',@level2name=N'BaseCurrency'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Maximum allowed top-up per day' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GeneralSettings', @level2type=N'COLUMN',@level2name=N'MaxTopupPerDay'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Maximum allowed Prepaid Card Balance' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GeneralSettings', @level2type=N'COLUMN',@level2name=N'MaxPrepaidBalance'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Default usage limit for all the cards' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'GeneralSettings', @level2type=N'COLUMN',@level2name=N'DefaultUsageLimit'
GO
SET IDENTITY_INSERT [dbo].[GeneralSettings] ON
INSERT [dbo].[GeneralSettings] ([GenSet_id], [PostPaidExpValue], [PostPaidExpPeriod], [MinRedeemPoints], [BaseCurrency], [MaxTopupPerDay], [MaxPrepaidBalance], [DefaultUsageLimit], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (3, NULL, NULL, 2500, 144, 2323, 2000, 8000, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[GeneralSettings] OFF
/****** Object:  Table [dbo].[Gadgets]    Script Date: 11/30/2015 16:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gadgets](
	[Gadget_id] [bigint] IDENTITY(1,1) NOT NULL,
	[Gadget_Name] [nvarchar](50) NULL,
	[Gadget_Description] [nvarchar](250) NULL,
	[Gadget_IsActive] [bit] NULL,
	[Gadget_IsDeleted] [bit] NULL,
	[Gadget_DateCreated] [datetime] NULL,
	[IsAddApproved] [bit] NULL,
	[IsDelApproved] [bit] NULL,
	[IsEditApproved] [bit] NULL,
	[IsDeletedFlag] [int] NULL,
	[IsbeingEdited] [bit] NULL,
 CONSTRAINT [PK_Gadgets] PRIMARY KEY CLUSTERED 
(
	[Gadget_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Gadgets] ON
INSERT [dbo].[Gadgets] ([Gadget_id], [Gadget_Name], [Gadget_Description], [Gadget_IsActive], [Gadget_IsDeleted], [Gadget_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [IsDeletedFlag], [IsbeingEdited]) VALUES (1, N'Gadget one', N'Gadget one description', 1, 0, CAST(0x0000A4BC00C9CFC7 AS DateTime), 1, 1, 1, -1, 1)
INSERT [dbo].[Gadgets] ([Gadget_id], [Gadget_Name], [Gadget_Description], [Gadget_IsActive], [Gadget_IsDeleted], [Gadget_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [IsDeletedFlag], [IsbeingEdited]) VALUES (4, N'Gadget two', N'Gadget two description.', 1, 0, CAST(0x0000A4BC00C9CB48 AS DateTime), 1, 1, 1, -1, 1)
INSERT [dbo].[Gadgets] ([Gadget_id], [Gadget_Name], [Gadget_Description], [Gadget_IsActive], [Gadget_IsDeleted], [Gadget_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [IsDeletedFlag], [IsbeingEdited]) VALUES (5, N'Gadget three', N'Gadget three description.', 1, 0, CAST(0x0000A4BC00CC9382 AS DateTime), 1, 0, 0, 0, 0)
INSERT [dbo].[Gadgets] ([Gadget_id], [Gadget_Name], [Gadget_Description], [Gadget_IsActive], [Gadget_IsDeleted], [Gadget_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [IsDeletedFlag], [IsbeingEdited]) VALUES (6, N'Gadget Four', N'Gadget four description', 1, 0, CAST(0x0000A4D200B5ABA2 AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Gadgets] ([Gadget_id], [Gadget_Name], [Gadget_Description], [Gadget_IsActive], [Gadget_IsDeleted], [Gadget_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [IsDeletedFlag], [IsbeingEdited]) VALUES (7, N'Gadget Five', N'asha sjahsajsjas', 1, 0, CAST(0x0000A4D200B5C154 AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Gadgets] ([Gadget_id], [Gadget_Name], [Gadget_Description], [Gadget_IsActive], [Gadget_IsDeleted], [Gadget_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [IsDeletedFlag], [IsbeingEdited]) VALUES (8, N'sdfsd', N'asd', 1, 0, CAST(0x0000A4DB00D66136 AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Gadgets] ([Gadget_id], [Gadget_Name], [Gadget_Description], [Gadget_IsActive], [Gadget_IsDeleted], [Gadget_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [IsDeletedFlag], [IsbeingEdited]) VALUES (9, N'GadgetXXX', N'XXXXXXXXX', 1, 0, CAST(0x0000A4E90113526A AS DateTime), NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Gadgets] OFF
/****** Object:  Table [dbo].[FormulaValueType]    Script Date: 11/30/2015 16:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FormulaValueType](
	[ValueId] [bigint] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](50) NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_ValueType] PRIMARY KEY CLUSTERED 
(
	[ValueId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[FormulaValueType] ON
INSERT [dbo].[FormulaValueType] ([ValueId], [Type], [IsActive], [IsDeleted]) VALUES (1, N'Quantity', 1, 0)
INSERT [dbo].[FormulaValueType] ([ValueId], [Type], [IsActive], [IsDeleted]) VALUES (2, N'Amount', 1, 0)
SET IDENTITY_INSERT [dbo].[FormulaValueType] OFF
/****** Object:  Table [dbo].[Finance_Transaction]    Script Date: 11/30/2015 16:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Finance_Transaction](
	[Finance_Transaction_id] [bigint] IDENTITY(1,1) NOT NULL,
	[Finance_Trans_description] [varchar](50) NULL,
	[Transaction_Code] [varchar](50) NULL,
	[IsPosted] [bit] NULL,
	[Transaction_DateCreated] [datetime] NULL,
	[Doc_Type_id] [bigint] NULL,
 CONSTRAINT [PK_Finance_Transaction] PRIMARY KEY CLUSTERED 
(
	[Finance_Transaction_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_Finance_Transaction] UNIQUE NONCLUSTERED 
(
	[Transaction_Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Finance_Transaction] ON
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (1, N'Sale', N'123', NULL, CAST(0x0000A41300000000 AS DateTime), NULL)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (6, N'Topup', N'1234', NULL, CAST(0x0000A52D00000000 AS DateTime), NULL)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (7, N'desc', N'0', NULL, CAST(0x0000A541011593DD AS DateTime), NULL)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (9, N'desc', N'055', NULL, CAST(0x0000A541012DB7F5 AS DateTime), NULL)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (19, N'desc', N'057', NULL, CAST(0x0000A54200F681F5 AS DateTime), NULL)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (21, N'desc', N'058', NULL, CAST(0x0000A54200F80E01 AS DateTime), NULL)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (22, N'desc', N'059', NULL, CAST(0x0000A54200F97F9D AS DateTime), NULL)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (25, N'desc', N'061', NULL, CAST(0x0000A54200FEC098 AS DateTime), NULL)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (27, N'POSSALE', N'9876543', NULL, CAST(0x0000A54400BFE237 AS DateTime), NULL)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (28, N'Topup', N'111/7/2015 6:19:32 PM', 1, CAST(0x0000A549012E02A1 AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (29, N'Topup', N'111/7/2015 6:22:16 PM', 1, CAST(0x0000A549012EC172 AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (30, N'Topup', N'111/7/2015 6:24:37 PM', 1, CAST(0x0000A549012F6A73 AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (31, N'Transfer', N'111/7/2015 6:48:28 PM', 1, CAST(0x0000A5490135F2EB AS DateTime), 9)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (32, N'Transfer', N'111/7/2015 6:50:02 PM', 1, CAST(0x0000A54901366066 AS DateTime), 9)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (33, N'Transfer by Customer', N'811/7/2015 6:55:27 PM', 1, CAST(0x0000A5490137DCFE AS DateTime), 9)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (34, N'Topup', N'111/25/2015 12:40:38 PM', 1, CAST(0x0000A55B00D0EB0F AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (35, N'Topup', N'111/25/2015 12:55:19 PM', 1, CAST(0x0000A55B00D4F299 AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (36, N'Transfer', N'111/25/2015 1:13:28 PM', 1, CAST(0x0000A55B00D9EEB6 AS DateTime), 9)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (37, N'Transfer', N'111/25/2015 1:18:15 PM', 1, CAST(0x0000A55B00DB3F92 AS DateTime), 9)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (38, N'Topup', N'111/26/2015 6:32:07 PM', 1, CAST(0x0000A55C013174CA AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (39, N'Topup', N'111/26/2015 7:11:45 PM', 1, CAST(0x0000A55C013C5700 AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (40, N'Topup', N'111/26/2015 7:17:25 PM', 1, CAST(0x0000A55C013DE5FB AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (41, N'Topup', N'111/26/2015 7:21:37 PM', 1, CAST(0x0000A55C013F0D85 AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (42, N'Topup', N'111/26/2015 7:22:28 PM', 1, CAST(0x0000A55C013F48BC AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (43, N'Topup', N'111/26/2015 7:22:30 PM', 1, CAST(0x0000A55C013F4A6B AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (44, N'Topup', N'111/26/2015 7:22:31 PM', 1, CAST(0x0000A55C013F4BE6 AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (45, N'Topup', N'111/26/2015 7:22:32 PM', 1, CAST(0x0000A55C013F4D74 AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (46, N'Topup', N'111/26/2015 7:22:33 PM', 1, CAST(0x0000A55C013F4EEB AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (47, N'Topup', N'111/26/2015 7:22:35 PM', 1, CAST(0x0000A55C013F5061 AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (48, N'Topup', N'111/26/2015 7:22:36 PM', 1, CAST(0x0000A55C013F51CF AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (49, N'Topup', N'111/26/2015 7:22:37 PM', 1, CAST(0x0000A55C013F5337 AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (50, N'Topup', N'111/26/2015 7:22:38 PM', 1, CAST(0x0000A55C013F549E AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (51, N'Topup', N'111/26/2015 7:31:34 PM', 1, CAST(0x0000A55C0141C8D3 AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (52, N'Topup', N'111/26/2015 7:33:29 PM', 1, CAST(0x0000A55C01424F75 AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (53, N'Topup', N'111/26/2015 7:34:05 PM', 1, CAST(0x0000A55C014279C2 AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (54, N'Topup', N'111/26/2015 7:34:29 PM', 1, CAST(0x0000A55C014294F5 AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (55, N'Topup', N'111/26/2015 7:40:26 PM', 1, CAST(0x0000A55C014437FA AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (56, N'Topup', N'111/26/2015 7:40:55 PM', 1, CAST(0x0000A55C01445A36 AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (57, N'Topup', N'111/26/2015 7:40:58 PM', 1, CAST(0x0000A55C01445DC6 AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (58, N'Topup', N'111/26/2015 7:41:02 PM', 1, CAST(0x0000A55C01446192 AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (59, N'Topup', N'111/26/2015 7:41:05 PM', 1, CAST(0x0000A55C014464EF AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (60, N'Topup', N'111/26/2015 7:41:07 PM', 1, CAST(0x0000A55C014467AC AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (61, N'Topup', N'111/26/2015 7:41:09 PM', 1, CAST(0x0000A55C014469BA AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (62, N'Topup', N'111/26/2015 7:41:10 PM', 1, CAST(0x0000A55C01446BBE AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (63, N'Topup', N'111/26/2015 7:41:12 PM', 1, CAST(0x0000A55C01446E05 AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (64, N'Topup', N'111/26/2015 7:41:34 PM', 1, CAST(0x0000A55C01448741 AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (65, N'Topup', N'111/26/2015 7:47:42 PM', 1, CAST(0x0000A55C01463717 AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (66, N'Topup', N'111/26/2015 7:47:43 PM', 1, CAST(0x0000A55C01463768 AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (68, N'Topup', N'111/26/2015 7:50:26 PM', 1, CAST(0x0000A55C0146F6A3 AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (70, N'Topup', N'111/26/2015 7:51:41 PM', 1, CAST(0x0000A55C01474EF3 AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (71, N'Topup', N'111/26/2015 7:52:48 PM', 1, CAST(0x0000A55C01479DB5 AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (72, N'Topup', N'111/26/2015 7:52:54 PM', 1, CAST(0x0000A55C0147A468 AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (73, N'Topup', N'111/26/2015 7:52:57 PM', 1, CAST(0x0000A55C0147A7F4 AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (74, N'Topup', N'111/26/2015 7:52:59 PM', 1, CAST(0x0000A55C0147AAA7 AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (75, N'Topup', N'111/26/2015 7:53:02 PM', 1, CAST(0x0000A55C0147AD58 AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (76, N'Topup', N'111/26/2015 7:53:04 PM', 1, CAST(0x0000A55C0147AFFF AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (77, N'Topup', N'111/26/2015 7:53:06 PM', 1, CAST(0x0000A55C0147B28E AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (78, N'Topup', N'111/26/2015 7:53:08 PM', 1, CAST(0x0000A55C0147B4F5 AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (79, N'Topup', N'111/26/2015 7:53:10 PM', 1, CAST(0x0000A55C0147B739 AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (80, N'Topup', N'111/26/2015 7:54:14 PM', 1, CAST(0x0000A55C0148027D AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (81, N'Topup', N'111/26/2015 7:56:29 PM', 1, CAST(0x0000A55C01489FD1 AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (83, N'Topup', N'c1370004-a370-4744-882a-6fbc006d56c9', 1, CAST(0x0000A55C014BC8F9 AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (84, N'Topup', N'0be19743-cf34-429d-8bfc-4da899884101', 1, CAST(0x0000A55C014BC945 AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (85, N'Topup', N'd9a9beaf-4e4e-4660-a3c5-d6d851c38f32', 1, CAST(0x0000A55C014BC94C AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (86, N'Topup', N'6088b1a4-b070-4a5b-963c-6baffaddc5eb', 1, CAST(0x0000A55C014BC952 AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (87, N'Topup', N'3bd1ecb6-7d94-4695-a795-55a7fe3bb904', 1, CAST(0x0000A55C014BC95E AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (88, N'Topup', N'9cf080a0-9827-4899-9c3c-df68eaa2721b', 1, CAST(0x0000A55C014BC964 AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (89, N'Topup', N'f64e09de-c443-4e22-b960-a4cfed9bdb43', 1, CAST(0x0000A55C014BC969 AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (90, N'Topup', N'5942b7ff-acf3-4f3f-a65a-9df4e39f3019', 1, CAST(0x0000A55C014BC973 AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (91, N'Topup', N'876f4edf-a141-4dfb-aace-a35cbf041a41', 1, CAST(0x0000A55C014BC979 AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (92, N'Topup', N'ef029ffd-8dd1-488b-9189-2955c3a2dba3', 1, CAST(0x0000A55C014BC983 AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (93, N'Topup', N'f573081c-de5c-4c0f-93bb-49b759bafb62', 1, CAST(0x0000A55C014C30AB AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (94, N'Topup', N'5310b633-f982-4e2a-aa87-dc7218368492', 1, CAST(0x0000A55C014C30F3 AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (95, N'Topup', N'8cad8b25-7c17-40c5-a7d1-7c7bd08b4ad1', 1, CAST(0x0000A55C014C30FF AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (96, N'Topup', N'25ee4a69-c47b-4d49-baa9-c1cc531375c5', 1, CAST(0x0000A55C014C3104 AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (97, N'Topup', N'107bf5eb-596e-4715-ba3c-2373026ab186', 1, CAST(0x0000A55C014C310E AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (98, N'Topup', N'f94cf56f-96fb-404c-9e31-cbe7c0f5b7a7', 1, CAST(0x0000A55C014C3113 AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (99, N'Topup', N'93129fe5-2cd4-4ef9-884b-6c3687b9dcf0', 1, CAST(0x0000A55C014C3118 AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (100, N'Topup', N'6fb95b02-a51e-43e6-a369-69ef17480140', 1, CAST(0x0000A55C014C3120 AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (101, N'Topup', N'bc90d503-7711-4078-b02a-57eebba6dc18', 1, CAST(0x0000A55C014C3126 AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (102, N'Topup', N'5d25941a-8ce6-4402-b0c5-02e03222a48c', 1, CAST(0x0000A55C014C3130 AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (103, N'Topup', N'111/27/2015 12:09:10 PM', 1, CAST(0x0000A55D00C845BC AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (105, N'Topup', N'111/27/201512:15:10.9043', 1, CAST(0x0000A55D00C9EC77 AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (106, N'Topup', N'111/27/201512:15:11.1493', 1, CAST(0x0000A55D00C9ECC1 AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (107, N'Topup', N'111/27/201512:15:11.1703', 1, CAST(0x0000A55D00C9ECC7 AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (108, N'Topup', N'111/27/201512:15:11.1903', 1, CAST(0x0000A55D00C9ECCD AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (109, N'Topup', N'111/27/201512:15:11.2093', 1, CAST(0x0000A55D00C9ECD3 AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (110, N'Topup', N'111/27/201512:15:11.2283', 1, CAST(0x0000A55D00C9ECD8 AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (111, N'Topup', N'111/27/201512:15:11.2583', 1, CAST(0x0000A55D00C9ECE1 AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (112, N'Topup', N'111/27/201512:15:11.2803', 1, CAST(0x0000A55D00C9ECE8 AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (113, N'Topup', N'111/27/201512:15:11.3123', 1, CAST(0x0000A55D00C9ECF2 AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (114, N'Topup', N'111/27/201512:15:11.3303', 1, CAST(0x0000A55D00C9ECF7 AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (115, N'Topup', N'1/11/27/2015/12:18:00.6060', 1, CAST(0x0000A55D00CAB356 AS DateTime), 10)
INSERT [dbo].[Finance_Transaction] ([Finance_Transaction_id], [Finance_Trans_description], [Transaction_Code], [IsPosted], [Transaction_DateCreated], [Doc_Type_id]) VALUES (116, N'Topup', N'1112720151219440209', 1, CAST(0x0000A55D00CB2C86 AS DateTime), 10)
SET IDENTITY_INSERT [dbo].[Finance_Transaction] OFF
/****** Object:  Table [dbo].[EventsTbl]    Script Date: 11/30/2015 16:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventsTbl](
	[Event_id] [bigint] IDENTITY(1,1) NOT NULL,
	[Event_Name] [nvarchar](50) NULL,
	[Event_Description] [nvarchar](250) NULL,
	[Event_IsActive] [bit] NULL CONSTRAINT [DF_EventsTbl_Event_IsActive]  DEFAULT ((1)),
	[Event_IsDeleted] [bit] NULL CONSTRAINT [DF_EventsTbl_Event_IsDeleted]  DEFAULT ((0)),
	[Event_DateCreated] [datetime] NULL,
	[IsAddApproved] [bit] NULL,
	[IsDelApproved] [bit] NULL,
	[IsEditApproved] [bit] NULL,
 CONSTRAINT [PK_EventsTbl] PRIMARY KEY CLUSTERED 
(
	[Event_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[EventsTbl] ON
INSERT [dbo].[EventsTbl] ([Event_id], [Event_Name], [Event_Description], [Event_IsActive], [Event_IsDeleted], [Event_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (1, N'Event1', N'sdsu sudysd usdy', 1, 0, CAST(0x0000A4B500C2842E AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[EventsTbl] ([Event_id], [Event_Name], [Event_Description], [Event_IsActive], [Event_IsDeleted], [Event_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (2, N'Event2', N'Tets sdasjd jsdh', 1, 0, CAST(0x0000A4F700DBAA32 AS DateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[EventsTbl] OFF
/****** Object:  Table [dbo].[Employee]    Script Date: 11/30/2015 16:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Emp_id] [bigint] IDENTITY(1,1) NOT NULL,
	[Emp_Customer_id] [bigint] NULL,
	[Emp_Name] [nvarchar](50) NULL,
	[Emp_Description] [nvarchar](50) NULL,
	[Emp_Email] [nvarchar](50) NULL,
	[Emp_Phone] [nvarchar](50) NULL,
	[Emp_IsActive] [bit] NULL,
	[Emp_IsDeleted] [bit] NULL,
	[Emp_DateCreated] [datetime] NULL,
	[IsAddApproved] [bit] NULL,
	[IsDelApproved] [bit] NULL,
	[IsEditApproved] [bit] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Emp_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Employee related to customer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Employee', @level2type=N'COLUMN',@level2name=N'Emp_Customer_id'
GO
SET IDENTITY_INSERT [dbo].[Employee] ON
INSERT [dbo].[Employee] ([Emp_id], [Emp_Customer_id], [Emp_Name], [Emp_Description], [Emp_Email], [Emp_Phone], [Emp_IsActive], [Emp_IsDeleted], [Emp_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (10, 3, N'Ganesh', N'sdsdksj dsgdh', N'hagas@dgsd', N'9839839434', 1, 0, CAST(0x0000A4A100C0A489 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Employee] ([Emp_id], [Emp_Customer_id], [Emp_Name], [Emp_Description], [Emp_Email], [Emp_Phone], [Emp_IsActive], [Emp_IsDeleted], [Emp_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (11, 3, N'Ganesh Sharma', N'aa aadj skdjds dk', N'ganeshsharma@yahoo.com', N'238293829', 1, 0, CAST(0x0000A4A00128E4DB AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Employee] ([Emp_id], [Emp_Customer_id], [Emp_Name], [Emp_Description], [Emp_Email], [Emp_Phone], [Emp_IsActive], [Emp_IsDeleted], [Emp_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (12, 3, N'jkjaska', N'askjask', N'kdjsk@ksdjsdk', N'3473748347', 1, 0, CAST(0x0000A4A001294F23 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Employee] ([Emp_id], [Emp_Customer_id], [Emp_Name], [Emp_Description], [Emp_Email], [Emp_Phone], [Emp_IsActive], [Emp_IsDeleted], [Emp_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (13, 3, N'kjdkas', N'kjckc', N'xckjxck@kdjdfk', N'93483948', 1, 0, CAST(0x0000A4A0012A2401 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Employee] ([Emp_id], [Emp_Customer_id], [Emp_Name], [Emp_Description], [Emp_Email], [Emp_Phone], [Emp_IsActive], [Emp_IsDeleted], [Emp_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (14, 3, N'sdasds', N'asasj', N'sdias@sduisd', N'3473487348', 1, 0, CAST(0x0000A4A0012A9349 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Employee] ([Emp_id], [Emp_Customer_id], [Emp_Name], [Emp_Description], [Emp_Email], [Emp_Phone], [Emp_IsActive], [Emp_IsDeleted], [Emp_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (15, 3, N'duasduasi', N'isdusdi', N'idusd@isdudsi', N'384394394', 1, 0, CAST(0x0000A4A0012B1ACD AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Employee] ([Emp_id], [Emp_Customer_id], [Emp_Name], [Emp_Description], [Emp_Email], [Emp_Phone], [Emp_IsActive], [Emp_IsDeleted], [Emp_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (16, 3, N'sdusidu', N'idsduisd', N'isdusd@isdusdi', N'348398349', 1, 0, CAST(0x0000A4A0012B9D6B AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Employee] ([Emp_id], [Emp_Customer_id], [Emp_Name], [Emp_Description], [Emp_Email], [Emp_Phone], [Emp_IsActive], [Emp_IsDeleted], [Emp_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (17, 3, N'dasdus', N'isdusdi', N'idusd@idusdi', N'3434839', 1, 0, CAST(0x0000A4A0012BBB2E AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Employee] ([Emp_id], [Emp_Customer_id], [Emp_Name], [Emp_Description], [Emp_Email], [Emp_Phone], [Emp_IsActive], [Emp_IsDeleted], [Emp_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (18, 3, N'duid', N'isdusdi', N'idusd@idusdi', N'834834783', 1, 0, CAST(0x0000A4A0012C414E AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Employee] ([Emp_id], [Emp_Customer_id], [Emp_Name], [Emp_Description], [Emp_Email], [Emp_Phone], [Emp_IsActive], [Emp_IsDeleted], [Emp_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (19, 3, N'asdjskd', N'skjsdk', N'skdjs@ksdjdsk', N'483948349', 1, 0, CAST(0x0000A4A0012DF454 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Employee] ([Emp_id], [Emp_Customer_id], [Emp_Name], [Emp_Description], [Emp_Email], [Emp_Phone], [Emp_IsActive], [Emp_IsDeleted], [Emp_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (20, 3, N'sdasdj', N'skdjsdk', N'dksjd@ksdsdk', N'348394839', 1, 0, CAST(0x0000A4A0012E41E0 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Employee] ([Emp_id], [Emp_Customer_id], [Emp_Name], [Emp_Description], [Emp_Email], [Emp_Phone], [Emp_IsActive], [Emp_IsDeleted], [Emp_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (21, 3, N'hjasdhs', N'dhsj', N'jdshd@jsdhsdj', N'347384738', 1, 0, CAST(0x0000A4A00130FB74 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Employee] ([Emp_id], [Emp_Customer_id], [Emp_Name], [Emp_Description], [Emp_Email], [Emp_Phone], [Emp_IsActive], [Emp_IsDeleted], [Emp_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (22, 3, N'asdasdh', N'djsdj', N'sdjhs@jsdhsdj', N'3498349348', 1, 0, CAST(0x0000A4A00137D81E AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Employee] ([Emp_id], [Emp_Customer_id], [Emp_Name], [Emp_Description], [Emp_Email], [Emp_Phone], [Emp_IsActive], [Emp_IsDeleted], [Emp_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (23, 3, N'asdasdhsad', N'sdshd', N'sdjks@ksjdsd', N'237843443', 1, 0, CAST(0x0000A4A00140E3E2 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Employee] ([Emp_id], [Emp_Customer_id], [Emp_Name], [Emp_Description], [Emp_Email], [Emp_Phone], [Emp_IsActive], [Emp_IsDeleted], [Emp_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (24, 1, N'Ganesh', N'sdsd sdsdsdy', N'jsdsdj@jsdhd', N'483493849', 1, 0, CAST(0x0000A4CA011C9909 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Employee] ([Emp_id], [Emp_Customer_id], [Emp_Name], [Emp_Description], [Emp_Email], [Emp_Phone], [Emp_IsActive], [Emp_IsDeleted], [Emp_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (25, 7, N'Lokesh', N'sas ahsashagsh', N'lokesh@yahoo.com', N'234567899', 1, 0, CAST(0x0000A4DB00E40229 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Employee] ([Emp_id], [Emp_Customer_id], [Emp_Name], [Emp_Description], [Emp_Email], [Emp_Phone], [Emp_IsActive], [Emp_IsDeleted], [Emp_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (26, 8, N'Manoj', N'Monoj', N'manoj@yahoo.com', N'9828723456', 1, 0, CAST(0x0000A53E011E93D5 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Employee] ([Emp_id], [Emp_Customer_id], [Emp_Name], [Emp_Description], [Emp_Email], [Emp_Phone], [Emp_IsActive], [Emp_IsDeleted], [Emp_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (27, 7, N'Surendra', N'sdjsd sdksdk', N'surendra@abc.com', N'93832823', 1, 0, CAST(0x0000A53A013B1904 AS DateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Employee] OFF
/****** Object:  Table [dbo].[CustomTableFields]    Script Date: 11/30/2015 16:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomTableFields](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[CustomFieldId] [varchar](50) NULL,
	[CustomFieldName] [varchar](50) NULL,
	[TableName] [varchar](50) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_CustomTableFields] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[CustomTableFields] ON
INSERT [dbo].[CustomTableFields] ([id], [CustomFieldId], [CustomFieldName], [TableName], [IsActive]) VALUES (1, N'CF1', N'Custom Field Name1', N'Customers', 1)
INSERT [dbo].[CustomTableFields] ([id], [CustomFieldId], [CustomFieldName], [TableName], [IsActive]) VALUES (2, N'CF2', N'Custom Field Name2', N'Customers', 1)
INSERT [dbo].[CustomTableFields] ([id], [CustomFieldId], [CustomFieldName], [TableName], [IsActive]) VALUES (3, N'CF3', N'Custom Field Name3', N'Customers', 1)
INSERT [dbo].[CustomTableFields] ([id], [CustomFieldId], [CustomFieldName], [TableName], [IsActive]) VALUES (4, N'CF4', N'Custom Field Name4', N'Customers', 1)
INSERT [dbo].[CustomTableFields] ([id], [CustomFieldId], [CustomFieldName], [TableName], [IsActive]) VALUES (5, N'CF5', N'Custom Field Name5', N'Customers', 1)
INSERT [dbo].[CustomTableFields] ([id], [CustomFieldId], [CustomFieldName], [TableName], [IsActive]) VALUES (6, N'CF1', N'Custom Field Name1', N'Staff', 1)
INSERT [dbo].[CustomTableFields] ([id], [CustomFieldId], [CustomFieldName], [TableName], [IsActive]) VALUES (7, N'CF2', N'Custom Field Name2', N'Staff', 1)
INSERT [dbo].[CustomTableFields] ([id], [CustomFieldId], [CustomFieldName], [TableName], [IsActive]) VALUES (8, N'CF3', N'Custom Field Name3', N'Staff', 1)
INSERT [dbo].[CustomTableFields] ([id], [CustomFieldId], [CustomFieldName], [TableName], [IsActive]) VALUES (9, N'CF4', N'Custom Field Name4', N'Staff', 1)
INSERT [dbo].[CustomTableFields] ([id], [CustomFieldId], [CustomFieldName], [TableName], [IsActive]) VALUES (10, N'CF5', N'Custom Field Name5', N'Staff', 1)
INSERT [dbo].[CustomTableFields] ([id], [CustomFieldId], [CustomFieldName], [TableName], [IsActive]) VALUES (11, N'CF1', N'Custom Field Name1', N'ChannelType', 1)
INSERT [dbo].[CustomTableFields] ([id], [CustomFieldId], [CustomFieldName], [TableName], [IsActive]) VALUES (12, N'CF2', N'Custom Field Name2', N'ChannelType', 1)
INSERT [dbo].[CustomTableFields] ([id], [CustomFieldId], [CustomFieldName], [TableName], [IsActive]) VALUES (13, N'CF3', N'Custom Field Name3', N'ChannelType', 1)
INSERT [dbo].[CustomTableFields] ([id], [CustomFieldId], [CustomFieldName], [TableName], [IsActive]) VALUES (14, N'CF4', N'Custom Field Name4', N'ChannelType', 1)
INSERT [dbo].[CustomTableFields] ([id], [CustomFieldId], [CustomFieldName], [TableName], [IsActive]) VALUES (15, N'CF5', N'Custom Field Name5', N'ChannelType', 1)
INSERT [dbo].[CustomTableFields] ([id], [CustomFieldId], [CustomFieldName], [TableName], [IsActive]) VALUES (16, N'CF1', N'Custom Field Name1', N'Channel', 1)
INSERT [dbo].[CustomTableFields] ([id], [CustomFieldId], [CustomFieldName], [TableName], [IsActive]) VALUES (17, N'CF2', N'Custom Field Name2', N'Channel', 1)
INSERT [dbo].[CustomTableFields] ([id], [CustomFieldId], [CustomFieldName], [TableName], [IsActive]) VALUES (18, N'CF3', N'Custom Field Name3', N'Channel', 1)
INSERT [dbo].[CustomTableFields] ([id], [CustomFieldId], [CustomFieldName], [TableName], [IsActive]) VALUES (19, N'CF4', N'Custom Field Name4', N'Channel', 1)
INSERT [dbo].[CustomTableFields] ([id], [CustomFieldId], [CustomFieldName], [TableName], [IsActive]) VALUES (20, N'CF5', N'Custom Field Name5', N'Channel', 1)
INSERT [dbo].[CustomTableFields] ([id], [CustomFieldId], [CustomFieldName], [TableName], [IsActive]) VALUES (21, N'CF1', N'Custom Field Name1', N'Product', 1)
INSERT [dbo].[CustomTableFields] ([id], [CustomFieldId], [CustomFieldName], [TableName], [IsActive]) VALUES (22, N'CF2', N'Custom Field Name2', N'Product', 1)
INSERT [dbo].[CustomTableFields] ([id], [CustomFieldId], [CustomFieldName], [TableName], [IsActive]) VALUES (23, N'CF3', N'Custom Field Name3', N'Product', 1)
INSERT [dbo].[CustomTableFields] ([id], [CustomFieldId], [CustomFieldName], [TableName], [IsActive]) VALUES (24, N'CF4', N'Custom Field Name4', N'Product', 1)
INSERT [dbo].[CustomTableFields] ([id], [CustomFieldId], [CustomFieldName], [TableName], [IsActive]) VALUES (25, N'CF5', N'Custom Field Name5', N'Product', 1)
INSERT [dbo].[CustomTableFields] ([id], [CustomFieldId], [CustomFieldName], [TableName], [IsActive]) VALUES (26, N'CF1', N'Custom Field Name1', N'ProductType', 1)
INSERT [dbo].[CustomTableFields] ([id], [CustomFieldId], [CustomFieldName], [TableName], [IsActive]) VALUES (27, N'CF2', N'Custom Field Name2', N'ProductType', 1)
INSERT [dbo].[CustomTableFields] ([id], [CustomFieldId], [CustomFieldName], [TableName], [IsActive]) VALUES (28, N'CF3', N'Custom Field Name3', N'ProductType', 1)
INSERT [dbo].[CustomTableFields] ([id], [CustomFieldId], [CustomFieldName], [TableName], [IsActive]) VALUES (29, N'CF4', N'Custom Field Name4', N'ProductType', 1)
INSERT [dbo].[CustomTableFields] ([id], [CustomFieldId], [CustomFieldName], [TableName], [IsActive]) VALUES (30, N'CF5', N'Custom Field Name5', N'ProductType', 1)
SET IDENTITY_INSERT [dbo].[CustomTableFields] OFF
/****** Object:  Table [dbo].[CustomerTypes]    Script Date: 11/30/2015 16:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerTypes](
	[CustomerType_id] [bigint] IDENTITY(1,1) NOT NULL,
	[Customer_Type] [nvarchar](50) NULL,
	[CustomerTypeDescription] [nvarchar](250) NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[IsSelected] [bit] NOT NULL CONSTRAINT [DF_CustomerTypes_IsSelected]  DEFAULT ((0)),
	[IsAddApproved] [bit] NULL,
	[IsDelApproved] [bit] NULL,
	[IsEditApproved] [bit] NULL,
	[IsDeletedFlag] [int] NULL,
	[IsbeingEdited] [bit] NULL,
 CONSTRAINT [PK_CustomerTypes] PRIMARY KEY CLUSTERED 
(
	[CustomerType_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CustomerTypes] ON
INSERT [dbo].[CustomerTypes] ([CustomerType_id], [Customer_Type], [CustomerTypeDescription], [IsActive], [IsDeleted], [DateCreated], [IsSelected], [IsAddApproved], [IsDelApproved], [IsEditApproved], [IsDeletedFlag], [IsbeingEdited]) VALUES (1, N'Normal Customer', N'Normal Customer', 1, 0, CAST(0x0000A54500E6849E AS DateTime), 0, 1, NULL, 1, NULL, 0)
INSERT [dbo].[CustomerTypes] ([CustomerType_id], [Customer_Type], [CustomerTypeDescription], [IsActive], [IsDeleted], [DateCreated], [IsSelected], [IsAddApproved], [IsDelApproved], [IsEditApproved], [IsDeletedFlag], [IsbeingEdited]) VALUES (2, N'Regular Customer', N'Old Customer', 1, 0, CAST(0x0000A54600F56946 AS DateTime), 0, 1, NULL, 1, NULL, 0)
INSERT [dbo].[CustomerTypes] ([CustomerType_id], [Customer_Type], [CustomerTypeDescription], [IsActive], [IsDeleted], [DateCreated], [IsSelected], [IsAddApproved], [IsDelApproved], [IsEditApproved], [IsDeletedFlag], [IsbeingEdited]) VALUES (3, N'Corporate Customer', N'Corporate Customer', 1, 0, CAST(0x0000A54500E66B34 AS DateTime), 0, 1, NULL, 1, NULL, 0)
SET IDENTITY_INSERT [dbo].[CustomerTypes] OFF
/****** Object:  Table [dbo].[Customers]    Script Date: 11/30/2015 16:02:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customers](
	[Customer_id] [bigint] IDENTITY(1,1) NOT NULL,
	[Customer_Name] [nvarchar](50) NULL,
	[Customer_OtherName] [nvarchar](50) NULL,
	[Customer_DoB] [date] NULL,
	[Customer_Gender] [nvarchar](1) NULL,
	[Customer_Email] [nvarchar](50) NULL,
	[Customer_Password] [nvarchar](250) NULL,
	[Customer_Phone] [nvarchar](30) NULL,
	[Customer_Country] [nvarchar](100) NULL,
	[Customer_Role] [bigint] NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[IsVerificationMailSent] [bit] NULL,
	[IsVerified] [bit] NULL,
	[VerificationMailDate] [datetime] NULL,
	[PasswordResetLnkDate] [datetime] NULL,
	[DateCreated] [datetime] NULL,
	[IsAddApproved] [bit] NULL,
	[IsDelApproved] [bit] NULL,
	[IsEditApproved] [bit] NULL,
	[TotalEmp] [int] NULL,
	[ReportingPassword] [nvarchar](250) NULL,
	[Payment_Term_id] [bigint] NULL,
	[AutoRedistributeFunds] [bit] NULL,
	[CF1] [varchar](50) NULL,
	[CF2] [varchar](50) NULL,
	[CF3] [varchar](50) NULL,
	[CF4] [varchar](50) NULL,
	[CF5] [varchar](50) NULL,
	[Price_List_id] [bigint] NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Customer_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON
INSERT [dbo].[Customers] ([Customer_id], [Customer_Name], [Customer_OtherName], [Customer_DoB], [Customer_Gender], [Customer_Email], [Customer_Password], [Customer_Phone], [Customer_Country], [Customer_Role], [IsActive], [IsDeleted], [IsVerificationMailSent], [IsVerified], [VerificationMailDate], [PasswordResetLnkDate], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [TotalEmp], [ReportingPassword], [Payment_Term_id], [AutoRedistributeFunds], [CF1], [CF2], [CF3], [CF4], [CF5], [Price_List_id]) VALUES (8, N'Ramesh Sharma', N'Ram', CAST(0x86140B00 AS Date), N'M', N'surendra@mtoag.com', N'6F7nyIgPwCUxYMUZVJZYbg==', N'+91(2372)837-283', N'India', 3, 1, 0, 1, NULL, NULL, CAST(0x0000A4BD01361D25 AS DateTime), CAST(0x0000A5600106D9BA AS DateTime), NULL, NULL, NULL, NULL, N'e10adc3949ba59abbe56e057f20f883e', 1, 1, NULL, NULL, NULL, NULL, NULL, 3)
INSERT [dbo].[Customers] ([Customer_id], [Customer_Name], [Customer_OtherName], [Customer_DoB], [Customer_Gender], [Customer_Email], [Customer_Password], [Customer_Phone], [Customer_Country], [Customer_Role], [IsActive], [IsDeleted], [IsVerificationMailSent], [IsVerified], [VerificationMailDate], [PasswordResetLnkDate], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [TotalEmp], [ReportingPassword], [Payment_Term_id], [AutoRedistributeFunds], [CF1], [CF2], [CF3], [CF4], [CF5], [Price_List_id]) VALUES (13, N'Jhon', N'Jhon', CAST(0xA4040B00 AS Date), N'M', N'rakesh@mtoag.com', N'6F7nyIgPwCUxYMUZVJZYbg==', N'+91(9232)392-839', N'India', 4, 1, 0, 1, NULL, NULL, CAST(0x0000A54A011256AC AS DateTime), CAST(0x0000A55C0109EF02 AS DateTime), NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Customers] ([Customer_id], [Customer_Name], [Customer_OtherName], [Customer_DoB], [Customer_Gender], [Customer_Email], [Customer_Password], [Customer_Phone], [Customer_Country], [Customer_Role], [IsActive], [IsDeleted], [IsVerificationMailSent], [IsVerified], [VerificationMailDate], [PasswordResetLnkDate], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [TotalEmp], [ReportingPassword], [Payment_Term_id], [AutoRedistributeFunds], [CF1], [CF2], [CF3], [CF4], [CF5], [Price_List_id]) VALUES (14, N'Test', N'Testing', CAST(0x7E070B00 AS Date), N'M', N'mahendra@mtoag.com', N'BEWZdaS+ltpXGvbtrFZdZQ==', N'+91(8329)329-382', N'India', 3, 1, 0, 1, NULL, NULL, CAST(0x0000A55F01414A6C AS DateTime), CAST(0x0000A55C01178E3B AS DateTime), NULL, NULL, NULL, NULL, N'2ec0b7a0a7f96375e26df81b724ed86e', 1, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Customers] ([Customer_id], [Customer_Name], [Customer_OtherName], [Customer_DoB], [Customer_Gender], [Customer_Email], [Customer_Password], [Customer_Phone], [Customer_Country], [Customer_Role], [IsActive], [IsDeleted], [IsVerificationMailSent], [IsVerified], [VerificationMailDate], [PasswordResetLnkDate], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [TotalEmp], [ReportingPassword], [Payment_Term_id], [AutoRedistributeFunds], [CF1], [CF2], [CF3], [CF4], [CF5], [Price_List_id]) VALUES (15, N'sdasd', N'sdsdsd', CAST(0xB03A0B00 AS Date), N'M', N'yadavsurendra1@mtoag.com', N'xiKO6s4fdNMcuyDWLZ/N9A==', N'+91(2839)283-923', N'India', 3, 1, 0, 1, 0, NULL, CAST(0x0000A5650105580F AS DateTime), CAST(0x0000A56001054A63 AS DateTime), NULL, NULL, NULL, NULL, N'a48dcfbc8082e8fcaf883c8264ae3180', 1, NULL, NULL, NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[Customers] ([Customer_id], [Customer_Name], [Customer_OtherName], [Customer_DoB], [Customer_Gender], [Customer_Email], [Customer_Password], [Customer_Phone], [Customer_Country], [Customer_Role], [IsActive], [IsDeleted], [IsVerificationMailSent], [IsVerified], [VerificationMailDate], [PasswordResetLnkDate], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [TotalEmp], [ReportingPassword], [Payment_Term_id], [AutoRedistributeFunds], [CF1], [CF2], [CF3], [CF4], [CF5], [Price_List_id]) VALUES (16, N'sdasd', N'sdsd', CAST(0xBF070B00 AS Date), N'M', N'yadavsurendra1@gmail.com', N'6F7nyIgPwCUxYMUZVJZYbg==', N'+91(0290)239-202', N'India', 3, 1, 0, 1, 1, CAST(0x0000A56001066B53 AS DateTime), CAST(0x0000A56501064901 AS DateTime), CAST(0x0000A56001064232 AS DateTime), NULL, NULL, NULL, NULL, N'e10adc3949ba59abbe56e057f20f883e', 1, NULL, NULL, NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[Customers] ([Customer_id], [Customer_Name], [Customer_OtherName], [Customer_DoB], [Customer_Gender], [Customer_Email], [Customer_Password], [Customer_Phone], [Customer_Country], [Customer_Role], [IsActive], [IsDeleted], [IsVerificationMailSent], [IsVerified], [VerificationMailDate], [PasswordResetLnkDate], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [TotalEmp], [ReportingPassword], [Payment_Term_id], [AutoRedistributeFunds], [CF1], [CF2], [CF3], [CF4], [CF5], [Price_List_id]) VALUES (17, N'asdasd', N'sdsd', CAST(0xB93A0B00 AS Date), N'M', N'sds@gmail.com', N'45LaZgdg2MChRD7/TgyFFQ==', N'+91(8239)238-923', N'India', 3, 1, 0, 1, 0, NULL, CAST(0x0000A56501070E61 AS DateTime), CAST(0x0000A5600107087E AS DateTime), NULL, NULL, NULL, NULL, N'ce8a03e91cf36367aaddc92947649a85', 1, NULL, NULL, NULL, NULL, NULL, NULL, 2)
SET IDENTITY_INSERT [dbo].[Customers] OFF
/****** Object:  Table [dbo].[CustomerPermissions]    Script Date: 11/30/2015 16:02:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerPermissions](
	[Permission_Id] [bigint] IDENTITY(9845,1) NOT NULL,
	[PermissionName] [nvarchar](50) NULL,
	[PermissionDescription] [nvarchar](250) NULL,
	[PermissionIsSelected] [bit] NOT NULL CONSTRAINT [DF_CustomerPermissions_PermissionIsSelected]  DEFAULT ((0)),
	[IsAddApproved] [bit] NULL,
	[IsDelApproved] [bit] NULL,
	[IsEditApproved] [bit] NULL,
 CONSTRAINT [PK_CustomerPermissions] PRIMARY KEY CLUSTERED 
(
	[Permission_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CustomerPermissions] ON
INSERT [dbo].[CustomerPermissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (9846, N'Can_Create_Employee', N'Can be able to register new employee', 0, NULL, NULL, NULL)
INSERT [dbo].[CustomerPermissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (9847, N'Can_Edit_Employee', N'Can be able to edit employee details', 0, NULL, NULL, NULL)
INSERT [dbo].[CustomerPermissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (9848, N'Can_Delete_Employee', N'Can be able to delete employee', 0, NULL, NULL, NULL)
INSERT [dbo].[CustomerPermissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (9849, N'Can_Define_AccountUsageLimits', N'Can Define Account Usage Limits', 0, NULL, NULL, NULL)
INSERT [dbo].[CustomerPermissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (9850, N'Can_Login_to_CustomerPortal', N'Can login to Customer Portal', 0, NULL, NULL, NULL)
INSERT [dbo].[CustomerPermissions] ([Permission_Id], [PermissionName], [PermissionDescription], [PermissionIsSelected], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (9851, N'Can_Assign_AccountsToCustomerEmployee', N'Can Assign Accounts to Customer''s Employee', 0, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[CustomerPermissions] OFF
/****** Object:  Table [dbo].[Customer_Vehicle]    Script Date: 11/30/2015 16:02:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_Vehicle](
	[CustomerVehicleId] [bigint] IDENTITY(1,1) NOT NULL,
	[Customer_Id] [bigint] NULL,
	[Vehicle_Id] [bigint] NULL,
	[VehicleModel_Id] [bigint] NULL,
	[VehicleRegNo] [nvarchar](50) NULL,
	[TankCapacity] [decimal](18, 2) NULL,
	[DaystoFuel] [nvarchar](150) NULL,
	[StartTime] [time](7) NULL,
	[EndTime] [time](7) NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[ProductID] [bigint] NULL,
 CONSTRAINT [PK_Customer_Vehicle] PRIMARY KEY CLUSTERED 
(
	[CustomerVehicleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Customer_Vehicle] ON
INSERT [dbo].[Customer_Vehicle] ([CustomerVehicleId], [Customer_Id], [Vehicle_Id], [VehicleModel_Id], [VehicleRegNo], [TankCapacity], [DaystoFuel], [StartTime], [EndTime], [IsActive], [IsDeleted], [DateCreated], [ProductID]) VALUES (5, 6, 8, 6, N'TR90009', CAST(2.40 AS Decimal(18, 2)), N'Sunday,Monday', CAST(0x0700A6C9A96D0000 AS Time), CAST(0x07007E2856A80000 AS Time), 1, 0, CAST(0x0000A53D00C06DD8 AS DateTime), NULL)
INSERT [dbo].[Customer_Vehicle] ([CustomerVehicleId], [Customer_Id], [Vehicle_Id], [VehicleModel_Id], [VehicleRegNo], [TankCapacity], [DaystoFuel], [StartTime], [EndTime], [IsActive], [IsDeleted], [DateCreated], [ProductID]) VALUES (6, 6, 8, 8, N'HU00918', CAST(2.40 AS Decimal(18, 2)), N'Tuesday,Wednesday,Thursday', CAST(0x0700049A5C6E0000 AS Time), CAST(0x0700E49F89790000 AS Time), 1, 0, CAST(0x0000A53D00C3352B AS DateTime), NULL)
INSERT [dbo].[Customer_Vehicle] ([CustomerVehicleId], [Customer_Id], [Vehicle_Id], [VehicleModel_Id], [VehicleRegNo], [TankCapacity], [DaystoFuel], [StartTime], [EndTime], [IsActive], [IsDeleted], [DateCreated], [ProductID]) VALUES (8, 6, 5, 2, N'WV0092', CAST(5.00 AS Decimal(18, 2)), N'Tuesday,Wednesday,Thursday', CAST(0x0700227669850000 AS Time), CAST(0x0700629977C80000 AS Time), 1, 0, CAST(0x0000A53D00C33D61 AS DateTime), NULL)
INSERT [dbo].[Customer_Vehicle] ([CustomerVehicleId], [Customer_Id], [Vehicle_Id], [VehicleModel_Id], [VehicleRegNo], [TankCapacity], [DaystoFuel], [StartTime], [EndTime], [IsActive], [IsDeleted], [DateCreated], [ProductID]) VALUES (9, 4, 8, 9, N'RD-9038', CAST(2.40 AS Decimal(18, 2)), N'Monday,Wednesday,Saturday', CAST(0x0700DE16CF860000 AS Time), CAST(0x07007E2856A80000 AS Time), 1, 0, CAST(0x0000A53600CEAE21 AS DateTime), NULL)
INSERT [dbo].[Customer_Vehicle] ([CustomerVehicleId], [Customer_Id], [Vehicle_Id], [VehicleModel_Id], [VehicleRegNo], [TankCapacity], [DaystoFuel], [StartTime], [EndTime], [IsActive], [IsDeleted], [DateCreated], [ProductID]) VALUES (10, 4, 8, 3, N'KE8989', CAST(2.40 AS Decimal(18, 2)), N'Monday,Wednesday,Thursday,Friday', CAST(0x0700D85EAC3A0000 AS Time), CAST(0x07002058A3A70000 AS Time), 1, 0, CAST(0x0000A53600CFA65C AS DateTime), NULL)
INSERT [dbo].[Customer_Vehicle] ([CustomerVehicleId], [Customer_Id], [Vehicle_Id], [VehicleModel_Id], [VehicleRegNo], [TankCapacity], [DaystoFuel], [StartTime], [EndTime], [IsActive], [IsDeleted], [DateCreated], [ProductID]) VALUES (11, 4, 8, 8, N'KEN9253', CAST(2.40 AS Decimal(18, 2)), N'Monday,Tuesday', CAST(0x0700D85EAC3A0000 AS Time), CAST(0x07002058A3A70000 AS Time), 1, 0, CAST(0x0000A53600D10B68 AS DateTime), NULL)
INSERT [dbo].[Customer_Vehicle] ([CustomerVehicleId], [Customer_Id], [Vehicle_Id], [VehicleModel_Id], [VehicleRegNo], [TankCapacity], [DaystoFuel], [StartTime], [EndTime], [IsActive], [IsDeleted], [DateCreated], [ProductID]) VALUES (12, 7, 5, 2, N'RT9090', CAST(5.00 AS Decimal(18, 2)), N'Sunday,Monday,Tuesday', CAST(0x070040230E430000 AS Time), CAST(0x07002058A3A70000 AS Time), 1, 0, CAST(0x0000A53D00CD88E0 AS DateTime), 1)
INSERT [dbo].[Customer_Vehicle] ([CustomerVehicleId], [Customer_Id], [Vehicle_Id], [VehicleModel_Id], [VehicleRegNo], [TankCapacity], [DaystoFuel], [StartTime], [EndTime], [IsActive], [IsDeleted], [DateCreated], [ProductID]) VALUES (13, 7, 5, 7, N'KE1234', CAST(5.00 AS Decimal(18, 2)), N'Monday', CAST(0x07008482A8410000 AS Time), CAST(0x07005CE1547C0000 AS Time), 1, 0, CAST(0x0000A53D00CD465D AS DateTime), 1)
INSERT [dbo].[Customer_Vehicle] ([CustomerVehicleId], [Customer_Id], [Vehicle_Id], [VehicleModel_Id], [VehicleRegNo], [TankCapacity], [DaystoFuel], [StartTime], [EndTime], [IsActive], [IsDeleted], [DateCreated], [ProductID]) VALUES (14, 4, 5, 2, N'AA12345', CAST(5.00 AS Decimal(18, 2)), N'Monday,Tuesday,Wednesday', CAST(0x0700D85EAC3A0000 AS Time), CAST(0x07002058A3A70000 AS Time), 1, 0, CAST(0x0000A53600D5FF18 AS DateTime), NULL)
INSERT [dbo].[Customer_Vehicle] ([CustomerVehicleId], [Customer_Id], [Vehicle_Id], [VehicleModel_Id], [VehicleRegNo], [TankCapacity], [DaystoFuel], [StartTime], [EndTime], [IsActive], [IsDeleted], [DateCreated], [ProductID]) VALUES (15, 4, 5, 4, N'RA8989', CAST(5.00 AS Decimal(18, 2)), N'Tuesday', CAST(0x0700D088C3100000 AS Time), CAST(0x07002058A3A70000 AS Time), 1, 0, CAST(0x0000A53600D6363E AS DateTime), NULL)
INSERT [dbo].[Customer_Vehicle] ([CustomerVehicleId], [Customer_Id], [Vehicle_Id], [VehicleModel_Id], [VehicleRegNo], [TankCapacity], [DaystoFuel], [StartTime], [EndTime], [IsActive], [IsDeleted], [DateCreated], [ProductID]) VALUES (16, 8, 8, 9, N'LX6363', CAST(2.40 AS Decimal(18, 2)), N'Monday,Tuesday', CAST(0x0700D85EAC3A0000 AS Time), CAST(0x07002058A3A70000 AS Time), 1, 0, CAST(0x0000A55C00FFB58A AS DateTime), 19)
INSERT [dbo].[Customer_Vehicle] ([CustomerVehicleId], [Customer_Id], [Vehicle_Id], [VehicleModel_Id], [VehicleRegNo], [TankCapacity], [DaystoFuel], [StartTime], [EndTime], [IsActive], [IsDeleted], [DateCreated], [ProductID]) VALUES (17, 8, 8, 9, N'Y73823', CAST(2.40 AS Decimal(18, 2)), N'Monday,Tuesday', CAST(0x0700EAF9DB120000 AS Time), CAST(0x070032F3D27F0000 AS Time), 1, 0, CAST(0x0000A55C00FC54C7 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Customer_Vehicle] OFF
/****** Object:  Table [dbo].[Customer_Roles]    Script Date: 11/30/2015 16:02:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_Roles](
	[Customer_RoleId] [bigint] IDENTITY(1,1) NOT NULL,
	[Customer_RoleName] [nvarchar](50) NULL,
	[Customer_RoleDescription] [nvarchar](250) NULL,
	[Role_IsActive] [bit] NULL CONSTRAINT [DF_Customer_Roles_Role_IsActive]  DEFAULT ((1)),
	[Role_IsDeleted] [bit] NULL CONSTRAINT [DF_Customer_Roles_Role_IsDeleted]  DEFAULT ((0)),
	[Role_DateCreated] [datetime] NULL,
	[IsAddApproved] [bit] NULL,
	[IsDelApproved] [bit] NULL,
	[IsEditApproved] [bit] NULL,
 CONSTRAINT [PK_Customer_Roles] PRIMARY KEY CLUSTERED 
(
	[Customer_RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Customer_Roles] ON
INSERT [dbo].[Customer_Roles] ([Customer_RoleId], [Customer_RoleName], [Customer_RoleDescription], [Role_IsActive], [Role_IsDeleted], [Role_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (3, N'Admin', N'Can do CRUD operation.', 1, 0, CAST(0x0000A54500D76D8C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Customer_Roles] ([Customer_RoleId], [Customer_RoleName], [Customer_RoleDescription], [Role_IsActive], [Role_IsDeleted], [Role_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (4, N'NormalUser', N'Normal User of Customer Portal', 1, 0, CAST(0x0000A54500E0AEEB AS DateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Customer_Roles] OFF
/****** Object:  Table [dbo].[Customer_PriceList]    Script Date: 11/30/2015 16:02:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_PriceList](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[Customer_id] [bigint] NULL,
	[Price_List_id] [bigint] NULL,
 CONSTRAINT [PK_Customer_PriceList] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Customer_PriceList] ON
INSERT [dbo].[Customer_PriceList] ([id], [Customer_id], [Price_List_id]) VALUES (10, 8, 2)
INSERT [dbo].[Customer_PriceList] ([id], [Customer_id], [Price_List_id]) VALUES (11, 13, 2)
INSERT [dbo].[Customer_PriceList] ([id], [Customer_id], [Price_List_id]) VALUES (12, 14, 2)
SET IDENTITY_INSERT [dbo].[Customer_PriceList] OFF
/****** Object:  Table [dbo].[Customer_AccountUsageLimit]    Script Date: 11/30/2015 16:02:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_AccountUsageLimit](
	[UsageLimit_id] [bigint] IDENTITY(2678,1) NOT NULL,
	[UsageLimit_AccountNumber] [bigint] NULL,
	[UsageLimit_Product_id] [bigint] NULL,
	[UsageLimit_Value] [decimal](18, 2) NULL,
	[UsageLimit_DateCreated] [datetime] NULL,
	[UsageLimit_Type] [bigint] NULL,
	[UsageLimit_IsOverall] [bit] NULL CONSTRAINT [DF_Table_1_Card_UsageLimit_IsOverall]  DEFAULT ((0)),
	[UsageLimit_IsActive] [bit] NULL CONSTRAINT [DF_Table_1_Card_UsageLimit_IsActive]  DEFAULT ((1)),
	[UsageLimit_IsDeleted] [bit] NULL CONSTRAINT [DF_Table_1_Card_UsageLimit_IsDeleted]  DEFAULT ((0)),
 CONSTRAINT [PK_Customer_AccountUsageLimit] PRIMARY KEY CLUSTERED 
(
	[UsageLimit_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Daily or Weekly or Monthly code from TimeDuration table' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer_AccountUsageLimit', @level2type=N'COLUMN',@level2name=N'UsageLimit_Type'
GO
SET IDENTITY_INSERT [dbo].[Customer_AccountUsageLimit] ON
INSERT [dbo].[Customer_AccountUsageLimit] ([UsageLimit_id], [UsageLimit_AccountNumber], [UsageLimit_Product_id], [UsageLimit_Value], [UsageLimit_DateCreated], [UsageLimit_Type], [UsageLimit_IsOverall], [UsageLimit_IsActive], [UsageLimit_IsDeleted]) VALUES (2684, 4857247, -1, CAST(900.00 AS Decimal(18, 2)), CAST(0x0000A54400C77A22 AS DateTime), 54, NULL, 1, 0)
INSERT [dbo].[Customer_AccountUsageLimit] ([UsageLimit_id], [UsageLimit_AccountNumber], [UsageLimit_Product_id], [UsageLimit_Value], [UsageLimit_DateCreated], [UsageLimit_Type], [UsageLimit_IsOverall], [UsageLimit_IsActive], [UsageLimit_IsDeleted]) VALUES (2685, 4857247, 17, CAST(800.00 AS Decimal(18, 2)), CAST(0x0000A53200D74BB6 AS DateTime), 52, NULL, 1, 0)
INSERT [dbo].[Customer_AccountUsageLimit] ([UsageLimit_id], [UsageLimit_AccountNumber], [UsageLimit_Product_id], [UsageLimit_Value], [UsageLimit_DateCreated], [UsageLimit_Type], [UsageLimit_IsOverall], [UsageLimit_IsActive], [UsageLimit_IsDeleted]) VALUES (2686, 4857250, -1, CAST(1000.00 AS Decimal(18, 2)), CAST(0x0000A53200D86236 AS DateTime), 52, 0, 1, 0)
INSERT [dbo].[Customer_AccountUsageLimit] ([UsageLimit_id], [UsageLimit_AccountNumber], [UsageLimit_Product_id], [UsageLimit_Value], [UsageLimit_DateCreated], [UsageLimit_Type], [UsageLimit_IsOverall], [UsageLimit_IsActive], [UsageLimit_IsDeleted]) VALUES (2687, 4857250, 12, CAST(700.00 AS Decimal(18, 2)), CAST(0x0000A53200D85B04 AS DateTime), 52, NULL, 1, 0)
INSERT [dbo].[Customer_AccountUsageLimit] ([UsageLimit_id], [UsageLimit_AccountNumber], [UsageLimit_Product_id], [UsageLimit_Value], [UsageLimit_DateCreated], [UsageLimit_Type], [UsageLimit_IsOverall], [UsageLimit_IsActive], [UsageLimit_IsDeleted]) VALUES (2688, 4857249, -1, CAST(600.00 AS Decimal(18, 2)), CAST(0x0000A53200DB2AB5 AS DateTime), 52, NULL, 1, 0)
INSERT [dbo].[Customer_AccountUsageLimit] ([UsageLimit_id], [UsageLimit_AccountNumber], [UsageLimit_Product_id], [UsageLimit_Value], [UsageLimit_DateCreated], [UsageLimit_Type], [UsageLimit_IsOverall], [UsageLimit_IsActive], [UsageLimit_IsDeleted]) VALUES (2689, 4857255, -1, CAST(5000.00 AS Decimal(18, 2)), CAST(0x0000A53800DCB0F6 AS DateTime), 52, NULL, 1, 0)
INSERT [dbo].[Customer_AccountUsageLimit] ([UsageLimit_id], [UsageLimit_AccountNumber], [UsageLimit_Product_id], [UsageLimit_Value], [UsageLimit_DateCreated], [UsageLimit_Type], [UsageLimit_IsOverall], [UsageLimit_IsActive], [UsageLimit_IsDeleted]) VALUES (2690, 4857255, 19, CAST(500.00 AS Decimal(18, 2)), CAST(0x0000A53800DCF5AD AS DateTime), 52, NULL, 1, 0)
INSERT [dbo].[Customer_AccountUsageLimit] ([UsageLimit_id], [UsageLimit_AccountNumber], [UsageLimit_Product_id], [UsageLimit_Value], [UsageLimit_DateCreated], [UsageLimit_Type], [UsageLimit_IsOverall], [UsageLimit_IsActive], [UsageLimit_IsDeleted]) VALUES (2691, 4857257, -1, CAST(200.00 AS Decimal(18, 2)), CAST(0x0000A53A01410329 AS DateTime), 52, NULL, 1, 0)
INSERT [dbo].[Customer_AccountUsageLimit] ([UsageLimit_id], [UsageLimit_AccountNumber], [UsageLimit_Product_id], [UsageLimit_Value], [UsageLimit_DateCreated], [UsageLimit_Type], [UsageLimit_IsOverall], [UsageLimit_IsActive], [UsageLimit_IsDeleted]) VALUES (2692, 4857258, 22, CAST(290.00 AS Decimal(18, 2)), CAST(0x0000A53E00C8C3C2 AS DateTime), 52, NULL, 1, 0)
INSERT [dbo].[Customer_AccountUsageLimit] ([UsageLimit_id], [UsageLimit_AccountNumber], [UsageLimit_Product_id], [UsageLimit_Value], [UsageLimit_DateCreated], [UsageLimit_Type], [UsageLimit_IsOverall], [UsageLimit_IsActive], [UsageLimit_IsDeleted]) VALUES (2693, 4857267, -1, CAST(2000.00 AS Decimal(18, 2)), CAST(0x0000A53E011157EC AS DateTime), 52, 0, 1, 0)
INSERT [dbo].[Customer_AccountUsageLimit] ([UsageLimit_id], [UsageLimit_AccountNumber], [UsageLimit_Product_id], [UsageLimit_Value], [UsageLimit_DateCreated], [UsageLimit_Type], [UsageLimit_IsOverall], [UsageLimit_IsActive], [UsageLimit_IsDeleted]) VALUES (2694, 4857268, -1, CAST(500.00 AS Decimal(18, 2)), CAST(0x0000A54B00DF8806 AS DateTime), 54, NULL, 1, 0)
INSERT [dbo].[Customer_AccountUsageLimit] ([UsageLimit_id], [UsageLimit_AccountNumber], [UsageLimit_Product_id], [UsageLimit_Value], [UsageLimit_DateCreated], [UsageLimit_Type], [UsageLimit_IsOverall], [UsageLimit_IsActive], [UsageLimit_IsDeleted]) VALUES (2695, 4857268, 22, CAST(100.00 AS Decimal(18, 2)), CAST(0x0000A54B00DFF2B1 AS DateTime), 54, NULL, 1, 0)
SET IDENTITY_INSERT [dbo].[Customer_AccountUsageLimit] OFF
/****** Object:  Table [dbo].[Customer_AccountTopup]    Script Date: 11/30/2015 16:02:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_AccountTopup](
	[AccountTopup_id] [bigint] IDENTITY(7866,1) NOT NULL,
	[AccountNumber] [bigint] NULL,
	[Amount] [decimal](18, 2) NULL CONSTRAINT [DF_Customer_AccountTopup_Amount]  DEFAULT ((0)),
	[Channel_id] [bigint] NULL,
	[Modeofpayment] [nvarchar](50) NULL,
	[ERPRef] [nvarchar](50) NULL,
	[ChequeNo] [nvarchar](50) NULL,
	[BankAccountNo] [nvarchar](50) NULL,
	[Reference] [nvarchar](50) NULL,
	[Topupby] [bigint] NULL,
	[Topupdate] [datetime] NULL,
	[IsDeleted] [bit] NULL CONSTRAINT [DF_AccountTopup_IsDeleted]  DEFAULT ((0)),
	[UpdateDate] [datetime] NULL,
	[Finance_Transaction_id] [bigint] NULL,
 CONSTRAINT [PK_AccountTopup] PRIMARY KEY CLUSTERED 
(
	[AccountTopup_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Staff id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer_AccountTopup', @level2type=N'COLUMN',@level2name=N'Topupby'
GO
SET IDENTITY_INSERT [dbo].[Customer_AccountTopup] ON
INSERT [dbo].[Customer_AccountTopup] ([AccountTopup_id], [AccountNumber], [Amount], [Channel_id], [Modeofpayment], [ERPRef], [ChequeNo], [BankAccountNo], [Reference], [Topupby], [Topupdate], [IsDeleted], [UpdateDate], [Finance_Transaction_id]) VALUES (7869, 4857250, CAST(5000.00 AS Decimal(18, 2)), 1, N'Cheque', NULL, NULL, NULL, N'Ch#983484744', 1, CAST(0x0000A539010B1D0D AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Customer_AccountTopup] ([AccountTopup_id], [AccountNumber], [Amount], [Channel_id], [Modeofpayment], [ERPRef], [ChequeNo], [BankAccountNo], [Reference], [Topupby], [Topupdate], [IsDeleted], [UpdateDate], [Finance_Transaction_id]) VALUES (7873, 4857247, CAST(500.00 AS Decimal(18, 2)), 1, N'Cash', N'ER9282', NULL, NULL, N'-', 1, CAST(0x0000A53700E0169B AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Customer_AccountTopup] ([AccountTopup_id], [AccountNumber], [Amount], [Channel_id], [Modeofpayment], [ERPRef], [ChequeNo], [BankAccountNo], [Reference], [Topupby], [Topupdate], [IsDeleted], [UpdateDate], [Finance_Transaction_id]) VALUES (7874, 4857247, CAST(1000.00 AS Decimal(18, 2)), 2, N'Cheque', N'ER9099', N'5353672', N'47892838383', N'-', 1, CAST(0x0000A53700DFC928 AS DateTime), 0, CAST(0x0000A53700DFFE56 AS DateTime), NULL)
INSERT [dbo].[Customer_AccountTopup] ([AccountTopup_id], [AccountNumber], [Amount], [Channel_id], [Modeofpayment], [ERPRef], [ChequeNo], [BankAccountNo], [Reference], [Topupby], [Topupdate], [IsDeleted], [UpdateDate], [Finance_Transaction_id]) VALUES (7875, 4857250, CAST(100.00 AS Decimal(18, 2)), 1, N'Cheque', NULL, NULL, NULL, N'hjfhdf', 1, CAST(0x0000A53200D87B5C AS DateTime), NULL, CAST(0x0000A53200D87B5C AS DateTime), NULL)
INSERT [dbo].[Customer_AccountTopup] ([AccountTopup_id], [AccountNumber], [Amount], [Channel_id], [Modeofpayment], [ERPRef], [ChequeNo], [BankAccountNo], [Reference], [Topupby], [Topupdate], [IsDeleted], [UpdateDate], [Finance_Transaction_id]) VALUES (7876, 4857249, CAST(2500.00 AS Decimal(18, 2)), 1, N'Cheque', NULL, NULL, NULL, N'fhdjfdh', 1, CAST(0x0000A53200DADF82 AS DateTime), NULL, CAST(0x0000A53200DADF82 AS DateTime), NULL)
INSERT [dbo].[Customer_AccountTopup] ([AccountTopup_id], [AccountNumber], [Amount], [Channel_id], [Modeofpayment], [ERPRef], [ChequeNo], [BankAccountNo], [Reference], [Topupby], [Topupdate], [IsDeleted], [UpdateDate], [Finance_Transaction_id]) VALUES (7877, 4857247, CAST(100.00 AS Decimal(18, 2)), 1, N'Cheque', N'91281', N'93839388', N'238293829323', NULL, 1, CAST(0x0000A53700DCE4C9 AS DateTime), NULL, CAST(0x0000A53700DCE4C9 AS DateTime), NULL)
INSERT [dbo].[Customer_AccountTopup] ([AccountTopup_id], [AccountNumber], [Amount], [Channel_id], [Modeofpayment], [ERPRef], [ChequeNo], [BankAccountNo], [Reference], [Topupby], [Topupdate], [IsDeleted], [UpdateDate], [Finance_Transaction_id]) VALUES (7878, 4857250, CAST(500.00 AS Decimal(18, 2)), 1, N'Cheque', N'9238293', N'982392', N'23293', N'qas asasjh ssd.', 1, CAST(0x0000A539010ADBAE AS DateTime), NULL, CAST(0x0000A539010ADBAE AS DateTime), NULL)
INSERT [dbo].[Customer_AccountTopup] ([AccountTopup_id], [AccountNumber], [Amount], [Channel_id], [Modeofpayment], [ERPRef], [ChequeNo], [BankAccountNo], [Reference], [Topupby], [Topupdate], [IsDeleted], [UpdateDate], [Finance_Transaction_id]) VALUES (7879, 4857261, CAST(200.00 AS Decimal(18, 2)), 1, N'Cheque', N'73283', N'728372', N'7238273', N'87hzxj jsajshasj ', 1, CAST(0x0000A53A011984FA AS DateTime), NULL, CAST(0x0000A53A011984FA AS DateTime), NULL)
INSERT [dbo].[Customer_AccountTopup] ([AccountTopup_id], [AccountNumber], [Amount], [Channel_id], [Modeofpayment], [ERPRef], [ChequeNo], [BankAccountNo], [Reference], [Topupby], [Topupdate], [IsDeleted], [UpdateDate], [Finance_Transaction_id]) VALUES (7880, 4857259, CAST(500.00 AS Decimal(18, 2)), 1, N'Cheque', N'263723', N'34736', N'32736', N'dshjshd', 1, CAST(0x0000A53B00DB7445 AS DateTime), NULL, CAST(0x0000A53B00DB7445 AS DateTime), NULL)
INSERT [dbo].[Customer_AccountTopup] ([AccountTopup_id], [AccountNumber], [Amount], [Channel_id], [Modeofpayment], [ERPRef], [ChequeNo], [BankAccountNo], [Reference], [Topupby], [Topupdate], [IsDeleted], [UpdateDate], [Finance_Transaction_id]) VALUES (7881, 4857259, CAST(700.00 AS Decimal(18, 2)), 1, N'Cheque', N'98989', N'8989', N'98989', N'jd sdsdhsdj', 1, CAST(0x0000A53B00DBC21A AS DateTime), NULL, CAST(0x0000A53B00DBC21A AS DateTime), NULL)
INSERT [dbo].[Customer_AccountTopup] ([AccountTopup_id], [AccountNumber], [Amount], [Channel_id], [Modeofpayment], [ERPRef], [ChequeNo], [BankAccountNo], [Reference], [Topupby], [Topupdate], [IsDeleted], [UpdateDate], [Finance_Transaction_id]) VALUES (7882, 4857259, CAST(800.00 AS Decimal(18, 2)), 1, N'Cheque', N'8273823', N'834934', N'72837', N'Hjshs jhdd sjdhsdj', 1, CAST(0x0000A53B00DD11EB AS DateTime), NULL, CAST(0x0000A53B00DD11EB AS DateTime), NULL)
INSERT [dbo].[Customer_AccountTopup] ([AccountTopup_id], [AccountNumber], [Amount], [Channel_id], [Modeofpayment], [ERPRef], [ChequeNo], [BankAccountNo], [Reference], [Topupby], [Topupdate], [IsDeleted], [UpdateDate], [Finance_Transaction_id]) VALUES (7883, 4857259, CAST(500.00 AS Decimal(18, 2)), 1, N'Cheque', N'83493', N'839283', N'849384', N'ssd sjdhsjd jsdhdj', 1, CAST(0x0000A53B00DDBDE8 AS DateTime), NULL, CAST(0x0000A53B00DDBDE8 AS DateTime), NULL)
INSERT [dbo].[Customer_AccountTopup] ([AccountTopup_id], [AccountNumber], [Amount], [Channel_id], [Modeofpayment], [ERPRef], [ChequeNo], [BankAccountNo], [Reference], [Topupby], [Topupdate], [IsDeleted], [UpdateDate], [Finance_Transaction_id]) VALUES (7884, 4857258, CAST(1200.00 AS Decimal(18, 2)), 1, N'Cheque', N'239823', N'83934', N'283923', N'dskj skdjskd ', 1, CAST(0x0000A53D01253F19 AS DateTime), NULL, CAST(0x0000A53D01253F19 AS DateTime), NULL)
INSERT [dbo].[Customer_AccountTopup] ([AccountTopup_id], [AccountNumber], [Amount], [Channel_id], [Modeofpayment], [ERPRef], [ChequeNo], [BankAccountNo], [Reference], [Topupby], [Topupdate], [IsDeleted], [UpdateDate], [Finance_Transaction_id]) VALUES (7885, 4857269, CAST(2000.00 AS Decimal(18, 2)), 1, N'Cheque', N'8392', N'CH#238923', N'98239989', N'dksdk', 1, CAST(0x0000A5480123DA18 AS DateTime), NULL, CAST(0x0000A5480123DA18 AS DateTime), NULL)
INSERT [dbo].[Customer_AccountTopup] ([AccountTopup_id], [AccountNumber], [Amount], [Channel_id], [Modeofpayment], [ERPRef], [ChequeNo], [BankAccountNo], [Reference], [Topupby], [Topupdate], [IsDeleted], [UpdateDate], [Finance_Transaction_id]) VALUES (7886, 4857275, CAST(900.00 AS Decimal(18, 2)), 1, N'Cheque', N'9283923', N'Ch#9383', N'2383923', N'NA', 1, CAST(0x0000A549012EE87B AS DateTime), NULL, CAST(0x0000A549012EE87B AS DateTime), 29)
INSERT [dbo].[Customer_AccountTopup] ([AccountTopup_id], [AccountNumber], [Amount], [Channel_id], [Modeofpayment], [ERPRef], [ChequeNo], [BankAccountNo], [Reference], [Topupby], [Topupdate], [IsDeleted], [UpdateDate], [Finance_Transaction_id]) VALUES (7887, 4857273, CAST(1000.00 AS Decimal(18, 2)), 1, N'Cheque', N'8237', N'CH#33738', N'837383', N'NA', 1, CAST(0x0000A549012FA520 AS DateTime), NULL, CAST(0x0000A549012FA520 AS DateTime), 30)
INSERT [dbo].[Customer_AccountTopup] ([AccountTopup_id], [AccountNumber], [Amount], [Channel_id], [Modeofpayment], [ERPRef], [ChequeNo], [BankAccountNo], [Reference], [Topupby], [Topupdate], [IsDeleted], [UpdateDate], [Finance_Transaction_id]) VALUES (7888, 4857259, CAST(1234.00 AS Decimal(18, 2)), 1, N'Cheque', N'909', N'8934834', N'93839', N'jsdksd skdskd', 1, CAST(0x0000A55B00D0EB56 AS DateTime), NULL, CAST(0x0000A55B00D0EB56 AS DateTime), 34)
INSERT [dbo].[Customer_AccountTopup] ([AccountTopup_id], [AccountNumber], [Amount], [Channel_id], [Modeofpayment], [ERPRef], [ChequeNo], [BankAccountNo], [Reference], [Topupby], [Topupdate], [IsDeleted], [UpdateDate], [Finance_Transaction_id]) VALUES (7889, 4857275, CAST(111.00 AS Decimal(18, 2)), 1, N'Cheque', N'sdsldk', N'jkdf', N'343498', NULL, 1, CAST(0x0000A55B00D4F29D AS DateTime), NULL, CAST(0x0000A55B00D4F29D AS DateTime), 35)
INSERT [dbo].[Customer_AccountTopup] ([AccountTopup_id], [AccountNumber], [Amount], [Channel_id], [Modeofpayment], [ERPRef], [ChequeNo], [BankAccountNo], [Reference], [Topupby], [Topupdate], [IsDeleted], [UpdateDate], [Finance_Transaction_id]) VALUES (7890, 4857257, CAST(900.00 AS Decimal(18, 2)), 1, N'Cheque', N'98998', N'898989', N'8998989', N'sdhsdj', 1, CAST(0x0000A55C01317511 AS DateTime), NULL, CAST(0x0000A55C01317511 AS DateTime), 38)
INSERT [dbo].[Customer_AccountTopup] ([AccountTopup_id], [AccountNumber], [Amount], [Channel_id], [Modeofpayment], [ERPRef], [ChequeNo], [BankAccountNo], [Reference], [Topupby], [Topupdate], [IsDeleted], [UpdateDate], [Finance_Transaction_id]) VALUES (7891, 4857267, CAST(1111.00 AS Decimal(18, 2)), 1, N'Cheque', N'444444', N'CH#4444', N'444444', N'Test', 1, CAST(0x0000A55C013C5722 AS DateTime), NULL, CAST(0x0000A55C013C5722 AS DateTime), 39)
INSERT [dbo].[Customer_AccountTopup] ([AccountTopup_id], [AccountNumber], [Amount], [Channel_id], [Modeofpayment], [ERPRef], [ChequeNo], [BankAccountNo], [Reference], [Topupby], [Topupdate], [IsDeleted], [UpdateDate], [Finance_Transaction_id]) VALUES (7892, 4857265, CAST(5555.00 AS Decimal(18, 2)), 1, N'Cheque', N'39238', N'CH#5555', N'3487348', N'TEST', 1, CAST(0x0000A55C013DF11A AS DateTime), NULL, CAST(0x0000A55C013DF16E AS DateTime), 40)
INSERT [dbo].[Customer_AccountTopup] ([AccountTopup_id], [AccountNumber], [Amount], [Channel_id], [Modeofpayment], [ERPRef], [ChequeNo], [BankAccountNo], [Reference], [Topupby], [Topupdate], [IsDeleted], [UpdateDate], [Finance_Transaction_id]) VALUES (7893, 4857267, CAST(1000.00 AS Decimal(18, 2)), 1, N'Cheque', N'99999', N'CH#TEST', N'999999', N'TESTing', 1, CAST(0x0000A55C013F54A6 AS DateTime), NULL, CAST(0x0000A55C013F54A6 AS DateTime), 50)
INSERT [dbo].[Customer_AccountTopup] ([AccountTopup_id], [AccountNumber], [Amount], [Channel_id], [Modeofpayment], [ERPRef], [ChequeNo], [BankAccountNo], [Reference], [Topupby], [Topupdate], [IsDeleted], [UpdateDate], [Finance_Transaction_id]) VALUES (7894, 4857267, CAST(900.00 AS Decimal(18, 2)), 1, N'Cheque', N'987', N'CH#909', N'9090', N'sdjs', 1, CAST(0x0000A55C0141C912 AS DateTime), NULL, CAST(0x0000A55C0141C912 AS DateTime), 51)
INSERT [dbo].[Customer_AccountTopup] ([AccountTopup_id], [AccountNumber], [Amount], [Channel_id], [Modeofpayment], [ERPRef], [ChequeNo], [BankAccountNo], [Reference], [Topupby], [Topupdate], [IsDeleted], [UpdateDate], [Finance_Transaction_id]) VALUES (7895, 4857267, CAST(789.00 AS Decimal(18, 2)), 5, N'Cash', N'787', NULL, NULL, N'878', 1, CAST(0x0000A55C01424FB5 AS DateTime), NULL, CAST(0x0000A55C01424FB5 AS DateTime), 52)
INSERT [dbo].[Customer_AccountTopup] ([AccountTopup_id], [AccountNumber], [Amount], [Channel_id], [Modeofpayment], [ERPRef], [ChequeNo], [BankAccountNo], [Reference], [Topupby], [Topupdate], [IsDeleted], [UpdateDate], [Finance_Transaction_id]) VALUES (7896, 4857267, CAST(67.00 AS Decimal(18, 2)), 6, N'Cash', N'34534', NULL, NULL, N'545', 1, CAST(0x0000A55C014279C9 AS DateTime), NULL, CAST(0x0000A55C014279C9 AS DateTime), 53)
INSERT [dbo].[Customer_AccountTopup] ([AccountTopup_id], [AccountNumber], [Amount], [Channel_id], [Modeofpayment], [ERPRef], [ChequeNo], [BankAccountNo], [Reference], [Topupby], [Topupdate], [IsDeleted], [UpdateDate], [Finance_Transaction_id]) VALUES (7897, 4857267, CAST(500.00 AS Decimal(18, 2)), 1, N'Cheque', N'4894', N'CH#fdfhj', N'3493849', N'fjkjfdff', 1, CAST(0x0000A55C014294FC AS DateTime), NULL, CAST(0x0000A55C014294FC AS DateTime), 54)
INSERT [dbo].[Customer_AccountTopup] ([AccountTopup_id], [AccountNumber], [Amount], [Channel_id], [Modeofpayment], [ERPRef], [ChequeNo], [BankAccountNo], [Reference], [Topupby], [Topupdate], [IsDeleted], [UpdateDate], [Finance_Transaction_id]) VALUES (7898, 4857267, CAST(10.00 AS Decimal(18, 2)), 7, N'Cash', N'C9090', NULL, NULL, N'HHHH', 1, CAST(0x0000A55C01448748 AS DateTime), NULL, CAST(0x0000A55C01448748 AS DateTime), 64)
INSERT [dbo].[Customer_AccountTopup] ([AccountTopup_id], [AccountNumber], [Amount], [Channel_id], [Modeofpayment], [ERPRef], [ChequeNo], [BankAccountNo], [Reference], [Topupby], [Topupdate], [IsDeleted], [UpdateDate], [Finance_Transaction_id]) VALUES (7899, 4857254, CAST(889.00 AS Decimal(18, 2)), 1, N'Cheque', N'888', N'CH#8888', N'8888', N'REF***', 1, CAST(0x0000A55C0146376B AS DateTime), NULL, CAST(0x0000A55C0146376B AS DateTime), 66)
INSERT [dbo].[Customer_AccountTopup] ([AccountTopup_id], [AccountNumber], [Amount], [Channel_id], [Modeofpayment], [ERPRef], [ChequeNo], [BankAccountNo], [Reference], [Topupby], [Topupdate], [IsDeleted], [UpdateDate], [Finance_Transaction_id]) VALUES (7900, 4857252, CAST(778.00 AS Decimal(18, 2)), 1, N'Cash', N'4545', NULL, NULL, N'REF&&&&', 1, CAST(0x0000A55C0146F6E2 AS DateTime), NULL, CAST(0x0000A55C0146F6E2 AS DateTime), 68)
INSERT [dbo].[Customer_AccountTopup] ([AccountTopup_id], [AccountNumber], [Amount], [Channel_id], [Modeofpayment], [ERPRef], [ChequeNo], [BankAccountNo], [Reference], [Topupby], [Topupdate], [IsDeleted], [UpdateDate], [Finance_Transaction_id]) VALUES (7901, 4857267, CAST(67.00 AS Decimal(18, 2)), 1, N'Cash', N'898', NULL, NULL, N'9898', 1, CAST(0x0000A55C0147B740 AS DateTime), NULL, CAST(0x0000A55C0147B740 AS DateTime), 79)
INSERT [dbo].[Customer_AccountTopup] ([AccountTopup_id], [AccountNumber], [Amount], [Channel_id], [Modeofpayment], [ERPRef], [ChequeNo], [BankAccountNo], [Reference], [Topupby], [Topupdate], [IsDeleted], [UpdateDate], [Finance_Transaction_id]) VALUES (7902, 4857267, CAST(100.00 AS Decimal(18, 2)), 1, N'Cash', NULL, NULL, NULL, NULL, 1, CAST(0x0000A55C01480B2B AS DateTime), NULL, CAST(0x0000A55C01480B69 AS DateTime), 80)
INSERT [dbo].[Customer_AccountTopup] ([AccountTopup_id], [AccountNumber], [Amount], [Channel_id], [Modeofpayment], [ERPRef], [ChequeNo], [BankAccountNo], [Reference], [Topupby], [Topupdate], [IsDeleted], [UpdateDate], [Finance_Transaction_id]) VALUES (7903, 4857252, CAST(222.00 AS Decimal(18, 2)), 6, N'Cash', NULL, NULL, NULL, NULL, 1, CAST(0x0000A55C0148A010 AS DateTime), NULL, CAST(0x0000A55C0148A010 AS DateTime), 81)
INSERT [dbo].[Customer_AccountTopup] ([AccountTopup_id], [AccountNumber], [Amount], [Channel_id], [Modeofpayment], [ERPRef], [ChequeNo], [BankAccountNo], [Reference], [Topupby], [Topupdate], [IsDeleted], [UpdateDate], [Finance_Transaction_id]) VALUES (7904, 4857267, CAST(89.00 AS Decimal(18, 2)), 1, N'Cash', NULL, NULL, NULL, NULL, 1, CAST(0x0000A55C014BC987 AS DateTime), NULL, CAST(0x0000A55C014BC987 AS DateTime), 92)
INSERT [dbo].[Customer_AccountTopup] ([AccountTopup_id], [AccountNumber], [Amount], [Channel_id], [Modeofpayment], [ERPRef], [ChequeNo], [BankAccountNo], [Reference], [Topupby], [Topupdate], [IsDeleted], [UpdateDate], [Finance_Transaction_id]) VALUES (7905, 4857252, CAST(222.00 AS Decimal(18, 2)), 1, N'Cash', NULL, NULL, NULL, NULL, 1, CAST(0x0000A55C014C30EA AS DateTime), NULL, CAST(0x0000A55C014C30EA AS DateTime), 93)
INSERT [dbo].[Customer_AccountTopup] ([AccountTopup_id], [AccountNumber], [Amount], [Channel_id], [Modeofpayment], [ERPRef], [ChequeNo], [BankAccountNo], [Reference], [Topupby], [Topupdate], [IsDeleted], [UpdateDate], [Finance_Transaction_id]) VALUES (7906, 4857254, CAST(222.00 AS Decimal(18, 2)), 1, N'Cash', NULL, NULL, NULL, NULL, 1, CAST(0x0000A55C014C30FD AS DateTime), NULL, CAST(0x0000A55C014C30FD AS DateTime), 94)
INSERT [dbo].[Customer_AccountTopup] ([AccountTopup_id], [AccountNumber], [Amount], [Channel_id], [Modeofpayment], [ERPRef], [ChequeNo], [BankAccountNo], [Reference], [Topupby], [Topupdate], [IsDeleted], [UpdateDate], [Finance_Transaction_id]) VALUES (7907, 4857255, CAST(222.00 AS Decimal(18, 2)), 1, N'Cash', NULL, NULL, NULL, NULL, 1, CAST(0x0000A55C014C3102 AS DateTime), NULL, CAST(0x0000A55C014C3102 AS DateTime), 95)
INSERT [dbo].[Customer_AccountTopup] ([AccountTopup_id], [AccountNumber], [Amount], [Channel_id], [Modeofpayment], [ERPRef], [ChequeNo], [BankAccountNo], [Reference], [Topupby], [Topupdate], [IsDeleted], [UpdateDate], [Finance_Transaction_id]) VALUES (7908, 4857256, CAST(222.00 AS Decimal(18, 2)), 1, N'Cash', NULL, NULL, NULL, NULL, 1, CAST(0x0000A55C014C310C AS DateTime), NULL, CAST(0x0000A55C014C310C AS DateTime), 96)
INSERT [dbo].[Customer_AccountTopup] ([AccountTopup_id], [AccountNumber], [Amount], [Channel_id], [Modeofpayment], [ERPRef], [ChequeNo], [BankAccountNo], [Reference], [Topupby], [Topupdate], [IsDeleted], [UpdateDate], [Finance_Transaction_id]) VALUES (7909, 4857257, CAST(222.00 AS Decimal(18, 2)), 1, N'Cash', NULL, NULL, NULL, NULL, 1, CAST(0x0000A55C014C3111 AS DateTime), NULL, CAST(0x0000A55C014C3111 AS DateTime), 97)
INSERT [dbo].[Customer_AccountTopup] ([AccountTopup_id], [AccountNumber], [Amount], [Channel_id], [Modeofpayment], [ERPRef], [ChequeNo], [BankAccountNo], [Reference], [Topupby], [Topupdate], [IsDeleted], [UpdateDate], [Finance_Transaction_id]) VALUES (7910, 4857258, CAST(222.00 AS Decimal(18, 2)), 1, N'Cash', NULL, NULL, NULL, NULL, 1, CAST(0x0000A55C014C3117 AS DateTime), NULL, CAST(0x0000A55C014C3117 AS DateTime), 98)
INSERT [dbo].[Customer_AccountTopup] ([AccountTopup_id], [AccountNumber], [Amount], [Channel_id], [Modeofpayment], [ERPRef], [ChequeNo], [BankAccountNo], [Reference], [Topupby], [Topupdate], [IsDeleted], [UpdateDate], [Finance_Transaction_id]) VALUES (7911, 4857259, CAST(222.00 AS Decimal(18, 2)), 1, N'Cash', NULL, NULL, NULL, NULL, 1, CAST(0x0000A55C014C311B AS DateTime), NULL, CAST(0x0000A55C014C311B AS DateTime), 99)
INSERT [dbo].[Customer_AccountTopup] ([AccountTopup_id], [AccountNumber], [Amount], [Channel_id], [Modeofpayment], [ERPRef], [ChequeNo], [BankAccountNo], [Reference], [Topupby], [Topupdate], [IsDeleted], [UpdateDate], [Finance_Transaction_id]) VALUES (7912, 4857265, CAST(222.00 AS Decimal(18, 2)), 1, N'Cash', NULL, NULL, NULL, NULL, 1, CAST(0x0000A55C014C3123 AS DateTime), NULL, CAST(0x0000A55C014C3123 AS DateTime), 100)
INSERT [dbo].[Customer_AccountTopup] ([AccountTopup_id], [AccountNumber], [Amount], [Channel_id], [Modeofpayment], [ERPRef], [ChequeNo], [BankAccountNo], [Reference], [Topupby], [Topupdate], [IsDeleted], [UpdateDate], [Finance_Transaction_id]) VALUES (7913, 4857266, CAST(222.00 AS Decimal(18, 2)), 1, N'Cash', NULL, NULL, NULL, NULL, 1, CAST(0x0000A55C014C3129 AS DateTime), NULL, CAST(0x0000A55C014C3129 AS DateTime), 101)
INSERT [dbo].[Customer_AccountTopup] ([AccountTopup_id], [AccountNumber], [Amount], [Channel_id], [Modeofpayment], [ERPRef], [ChequeNo], [BankAccountNo], [Reference], [Topupby], [Topupdate], [IsDeleted], [UpdateDate], [Finance_Transaction_id]) VALUES (7914, 4857267, CAST(222.00 AS Decimal(18, 2)), 1, N'Cash', NULL, NULL, NULL, NULL, 1, CAST(0x0000A55C014C3134 AS DateTime), NULL, CAST(0x0000A55C014C3134 AS DateTime), 102)
INSERT [dbo].[Customer_AccountTopup] ([AccountTopup_id], [AccountNumber], [Amount], [Channel_id], [Modeofpayment], [ERPRef], [ChequeNo], [BankAccountNo], [Reference], [Topupby], [Topupdate], [IsDeleted], [UpdateDate], [Finance_Transaction_id]) VALUES (7915, 4857252, CAST(800.00 AS Decimal(18, 2)), 1, N'Cash', NULL, NULL, NULL, NULL, 1, CAST(0x0000A55D00C845FE AS DateTime), NULL, CAST(0x0000A55D00C845FE AS DateTime), 103)
INSERT [dbo].[Customer_AccountTopup] ([AccountTopup_id], [AccountNumber], [Amount], [Channel_id], [Modeofpayment], [ERPRef], [ChequeNo], [BankAccountNo], [Reference], [Topupby], [Topupdate], [IsDeleted], [UpdateDate], [Finance_Transaction_id]) VALUES (7916, 4857252, CAST(700.00 AS Decimal(18, 2)), 1, N'Cash', NULL, NULL, NULL, NULL, 1, CAST(0x0000A55D00C9ECB7 AS DateTime), NULL, CAST(0x0000A55D00C9ECB7 AS DateTime), 105)
INSERT [dbo].[Customer_AccountTopup] ([AccountTopup_id], [AccountNumber], [Amount], [Channel_id], [Modeofpayment], [ERPRef], [ChequeNo], [BankAccountNo], [Reference], [Topupby], [Topupdate], [IsDeleted], [UpdateDate], [Finance_Transaction_id]) VALUES (7917, 4857254, CAST(700.00 AS Decimal(18, 2)), 1, N'Cash', NULL, NULL, NULL, NULL, 1, CAST(0x0000A55D00C9ECC4 AS DateTime), NULL, CAST(0x0000A55D00C9ECC4 AS DateTime), 106)
INSERT [dbo].[Customer_AccountTopup] ([AccountTopup_id], [AccountNumber], [Amount], [Channel_id], [Modeofpayment], [ERPRef], [ChequeNo], [BankAccountNo], [Reference], [Topupby], [Topupdate], [IsDeleted], [UpdateDate], [Finance_Transaction_id]) VALUES (7918, 4857255, CAST(700.00 AS Decimal(18, 2)), 1, N'Cash', NULL, NULL, NULL, NULL, 1, CAST(0x0000A55D00C9ECCB AS DateTime), NULL, CAST(0x0000A55D00C9ECCB AS DateTime), 107)
INSERT [dbo].[Customer_AccountTopup] ([AccountTopup_id], [AccountNumber], [Amount], [Channel_id], [Modeofpayment], [ERPRef], [ChequeNo], [BankAccountNo], [Reference], [Topupby], [Topupdate], [IsDeleted], [UpdateDate], [Finance_Transaction_id]) VALUES (7919, 4857256, CAST(700.00 AS Decimal(18, 2)), 1, N'Cash', NULL, NULL, NULL, NULL, 1, CAST(0x0000A55D00C9ECD1 AS DateTime), NULL, CAST(0x0000A55D00C9ECD1 AS DateTime), 108)
INSERT [dbo].[Customer_AccountTopup] ([AccountTopup_id], [AccountNumber], [Amount], [Channel_id], [Modeofpayment], [ERPRef], [ChequeNo], [BankAccountNo], [Reference], [Topupby], [Topupdate], [IsDeleted], [UpdateDate], [Finance_Transaction_id]) VALUES (7920, 4857257, CAST(700.00 AS Decimal(18, 2)), 1, N'Cash', NULL, NULL, NULL, NULL, 1, CAST(0x0000A55D00C9ECD6 AS DateTime), NULL, CAST(0x0000A55D00C9ECD6 AS DateTime), 109)
INSERT [dbo].[Customer_AccountTopup] ([AccountTopup_id], [AccountNumber], [Amount], [Channel_id], [Modeofpayment], [ERPRef], [ChequeNo], [BankAccountNo], [Reference], [Topupby], [Topupdate], [IsDeleted], [UpdateDate], [Finance_Transaction_id]) VALUES (7921, 4857258, CAST(700.00 AS Decimal(18, 2)), 1, N'Cash', NULL, NULL, NULL, NULL, 1, CAST(0x0000A55D00C9ECDF AS DateTime), NULL, CAST(0x0000A55D00C9ECDF AS DateTime), 110)
INSERT [dbo].[Customer_AccountTopup] ([AccountTopup_id], [AccountNumber], [Amount], [Channel_id], [Modeofpayment], [ERPRef], [ChequeNo], [BankAccountNo], [Reference], [Topupby], [Topupdate], [IsDeleted], [UpdateDate], [Finance_Transaction_id]) VALUES (7922, 4857259, CAST(700.00 AS Decimal(18, 2)), 1, N'Cash', NULL, NULL, NULL, NULL, 1, CAST(0x0000A55D00C9ECE5 AS DateTime), NULL, CAST(0x0000A55D00C9ECE5 AS DateTime), 111)
INSERT [dbo].[Customer_AccountTopup] ([AccountTopup_id], [AccountNumber], [Amount], [Channel_id], [Modeofpayment], [ERPRef], [ChequeNo], [BankAccountNo], [Reference], [Topupby], [Topupdate], [IsDeleted], [UpdateDate], [Finance_Transaction_id]) VALUES (7923, 4857265, CAST(700.00 AS Decimal(18, 2)), 1, N'Cash', NULL, NULL, NULL, NULL, 1, CAST(0x0000A55D00C9ECEF AS DateTime), NULL, CAST(0x0000A55D00C9ECEF AS DateTime), 112)
INSERT [dbo].[Customer_AccountTopup] ([AccountTopup_id], [AccountNumber], [Amount], [Channel_id], [Modeofpayment], [ERPRef], [ChequeNo], [BankAccountNo], [Reference], [Topupby], [Topupdate], [IsDeleted], [UpdateDate], [Finance_Transaction_id]) VALUES (7924, 4857266, CAST(700.00 AS Decimal(18, 2)), 1, N'Cash', NULL, NULL, NULL, NULL, 1, CAST(0x0000A55D00C9ECF5 AS DateTime), NULL, CAST(0x0000A55D00C9ECF5 AS DateTime), 113)
INSERT [dbo].[Customer_AccountTopup] ([AccountTopup_id], [AccountNumber], [Amount], [Channel_id], [Modeofpayment], [ERPRef], [ChequeNo], [BankAccountNo], [Reference], [Topupby], [Topupdate], [IsDeleted], [UpdateDate], [Finance_Transaction_id]) VALUES (7925, 4857267, CAST(700.00 AS Decimal(18, 2)), 1, N'Cash', NULL, NULL, NULL, NULL, 1, CAST(0x0000A55D00C9ECFA AS DateTime), NULL, CAST(0x0000A55D00C9ECFA AS DateTime), 114)
INSERT [dbo].[Customer_AccountTopup] ([AccountTopup_id], [AccountNumber], [Amount], [Channel_id], [Modeofpayment], [ERPRef], [ChequeNo], [BankAccountNo], [Reference], [Topupby], [Topupdate], [IsDeleted], [UpdateDate], [Finance_Transaction_id]) VALUES (7926, 4857265, CAST(400.00 AS Decimal(18, 2)), 2, N'Cash', NULL, NULL, NULL, NULL, 1, CAST(0x0000A55D00CAB39B AS DateTime), NULL, CAST(0x0000A55D00CAB39B AS DateTime), 115)
INSERT [dbo].[Customer_AccountTopup] ([AccountTopup_id], [AccountNumber], [Amount], [Channel_id], [Modeofpayment], [ERPRef], [ChequeNo], [BankAccountNo], [Reference], [Topupby], [Topupdate], [IsDeleted], [UpdateDate], [Finance_Transaction_id]) VALUES (7927, 4857265, CAST(167.00 AS Decimal(18, 2)), 1, N'Cash', NULL, NULL, NULL, NULL, 1, CAST(0x0000A55D00CB2CC6 AS DateTime), NULL, CAST(0x0000A55D00CB2CC6 AS DateTime), 116)
SET IDENTITY_INSERT [dbo].[Customer_AccountTopup] OFF
/****** Object:  Table [dbo].[Customer_Account]    Script Date: 11/30/2015 16:02:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customer_Account](
	[AccountNumber] [bigint] IDENTITY(4857237,1) NOT NULL,
	[Customer_id] [bigint] NULL,
	[AccountType_id] [bigint] NULL,
	[Mask_Type] [varchar](50) NULL,
	[Mask] [varchar](50) NULL,
	[CreditType] [int] NULL,
	[IsDeleted] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[Balance] [decimal](18, 2) NULL CONSTRAINT [DF_Customer_Account_Balance]  DEFAULT ((0)),
	[IsCollection] [bit] NOT NULL CONSTRAINT [DF_Customer_Account_IsCollection]  DEFAULT ((0)),
	[Employee_id] [bigint] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Customer_Account] PRIMARY KEY CLUSTERED 
(
	[AccountNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Customer_Account] ON
INSERT [dbo].[Customer_Account] ([AccountNumber], [Customer_id], [AccountType_id], [Mask_Type], [Mask], [CreditType], [IsDeleted], [DateCreated], [Balance], [IsCollection], [Employee_id], [IsActive]) VALUES (4857247, 4, 1, N'Card Number', N'250R000150', 0, 0, CAST(0x0000A5440119A67D AS DateTime), CAST(2000.00 AS Decimal(18, 2)), 0, NULL, 1)
INSERT [dbo].[Customer_Account] ([AccountNumber], [Customer_id], [AccountType_id], [Mask_Type], [Mask], [CreditType], [IsDeleted], [DateCreated], [Balance], [IsCollection], [Employee_id], [IsActive]) VALUES (4857248, 7, 1, N'Card Number', N'250R000151', 0, 0, CAST(0x0000A54401140450 AS DateTime), NULL, 0, NULL, 1)
INSERT [dbo].[Customer_Account] ([AccountNumber], [Customer_id], [AccountType_id], [Mask_Type], [Mask], [CreditType], [IsDeleted], [DateCreated], [Balance], [IsCollection], [Employee_id], [IsActive]) VALUES (4857249, 7, 1, N'Card Number', N'250R000152', 0, 0, CAST(0x0000A54401131DD5 AS DateTime), NULL, 0, 27, 1)
INSERT [dbo].[Customer_Account] ([AccountNumber], [Customer_id], [AccountType_id], [Mask_Type], [Mask], [CreditType], [IsDeleted], [DateCreated], [Balance], [IsCollection], [Employee_id], [IsActive]) VALUES (4857250, 7, 1, N'Card Number', N'250R000153', 0, 0, CAST(0x0000A54401140275 AS DateTime), CAST(500.00 AS Decimal(18, 2)), 0, 27, 1)
INSERT [dbo].[Customer_Account] ([AccountNumber], [Customer_id], [AccountType_id], [Mask_Type], [Mask], [CreditType], [IsDeleted], [DateCreated], [Balance], [IsCollection], [Employee_id], [IsActive]) VALUES (4857251, 8, 1, N'Card Number', N'250R000151', 1, 0, CAST(0x0000A53E00F85541 AS DateTime), CAST(4500.00 AS Decimal(18, 2)), 0, NULL, 1)
INSERT [dbo].[Customer_Account] ([AccountNumber], [Customer_id], [AccountType_id], [Mask_Type], [Mask], [CreditType], [IsDeleted], [DateCreated], [Balance], [IsCollection], [Employee_id], [IsActive]) VALUES (4857252, 8, 1, N'Card Number', N'250R000152', 0, 0, CAST(0x0000A55D00C9ECB7 AS DateTime), CAST(4827.00 AS Decimal(18, 2)), 0, NULL, 1)
INSERT [dbo].[Customer_Account] ([AccountNumber], [Customer_id], [AccountType_id], [Mask_Type], [Mask], [CreditType], [IsDeleted], [DateCreated], [Balance], [IsCollection], [Employee_id], [IsActive]) VALUES (4857253, 8, 1, N'Card Number', N'250R000153', 0, 0, CAST(0x0000A55C013D7C18 AS DateTime), NULL, 1, NULL, 1)
INSERT [dbo].[Customer_Account] ([AccountNumber], [Customer_id], [AccountType_id], [Mask_Type], [Mask], [CreditType], [IsDeleted], [DateCreated], [Balance], [IsCollection], [Employee_id], [IsActive]) VALUES (4857254, 8, 1, N'Card Number', N'250R000154', 0, 0, CAST(0x0000A55D00C9ECC4 AS DateTime), CAST(2977.00 AS Decimal(18, 2)), 0, NULL, 1)
INSERT [dbo].[Customer_Account] ([AccountNumber], [Customer_id], [AccountType_id], [Mask_Type], [Mask], [CreditType], [IsDeleted], [DateCreated], [Balance], [IsCollection], [Employee_id], [IsActive]) VALUES (4857255, 8, 1, N'Card Number', N'250R000155', 0, 0, CAST(0x0000A55D00C9ECCA AS DateTime), CAST(2088.00 AS Decimal(18, 2)), 0, NULL, 1)
INSERT [dbo].[Customer_Account] ([AccountNumber], [Customer_id], [AccountType_id], [Mask_Type], [Mask], [CreditType], [IsDeleted], [DateCreated], [Balance], [IsCollection], [Employee_id], [IsActive]) VALUES (4857256, 8, 1, N'Card Number', N'250R000156', 0, 0, CAST(0x0000A55D00C9ECD0 AS DateTime), CAST(2088.00 AS Decimal(18, 2)), 0, NULL, 1)
INSERT [dbo].[Customer_Account] ([AccountNumber], [Customer_id], [AccountType_id], [Mask_Type], [Mask], [CreditType], [IsDeleted], [DateCreated], [Balance], [IsCollection], [Employee_id], [IsActive]) VALUES (4857257, 8, 1, N'Card Number', N'250R000157', 0, 0, CAST(0x0000A55D00C9ECD6 AS DateTime), CAST(2988.00 AS Decimal(18, 2)), 0, NULL, 1)
INSERT [dbo].[Customer_Account] ([AccountNumber], [Customer_id], [AccountType_id], [Mask_Type], [Mask], [CreditType], [IsDeleted], [DateCreated], [Balance], [IsCollection], [Employee_id], [IsActive]) VALUES (4857258, 8, 1, N'Card Number', N'250R000162', 0, 0, CAST(0x0000A55D00C9ECDE AS DateTime), CAST(2338.00 AS Decimal(18, 2)), 0, NULL, 1)
INSERT [dbo].[Customer_Account] ([AccountNumber], [Customer_id], [AccountType_id], [Mask_Type], [Mask], [CreditType], [IsDeleted], [DateCreated], [Balance], [IsCollection], [Employee_id], [IsActive]) VALUES (4857259, 8, 1, N'Card Number', N'250R000163', 0, 0, CAST(0x0000A55D00C9ECE5 AS DateTime), CAST(3322.00 AS Decimal(18, 2)), 0, NULL, 1)
INSERT [dbo].[Customer_Account] ([AccountNumber], [Customer_id], [AccountType_id], [Mask_Type], [Mask], [CreditType], [IsDeleted], [DateCreated], [Balance], [IsCollection], [Employee_id], [IsActive]) VALUES (4857260, 6, 1, N'Card Number', N'250R000158', 0, 0, CAST(0x0000A53A010AFC40 AS DateTime), NULL, 0, NULL, 1)
INSERT [dbo].[Customer_Account] ([AccountNumber], [Customer_id], [AccountType_id], [Mask_Type], [Mask], [CreditType], [IsDeleted], [DateCreated], [Balance], [IsCollection], [Employee_id], [IsActive]) VALUES (4857261, 6, 1, N'Card Number', N'250R000159', 0, 0, CAST(0x0000A53A011984FA AS DateTime), CAST(200.00 AS Decimal(18, 2)), 0, NULL, 1)
INSERT [dbo].[Customer_Account] ([AccountNumber], [Customer_id], [AccountType_id], [Mask_Type], [Mask], [CreditType], [IsDeleted], [DateCreated], [Balance], [IsCollection], [Employee_id], [IsActive]) VALUES (4857262, 6, 1, N'Card Number', N'250R000160', 0, 0, CAST(0x0000A53A0129A9E7 AS DateTime), CAST(500.00 AS Decimal(18, 2)), 0, NULL, 1)
INSERT [dbo].[Customer_Account] ([AccountNumber], [Customer_id], [AccountType_id], [Mask_Type], [Mask], [CreditType], [IsDeleted], [DateCreated], [Balance], [IsCollection], [Employee_id], [IsActive]) VALUES (4857263, 9, 1, N'Card Number', N'250R000161', 0, 0, CAST(0x0000A53E00D0D095 AS DateTime), NULL, 0, NULL, 1)
INSERT [dbo].[Customer_Account] ([AccountNumber], [Customer_id], [AccountType_id], [Mask_Type], [Mask], [CreditType], [IsDeleted], [DateCreated], [Balance], [IsCollection], [Employee_id], [IsActive]) VALUES (4857264, 8, 1, N'Card Number', N'250R000170', 1, 0, CAST(0x0000A53E00FA3F8B AS DateTime), CAST(4500.00 AS Decimal(18, 2)), 0, NULL, 1)
INSERT [dbo].[Customer_Account] ([AccountNumber], [Customer_id], [AccountType_id], [Mask_Type], [Mask], [CreditType], [IsDeleted], [DateCreated], [Balance], [IsCollection], [Employee_id], [IsActive]) VALUES (4857265, 8, 1, N'Card Number', N'250R000171', 0, 0, CAST(0x0000A55D00CB2CC5 AS DateTime), CAST(8210.00 AS Decimal(18, 2)), 0, NULL, 1)
INSERT [dbo].[Customer_Account] ([AccountNumber], [Customer_id], [AccountType_id], [Mask_Type], [Mask], [CreditType], [IsDeleted], [DateCreated], [Balance], [IsCollection], [Employee_id], [IsActive]) VALUES (4857266, 8, 1, N'Card Number', N'250R000172', 0, 0, CAST(0x0000A55D00C9ECF4 AS DateTime), CAST(2338.00 AS Decimal(18, 2)), 0, NULL, 1)
INSERT [dbo].[Customer_Account] ([AccountNumber], [Customer_id], [AccountType_id], [Mask_Type], [Mask], [CreditType], [IsDeleted], [DateCreated], [Balance], [IsCollection], [Employee_id], [IsActive]) VALUES (4857267, 8, 1, N'Card Number', N'250R000173', 0, 0, CAST(0x0000A55D00C9ECFA AS DateTime), CAST(5555.00 AS Decimal(18, 2)), 0, NULL, 1)
INSERT [dbo].[Customer_Account] ([AccountNumber], [Customer_id], [AccountType_id], [Mask_Type], [Mask], [CreditType], [IsDeleted], [DateCreated], [Balance], [IsCollection], [Employee_id], [IsActive]) VALUES (4857268, 13, 1, N'Card Number', N'250R000123', 0, 0, CAST(0x0000A54801239687 AS DateTime), CAST(200.00 AS Decimal(18, 2)), 0, NULL, 1)
INSERT [dbo].[Customer_Account] ([AccountNumber], [Customer_id], [AccountType_id], [Mask_Type], [Mask], [CreditType], [IsDeleted], [DateCreated], [Balance], [IsCollection], [Employee_id], [IsActive]) VALUES (4857269, 13, 1, N'Card Number', N'250R000124', 0, 0, CAST(0x0000A5480123DA17 AS DateTime), CAST(2000.00 AS Decimal(18, 2)), 0, NULL, 1)
INSERT [dbo].[Customer_Account] ([AccountNumber], [Customer_id], [AccountType_id], [Mask_Type], [Mask], [CreditType], [IsDeleted], [DateCreated], [Balance], [IsCollection], [Employee_id], [IsActive]) VALUES (4857270, 13, 1, N'Card Number', N'250R000125', 1, 0, CAST(0x0000A5480123FE31 AS DateTime), CAST(5000.00 AS Decimal(18, 2)), 0, NULL, 1)
INSERT [dbo].[Customer_Account] ([AccountNumber], [Customer_id], [AccountType_id], [Mask_Type], [Mask], [CreditType], [IsDeleted], [DateCreated], [Balance], [IsCollection], [Employee_id], [IsActive]) VALUES (4857271, 13, 1, N'Card Number', N'250R000126', 0, 0, CAST(0x0000A549011D8D84 AS DateTime), NULL, 0, NULL, 1)
INSERT [dbo].[Customer_Account] ([AccountNumber], [Customer_id], [AccountType_id], [Mask_Type], [Mask], [CreditType], [IsDeleted], [DateCreated], [Balance], [IsCollection], [Employee_id], [IsActive]) VALUES (4857272, 13, 1, N'Card Number', N'250R000127', 0, 0, CAST(0x0000A549011EBC8A AS DateTime), NULL, 0, NULL, 1)
INSERT [dbo].[Customer_Account] ([AccountNumber], [Customer_id], [AccountType_id], [Mask_Type], [Mask], [CreditType], [IsDeleted], [DateCreated], [Balance], [IsCollection], [Employee_id], [IsActive]) VALUES (4857273, 13, 1, N'Card Number', N'250R000128', 0, 0, CAST(0x0000A549012FA44F AS DateTime), CAST(900.00 AS Decimal(18, 2)), 0, NULL, 1)
INSERT [dbo].[Customer_Account] ([AccountNumber], [Customer_id], [AccountType_id], [Mask_Type], [Mask], [CreditType], [IsDeleted], [DateCreated], [Balance], [IsCollection], [Employee_id], [IsActive]) VALUES (4857274, 13, 1, N'Card Number', N'250R000129', 0, 0, CAST(0x0000A549012A5D9B AS DateTime), NULL, 0, NULL, 1)
INSERT [dbo].[Customer_Account] ([AccountNumber], [Customer_id], [AccountType_id], [Mask_Type], [Mask], [CreditType], [IsDeleted], [DateCreated], [Balance], [IsCollection], [Employee_id], [IsActive]) VALUES (4857275, 13, 1, N'Card Number', N'250R000130', 0, 0, CAST(0x0000A55B00D4F29D AS DateTime), CAST(701.00 AS Decimal(18, 2)), 0, NULL, 1)
INSERT [dbo].[Customer_Account] ([AccountNumber], [Customer_id], [AccountType_id], [Mask_Type], [Mask], [CreditType], [IsDeleted], [DateCreated], [Balance], [IsCollection], [Employee_id], [IsActive]) VALUES (4857276, 13, 1, N'Card Number', N'250R000160', 0, 0, CAST(0x0000A55B00D95545 AS DateTime), CAST(210.00 AS Decimal(18, 2)), 0, NULL, 1)
INSERT [dbo].[Customer_Account] ([AccountNumber], [Customer_id], [AccountType_id], [Mask_Type], [Mask], [CreditType], [IsDeleted], [DateCreated], [Balance], [IsCollection], [Employee_id], [IsActive]) VALUES (4857277, 13, 1, N'Card Number', N'250R000161', 0, 0, CAST(0x0000A55B00D98AF7 AS DateTime), NULL, 0, NULL, 1)
SET IDENTITY_INSERT [dbo].[Customer_Account] OFF
/****** Object:  Table [dbo].[Currency]    Script Date: 11/30/2015 16:02:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Currency](
	[Currency_id] [bigint] IDENTITY(1,1) NOT NULL,
	[CurrencyName] [nvarchar](20) NULL,
	[CurrencySymbol] [nvarchar](5) NULL,
	[RatioToBase] [decimal](18, 2) NULL,
	[DateCreated] [datetime] NULL,
	[IsAddApproved] [bit] NULL,
	[IsDelApproved] [bit] NULL,
	[IsEditApproved] [bit] NULL,
 CONSTRAINT [PK_Currency] PRIMARY KEY CLUSTERED 
(
	[Currency_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Currency] ON
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (32, N'Afghanistan Afghani', N'AFN', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (33, N'Albanian Lek', N'ALL', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (34, N'Algerian Dinar', N'DZD', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (37, N'Angolan Kwanza', N'AOA', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (41, N'Argentine Peso', N'ARS', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (42, N'Armenian Dram', N'AMD', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (43, N'Aruban Guilder', N'AWG', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (44, N'Australian Dollar', N'AUD', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (46, N'Azerbaijan New Manat', N'AZN', CAST(1.50 AS Decimal(18, 2)), CAST(0x0000A4CA011A4143 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (47, N'Bahamian Dollar', N'BSD', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (48, N'Bahraini Dinar', N'BHD', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (49, N'Bangladeshi Taka', N'BDT', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (50, N'Barbados Dollar', N'BBD', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (51, N'Belarussian Ruble', N'BYR', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (53, N'Belize Dollar', N'BZD', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (55, N'Bermudian Dollar', N'BMD', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (56, N'Bhutan Ngultrum', N'BTN', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (57, N'Boliviano', N'BOB', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (58, N'Marka', N'BAM', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (59, N'Botswana Pula', N'BWP', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (61, N'Brazilian Real', N'BRL', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (63, N'Brunei Dollar', N'BND', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (64, N'Bulgarian Lev', N'BGN', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (65, N'CFA Franc BCEAO', N'XOF', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (66, N'Burundi Franc', N'BIF', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (67, N'Kampuchean Riel', N'KHR', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (68, N'CFA Franc BEAC', N'XAF', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (69, N'Canadian Dollar', N'CAD', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (70, N'Cape Verde Escudo', N'CVE', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (74, N'Chilean Peso', N'CLP', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (75, N'Yuan Renminbi', N'CNY', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (78, N'Colombian Peso', N'COP', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (79, N'Comoros Franc', N'KMF', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (81, N'Francs', N'CDF', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (83, N'Costa Rican Colon', N'CRC', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (84, N'Croatian Kuna', N'HRK', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (85, N'Cuban Peso', N'CUP', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (87, N'Czech Koruna', N'CZK', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (88, N'Danish Krone', N'DKK', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (89, N'Djibouti Franc', N'DJF', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (91, N'Dominican Peso', N'DOP', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (92, N'Ecuador Sucre', N'ECS', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (93, N'Egyptian Pound', N'EGP', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (94, N'El Salvador Colon', N'SVC', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (96, N'Eritrean Nakfa', N'ERN', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (98, N'Ethiopian Birr', N'ETB', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (102, N'Fiji Dollar', N'FJD', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (108, N'Gambian Dalasi', N'GMD', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (109, N'Georgian Lari', N'GEL', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (111, N'Ghanaian Cedi', N'GHS', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (112, N'Gibraltar Pound', N'GIP', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (113, N'Pound Sterling', N'GBP', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (119, N'Guatemalan Quetzal', N'QTQ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (120, N'Pound Sterling', N'GGP', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (121, N'Guinea Franc', N'GNF', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (122, N'Guinea-Bissau Peso', N'GWP', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (123, N'Guyana Dollar', N'GYD', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (124, N'Haitian Gourde', N'HTG', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (126, N'Honduran Lempira', N'HNL', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (127, N'Hong Kong Dollar', N'HKD', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (128, N'Hungarian Forint', N'HUF', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (129, N'Iceland Krona', N'ISK', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (130, N'Indian Rupee', N'INR', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (131, N'Indonesian Rupiah', N'IDR', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (132, N'Iranian Rial', N'IRR', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (133, N'Iraqi Dinar', N'IQD', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (136, N'Israeli New Shekel', N'ILS', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (139, N'Jamaican Dollar', N'JMD', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (140, N'Japanese Yen', N'JPY', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (142, N'Jordanian Dinar', N'JOD', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (143, N'Kazakhstan Tenge', N'KZT', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (144, N'Kenyan Shilling', N'KES', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (146, N'North Korean Won', N'KPW', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (147, N'Korean Won', N'KRW', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (148, N'Kuwaiti Dinar', N'KWD', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (149, N'Som', N'KGS', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (150, N'Lao Kip', N'LAK', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (151, N'Latvian Lats', N'LVL', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (152, N'Lebanese Pound', N'LBP', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (153, N'Lesotho Loti', N'LSL', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (154, N'Liberian Dollar', N'LRD', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (155, N'Libyan Dinar', N'LYD', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (156, N'Swiss Franc', N'CHF', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (157, N'Lithuanian Litas', N'LTL', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (159, N'Macau Pataca', N'MOP', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (160, N'Denar', N'MKD', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (161, N'Malagasy Franc', N'MGF', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (162, N'Malawi Kwacha', N'MWK', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (163, N'Malaysian Ringgit', N'MYR', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (164, N'Maldive Rufiyaa', N'MVR', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (169, N'Mauritanian Ouguiya', N'MRO', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (170, N'Mauritius Rupee', N'MUR', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (172, N'Mexican Nuevo Peso', N'MXN', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (174, N'Moldovan Leu', N'MDL', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (176, N'Mongolian Tugrik', N'MNT', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (179, N'Moroccan Dirham', N'MAD', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (180, N'Mozambique Metical', N'MZN', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (181, N'Myanmar Kyat', N'MMK', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (182, N'Namibian Dollar', N'NAD', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (184, N'Nepalese Rupee', N'NPR', NULL, NULL, NULL, NULL, NULL)
GO
print 'Processed 100 total records'
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (191, N'Nigerian Naira', N'NGN', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (192, N'New Zealand Dollar', N'NZD', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (195, N'Norwegian Krone', N'NOK', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (196, N'Omani Rial', N'OMR', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (197, N'Pakistan Rupee', N'PKR', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (199, N'Panamanian Balboa', N'PAB', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (201, N'Paraguay Guarani', N'PYG', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (202, N'Peruvian Nuevo Sol', N'PEN', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (203, N'Philippine Peso', N'PHP', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (205, N'Polish Zloty', N'PLN', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (209, N'Qatari Rial', N'QAR', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (211, N'Romanian New Leu', N'RON', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (212, N'Russian Ruble', N'RUB', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (213, N'Rwanda Franc', N'RWF', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (214, N'St. Helena Pound', N'SHP', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (219, N'Samoan Tala', N'WST', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (221, N'Dobra', N'STD', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (222, N'Saudi Riyal', N'SAR', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (224, N'Dinar', N'RSD', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (225, N'Seychelles Rupee', N'SCR', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (226, N'Sierra Leone Leone', N'SLL', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (227, N'Singapore Dollar', N'SGD', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (231, N'Somali Shilling', N'SOS', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (232, N'South African Rand', N'ZAR', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (234, N'South Sudan Pound', N'SSP', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (236, N'Sri Lanka Rupee', N'LKR', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (237, N'Sudanese Pound', N'SDG', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (238, N'Surinam Dollar', N'SRD', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (240, N'Swaziland Lilangeni', N'SZL', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (241, N'Swedish Krona', N'SEK', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (243, N'Syrian Pound', N'SYP', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (244, N'Taiwan Dollar', N'TWD', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (245, N'Tajik Somoni', N'TJS', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (246, N'Tanzanian Shilling', N'TZS', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (247, N'Thai Baht', N'THB', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (250, N'Tongan Paanga', N'TOP', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (252, N'Tunisian Dollar', N'TND', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (253, N'Turkish Lira', N'TRY', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (254, N'Manat', N'TMT', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (255, N'US Dollar', N'USD', CAST(1.00 AS Decimal(18, 2)), CAST(0x0000A491013407BE AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (258, N'Uganda Shilling', N'UGX', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (259, N'Ukraine Hryvnia', N'UAH', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (260, N'Arab Emirates Dirham', N'AED', CAST(1.00 AS Decimal(18, 2)), CAST(0x0000A539013FE6D5 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (261, N'Uruguayan Peso', N'UYU', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (264, N'Uzbekistan Sum', N'UZS', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (265, N'Vanuatu Vatu', N'VUV', CAST(1.00 AS Decimal(18, 2)), CAST(0x0000A491012D6A6F AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (267, N'Venezuelan Bolivar', N'VEF', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (268, N'Vietnamese Dong', N'VND', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (271, N'CFP Franc', N'XPF', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (273, N'Yemeni Rial', N'YER', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (274, N'Zambian Kwacha', N'ZMW', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Currency] ([Currency_id], [CurrencyName], [CurrencySymbol], [RatioToBase], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (275, N'Zimbabwe Dollar', N'ZWD', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Currency] OFF
/****** Object:  Table [dbo].[Country]    Script Date: 11/30/2015 16:02:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[CountryId] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[IsAddApproved] [bit] NULL,
	[IsEditApproved] [bit] NULL,
	[IsDelApproved] [bit] NULL,
 CONSTRAINT [PK_CountryMstr] PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Country] ON
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (47, N'Afghanistan', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (48, N'Albania', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (49, N'Algeria', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (50, N'American Samoa', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (51, N'Angola', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (52, N'Anguilla', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (53, N'Antartica', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (54, N'Antigua and Barbuda', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (55, N'Argentina', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (56, N'Armenia', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (57, N'Aruba', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (58, N'Ashmore and Cartier Island', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (59, N'Australia', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (60, N'Austria', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (61, N'Azerbaijan', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (62, N'Bahamas', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (63, N'Bahrain', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (64, N'Bangladesh', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (65, N'Barbados', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (66, N'Belarus', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (67, N'Belgium', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (68, N'Belize', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (69, N'Benin', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (70, N'Bermuda', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (71, N'Bhutan', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (72, N'Bolivia', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (73, N'Bosnia and Herzegovina', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (74, N'Botswana', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (75, N'Brazil', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (76, N'British Virgin Islands', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (77, N'Brunei', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (78, N'Bulgaria', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (79, N'Burkina Faso', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (80, N'Burma', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (81, N'Burundi', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (82, N'Cambodia', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (83, N'Cameroon', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (84, N'Canada', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (85, N'Cape Verde', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (86, N'Cayman Islands', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (87, N'Central African Republic', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (88, N'Chad', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (89, N'Chile', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (90, N'China', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (91, N'Christmas Island', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (92, N'Clipperton Island', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (93, N'Cocos (Keeling) Islands', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (94, N'Colombia', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (95, N'Comoros', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (96, N'Congo), Democratic Republic of the', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (97, N'Congo), Republic of the), Cook Islands', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (98, N'Costa Rica', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (99, N'Cote d Ivoire', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (100, N'Croatia', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (101, N'Cuba', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (102, N'Cyprus', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (103, N'Czeck Republic', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (104, N'Denmark', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (105, N'Djibouti', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (106, N'Dominica', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (107, N'Dominican Republic', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (108, N'Ecuador', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (109, N'Egypt', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (110, N'El Salvador', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (111, N'Equatorial Guinea', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (112, N'Eritrea', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (113, N'Estonia', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (114, N'Ethiopia', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (115, N'Europa Island', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (116, N'Falkland Islands (Islas Malvinas)', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (117, N'Faroe Islands', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (118, N'Fiji', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (119, N'Finland', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (120, N'France', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (121, N'French Guiana', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (122, N'French Polynesia', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (123, N'French Southern and Antarctic Lands', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (124, N'Gabon', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (125, N'Gambia), The Gaza Strip', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126, N'Georgia', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (127, N'Germany', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (128, N'Ghana', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (129, N'Gibraltar', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (130, N'Glorioso Islands', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (131, N'Greece', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (132, N'Greenland', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (133, N'Grenada', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (134, N'Guadeloupe', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (135, N'Guam', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (136, N'Guatemala', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (137, N'Guernsey', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (138, N'Guinea', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (139, N'Guinea-Bissau', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (140, N'Guyana', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (141, N'Haiti', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (142, N'Heard Island and McDonald Islands', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (143, N'Holy See (Vatican City)', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (144, N'Honduras', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (145, N'Hong Kong', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (146, N'Howland Island', 1, 0, NULL, NULL, NULL, NULL)
GO
print 'Processed 100 total records'
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (147, N'Hungary', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (148, N'Iceland', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (149, N'India', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (150, N'Indonesia', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (151, N'Iran', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (152, N'Iraq', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (153, N'Ireland', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (154, N'Ireland), Northern', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (155, N'Israel', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (156, N'Italy', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (157, N'Jamaica', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (158, N'Jan Mayen', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (159, N'Japan', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (160, N'Jarvis Island', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (161, N'Jersey', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (162, N'Johnston Atoll', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (163, N'Jordan', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (164, N'Juan de Nova Island', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (165, N'Kazakhstan', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (166, N'Kenya', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (167, N'Kiribati', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (168, N'Korea), North', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (169, N'Korea), South', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (170, N'Kuwait', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (171, N'Kyrgyzstan', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (172, N'Laos', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (173, N'Latvia', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (174, N'Lebanon', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (175, N'Lesotho', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (176, N'Liberia', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (177, N'Libya', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (178, N'Liechtenstein', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (179, N'Lithuania', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (180, N'Luxembourg', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (181, N'Macau', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (182, N'Macedonia), Former Yugoslav Republic of Madagascar', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (183, N'Malawi', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (184, N'Malaysia', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (185, N'Maldives', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (186, N'Mali', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (187, N'Malta', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (188, N'Man Isle of Marshall Islands', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (189, N'Martinique', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (190, N'Mauritania', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (191, N'Mauritius', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (192, N'Mayotte', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (193, N'Mexico', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (194, N'Micronesia), Federated States of', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (195, N'Midway Islands', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (196, N'Moldova', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (197, N'Monaco', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (198, N'Mongolia', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (199, N'Montserrat', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (200, N'Morocco', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (201, N'Mozambique', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (202, N'Namibia', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (203, N'Nauru', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (204, N'Nepal', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (205, N'Netherlands', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (206, N'Netherlands Antilles', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (207, N'New Caledonia', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (208, N'New Zealand', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (209, N'Nicaragua', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (210, N'Niger', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (211, N'Nigeria', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (212, N'Niue', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (213, N'Norfolk Island', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (214, N'Northern Mariana Islands', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (215, N'Norway', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (216, N'Oman', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (217, N'Pakistan', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (218, N'Palau', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (219, N'Panama', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (220, N'Papua New Guinea', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (221, N'Paraguay', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (222, N'Peru', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (223, N'Philippines', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (224, N'Pitcaim Islands', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (225, N'Poland', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (226, N'Portugal', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (227, N'Puerto Rico', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (228, N'Qatar', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (229, N'Reunion', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (230, N'Romainia', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (231, N'Russia', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (232, N'Rwanda', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (233, N'Saint Helena', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (234, N'Saint Kitts and Nevis', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (235, N'Saint Lucia', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (236, N'Saint Pierre and Miquelon', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (237, N'Saint Vincent and the Grenadines', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (238, N'Samoa', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (239, N'San Marino', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (240, N'Sao Tome and Principe', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (241, N'Saudi Arabia', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (242, N'Scotland', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (243, N'Senegal', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (244, N'Seychelles', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (245, N'Sierra Leone', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (246, N'Singapore', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (247, N'Slovakia', 1, 0, NULL, NULL, NULL, NULL)
GO
print 'Processed 200 total records'
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (248, N'Slovenia', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (249, N'Solomon Islands', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (250, N'Somalia', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (251, N'South Africa', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (252, N'South Georgia and South Sandwich Islands', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (253, N'Spain', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (254, N'Spratly Islands', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (255, N'Sri Lanka', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (256, N'Sudan', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (257, N'Suriname', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (258, N'Svalbard', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (259, N'Swaziland', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (260, N'Sweden', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (261, N'Switzerland', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (262, N'Syria', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (263, N'Taiwan', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (264, N'Tajikistan', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (265, N'Tanzania', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (266, N'Thailand', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (267, N'Tobago', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (268, N'Toga', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (269, N'Tokelau', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (270, N'Tonga', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (271, N'Trinidad', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (272, N'Tunisia', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (273, N'Turkey', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (274, N'Turkmenistan', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (275, N'Tuvalu', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (276, N'Uganda', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (277, N'Ukraine', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (278, N'United Arab Emirates', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (279, N'United Kingdom', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (280, N'Uruguay', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (281, N'USA', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (282, N'Uzbekistan', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (283, N'Vanuatu', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (284, N'Venezuela', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (285, N'Vietnam', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (286, N'Virgin Islands', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (287, N'Wales', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (288, N'Wallis and Futuna', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (289, N'West Bank', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (290, N'Western Sahara', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (291, N'Yemen', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (292, N'Yugoslavia', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (293, N'Zambia', 1, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[Country] ([CountryId], [CountryName], [IsActive], [IsDeleted], [DateCreated], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (294, N'Zimbabwe', 1, 0, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Country] OFF
/****** Object:  Table [dbo].[conflicting_action]    Script Date: 11/30/2015 16:02:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[conflicting_action](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[action_id] [bigint] NULL,
	[conflicting_action_id] [bigint] NULL,
 CONSTRAINT [PK_conflicting_action] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommunicationTemplates]    Script Date: 11/30/2015 16:02:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommunicationTemplates](
	[Template_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Template_Name] [nvarchar](50) NULL,
	[Template_Content] [text] NULL,
	[IsActive] [bit] NULL,
	[IsDeleted] [bit] NULL,
	[DateCreated] [datetime] NULL,
	[Template_Type] [nvarchar](50) NULL,
	[IsAddApproved] [bit] NULL,
	[IsDelApproved] [bit] NULL,
	[IsEditApproved] [bit] NULL,
	[Template_Subject] [nvarchar](50) NULL,
 CONSTRAINT [PK_CommunicationTemplates] PRIMARY KEY CLUSTERED 
(
	[Template_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CommunicationTemplates] ON
INSERT [dbo].[CommunicationTemplates] ([Template_Id], [Template_Name], [Template_Content], [IsActive], [IsDeleted], [DateCreated], [Template_Type], [IsAddApproved], [IsDelApproved], [IsEditApproved], [Template_Subject]) VALUES (3, N'Registration Email', N'<div style="margin:0px; padding:0px; border:1px solid #dfdfdf; width:692px;">
	<div style="margin:0px; padding:0px; height:5px; background:#2c9ce9; height:12px;">
		&nbsp;</div>
	<div style="margin:15px auto; padding:0px; width:636px; font-family:Arial, Helvetica, sans-serif; font-size:12px;">
		<div style="margin:0px; padding:0px; width:100%; border-bottom:double #CCC;   font-size: 58px; color: #2c9ce9;  font-family: times new roman; padding-bottom:22px;">
			FCS</div>
		<div style="margin:0px; padding:0px;">
			<h1 style="margin:0px; padding:10px 0px 10px 0px; font-size:12px; color:#2c9ce9; font-weight:bold;">
				Dear @name,</h1>
			<p style="margin:0px; padding:0px 0px 11px 0px; color:#5a5a5a; line-height:18px;">
				Congratulations, you have successfully registered on FCS.<br />
				Thanks for signing up with FCS. In order to complete the registration, please @link</p>
		</div>
	</div>
	<div style="margin:0px; padding:0px; background:#2c9ce9; color:#fff; text-align:center; font-family:Arial, Helvetica, sans-serif; font-size:12px; height:40px; line-height:40px;">
		&copy; 2015 FCS All Rights Reserved.</div>
</div>
', 1, 0, CAST(0x0000A54400FEF7A1 AS DateTime), N'Email', NULL, NULL, NULL, N'Welcome to the FCS')
INSERT [dbo].[CommunicationTemplates] ([Template_Id], [Template_Name], [Template_Content], [IsActive], [IsDeleted], [DateCreated], [Template_Type], [IsAddApproved], [IsDelApproved], [IsEditApproved], [Template_Subject]) VALUES (4, N'Staff Registration Email', N'<div style="margin:0px; padding:0px; border:1px solid #dfdfdf; width:692px;">
	<div style="margin:0px; padding:0px; height:5px; background:#2c9ce9; height:12px;">
		&nbsp;</div>
	<div style="margin:15px auto; padding:0px; width:636px; font-family:Arial, Helvetica, sans-serif; font-size:12px;">
		<div style="margin:0px; padding:0px; width:100%; border-bottom:double #CCC;   font-size: 58px; color: #2c9ce9;  font-family: times new roman; padding-bottom:22px;">
			Welcome</div>
		<div style="margin:0px; padding:0px;">
			<h1 style="margin:0px; padding:10px 0px 10px 0px; font-size:12px; color:#2c9ce9; font-weight:bold;">
				Dear @name,</h1>
			<p style="margin:0px; padding:0px 0px 11px 0px; color:#5a5a5a; line-height:18px;">
				Congratulations, you have successfully registered on FCS.<br />
				Thanks for signing up with FCS. In order to complete the registration, please @link</p>
		</div>
	</div>
	<div style="margin:0px; padding:0px; background:#2c9ce9; color:#fff; text-align:center; font-family:Arial, Helvetica, sans-serif; font-size:12px; height:40px; line-height:40px;">
		&copy; 2015 FCS All Rights Reserved.</div>
</div>
', 1, 0, CAST(0x0000A54401008872 AS DateTime), N'Email', NULL, NULL, NULL, N'Welcome to the FCS')
INSERT [dbo].[CommunicationTemplates] ([Template_Id], [Template_Name], [Template_Content], [IsActive], [IsDeleted], [DateCreated], [Template_Type], [IsAddApproved], [IsDelApproved], [IsEditApproved], [Template_Subject]) VALUES (5, N'Staff Password', N'<div style="margin:0px; padding:0px; border:1px solid #dfdfdf; width:692px;">
	<div style="margin:0px; padding:0px; height:5px; background:#2c9ce9; height:12px;">
		&nbsp;</div>
	<div style="margin:15px auto; padding:0px; width:636px; font-family:Arial, Helvetica, sans-serif; font-size:12px;">
		<div style="margin:0px; padding:0px;">
			<h1 style="margin:0px; padding:10px 0px 10px 0px; font-size:12px; color:#2c9ce9; font-weight:bold;">
				Dear @name,</h1>
			<p style="margin:0px; padding:0px 0px 11px 0px; color:#5a5a5a; line-height:18px;">
				Please @link to reset your password.</p>
		</div>
	</div>
	<div style="margin:0px; padding:0px; background:#2c9ce9; color:#fff; text-align:center; font-family:Arial, Helvetica, sans-serif; font-size:12px; height:40px; line-height:40px;">
		&copy; 2015 FCS All Rights Reserved.</div>
</div>
', 1, 0, CAST(0x0000A5440100AE11 AS DateTime), N'Email', NULL, NULL, NULL, N'Password Reset Mail')
INSERT [dbo].[CommunicationTemplates] ([Template_Id], [Template_Name], [Template_Content], [IsActive], [IsDeleted], [DateCreated], [Template_Type], [IsAddApproved], [IsDelApproved], [IsEditApproved], [Template_Subject]) VALUES (6, N'Staff PIN', N'<div style="margin:0px; padding:0px; border:1px solid #dfdfdf; width:692px;">
	<div style="margin:0px; padding:0px; height:5px; background:#2c9ce9; height:12px;">
		&nbsp;</div>
	<div style="margin:15px auto; padding:0px; width:636px; font-family:Arial, Helvetica, sans-serif; font-size:12px;">
		<div style="margin:0px; padding:0px;">
			<h1 style="margin:0px; padding:10px 0px 10px 0px; font-size:12px; color:#2c9ce9; font-weight:bold;">
				Dear @name,</h1>
			<p style="margin:0px; padding:0px 0px 11px 0px; color:#5a5a5a; line-height:18px;">
				Your Terminal Operations PIN is @PIN</p>
		</div>
	</div>
	<div style="margin:0px; padding:0px; background:#2c9ce9; color:#fff; text-align:center; font-family:Arial, Helvetica, sans-serif; font-size:12px; height:40px; line-height:40px;">
		&copy; 2015 FCS All Rights Reserved.</div>
</div>
', 1, 0, CAST(0x0000A544010582A3 AS DateTime), N'Email', NULL, NULL, NULL, N'Terminal Operations PIN')
SET IDENTITY_INSERT [dbo].[CommunicationTemplates] OFF
/****** Object:  Table [dbo].[ChartofAccountTypes]    Script Date: 11/30/2015 16:02:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChartofAccountTypes](
	[ChartofAccountType_id] [bigint] IDENTITY(1,1) NOT NULL,
	[AccountType_Name] [varchar](50) NULL,
	[IsGLType] [bit] NULL,
 CONSTRAINT [PK_ChartofAccountTypes] PRIMARY KEY CLUSTERED 
(
	[ChartofAccountType_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ChartofAccountTypes] ON
INSERT [dbo].[ChartofAccountTypes] ([ChartofAccountType_id], [AccountType_Name], [IsGLType]) VALUES (1, N'Asset', 1)
INSERT [dbo].[ChartofAccountTypes] ([ChartofAccountType_id], [AccountType_Name], [IsGLType]) VALUES (2, N'Liability', 1)
INSERT [dbo].[ChartofAccountTypes] ([ChartofAccountType_id], [AccountType_Name], [IsGLType]) VALUES (3, N'Equity', 1)
INSERT [dbo].[ChartofAccountTypes] ([ChartofAccountType_id], [AccountType_Name], [IsGLType]) VALUES (4, N'Revenue', 1)
INSERT [dbo].[ChartofAccountTypes] ([ChartofAccountType_id], [AccountType_Name], [IsGLType]) VALUES (5, N'Expense', 1)
INSERT [dbo].[ChartofAccountTypes] ([ChartofAccountType_id], [AccountType_Name], [IsGLType]) VALUES (6, N'Default', 0)
SET IDENTITY_INSERT [dbo].[ChartofAccountTypes] OFF
/****** Object:  Table [dbo].[ChartofAccountsSubTypes]    Script Date: 11/30/2015 16:02:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChartofAccountsSubTypes](
	[ChartofAccountsSubType_id] [bigint] IDENTITY(1,1) NOT NULL,
	[Subtype_Name] [varchar](50) NULL,
	[ChartofAccountType_id] [bigint] NULL,
 CONSTRAINT [PK_ChartofAccountsSubTypes] PRIMARY KEY CLUSTERED 
(
	[ChartofAccountsSubType_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ChartofAccountsSubTypes] ON
INSERT [dbo].[ChartofAccountsSubTypes] ([ChartofAccountsSubType_id], [Subtype_Name], [ChartofAccountType_id]) VALUES (1, N'Cash Assets', 1)
INSERT [dbo].[ChartofAccountsSubTypes] ([ChartofAccountsSubType_id], [Subtype_Name], [ChartofAccountType_id]) VALUES (2, N'Accounts Receivable', 1)
INSERT [dbo].[ChartofAccountsSubTypes] ([ChartofAccountsSubType_id], [Subtype_Name], [ChartofAccountType_id]) VALUES (3, N'Inventory', 1)
INSERT [dbo].[ChartofAccountsSubTypes] ([ChartofAccountsSubType_id], [Subtype_Name], [ChartofAccountType_id]) VALUES (4, N'Current Assets', 1)
INSERT [dbo].[ChartofAccountsSubTypes] ([ChartofAccountsSubType_id], [Subtype_Name], [ChartofAccountType_id]) VALUES (5, N'Fixed Assets', 1)
INSERT [dbo].[ChartofAccountsSubTypes] ([ChartofAccountsSubType_id], [Subtype_Name], [ChartofAccountType_id]) VALUES (6, N'Accumulated Depreciation', 1)
INSERT [dbo].[ChartofAccountsSubTypes] ([ChartofAccountsSubType_id], [Subtype_Name], [ChartofAccountType_id]) VALUES (7, N'Accounts Payable', 2)
INSERT [dbo].[ChartofAccountsSubTypes] ([ChartofAccountsSubType_id], [Subtype_Name], [ChartofAccountType_id]) VALUES (8, N'Current Liabilities', 2)
INSERT [dbo].[ChartofAccountsSubTypes] ([ChartofAccountsSubType_id], [Subtype_Name], [ChartofAccountType_id]) VALUES (9, N'Long Term Liabilities', 2)
INSERT [dbo].[ChartofAccountsSubTypes] ([ChartofAccountsSubType_id], [Subtype_Name], [ChartofAccountType_id]) VALUES (10, N'Equity do not close', 3)
INSERT [dbo].[ChartofAccountsSubTypes] ([ChartofAccountsSubType_id], [Subtype_Name], [ChartofAccountType_id]) VALUES (11, N'Equity Retained Earnings', 3)
INSERT [dbo].[ChartofAccountsSubTypes] ([ChartofAccountsSubType_id], [Subtype_Name], [ChartofAccountType_id]) VALUES (12, N'Sales Income', 4)
INSERT [dbo].[ChartofAccountsSubTypes] ([ChartofAccountsSubType_id], [Subtype_Name], [ChartofAccountType_id]) VALUES (13, N'Other Income', 4)
INSERT [dbo].[ChartofAccountsSubTypes] ([ChartofAccountsSubType_id], [Subtype_Name], [ChartofAccountType_id]) VALUES (14, N'Cost of Goods Sold', 5)
INSERT [dbo].[ChartofAccountsSubTypes] ([ChartofAccountsSubType_id], [Subtype_Name], [ChartofAccountType_id]) VALUES (15, N'Expenses', 5)
INSERT [dbo].[ChartofAccountsSubTypes] ([ChartofAccountsSubType_id], [Subtype_Name], [ChartofAccountType_id]) VALUES (16, N'Depreciation Expense', 5)
INSERT [dbo].[ChartofAccountsSubTypes] ([ChartofAccountsSubType_id], [Subtype_Name], [ChartofAccountType_id]) VALUES (17, N'Default', 6)
SET IDENTITY_INSERT [dbo].[ChartofAccountsSubTypes] OFF
/****** Object:  Table [dbo].[ChartofAccounts]    Script Date: 11/30/2015 16:02:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChartofAccounts](
	[ChartofAccount_id] [bigint] IDENTITY(1,1) NOT NULL,
	[Account_Name] [varchar](50) NULL,
	[ChartofAccountsSubType_id] [bigint] NULL,
 CONSTRAINT [PK_ChartofAccounts] PRIMARY KEY CLUSTERED 
(
	[ChartofAccount_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ChartofAccounts] ON
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (1, N'4857237', 2)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (2, N'Cash Account', 1)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (3, N'Petty Cash Account', 1)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (4, N'Bank Account', 1)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (5, N'Cash at Retail', 1)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (6, N'Mpesa ', 1)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (7, N'Other modes of payment', 1)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (8, N'Accounts Receivable', 2)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (9, N'Warehouse 1: Finished Goods', 3)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (10, N'Warehouse 1: Materials', 3)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (11, N'Warehouse 2: Inventory', 3)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (12, N'Intransit Inventory', 3)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (13, N'Retail Inventory', 3)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (14, N'WIP Asset', 3)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (15, N'Shipping Asset WH1', 3)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (16, N'Shipping Asset WH2', 3)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (17, N'Prepaid Account - Purchasing', 4)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (18, N'PostPaid Card Asset Account', 4)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (19, N'PostPaid Card Interest and Penalty ', 4)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (20, N'Inventory Cost Variance', 3)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (21, N'Purchase Price Variance', 3)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (22, N'Material Usage Variance', 3)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (23, N'Fixed Assets', 5)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (24, N'Accumulated Depreciation', 6)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (25, N'Transform Clearing', 3)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (26, N'Unassigned Inv Transactions', 3)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (27, N'Accounts Payable', 7)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (28, N'Deferred Revenue', 8)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (29, N'Accrued Labor and Overhead Costs', 8)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (30, N'Accrued Project Labor and Overhead', 8)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (31, N'Value Added Tax Liability ', 8)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (32, N'Loyalty Points Liability', 8)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (33, N'Prepaid Card Liability Account', 8)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (34, N'Prepaid Receivables', 8)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (35, N'Credit Memo', 8)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (36, N'P/O Liability Clearing', 8)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (37, N'Freight Liability - Sales', 8)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (38, N'TO Freight Liability', 8)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (39, N'Accrued Warranty Liability', 8)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (40, N'Long Term Note Payable', 9)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (41, N'Paid-In Capital', 10)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (42, N'Retained Earnings', 11)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (43, N'Stock Class B', 10)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (44, N'Product Revenue (Domestic)', 12)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (45, N'Revenue (Retail)', 12)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (46, N'Revenue Clearing (Retail)', 12)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (47, N'Product Revenue (International)', 12)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (48, N'Service Revenue', 12)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (49, N'Card issuance fee', 13)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (50, N'Debit Note Allowed', 13)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (51, N'Shipping Charge Revenue', 13)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (52, N'Returns', 12)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (53, N'Returns (Retail)', 12)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (54, N'Revenue Credit sales', 13)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (55, N'Customer Discounts', 13)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (56, N'Interest Income - normal', 13)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (57, N'Interest Income - default', 13)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (58, N'Other Incomes', 13)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (59, N'Penalty Income ', 13)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (60, N'Revenue Adjustment', 12)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (61, N'Cost of Goods Sold', 14)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (62, N'Cost of Goods Sold (Retail)', 14)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (63, N'Returned Goods', 14)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (64, N'Return Goods (Retail)', 14)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (65, N'Warranty Expense', 14)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (66, N'Fair value of Loyalty Points', 14)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (67, N'Promotions and Discounts Taken', 14)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (68, N'Debit Note (Purchaser)', 14)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (69, N'Office Supplies', 15)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (70, N'Shop Supplies', 15)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (71, N'State Sales Tax Expense', 15)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (72, N'Outbound Freight Expense', 15)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (73, N'Inbound Freight Expense', 15)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (74, N'Expense Items', 15)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (75, N'Professional Services', 15)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (76, N'Travel Expense', 15)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (77, N'Depreciation Expense', 16)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (78, N'PO/TO Line Item Freight Exp', 15)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (79, N'Finance Fees and Expenses', 15)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (80, N'Inventory Adjustment', 15)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (81, N'Inventory Adjustment (Retail)', 15)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (82, N'Inventory Scrap', 15)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (83, N'Inventory Scrap (Retail)', 15)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (84, N'Manufacturing Scrap', 15)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (85, N'Retail Adjustment', 15)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (86, N'Purchase Expense Variance', 15)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (87, N'Currency Gain / Loss', 15)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (88, N'G/L Series Discrepancy', 15)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (89, N'4857274', 2)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (90, N'4857275', 2)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (91, N'4857276', 2)
INSERT [dbo].[ChartofAccounts] ([ChartofAccount_id], [Account_Name], [ChartofAccountsSubType_id]) VALUES (92, N'4857277', 2)
SET IDENTITY_INSERT [dbo].[ChartofAccounts] OFF
/****** Object:  Table [dbo].[ChannelTypes]    Script Date: 11/30/2015 16:02:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChannelTypes](
	[ChannelType_id] [bigint] IDENTITY(1,1) NOT NULL,
	[ChannelType_Name] [nvarchar](50) NULL,
	[ChannelType_Description] [nvarchar](250) NULL,
	[ChannelType_IsActive] [bit] NULL,
	[ChannelType_IsDeleted] [bit] NULL,
	[ChannelType_DateCreated] [datetime] NULL,
	[IsAddApproved] [bit] NULL,
	[IsDelApproved] [bit] NULL,
	[IsEditApproved] [bit] NULL,
	[IsDeletedFlag] [int] NULL,
	[IsbeingEdited] [bit] NULL,
	[CF1] [varchar](50) NULL,
	[CF2] [varchar](50) NULL,
	[CF3] [varchar](50) NULL,
	[CF4] [varchar](50) NULL,
	[CF5] [varchar](50) NULL,
 CONSTRAINT [PK_ChannelTypes] PRIMARY KEY CLUSTERED 
(
	[ChannelType_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ChannelTypes] ON
INSERT [dbo].[ChannelTypes] ([ChannelType_id], [ChannelType_Name], [ChannelType_Description], [ChannelType_IsActive], [ChannelType_IsDeleted], [ChannelType_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [IsDeletedFlag], [IsbeingEdited], [CF1], [CF2], [CF3], [CF4], [CF5]) VALUES (1, N'Channel Type one', N'Channel type one description', 1, 0, CAST(0x0000A4BC01011568 AS DateTime), 1, NULL, 1, NULL, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ChannelTypes] ([ChannelType_id], [ChannelType_Name], [ChannelType_Description], [ChannelType_IsActive], [ChannelType_IsDeleted], [ChannelType_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [IsDeletedFlag], [IsbeingEdited], [CF1], [CF2], [CF3], [CF4], [CF5]) VALUES (2, N'Channel Type two', N'Channel type two description', 1, 0, CAST(0x0000A4D8011D7887 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ChannelTypes] ([ChannelType_id], [ChannelType_Name], [ChannelType_Description], [ChannelType_IsActive], [ChannelType_IsDeleted], [ChannelType_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [IsDeletedFlag], [IsbeingEdited], [CF1], [CF2], [CF3], [CF4], [CF5]) VALUES (3, N'Channel Type three', N'dhsd sdgshds hdgsdh shdgshd sdh', 1, 0, CAST(0x0000A4D8011CEAF0 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[ChannelTypes] ([ChannelType_id], [ChannelType_Name], [ChannelType_Description], [ChannelType_IsActive], [ChannelType_IsDeleted], [ChannelType_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [IsDeletedFlag], [IsbeingEdited], [CF1], [CF2], [CF3], [CF4], [CF5]) VALUES (4, N'dfdf', N'fddf', 1, 0, CAST(0x0000A55D014235D4 AS DateTime), NULL, NULL, NULL, NULL, NULL, N'dfdf', N'dfdf', N'dfdf', N'dfdf', N'dfdf')
SET IDENTITY_INSERT [dbo].[ChannelTypes] OFF
/****** Object:  Table [dbo].[Channels]    Script Date: 11/30/2015 16:02:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Channels](
	[Channel_id] [bigint] IDENTITY(1,1) NOT NULL,
	[Channel_Name] [nvarchar](50) NULL,
	[Channel_Description] [nvarchar](250) NULL,
	[Channel_Type] [bigint] NULL,
	[Channel_Country] [nvarchar](100) NULL,
	[Channel_Address] [nvarchar](250) NULL,
	[Channel_City] [nvarchar](50) NULL,
	[Channel_IsDeleted] [bit] NULL,
	[Channel_IsActive] [bit] NULL,
	[Channel_DateCreated] [datetime] NULL,
	[Channel_IsSelected] [bit] NULL CONSTRAINT [DF_Channels_Channel_IsSelected]  DEFAULT ((0)),
	[IsAddApproved] [bit] NULL,
	[IsDelApproved] [bit] NULL,
	[IsEditApproved] [bit] NULL,
	[IsDeletedFlag] [int] NULL,
	[IsbeingEdited] [bit] NULL,
	[CF1] [varchar](50) NULL,
	[CF2] [varchar](50) NULL,
	[CF3] [varchar](50) NULL,
	[CF4] [varchar](50) NULL,
	[CF5] [varchar](50) NULL,
 CONSTRAINT [PK_Channels] PRIMARY KEY CLUSTERED 
(
	[Channel_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Channels] ON
INSERT [dbo].[Channels] ([Channel_id], [Channel_Name], [Channel_Description], [Channel_Type], [Channel_Country], [Channel_Address], [Channel_City], [Channel_IsDeleted], [Channel_IsActive], [Channel_DateCreated], [Channel_IsSelected], [IsAddApproved], [IsDelApproved], [IsEditApproved], [IsDeletedFlag], [IsbeingEdited], [CF1], [CF2], [CF3], [CF4], [CF5]) VALUES (1, N'Channel one', N'Channel one description', 2, N'India', N'Rambagh circle, Jaipur, Rajasthan, India', N'Jaipur', 0, 1, CAST(0x0000A49801312A22 AS DateTime), 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Channels] ([Channel_id], [Channel_Name], [Channel_Description], [Channel_Type], [Channel_Country], [Channel_Address], [Channel_City], [Channel_IsDeleted], [Channel_IsActive], [Channel_DateCreated], [Channel_IsSelected], [IsAddApproved], [IsDelApproved], [IsEditApproved], [IsDeletedFlag], [IsbeingEdited], [CF1], [CF2], [CF3], [CF4], [CF5]) VALUES (2, N'Channel Two', N'Channel Two', 2, N'India', N'Jaipur Rajasthan', N'Jaipur', 0, 1, CAST(0x0000A49600FBCC88 AS DateTime), 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Channels] ([Channel_id], [Channel_Name], [Channel_Description], [Channel_Type], [Channel_Country], [Channel_Address], [Channel_City], [Channel_IsDeleted], [Channel_IsActive], [Channel_DateCreated], [Channel_IsSelected], [IsAddApproved], [IsDelApproved], [IsEditApproved], [IsDeletedFlag], [IsbeingEdited], [CF1], [CF2], [CF3], [CF4], [CF5]) VALUES (5, N'Channel Three', N'Channel three description', 2, N'Kenya', N'Mombasa', N'Mombasa', 0, 1, CAST(0x0000A49600D583B8 AS DateTime), 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Channels] ([Channel_id], [Channel_Name], [Channel_Description], [Channel_Type], [Channel_Country], [Channel_Address], [Channel_City], [Channel_IsDeleted], [Channel_IsActive], [Channel_DateCreated], [Channel_IsSelected], [IsAddApproved], [IsDelApproved], [IsEditApproved], [IsDeletedFlag], [IsbeingEdited], [CF1], [CF2], [CF3], [CF4], [CF5]) VALUES (6, N'Channel Five', N'All Channels', 1, N'India', N'Jaipur', N'Jaipur', 0, 1, CAST(0x0000A4BC0117AD01 AS DateTime), NULL, NULL, 0, 0, 1, 0, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Channels] ([Channel_id], [Channel_Name], [Channel_Description], [Channel_Type], [Channel_Country], [Channel_Address], [Channel_City], [Channel_IsDeleted], [Channel_IsActive], [Channel_DateCreated], [Channel_IsSelected], [IsAddApproved], [IsDelApproved], [IsEditApproved], [IsDeletedFlag], [IsbeingEdited], [CF1], [CF2], [CF3], [CF4], [CF5]) VALUES (7, N'Channel Four', N'This is test', 2, N'India', N'Jaipur, Rajasthan', N'Jaipur', 0, 1, CAST(0x0000A4A100DFEDE3 AS DateTime), 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Channels] ([Channel_id], [Channel_Name], [Channel_Description], [Channel_Type], [Channel_Country], [Channel_Address], [Channel_City], [Channel_IsDeleted], [Channel_IsActive], [Channel_DateCreated], [Channel_IsSelected], [IsAddApproved], [IsDelApproved], [IsEditApproved], [IsDeletedFlag], [IsbeingEdited], [CF1], [CF2], [CF3], [CF4], [CF5]) VALUES (9, N'Channel 1', N'Channel 1', 3, N'India', N'89, Street one, Jaipur', N'Jaipur', 0, 1, CAST(0x0000A4D8012190C4 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Channels] OFF
/****** Object:  Table [dbo].[CardUsageLimit]    Script Date: 11/30/2015 16:02:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CardUsageLimit](
	[Card_UsageLimit_id] [bigint] IDENTITY(1,1) NOT NULL,
	[Card_UsageLimit_Card_id] [bigint] NULL,
	[Card_UsageLimit_Product_id] [bigint] NULL,
	[Card_UsageLimit_Value] [decimal](18, 2) NULL,
	[Card_UsageLimit_DateCreated] [datetime] NULL,
	[Card_UsageLimit_Type] [bigint] NULL,
	[Card_UsageLimit_IsOverall] [bit] NULL CONSTRAINT [DF_CardUsageLimit_Card_UsageLimit_IsOverall]  DEFAULT ((0)),
	[Card_UsageLimit_IsActive] [bit] NULL CONSTRAINT [DF_CardUsageLimit_Card_UsageLimit_IsActive]  DEFAULT ((1)),
	[Card_UsageLimit_IsDeleted] [bit] NULL CONSTRAINT [DF_CardUsageLimit_Card_UsageLimit_IsDeleted]  DEFAULT ((0)),
	[IsAddApproved] [bit] NULL,
	[IsDelApproved] [bit] NULL,
	[IsEditApproved] [bit] NULL,
 CONSTRAINT [PK_Card_UsageLimit] PRIMARY KEY CLUSTERED 
(
	[Card_UsageLimit_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Daily or Weekly or Monthly code from TimeDuration table' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CardUsageLimit', @level2type=N'COLUMN',@level2name=N'Card_UsageLimit_Type'
GO
SET IDENTITY_INSERT [dbo].[CardUsageLimit] ON
INSERT [dbo].[CardUsageLimit] ([Card_UsageLimit_id], [Card_UsageLimit_Card_id], [Card_UsageLimit_Product_id], [Card_UsageLimit_Value], [Card_UsageLimit_DateCreated], [Card_UsageLimit_Type], [Card_UsageLimit_IsOverall], [Card_UsageLimit_IsActive], [Card_UsageLimit_IsDeleted], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (3, 19825, -1, CAST(2000.00 AS Decimal(18, 2)), CAST(0x0000A4D1012F7498 AS DateTime), 52, 1, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[CardUsageLimit] ([Card_UsageLimit_id], [Card_UsageLimit_Card_id], [Card_UsageLimit_Product_id], [Card_UsageLimit_Value], [Card_UsageLimit_DateCreated], [Card_UsageLimit_Type], [Card_UsageLimit_IsOverall], [Card_UsageLimit_IsActive], [Card_UsageLimit_IsDeleted], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (6, 19837, -1, CAST(343.00 AS Decimal(18, 2)), CAST(0x0000A4B400D0053D AS DateTime), 52, 1, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[CardUsageLimit] ([Card_UsageLimit_id], [Card_UsageLimit_Card_id], [Card_UsageLimit_Product_id], [Card_UsageLimit_Value], [Card_UsageLimit_DateCreated], [Card_UsageLimit_Type], [Card_UsageLimit_IsOverall], [Card_UsageLimit_IsActive], [Card_UsageLimit_IsDeleted], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (7, 19837, 1, CAST(5000.00 AS Decimal(18, 2)), CAST(0x0000A4AE014DD27F AS DateTime), 52, NULL, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[CardUsageLimit] ([Card_UsageLimit_id], [Card_UsageLimit_Card_id], [Card_UsageLimit_Product_id], [Card_UsageLimit_Value], [Card_UsageLimit_DateCreated], [Card_UsageLimit_Type], [Card_UsageLimit_IsOverall], [Card_UsageLimit_IsActive], [Card_UsageLimit_IsDeleted], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (8, 19837, 2, CAST(2000.00 AS Decimal(18, 2)), CAST(0x0000A4AE0131883D AS DateTime), 52, NULL, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[CardUsageLimit] ([Card_UsageLimit_id], [Card_UsageLimit_Card_id], [Card_UsageLimit_Product_id], [Card_UsageLimit_Value], [Card_UsageLimit_DateCreated], [Card_UsageLimit_Type], [Card_UsageLimit_IsOverall], [Card_UsageLimit_IsActive], [Card_UsageLimit_IsDeleted], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (9, 19837, 3, CAST(850.00 AS Decimal(18, 2)), CAST(0x0000A4AE01474E79 AS DateTime), 52, NULL, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[CardUsageLimit] ([Card_UsageLimit_id], [Card_UsageLimit_Card_id], [Card_UsageLimit_Product_id], [Card_UsageLimit_Value], [Card_UsageLimit_DateCreated], [Card_UsageLimit_Type], [Card_UsageLimit_IsOverall], [Card_UsageLimit_IsActive], [Card_UsageLimit_IsDeleted], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (12, 19837, 18, CAST(950.00 AS Decimal(18, 2)), CAST(0x0000A4AE01477125 AS DateTime), 52, NULL, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[CardUsageLimit] ([Card_UsageLimit_id], [Card_UsageLimit_Card_id], [Card_UsageLimit_Product_id], [Card_UsageLimit_Value], [Card_UsageLimit_DateCreated], [Card_UsageLimit_Type], [Card_UsageLimit_IsOverall], [Card_UsageLimit_IsActive], [Card_UsageLimit_IsDeleted], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (13, 19844, -1, CAST(7890.00 AS Decimal(18, 2)), CAST(0x0000A4B300C2E5BE AS DateTime), 52, 0, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[CardUsageLimit] ([Card_UsageLimit_id], [Card_UsageLimit_Card_id], [Card_UsageLimit_Product_id], [Card_UsageLimit_Value], [Card_UsageLimit_DateCreated], [Card_UsageLimit_Type], [Card_UsageLimit_IsOverall], [Card_UsageLimit_IsActive], [Card_UsageLimit_IsDeleted], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (14, 19844, 1, CAST(5000.00 AS Decimal(18, 2)), CAST(0x0000A4B300BFA631 AS DateTime), 52, NULL, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[CardUsageLimit] ([Card_UsageLimit_id], [Card_UsageLimit_Card_id], [Card_UsageLimit_Product_id], [Card_UsageLimit_Value], [Card_UsageLimit_DateCreated], [Card_UsageLimit_Type], [Card_UsageLimit_IsOverall], [Card_UsageLimit_IsActive], [Card_UsageLimit_IsDeleted], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (15, 19825, 1, CAST(200.00 AS Decimal(18, 2)), CAST(0x0000A4D1012F336D AS DateTime), 52, NULL, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[CardUsageLimit] ([Card_UsageLimit_id], [Card_UsageLimit_Card_id], [Card_UsageLimit_Product_id], [Card_UsageLimit_Value], [Card_UsageLimit_DateCreated], [Card_UsageLimit_Type], [Card_UsageLimit_IsOverall], [Card_UsageLimit_IsActive], [Card_UsageLimit_IsDeleted], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (16, 19838, -1, CAST(100.00 AS Decimal(18, 2)), CAST(0x0000A4D10135B4ED AS DateTime), 52, NULL, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[CardUsageLimit] ([Card_UsageLimit_id], [Card_UsageLimit_Card_id], [Card_UsageLimit_Product_id], [Card_UsageLimit_Value], [Card_UsageLimit_DateCreated], [Card_UsageLimit_Type], [Card_UsageLimit_IsOverall], [Card_UsageLimit_IsActive], [Card_UsageLimit_IsDeleted], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (17, 19838, 7, CAST(100.00 AS Decimal(18, 2)), CAST(0x0000A4D10135BDF6 AS DateTime), 52, NULL, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[CardUsageLimit] ([Card_UsageLimit_id], [Card_UsageLimit_Card_id], [Card_UsageLimit_Product_id], [Card_UsageLimit_Value], [Card_UsageLimit_DateCreated], [Card_UsageLimit_Type], [Card_UsageLimit_IsOverall], [Card_UsageLimit_IsActive], [Card_UsageLimit_IsDeleted], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (18, 73050, -1, CAST(1200.00 AS Decimal(18, 2)), CAST(0x0000A50E00C7B354 AS DateTime), 52, 0, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[CardUsageLimit] ([Card_UsageLimit_id], [Card_UsageLimit_Card_id], [Card_UsageLimit_Product_id], [Card_UsageLimit_Value], [Card_UsageLimit_DateCreated], [Card_UsageLimit_Type], [Card_UsageLimit_IsOverall], [Card_UsageLimit_IsActive], [Card_UsageLimit_IsDeleted], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (19, 73050, 19, CAST(1000.00 AS Decimal(18, 2)), CAST(0x0000A50E00C7977B AS DateTime), 52, NULL, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[CardUsageLimit] ([Card_UsageLimit_id], [Card_UsageLimit_Card_id], [Card_UsageLimit_Product_id], [Card_UsageLimit_Value], [Card_UsageLimit_DateCreated], [Card_UsageLimit_Type], [Card_UsageLimit_IsOverall], [Card_UsageLimit_IsActive], [Card_UsageLimit_IsDeleted], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (20, 73027, -1, CAST(2500.00 AS Decimal(18, 2)), CAST(0x0000A4F200B3B635 AS DateTime), 52, NULL, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[CardUsageLimit] ([Card_UsageLimit_id], [Card_UsageLimit_Card_id], [Card_UsageLimit_Product_id], [Card_UsageLimit_Value], [Card_UsageLimit_DateCreated], [Card_UsageLimit_Type], [Card_UsageLimit_IsOverall], [Card_UsageLimit_IsActive], [Card_UsageLimit_IsDeleted], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (21, 73027, 22, CAST(900.00 AS Decimal(18, 2)), CAST(0x0000A4F200B3EDE3 AS DateTime), 52, NULL, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[CardUsageLimit] ([Card_UsageLimit_id], [Card_UsageLimit_Card_id], [Card_UsageLimit_Product_id], [Card_UsageLimit_Value], [Card_UsageLimit_DateCreated], [Card_UsageLimit_Type], [Card_UsageLimit_IsOverall], [Card_UsageLimit_IsActive], [Card_UsageLimit_IsDeleted], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (22, 73054, -1, CAST(5000.00 AS Decimal(18, 2)), CAST(0x0000A52D013183C4 AS DateTime), 52, 0, 1, 0, NULL, NULL, NULL)
INSERT [dbo].[CardUsageLimit] ([Card_UsageLimit_id], [Card_UsageLimit_Card_id], [Card_UsageLimit_Product_id], [Card_UsageLimit_Value], [Card_UsageLimit_DateCreated], [Card_UsageLimit_Type], [Card_UsageLimit_IsOverall], [Card_UsageLimit_IsActive], [Card_UsageLimit_IsDeleted], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (23, 73054, 19, CAST(1000.00 AS Decimal(18, 2)), CAST(0x0000A52D01327AE5 AS DateTime), 52, NULL, 1, 0, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[CardUsageLimit] OFF
/****** Object:  Table [dbo].[CardTopup]    Script Date: 11/30/2015 16:02:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CardTopup](
	[Card_topup_id] [bigint] IDENTITY(1,1) NOT NULL,
	[Card_id] [bigint] NULL,
	[Card_Amount] [decimal](18, 2) NULL,
	[Card_Channel] [bigint] NULL,
	[Card_Modeofpayment] [nvarchar](50) NULL,
	[Card_Reference] [nvarchar](50) NULL,
	[Card_topupby] [bigint] NULL,
	[Card_topupdate] [datetime] NULL,
	[IsDeleted] [bit] NULL CONSTRAINT [DF_CardTopup_IsDeleted]  DEFAULT ((0)),
	[UpdateDate] [datetime] NULL,
	[IsAddApproved] [bit] NULL,
	[IsDelApproved] [bit] NULL,
	[IsEditApproved] [bit] NULL,
 CONSTRAINT [PK_CardTopup] PRIMARY KEY CLUSTERED 
(
	[Card_topup_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Staff id' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CardTopup', @level2type=N'COLUMN',@level2name=N'Card_topupby'
GO
SET IDENTITY_INSERT [dbo].[CardTopup] ON
INSERT [dbo].[CardTopup] ([Card_topup_id], [Card_id], [Card_Amount], [Card_Channel], [Card_Modeofpayment], [Card_Reference], [Card_topupby], [Card_topupdate], [IsDeleted], [UpdateDate], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (1, 19841, CAST(4546.00 AS Decimal(18, 2)), 5, N'Cheque', N'ch32323', 4, CAST(0x0000A4160101AA85 AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CardTopup] ([Card_topup_id], [Card_id], [Card_Amount], [Card_Channel], [Card_Modeofpayment], [Card_Reference], [Card_topupby], [Card_topupdate], [IsDeleted], [UpdateDate], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (3, 19827, CAST(555.00 AS Decimal(18, 2)), 5, N'Cheque', N'Ch Number 2439438', 4, CAST(0x0000A2C80106B3CE AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CardTopup] ([Card_topup_id], [Card_id], [Card_Amount], [Card_Channel], [Card_Modeofpayment], [Card_Reference], [Card_topupby], [Card_topupdate], [IsDeleted], [UpdateDate], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (4, 19827, CAST(678.00 AS Decimal(18, 2)), 1, N'Cheque', N'ch454545', 4, CAST(0x0000A4510107222E AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CardTopup] ([Card_topup_id], [Card_id], [Card_Amount], [Card_Channel], [Card_Modeofpayment], [Card_Reference], [Card_topupby], [Card_topupdate], [IsDeleted], [UpdateDate], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (5, 19827, CAST(345.00 AS Decimal(18, 2)), 5, N'Cheque', N'ch54545', 4, CAST(0x0000A4700107930B AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CardTopup] ([Card_topup_id], [Card_id], [Card_Amount], [Card_Channel], [Card_Modeofpayment], [Card_Reference], [Card_topupby], [Card_topupdate], [IsDeleted], [UpdateDate], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (6, 19841, CAST(800.00 AS Decimal(18, 2)), 1, N'Cheque', N'ch5454', 4, CAST(0x0000A48E01081FC6 AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CardTopup] ([Card_topup_id], [Card_id], [Card_Amount], [Card_Channel], [Card_Modeofpayment], [Card_Reference], [Card_topupby], [Card_topupdate], [IsDeleted], [UpdateDate], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (7, 19841, CAST(3434.00 AS Decimal(18, 2)), 1, N'Cheque', N'ch3434334', 4, CAST(0x0000A4AD0108C3AD AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CardTopup] ([Card_topup_id], [Card_id], [Card_Amount], [Card_Channel], [Card_Modeofpayment], [Card_Reference], [Card_topupby], [Card_topupdate], [IsDeleted], [UpdateDate], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (8, 19841, CAST(200.00 AS Decimal(18, 2)), 1, N'Cheque', N'ch34343', 4, CAST(0x0000A4AD0108F8CE AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CardTopup] ([Card_topup_id], [Card_id], [Card_Amount], [Card_Channel], [Card_Modeofpayment], [Card_Reference], [Card_topupby], [Card_topupdate], [IsDeleted], [UpdateDate], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (9, 19843, CAST(100.00 AS Decimal(18, 2)), 1, N'Cheque', N'ch236723', 4, CAST(0x0000A4AD010917ED AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CardTopup] ([Card_topup_id], [Card_id], [Card_Amount], [Card_Channel], [Card_Modeofpayment], [Card_Reference], [Card_topupby], [Card_topupdate], [IsDeleted], [UpdateDate], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (10, 19843, CAST(200.00 AS Decimal(18, 2)), 1, N'Cheque', N'ch2362372', 4, CAST(0x0000A4AD01092F2F AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CardTopup] ([Card_topup_id], [Card_id], [Card_Amount], [Card_Channel], [Card_Modeofpayment], [Card_Reference], [Card_topupby], [Card_topupdate], [IsDeleted], [UpdateDate], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (11, 19837, CAST(800.00 AS Decimal(18, 2)), 1, N'Cheque', N'ch237283', 4, CAST(0x0000A4AD0126E051 AS DateTime), 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[CardTopup] ([Card_topup_id], [Card_id], [Card_Amount], [Card_Channel], [Card_Modeofpayment], [Card_Reference], [Card_topupby], [Card_topupdate], [IsDeleted], [UpdateDate], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (12, 19827, CAST(987.00 AS Decimal(18, 2)), 1, N'Cheque', N'ch2326323', 4, CAST(0x0000A4AD010CD7E6 AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CardTopup] ([Card_topup_id], [Card_id], [Card_Amount], [Card_Channel], [Card_Modeofpayment], [Card_Reference], [Card_topupby], [Card_topupdate], [IsDeleted], [UpdateDate], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (13, 19837, CAST(50.00 AS Decimal(18, 2)), 1, N'Cheque', N'ch34838483', 4, CAST(0x0000A4AD0126CA47 AS DateTime), 0, CAST(0x0000A4AD0131523F AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[CardTopup] ([Card_topup_id], [Card_id], [Card_Amount], [Card_Channel], [Card_Modeofpayment], [Card_Reference], [Card_topupby], [Card_topupdate], [IsDeleted], [UpdateDate], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (14, 19825, CAST(800.00 AS Decimal(18, 2)), 6, N'Cheque', N'ch3473483', 4, CAST(0x0000A4AD010F4D97 AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CardTopup] ([Card_topup_id], [Card_id], [Card_Amount], [Card_Channel], [Card_Modeofpayment], [Card_Reference], [Card_topupby], [Card_topupdate], [IsDeleted], [UpdateDate], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (15, 19825, CAST(25.00 AS Decimal(18, 2)), 1, N'Cheque', N'ch3463743', 4, CAST(0x0000A4AD0126472A AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CardTopup] ([Card_topup_id], [Card_id], [Card_Amount], [Card_Channel], [Card_Modeofpayment], [Card_Reference], [Card_topupby], [Card_topupdate], [IsDeleted], [UpdateDate], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (16, 19837, CAST(100.00 AS Decimal(18, 2)), 1, N'Cheque', N'ch37463743', 1, CAST(0x0000A4AE012D6F24 AS DateTime), 0, CAST(0x0000A4CE00F8B981 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[CardTopup] ([Card_topup_id], [Card_id], [Card_Amount], [Card_Channel], [Card_Modeofpayment], [Card_Reference], [Card_topupby], [Card_topupdate], [IsDeleted], [UpdateDate], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (17, 19837, CAST(100.00 AS Decimal(18, 2)), 2, N'Cheque', N'ch348349', 1, CAST(0x0000A4AE012D4C4E AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CardTopup] ([Card_topup_id], [Card_id], [Card_Amount], [Card_Channel], [Card_Modeofpayment], [Card_Reference], [Card_topupby], [Card_topupdate], [IsDeleted], [UpdateDate], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (18, 19825, CAST(75.00 AS Decimal(18, 2)), 1, N'Cheque', N'dshd sdhsgdhs', 1, CAST(0x0000A4D1013C47EE AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CardTopup] ([Card_topup_id], [Card_id], [Card_Amount], [Card_Channel], [Card_Modeofpayment], [Card_Reference], [Card_topupby], [Card_topupdate], [IsDeleted], [UpdateDate], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (19, 19838, CAST(200.00 AS Decimal(18, 2)), 1, N'Cheque', N'haJS', 1, CAST(0x0000A4D101353C0B AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CardTopup] ([Card_topup_id], [Card_id], [Card_Amount], [Card_Channel], [Card_Modeofpayment], [Card_Reference], [Card_topupby], [Card_topupdate], [IsDeleted], [UpdateDate], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (20, 19838, CAST(100.00 AS Decimal(18, 2)), 1, N'Cheque', N'shsd sdsdjsh', 1, CAST(0x0000A4D101378F72 AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CardTopup] ([Card_topup_id], [Card_id], [Card_Amount], [Card_Channel], [Card_Modeofpayment], [Card_Reference], [Card_topupby], [Card_topupdate], [IsDeleted], [UpdateDate], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (21, 19844, CAST(100.00 AS Decimal(18, 2)), 1, N'Cheque', N'dfdf', 1, CAST(0x0000A4D10137F1A1 AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CardTopup] ([Card_topup_id], [Card_id], [Card_Amount], [Card_Channel], [Card_Modeofpayment], [Card_Reference], [Card_topupby], [Card_topupdate], [IsDeleted], [UpdateDate], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (22, 19839, CAST(200.00 AS Decimal(18, 2)), 1, N'Cheque', N'sgahs shgash', 1, CAST(0x0000A4D1013839DE AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CardTopup] ([Card_topup_id], [Card_id], [Card_Amount], [Card_Channel], [Card_Modeofpayment], [Card_Reference], [Card_topupby], [Card_topupdate], [IsDeleted], [UpdateDate], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (23, 19839, CAST(50.00 AS Decimal(18, 2)), 1, N'Cheque', N'aA aAHh', 1, CAST(0x0000A4D101385C86 AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CardTopup] ([Card_topup_id], [Card_id], [Card_Amount], [Card_Channel], [Card_Modeofpayment], [Card_Reference], [Card_topupby], [Card_topupdate], [IsDeleted], [UpdateDate], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (24, 19838, CAST(150.00 AS Decimal(18, 2)), 1, N'Cheque', N'sdahsa sagshag', 1, CAST(0x0000A4D1013AA45C AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CardTopup] ([Card_topup_id], [Card_id], [Card_Amount], [Card_Channel], [Card_Modeofpayment], [Card_Reference], [Card_topupby], [Card_topupdate], [IsDeleted], [UpdateDate], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (25, 19825, CAST(45.00 AS Decimal(18, 2)), 1, N'Cheque', N'ddd', 1, CAST(0x0000A4D1013C8F6E AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CardTopup] ([Card_topup_id], [Card_id], [Card_Amount], [Card_Channel], [Card_Modeofpayment], [Card_Reference], [Card_topupby], [Card_topupdate], [IsDeleted], [UpdateDate], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (26, 19825, CAST(50.00 AS Decimal(18, 2)), 1, N'Cheque', N'fdfdf', 1, CAST(0x0000A4D1013CC43F AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CardTopup] ([Card_topup_id], [Card_id], [Card_Amount], [Card_Channel], [Card_Modeofpayment], [Card_Reference], [Card_topupby], [Card_topupdate], [IsDeleted], [UpdateDate], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (27, 19838, CAST(150.00 AS Decimal(18, 2)), 1, N'Cheque', N'asgash ashags', 1, CAST(0x0000A4D1013F5064 AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CardTopup] ([Card_topup_id], [Card_id], [Card_Amount], [Card_Channel], [Card_Modeofpayment], [Card_Reference], [Card_topupby], [Card_topupdate], [IsDeleted], [UpdateDate], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (28, 19838, CAST(500.00 AS Decimal(18, 2)), 1, N'Cheque', N'sdsds', 1, CAST(0x0000A4D1013FC4F0 AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CardTopup] ([Card_topup_id], [Card_id], [Card_Amount], [Card_Channel], [Card_Modeofpayment], [Card_Reference], [Card_topupby], [Card_topupdate], [IsDeleted], [UpdateDate], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (29, 73050, CAST(5000.00 AS Decimal(18, 2)), 1, N'Cheque', N'Cheque#563363', 1, CAST(0x0000A50E00C74E26 AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CardTopup] ([Card_topup_id], [Card_id], [Card_Amount], [Card_Channel], [Card_Modeofpayment], [Card_Reference], [Card_topupby], [Card_topupdate], [IsDeleted], [UpdateDate], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (30, 73050, CAST(100.00 AS Decimal(18, 2)), 1, N'Cheque', N'Cheque#384743', 1, CAST(0x0000A50E00F7C88E AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[CardTopup] ([Card_topup_id], [Card_id], [Card_Amount], [Card_Channel], [Card_Modeofpayment], [Card_Reference], [Card_topupby], [Card_topupdate], [IsDeleted], [UpdateDate], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (31, 73027, CAST(5000.00 AS Decimal(18, 2)), 1, N'Cheque', N'Ch#4554', 1, CAST(0x0000A52D0134B743 AS DateTime), 0, CAST(0x0000A52D0134D38B AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[CardTopup] ([Card_topup_id], [Card_id], [Card_Amount], [Card_Channel], [Card_Modeofpayment], [Card_Reference], [Card_topupby], [Card_topupdate], [IsDeleted], [UpdateDate], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (32, 73027, CAST(100.00 AS Decimal(18, 2)), 1, N'Cheque', N'wwwww', 1, CAST(0x0000A539011F85B0 AS DateTime), NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[CardTopup] OFF
/****** Object:  Table [dbo].[Cards]    Script Date: 11/30/2015 16:02:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cards](
	[Card_id] [bigint] IDENTITY(1,1) NOT NULL,
	[Card_UID] [nvarchar](250) NULL,
	[Card_SNO] [nvarchar](250) NULL,
	[Card_Type] [int] NULL,
	[Card_Owner] [bigint] NULL,
	[Card_Owner_Employee] [bigint] NULL,
	[Card_PIN] [nvarchar](250) NULL,
	[Card_Balance] [decimal](18, 2) NULL CONSTRAINT [DF_Cards_Card_Balance]  DEFAULT ((0)),
	[Card_Points_Balance] [int] NULL,
	[Card_OverDraftValue] [decimal](18, 2) NULL,
	[Card_PrepaidAmt] [decimal](18, 2) NULL,
	[Card_IsAssigned] [bit] NULL CONSTRAINT [DF_Cards_Card_IsAssigned]  DEFAULT ((0)),
	[Card_IsAssignedtoEmp] [bit] NULL CONSTRAINT [DF_Cards_Card_IsAssignedtoEmp]  DEFAULT ((0)),
	[Card_IsActive] [bit] NULL CONSTRAINT [DF_Cards_Card_IsActive]  DEFAULT ((1)),
	[Card_IsDeleted] [bit] NULL CONSTRAINT [DF_Cards_Card_IsDeleted]  DEFAULT ((0)),
	[Card_DateAssigned] [datetime] NULL,
	[Card_UploadDate] [datetime] NULL,
	[Card_UpdateDate] [datetime] NULL,
	[Card_CreditLimit] [decimal](18, 2) NULL,
	[Card_CreditLimit_Expiration] [datetime] NULL,
	[IsAddApproved] [bit] NULL,
	[IsEditApproved] [bit] NULL,
	[IsDelApproved] [bit] NULL,
 CONSTRAINT [PK_Cards] PRIMARY KEY CLUSTERED 
(
	[Card_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0=prepaid and 1=postpaid' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Cards', @level2type=N'COLUMN',@level2name=N'Card_Type'
GO
SET IDENTITY_INSERT [dbo].[Cards] ON
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126244, N'2387523', N'250R000123', 0, 13, NULL, N'fjyPAL/RI/8=', NULL, NULL, NULL, NULL, 1, NULL, 1, 0, NULL, CAST(0x0000A547013302D3 AS DateTime), CAST(0x0000A548012396BD AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126245, N'2387524', N'250R000124', 0, 13, NULL, N'OZn54gUCr0A=', NULL, NULL, NULL, NULL, 1, NULL, 1, 0, NULL, CAST(0x0000A54701330306 AS DateTime), CAST(0x0000A5480123AD90 AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126246, N'2387525', N'250R000125', 0, 13, NULL, N'OZn54gUCr0A=', NULL, NULL, NULL, NULL, 1, NULL, 1, 0, NULL, CAST(0x0000A54701330307 AS DateTime), CAST(0x0000A5480123FE33 AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126247, N'2387526', N'250R000126', 0, NULL, NULL, N'OZn54gUCr0A=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330308 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126248, N'2387527', N'250R000127', 0, NULL, NULL, N'OZn54gUCr0A=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330309 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126249, N'2387528', N'250R000128', 0, NULL, NULL, N'OZn54gUCr0A=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133030A AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126250, N'2387529', N'250R000129', 0, 13, NULL, N'7FuU5XcFkzE=', NULL, NULL, NULL, NULL, 1, NULL, 1, 0, NULL, CAST(0x0000A5470133030A AS DateTime), CAST(0x0000A549012A64D6 AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126251, N'2387530', N'250R000130', 0, 13, NULL, N'7FuU5XcFkzE=', NULL, NULL, NULL, NULL, 1, NULL, 1, 0, NULL, CAST(0x0000A5470133030B AS DateTime), CAST(0x0000A549012BD3AD AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126252, N'2387531', N'250R000131', 0, NULL, NULL, N'7FuU5XcFkzE=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133030C AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126253, N'2387532', N'250R000132', 0, NULL, NULL, N'7FuU5XcFkzE=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133030D AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126254, N'2387533', N'250R000133', 0, NULL, NULL, N'7FuU5XcFkzE=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133030E AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126255, N'2387534', N'250R000134', 0, NULL, NULL, N'7FuU5XcFkzE=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133030F AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126256, N'2387535', N'250R000135', 0, NULL, NULL, N'/3CnkQbeviQ=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330310 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126257, N'2387536', N'250R000136', 0, NULL, NULL, N'/3CnkQbeviQ=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330310 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126258, N'2387537', N'250R000137', 0, NULL, NULL, N'/3CnkQbeviQ=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330311 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126259, N'2387538', N'250R000138', 0, NULL, NULL, N'/3CnkQbeviQ=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330312 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126260, N'2387539', N'250R000139', 0, NULL, NULL, N'/3CnkQbeviQ=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330313 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126261, N'2387540', N'250R000140', 0, NULL, NULL, N'pbnw8Dcfbto=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330313 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126262, N'2387541', N'250R000141', 0, NULL, NULL, N'pbnw8Dcfbto=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330314 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126263, N'2387542', N'250R000142', 0, NULL, NULL, N'pbnw8Dcfbto=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330315 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126264, N'2387543', N'250R000143', 0, NULL, NULL, N'pbnw8Dcfbto=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330316 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126265, N'2387544', N'250R000144', 0, NULL, NULL, N'pbnw8Dcfbto=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330316 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126266, N'2387545', N'250R000145', 0, NULL, NULL, N'pbnw8Dcfbto=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330317 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126267, N'2387546', N'250R000146', 0, NULL, NULL, N'pbnw8Dcfbto=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330318 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126268, N'2387547', N'250R000147', 0, NULL, NULL, N'YbjMNpi3pQw=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330319 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126269, N'2387548', N'250R000148', 0, NULL, NULL, N'YbjMNpi3pQw=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330319 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126270, N'2387549', N'250R000149', 0, NULL, NULL, N'YbjMNpi3pQw=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133031A AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126271, N'2387550', N'250R000150', 0, NULL, NULL, N'YbjMNpi3pQw=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133031B AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126272, N'2387551', N'250R000151', 0, 8, NULL, N'YbjMNpi3pQw=', NULL, NULL, NULL, NULL, 1, NULL, 1, 0, NULL, CAST(0x0000A5470133031C AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126273, N'2387552', N'250R000152', 0, 8, NULL, N'YbjMNpi3pQw=', NULL, NULL, NULL, NULL, 1, NULL, 1, 0, NULL, CAST(0x0000A5470133031C AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126274, N'2387553', N'250R000153', 0, 8, NULL, N'tkNIz7lODAA=', NULL, NULL, NULL, NULL, 1, NULL, 1, 0, NULL, CAST(0x0000A5470133031D AS DateTime), CAST(0x0000A55C013D9364 AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126275, N'2387554', N'250R000154', 0, 8, NULL, N'tkNIz7lODAA=', NULL, NULL, NULL, NULL, 1, NULL, 1, 0, NULL, CAST(0x0000A5470133031E AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126276, N'2387555', N'250R000155', 0, 8, NULL, N'tkNIz7lODAA=', NULL, NULL, NULL, NULL, 1, NULL, 1, 0, NULL, CAST(0x0000A5470133031F AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126277, N'2387556', N'250R000156', 0, 8, NULL, N'tkNIz7lODAA=', NULL, NULL, NULL, NULL, 1, NULL, 1, 0, NULL, CAST(0x0000A5470133031F AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126278, N'2387557', N'250R000157', 0, 8, NULL, N'tkNIz7lODAA=', NULL, NULL, NULL, NULL, 1, NULL, 1, 0, NULL, CAST(0x0000A54701330320 AS DateTime), CAST(0x0000A55C013B99C8 AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126279, N'2387558', N'250R000158', 0, NULL, NULL, N'tkNIz7lODAA=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330321 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126280, N'2387559', N'250R000159', 0, NULL, NULL, N'okloBTeeVEY=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330322 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126281, N'2387560', N'250R000160', 0, 13, NULL, N'okloBTeeVEY=', NULL, NULL, NULL, NULL, 1, NULL, 1, 0, NULL, CAST(0x0000A54701330322 AS DateTime), CAST(0x0000A55B00D95550 AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126282, N'2387561', N'250R000161', 0, 13, NULL, N'okloBTeeVEY=', NULL, NULL, NULL, NULL, 1, NULL, 1, 0, NULL, CAST(0x0000A54701330323 AS DateTime), CAST(0x0000A55B00D98AF9 AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126283, N'2387562', N'250R000162', 0, 8, NULL, N'okloBTeeVEY=', NULL, NULL, NULL, NULL, 1, NULL, 1, 0, NULL, CAST(0x0000A54701330324 AS DateTime), CAST(0x0000A55C01260EE7 AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126284, N'2387563', N'250R000163', 0, 8, NULL, N'okloBTeeVEY=', NULL, NULL, NULL, NULL, 1, NULL, 1, 0, NULL, CAST(0x0000A54701330325 AS DateTime), CAST(0x0000A55C011E4B03 AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126285, N'2387564', N'250R000164', 0, NULL, NULL, N'okloBTeeVEY=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330325 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126286, N'2387565', N'250R000165', 0, NULL, NULL, N'mv1ynKAcDY4=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330326 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126287, N'2387566', N'250R000166', 0, NULL, NULL, N'mv1ynKAcDY4=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330327 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126288, N'2387567', N'250R000167', 0, NULL, NULL, N'mv1ynKAcDY4=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330328 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126289, N'2387568', N'250R000168', 0, NULL, NULL, N'mv1ynKAcDY4=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330328 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126290, N'2387569', N'250R000169', 0, NULL, NULL, N'mv1ynKAcDY4=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330329 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126291, N'2387570', N'250R000170', 0, 8, NULL, N'mv1ynKAcDY4=', NULL, NULL, NULL, NULL, 1, NULL, 1, 0, NULL, CAST(0x0000A5470133032A AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126292, N'2387571', N'250R000171', 0, 8, NULL, N'X5EqKCiKYFw=', NULL, NULL, NULL, NULL, 1, NULL, 1, 0, NULL, CAST(0x0000A5470133032B AS DateTime), CAST(0x0000A55C011E2D27 AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126293, N'2387572', N'250R000172', 0, 8, NULL, N'X5EqKCiKYFw=', NULL, NULL, NULL, NULL, 1, NULL, 1, 0, NULL, CAST(0x0000A5470133032C AS DateTime), CAST(0x0000A55C012C538F AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126294, N'2387573', N'250R000173', 0, 8, NULL, N'X5EqKCiKYFw=', NULL, NULL, NULL, NULL, 1, NULL, 1, 0, NULL, CAST(0x0000A5470133032C AS DateTime), CAST(0x0000A55C012C30A5 AS DateTime), NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126295, N'2387574', N'250R000174', 0, NULL, NULL, N'X5EqKCiKYFw=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133032D AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126296, N'2387575', N'250R000175', 0, NULL, NULL, N'X5EqKCiKYFw=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133032E AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126297, N'2387576', N'250R000176', 0, NULL, NULL, N'X5EqKCiKYFw=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133032E AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126298, N'2387577', N'250R000177', 0, NULL, NULL, N'X5EqKCiKYFw=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133032F AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126299, N'2387578', N'250R000178', 0, NULL, NULL, N'VXRxQTxgMMY=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330330 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126300, N'2387579', N'250R000179', 0, NULL, NULL, N'VXRxQTxgMMY=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330331 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126301, N'2387580', N'250R000180', 0, NULL, NULL, N'VXRxQTxgMMY=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330331 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126302, N'2387581', N'250R000181', 0, NULL, NULL, N'VXRxQTxgMMY=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330332 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126303, N'2387582', N'250R000182', 0, NULL, NULL, N'VXRxQTxgMMY=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330333 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126304, N'2387583', N'250R000183', 0, NULL, NULL, N'VXRxQTxgMMY=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330334 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126305, N'2387584', N'250R000184', 0, NULL, NULL, N'gOPA6czJ3Uc=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330334 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126306, N'2387585', N'250R000185', 0, NULL, NULL, N'gOPA6czJ3Uc=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330335 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126307, N'2387586', N'250R000186', 0, NULL, NULL, N'gOPA6czJ3Uc=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330336 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126308, N'2387587', N'250R000187', 0, NULL, NULL, N'gOPA6czJ3Uc=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330337 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126309, N'2387588', N'250R000188', 0, NULL, NULL, N'gOPA6czJ3Uc=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330337 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126310, N'2387589', N'250R000189', 0, NULL, NULL, N'gOPA6czJ3Uc=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330338 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126311, N'2387590', N'250R000190', 0, NULL, NULL, N'AWx7ewi7x5E=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330339 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126312, N'2387591', N'250R000191', 0, NULL, NULL, N'AWx7ewi7x5E=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133033A AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126313, N'2387592', N'250R000192', 0, NULL, NULL, N'AWx7ewi7x5E=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133033B AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126314, N'2387593', N'250R000193', 0, NULL, NULL, N'AWx7ewi7x5E=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133033B AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126315, N'2387594', N'250R000194', 0, NULL, NULL, N'AWx7ewi7x5E=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133033C AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126316, N'2387595', N'250R000195', 0, NULL, NULL, N'AWx7ewi7x5E=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133033D AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126317, N'2387596', N'250R000196', 0, NULL, NULL, N'iak LyQb1PE=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133033E AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126318, N'2387597', N'250R000197', 0, NULL, NULL, N'iak LyQb1PE=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133033E AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126319, N'2387598', N'250R000198', 0, NULL, NULL, N'iak LyQb1PE=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133033F AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126320, N'2387599', N'250R000199', 0, NULL, NULL, N'iak LyQb1PE=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330340 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126321, N'2387600', N'250R000200', 0, NULL, NULL, N'iak LyQb1PE=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330341 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126322, N'2387601', N'250R000201', 0, NULL, NULL, N'iak LyQb1PE=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330341 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126323, N'2387602', N'250R000202', 0, NULL, NULL, N'iak LyQb1PE=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330342 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126324, N'2387603', N'250R000203', 0, NULL, NULL, N'gng/twZjJc8=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330343 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126325, N'2387604', N'250R000204', 0, NULL, NULL, N'gng/twZjJc8=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330344 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126326, N'2387605', N'250R000205', 0, NULL, NULL, N'gng/twZjJc8=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330344 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126327, N'2387606', N'250R000206', 0, NULL, NULL, N'gng/twZjJc8=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330345 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126328, N'2387607', N'250R000207', 0, NULL, NULL, N'gng/twZjJc8=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330346 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126329, N'2387608', N'250R000208', 0, NULL, NULL, N'gng/twZjJc8=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330346 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126330, N'2387609', N'250R000209', 0, NULL, NULL, N'oVfdx BTI54=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330347 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126331, N'2387610', N'250R000210', 0, NULL, NULL, N'oVfdx BTI54=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330348 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126332, N'2387611', N'250R000211', 0, NULL, NULL, N'oVfdx BTI54=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330349 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126333, N'2387612', N'250R000212', 0, NULL, NULL, N'oVfdx BTI54=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330349 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126334, N'2387613', N'250R000213', 0, NULL, NULL, N'oVfdx BTI54=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133034A AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126335, N'2387614', N'250R000214', 0, NULL, NULL, N'oVfdx BTI54=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133034B AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126336, N'2387615', N'250R000215', 0, NULL, NULL, N'7LudSk5V8DI=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133034C AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126337, N'2387616', N'250R000216', 0, NULL, NULL, N'7LudSk5V8DI=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133034D AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126338, N'2387617', N'250R000217', 0, NULL, NULL, N'7LudSk5V8DI=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133034D AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126339, N'2387618', N'250R000218', 0, NULL, NULL, N'7LudSk5V8DI=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133034E AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126340, N'2387619', N'250R000219', 0, NULL, NULL, N'7LudSk5V8DI=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133034F AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126341, N'2387620', N'250R000220', 0, NULL, NULL, N'7LudSk5V8DI=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133034F AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126342, N'2387621', N'250R000221', 0, NULL, NULL, N'nLUmn6nAS/A=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330350 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126343, N'2387622', N'250R000222', 0, NULL, NULL, N'nLUmn6nAS/A=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330351 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
GO
print 'Processed 100 total records'
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126344, N'2387623', N'250R000223', 0, NULL, NULL, N'nLUmn6nAS/A=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330352 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126345, N'2387624', N'250R000224', 0, NULL, NULL, N'nLUmn6nAS/A=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330353 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126346, N'2387625', N'250R000225', 0, NULL, NULL, N'nLUmn6nAS/A=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330354 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126347, N'2387626', N'250R000226', 0, NULL, NULL, N'nLUmn6nAS/A=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330354 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126348, N'2387627', N'250R000227', 0, NULL, NULL, N'nLUmn6nAS/A=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330355 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126349, N'2387628', N'250R000228', 0, NULL, NULL, N'1ddACvwhExo=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330356 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126350, N'2387629', N'250R000229', 0, NULL, NULL, N'1ddACvwhExo=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330357 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126351, N'2387630', N'250R000230', 0, NULL, NULL, N'1ddACvwhExo=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330357 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126352, N'2387631', N'250R000231', 0, NULL, NULL, N'1ddACvwhExo=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330358 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126353, N'2387632', N'250R000232', 0, NULL, NULL, N'1ddACvwhExo=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330359 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126354, N'2387633', N'250R000233', 0, NULL, NULL, N'1ddACvwhExo=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330359 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126355, N'2387634', N'250R000234', 0, NULL, NULL, N'ltMqNzuwB4I=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133035A AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126356, N'2387635', N'250R000235', 0, NULL, NULL, N'ltMqNzuwB4I=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133035B AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126357, N'2387636', N'250R000236', 0, NULL, NULL, N'ltMqNzuwB4I=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133035C AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126358, N'2387637', N'250R000237', 0, NULL, NULL, N'ltMqNzuwB4I=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133035C AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126359, N'2387638', N'250R000238', 0, NULL, NULL, N'ltMqNzuwB4I=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133035D AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126360, N'2387639', N'250R000239', 0, NULL, NULL, N'ltMqNzuwB4I=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133035E AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126361, N'2387640', N'250R000240', 0, NULL, NULL, N'6MFT9HSWrEM=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133035E AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126362, N'2387641', N'250R000241', 0, NULL, NULL, N'6MFT9HSWrEM=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133035F AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126363, N'2387642', N'250R000242', 0, NULL, NULL, N'6MFT9HSWrEM=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330360 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126364, N'2387643', N'250R000243', 0, NULL, NULL, N'6MFT9HSWrEM=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330361 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126365, N'2387644', N'250R000244', 0, NULL, NULL, N'6MFT9HSWrEM=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330361 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126366, N'2387645', N'250R000245', 0, NULL, NULL, N'6MFT9HSWrEM=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330362 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126367, N'2387646', N'250R000246', 0, NULL, NULL, N'797J1GNuWgw=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330363 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126368, N'2387647', N'250R000247', 0, NULL, NULL, N'797J1GNuWgw=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330364 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126369, N'2387648', N'250R000248', 0, NULL, NULL, N'797J1GNuWgw=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330364 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126370, N'2387649', N'250R000249', 0, NULL, NULL, N'797J1GNuWgw=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330365 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126371, N'2387650', N'250R000250', 0, NULL, NULL, N'797J1GNuWgw=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330366 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126372, N'2387651', N'250R000251', 0, NULL, NULL, N'797J1GNuWgw=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330367 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126373, N'2387652', N'250R000252', 0, NULL, NULL, N'797J1GNuWgw=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330367 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126374, N'2387653', N'250R000253', 0, NULL, NULL, N'pZR/fL3uTLk=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330368 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126375, N'2387654', N'250R000254', 0, NULL, NULL, N'pZR/fL3uTLk=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330369 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126376, N'2387655', N'250R000255', 0, NULL, NULL, N'pZR/fL3uTLk=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330369 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126377, N'2387656', N'250R000256', 0, NULL, NULL, N'pZR/fL3uTLk=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133036A AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126378, N'2387657', N'250R000257', 0, NULL, NULL, N'pZR/fL3uTLk=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133036B AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126379, N'2387658', N'250R000258', 0, NULL, NULL, N'pZR/fL3uTLk=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133036C AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126380, N'2387659', N'250R000259', 0, NULL, NULL, N'XOjkRZEplLQ=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133036D AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126381, N'2387660', N'250R000260', 0, NULL, NULL, N'XOjkRZEplLQ=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133036D AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126382, N'2387661', N'250R000261', 0, NULL, NULL, N'XOjkRZEplLQ=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133036E AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126383, N'2387662', N'250R000262', 0, NULL, NULL, N'XOjkRZEplLQ=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133036F AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126384, N'2387663', N'250R000263', 0, NULL, NULL, N'XOjkRZEplLQ=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330370 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126385, N'2387664', N'250R000264', 0, NULL, NULL, N'XOjkRZEplLQ=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330370 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126386, N'2387665', N'250R000265', 0, NULL, NULL, N'WpxTJvmB4WM=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330371 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126387, N'2387666', N'250R000266', 0, NULL, NULL, N'WpxTJvmB4WM=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330372 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126388, N'2387667', N'250R000267', 0, NULL, NULL, N'WpxTJvmB4WM=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330373 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126389, N'2387668', N'250R000268', 0, NULL, NULL, N'WpxTJvmB4WM=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330373 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126390, N'2387669', N'250R000269', 0, NULL, NULL, N'WpxTJvmB4WM=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330374 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126391, N'2387670', N'250R000270', 0, NULL, NULL, N'WpxTJvmB4WM=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330375 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126392, N'2387671', N'250R000271', 0, NULL, NULL, N'w hfSJDxlZc=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330376 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126393, N'2387672', N'250R000272', 0, NULL, NULL, N'w hfSJDxlZc=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330376 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126394, N'2387673', N'250R000273', 0, NULL, NULL, N'w hfSJDxlZc=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330377 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126395, N'2387674', N'250R000274', 0, NULL, NULL, N'w hfSJDxlZc=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330378 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126396, N'2387675', N'250R000275', 0, NULL, NULL, N'w hfSJDxlZc=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330379 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126397, N'2387676', N'250R000276', 0, NULL, NULL, N'w hfSJDxlZc=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330379 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126398, N'2387677', N'250R000277', 0, NULL, NULL, N'w hfSJDxlZc=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133037A AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126399, N'2387678', N'250R000278', 0, NULL, NULL, N'EOAYdWcj6e0=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133037B AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126400, N'2387679', N'250R000279', 0, NULL, NULL, N'EOAYdWcj6e0=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133037C AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126401, N'2387680', N'250R000280', 0, NULL, NULL, N'EOAYdWcj6e0=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133037C AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126402, N'2387681', N'250R000281', 0, NULL, NULL, N'EOAYdWcj6e0=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133037D AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126403, N'2387682', N'250R000282', 0, NULL, NULL, N'EOAYdWcj6e0=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133037E AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126404, N'2387683', N'250R000283', 0, NULL, NULL, N'EOAYdWcj6e0=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133037F AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126405, N'2387684', N'250R000284', 0, NULL, NULL, N'gWjfe1EWsa8=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133037F AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126406, N'2387685', N'250R000285', 0, NULL, NULL, N'gWjfe1EWsa8=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330380 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126407, N'2387686', N'250R000286', 0, NULL, NULL, N'gWjfe1EWsa8=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330381 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126408, N'2387687', N'250R000287', 0, NULL, NULL, N'gWjfe1EWsa8=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330382 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126409, N'2387688', N'250R000288', 0, NULL, NULL, N'gWjfe1EWsa8=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330382 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126410, N'2387689', N'250R000289', 0, NULL, NULL, N'gWjfe1EWsa8=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330383 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126411, N'2387690', N'250R000290', 0, NULL, NULL, N'qrXCy0NXFAI=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330384 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126412, N'2387691', N'250R000291', 0, NULL, NULL, N'qrXCy0NXFAI=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330385 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126413, N'2387692', N'250R000292', 0, NULL, NULL, N'qrXCy0NXFAI=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330385 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126414, N'2387693', N'250R000293', 0, NULL, NULL, N'qrXCy0NXFAI=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330386 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126415, N'2387694', N'250R000294', 0, NULL, NULL, N'qrXCy0NXFAI=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330387 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126416, N'2387695', N'250R000295', 0, NULL, NULL, N'qrXCy0NXFAI=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330388 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126417, N'2387696', N'250R000296', 0, NULL, NULL, N'41EJnCVSd74=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330388 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126418, N'2387697', N'250R000297', 0, NULL, NULL, N'41EJnCVSd74=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330389 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126419, N'2387698', N'250R000298', 0, NULL, NULL, N'41EJnCVSd74=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133038A AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126420, N'2387699', N'250R000299', 0, NULL, NULL, N'41EJnCVSd74=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133038B AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126421, N'2387700', N'250R000300', 0, NULL, NULL, N'41EJnCVSd74=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133038B AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126422, N'2387701', N'250R000301', 0, NULL, NULL, N'41EJnCVSd74=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133038C AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126423, N'2387702', N'250R000302', 0, NULL, NULL, N'41EJnCVSd74=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133038D AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126424, N'2387703', N'250R000303', 0, NULL, NULL, N'Zp6D3/xkCSw=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133038E AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126425, N'2387704', N'250R000304', 0, NULL, NULL, N'Zp6D3/xkCSw=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133038E AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126426, N'2387705', N'250R000305', 0, NULL, NULL, N'Zp6D3/xkCSw=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133038F AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126427, N'2387706', N'250R000306', 0, NULL, NULL, N'Zp6D3/xkCSw=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330390 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126428, N'2387707', N'250R000307', 0, NULL, NULL, N'Zp6D3/xkCSw=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330391 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126429, N'2387708', N'250R000308', 0, NULL, NULL, N'Zp6D3/xkCSw=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330391 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126430, N'2387709', N'250R000309', 0, NULL, NULL, N'sZPGwxyM7d4=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330392 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126431, N'2387710', N'250R000310', 0, NULL, NULL, N'sZPGwxyM7d4=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330393 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126432, N'2387711', N'250R000311', 0, NULL, NULL, N'sZPGwxyM7d4=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330394 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126433, N'2387712', N'250R000312', 0, NULL, NULL, N'sZPGwxyM7d4=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330394 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126434, N'2387713', N'250R000313', 0, NULL, NULL, N'sZPGwxyM7d4=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330395 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126435, N'2387714', N'250R000314', 0, NULL, NULL, N'sZPGwxyM7d4=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330396 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126436, N'2387715', N'250R000315', 0, NULL, NULL, N'MGA/8CDfIrg=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330397 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126437, N'2387716', N'250R000316', 0, NULL, NULL, N'MGA/8CDfIrg=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330398 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126438, N'2387717', N'250R000317', 0, NULL, NULL, N'MGA/8CDfIrg=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330399 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126439, N'2387718', N'250R000318', 0, NULL, NULL, N'MGA/8CDfIrg=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A54701330399 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126440, N'2387719', N'250R000319', 0, NULL, NULL, N'MGA/8CDfIrg=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133039A AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126441, N'2387720', N'250R000320', 0, NULL, NULL, N'MGA/8CDfIrg=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133039B AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126442, N'2387721', N'250R000321', 0, NULL, NULL, N'0fot3vGuiZI=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133039C AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126443, N'2387722', N'250R000322', 0, NULL, NULL, N'0fot3vGuiZI=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133039C AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126444, N'2387723', N'250R000323', 0, NULL, NULL, N'0fot3vGuiZI=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133039D AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
GO
print 'Processed 200 total records'
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126445, N'2387724', N'250R000324', 0, NULL, NULL, N'0fot3vGuiZI=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133039E AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126446, N'2387725', N'250R000325', 0, NULL, NULL, N'0fot3vGuiZI=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A5470133039F AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126447, N'2387726', N'250R000326', 0, NULL, NULL, N'0fot3vGuiZI=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A547013303A0 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126448, N'2387727', N'250R000327', 0, NULL, NULL, N'y0tRtSI1SWI=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A547013303A0 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126449, N'2387728', N'250R000328', 0, NULL, NULL, N'y0tRtSI1SWI=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A547013303A1 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126450, N'2387729', N'250R000329', 0, NULL, NULL, N'y0tRtSI1SWI=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A547013303A2 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126451, N'2387730', N'250R000330', 0, NULL, NULL, N'y0tRtSI1SWI=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A547013303A3 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126452, N'2387731', N'250R000331', 0, NULL, NULL, N'y0tRtSI1SWI=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A547013303A3 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126453, N'2387732', N'250R000332', 0, NULL, NULL, N'y0tRtSI1SWI=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A547013303A4 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126454, N'2387733', N'250R000333', 0, NULL, NULL, N'0hyoIUrrRa4=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A547013303A5 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126455, N'2387734', N'250R000334', 0, NULL, NULL, N'0hyoIUrrRa4=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A547013303A6 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126456, N'2387735', N'250R000335', 0, NULL, NULL, N'0hyoIUrrRa4=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A547013303A6 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126457, N'2387736', N'250R000336', 0, NULL, NULL, N'0hyoIUrrRa4=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A547013303A7 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126458, N'2387737', N'250R000337', 0, NULL, NULL, N'0hyoIUrrRa4=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A547013303A8 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126459, N'2387738', N'250R000338', 0, NULL, NULL, N'0hyoIUrrRa4=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A547013303A9 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Cards] ([Card_id], [Card_UID], [Card_SNO], [Card_Type], [Card_Owner], [Card_Owner_Employee], [Card_PIN], [Card_Balance], [Card_Points_Balance], [Card_OverDraftValue], [Card_PrepaidAmt], [Card_IsAssigned], [Card_IsAssignedtoEmp], [Card_IsActive], [Card_IsDeleted], [Card_DateAssigned], [Card_UploadDate], [Card_UpdateDate], [Card_CreditLimit], [Card_CreditLimit_Expiration], [IsAddApproved], [IsEditApproved], [IsDelApproved]) VALUES (126460, N'2387739', N'250R000339', 0, NULL, NULL, N'mOTuCuBQJRw=', NULL, NULL, NULL, NULL, 0, NULL, 1, 0, NULL, CAST(0x0000A547013303A9 AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Cards] OFF
/****** Object:  Table [dbo].[Approval]    Script Date: 11/30/2015 16:02:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Approval](
	[Table_id] [bigint] IDENTITY(1,1) NOT NULL,
	[TableName] [nvarchar](50) NULL,
	[IsApprovalReqAdd] [bit] NULL CONSTRAINT [DF_Approval_IsApprovalReqAdd]  DEFAULT ((0)),
	[IsApprovalReqEdit] [bit] NULL CONSTRAINT [DF_Approval_IsApprovalReqEdit]  DEFAULT ((0)),
	[IsApprovalReqDelete] [bit] NULL CONSTRAINT [DF_Approval_IsApprovalReqDelete]  DEFAULT ((0)),
	[FirstApprover] [bigint] NULL,
	[SecondApprover] [bigint] NULL,
	[DateCreated] [datetime] NULL,
 CONSTRAINT [PK_Approval] PRIMARY KEY CLUSTERED 
(
	[Table_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Approval] ON
INSERT [dbo].[Approval] ([Table_id], [TableName], [IsApprovalReqAdd], [IsApprovalReqEdit], [IsApprovalReqDelete], [FirstApprover], [SecondApprover], [DateCreated]) VALUES (1, N'ActionsTbl', 1, 1, 1, 11, 1, CAST(0x0000A4BB011796A0 AS DateTime))
INSERT [dbo].[Approval] ([Table_id], [TableName], [IsApprovalReqAdd], [IsApprovalReqEdit], [IsApprovalReqDelete], [FirstApprover], [SecondApprover], [DateCreated]) VALUES (2, N'Activity', 1, 1, 1, 11, 1, CAST(0x0000A4BC011EE1A9 AS DateTime))
INSERT [dbo].[Approval] ([Table_id], [TableName], [IsApprovalReqAdd], [IsApprovalReqEdit], [IsApprovalReqDelete], [FirstApprover], [SecondApprover], [DateCreated]) VALUES (3, N'ActivityType', 1, 1, 1, 11, 1, CAST(0x0000A4BC011F82D7 AS DateTime))
INSERT [dbo].[Approval] ([Table_id], [TableName], [IsApprovalReqAdd], [IsApprovalReqEdit], [IsApprovalReqDelete], [FirstApprover], [SecondApprover], [DateCreated]) VALUES (4, N'Cards', 1, 1, 1, 11, 1, CAST(0x0000A4BC011F954F AS DateTime))
INSERT [dbo].[Approval] ([Table_id], [TableName], [IsApprovalReqAdd], [IsApprovalReqEdit], [IsApprovalReqDelete], [FirstApprover], [SecondApprover], [DateCreated]) VALUES (5, N'CardTopup', 1, 1, 1, 11, 1, CAST(0x0000A4BC011FA410 AS DateTime))
INSERT [dbo].[Approval] ([Table_id], [TableName], [IsApprovalReqAdd], [IsApprovalReqEdit], [IsApprovalReqDelete], [FirstApprover], [SecondApprover], [DateCreated]) VALUES (6, N'CardUsageLimit', 1, 1, 1, 11, 1, CAST(0x0000A4BC011FFA0E AS DateTime))
INSERT [dbo].[Approval] ([Table_id], [TableName], [IsApprovalReqAdd], [IsApprovalReqEdit], [IsApprovalReqDelete], [FirstApprover], [SecondApprover], [DateCreated]) VALUES (7, N'Channels', 1, 1, 1, 11, 1, CAST(0x0000A4BC00F26F60 AS DateTime))
INSERT [dbo].[Approval] ([Table_id], [TableName], [IsApprovalReqAdd], [IsApprovalReqEdit], [IsApprovalReqDelete], [FirstApprover], [SecondApprover], [DateCreated]) VALUES (8, N'ChannelTypes', 1, 1, 1, 11, 1, CAST(0x0000A4BC00F281A6 AS DateTime))
INSERT [dbo].[Approval] ([Table_id], [TableName], [IsApprovalReqAdd], [IsApprovalReqEdit], [IsApprovalReqDelete], [FirstApprover], [SecondApprover], [DateCreated]) VALUES (9, N'CommunicationTemplates', 1, 1, 1, 11, 1, CAST(0x0000A4BC01200A81 AS DateTime))
INSERT [dbo].[Approval] ([Table_id], [TableName], [IsApprovalReqAdd], [IsApprovalReqEdit], [IsApprovalReqDelete], [FirstApprover], [SecondApprover], [DateCreated]) VALUES (10, N'Country', 1, 1, 1, 11, 1, CAST(0x0000A4BC01201CB5 AS DateTime))
INSERT [dbo].[Approval] ([Table_id], [TableName], [IsApprovalReqAdd], [IsApprovalReqEdit], [IsApprovalReqDelete], [FirstApprover], [SecondApprover], [DateCreated]) VALUES (11, N'Currency', 1, 1, 1, 11, 1, CAST(0x0000A4BC0120339A AS DateTime))
INSERT [dbo].[Approval] ([Table_id], [TableName], [IsApprovalReqAdd], [IsApprovalReqEdit], [IsApprovalReqDelete], [FirstApprover], [SecondApprover], [DateCreated]) VALUES (12, N'Customer_Roles', 1, 1, 1, 11, 1, CAST(0x0000A4BC0120487C AS DateTime))
INSERT [dbo].[Approval] ([Table_id], [TableName], [IsApprovalReqAdd], [IsApprovalReqEdit], [IsApprovalReqDelete], [FirstApprover], [SecondApprover], [DateCreated]) VALUES (13, N'CustomerPermissions', 1, 1, 1, 11, 1, CAST(0x0000A4BC0120580E AS DateTime))
INSERT [dbo].[Approval] ([Table_id], [TableName], [IsApprovalReqAdd], [IsApprovalReqEdit], [IsApprovalReqDelete], [FirstApprover], [SecondApprover], [DateCreated]) VALUES (14, N'Customers', 1, 1, 1, 11, 1, CAST(0x0000A4BC0120686F AS DateTime))
INSERT [dbo].[Approval] ([Table_id], [TableName], [IsApprovalReqAdd], [IsApprovalReqEdit], [IsApprovalReqDelete], [FirstApprover], [SecondApprover], [DateCreated]) VALUES (15, N'CustomerTypes', 1, 1, 1, 11, 1, CAST(0x0000A4BC0120771F AS DateTime))
INSERT [dbo].[Approval] ([Table_id], [TableName], [IsApprovalReqAdd], [IsApprovalReqEdit], [IsApprovalReqDelete], [FirstApprover], [SecondApprover], [DateCreated]) VALUES (16, N'Employee', 1, 1, 1, 11, 1, CAST(0x0000A4BC01208596 AS DateTime))
INSERT [dbo].[Approval] ([Table_id], [TableName], [IsApprovalReqAdd], [IsApprovalReqEdit], [IsApprovalReqDelete], [FirstApprover], [SecondApprover], [DateCreated]) VALUES (17, N'EventsTbl', 1, 1, 1, 11, 1, CAST(0x0000A4BC012095C7 AS DateTime))
INSERT [dbo].[Approval] ([Table_id], [TableName], [IsApprovalReqAdd], [IsApprovalReqEdit], [IsApprovalReqDelete], [FirstApprover], [SecondApprover], [DateCreated]) VALUES (18, N'Gadgets', 1, 1, 1, 11, 1, CAST(0x0000A4BC00C9A0DF AS DateTime))
INSERT [dbo].[Approval] ([Table_id], [TableName], [IsApprovalReqAdd], [IsApprovalReqEdit], [IsApprovalReqDelete], [FirstApprover], [SecondApprover], [DateCreated]) VALUES (19, N'GeneralSettings', 1, 1, 1, 11, 1, CAST(0x0000A4BC011F3A76 AS DateTime))
INSERT [dbo].[Approval] ([Table_id], [TableName], [IsApprovalReqAdd], [IsApprovalReqEdit], [IsApprovalReqDelete], [FirstApprover], [SecondApprover], [DateCreated]) VALUES (20, N'Loyalty_Program', 1, 1, 1, 11, 1, CAST(0x0000A4BC011F54B1 AS DateTime))
INSERT [dbo].[Approval] ([Table_id], [TableName], [IsApprovalReqAdd], [IsApprovalReqEdit], [IsApprovalReqDelete], [FirstApprover], [SecondApprover], [DateCreated]) VALUES (21, N'Permissions', 1, 1, 1, 11, 1, CAST(0x0000A4BC011F6A62 AS DateTime))
INSERT [dbo].[Approval] ([Table_id], [TableName], [IsApprovalReqAdd], [IsApprovalReqEdit], [IsApprovalReqDelete], [FirstApprover], [SecondApprover], [DateCreated]) VALUES (22, N'ProductProperties', 1, 1, 1, 11, 1, CAST(0x0000A4BB00F7FE73 AS DateTime))
INSERT [dbo].[Approval] ([Table_id], [TableName], [IsApprovalReqAdd], [IsApprovalReqEdit], [IsApprovalReqDelete], [FirstApprover], [SecondApprover], [DateCreated]) VALUES (23, N'Products', 1, 1, 1, 11, 1, CAST(0x0000A4BB0117BB2E AS DateTime))
INSERT [dbo].[Approval] ([Table_id], [TableName], [IsApprovalReqAdd], [IsApprovalReqEdit], [IsApprovalReqDelete], [FirstApprover], [SecondApprover], [DateCreated]) VALUES (24, N'ProductTypes', 1, 1, 1, 11, 1, CAST(0x0000A4BB00BA0D48 AS DateTime))
INSERT [dbo].[Approval] ([Table_id], [TableName], [IsApprovalReqAdd], [IsApprovalReqEdit], [IsApprovalReqDelete], [FirstApprover], [SecondApprover], [DateCreated]) VALUES (25, N'Roles', 1, 1, 1, 11, 1, CAST(0x0000A4BC011EC793 AS DateTime))
INSERT [dbo].[Approval] ([Table_id], [TableName], [IsApprovalReqAdd], [IsApprovalReqEdit], [IsApprovalReqDelete], [FirstApprover], [SecondApprover], [DateCreated]) VALUES (26, N'Staff', 1, 1, 1, 11, 1, CAST(0x0000A4BC011EF569 AS DateTime))
INSERT [dbo].[Approval] ([Table_id], [TableName], [IsApprovalReqAdd], [IsApprovalReqEdit], [IsApprovalReqDelete], [FirstApprover], [SecondApprover], [DateCreated]) VALUES (27, N'Tierlevel', 1, 1, 1, 11, 1, CAST(0x0000A4BC011F0D7D AS DateTime))
INSERT [dbo].[Approval] ([Table_id], [TableName], [IsApprovalReqAdd], [IsApprovalReqEdit], [IsApprovalReqDelete], [FirstApprover], [SecondApprover], [DateCreated]) VALUES (28, N'Tierrule', 1, 1, 1, 11, 1, CAST(0x0000A4BC011F1F01 AS DateTime))
SET IDENTITY_INSERT [dbo].[Approval] OFF
/****** Object:  Table [dbo].[ActivityType]    Script Date: 11/30/2015 16:02:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivityType](
	[ActivityType_id] [bigint] IDENTITY(1,1) NOT NULL,
	[ActivityType_Name] [nvarchar](50) NULL,
	[ActivityType_Description] [nvarchar](50) NULL,
	[ActivityType_IsActive] [bit] NULL,
	[ActivityType_IsDeleted] [bit] NULL,
	[ActivityType_DateCreated] [datetime] NULL,
	[IsAddApproved] [bit] NULL,
	[IsDelApproved] [bit] NULL,
	[IsEditApproved] [bit] NULL,
 CONSTRAINT [PK_ActivityType] PRIMARY KEY CLUSTERED 
(
	[ActivityType_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ActivityType] ON
INSERT [dbo].[ActivityType] ([ActivityType_id], [ActivityType_Name], [ActivityType_Description], [ActivityType_IsActive], [ActivityType_IsDeleted], [ActivityType_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (1, N'ActivityType6', N'Activity Type 6', 1, 0, CAST(0x0000A4B3011F4C2E AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[ActivityType] ([ActivityType_id], [ActivityType_Name], [ActivityType_Description], [ActivityType_IsActive], [ActivityType_IsDeleted], [ActivityType_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (2, N'ActivityType2', N'Activity Type 2', 1, 0, CAST(0x0000A4B300F8FC51 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[ActivityType] ([ActivityType_id], [ActivityType_Name], [ActivityType_Description], [ActivityType_IsActive], [ActivityType_IsDeleted], [ActivityType_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (3, N'ActivityType3', N'Activity Type 3', 1, 0, CAST(0x0000A4B300F90AF8 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[ActivityType] ([ActivityType_id], [ActivityType_Name], [ActivityType_Description], [ActivityType_IsActive], [ActivityType_IsDeleted], [ActivityType_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (4, N'ActivityType4', N'Activity Type 4', 1, 0, CAST(0x0000A4B3011F498C AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[ActivityType] ([ActivityType_id], [ActivityType_Name], [ActivityType_Description], [ActivityType_IsActive], [ActivityType_IsDeleted], [ActivityType_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (5, N'ActivityType5', N'Activity Type 5', 1, 0, CAST(0x0000A4B3011F4A7A AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[ActivityType] ([ActivityType_id], [ActivityType_Name], [ActivityType_Description], [ActivityType_IsActive], [ActivityType_IsDeleted], [ActivityType_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (6, N'ActivityType1', N'Activity Type 1', 1, 0, CAST(0x0000A4B3011F4B5A AS DateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ActivityType] OFF
/****** Object:  Table [dbo].[Activity]    Script Date: 11/30/2015 16:02:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Activity](
	[Activity_id] [bigint] IDENTITY(1,1) NOT NULL,
	[ActivityType_id] [bigint] NULL,
	[Activity_Name] [nvarchar](50) NULL,
	[Activity_Description] [nvarchar](250) NULL,
	[Activity_IsActive] [bit] NULL,
	[Activity_IsDeleted] [bit] NULL,
	[Activity_DateCreated] [datetime] NULL,
	[IsAddApproved] [bit] NULL,
	[IsDelApproved] [bit] NULL,
	[IsEditApproved] [bit] NULL,
 CONSTRAINT [PK_Activity] PRIMARY KEY CLUSTERED 
(
	[Activity_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Activity] ON
INSERT [dbo].[Activity] ([Activity_id], [ActivityType_id], [Activity_Name], [Activity_Description], [Activity_IsActive], [Activity_IsDeleted], [Activity_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (1, 1, N'Activity 1', N'Activity 1 of ActivityType1', 1, 0, CAST(0x0000A4B3010A0C5D AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Activity] ([Activity_id], [ActivityType_id], [Activity_Name], [Activity_Description], [Activity_IsActive], [Activity_IsDeleted], [Activity_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (8, 2, N'Activity 2', N'sdsds sdsds dsds', 1, 0, CAST(0x0000A4B3010B9785 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Activity] ([Activity_id], [ActivityType_id], [Activity_Name], [Activity_Description], [Activity_IsActive], [Activity_IsDeleted], [Activity_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (9, 1, N'Activity 3', N'sdfd sdfsdf ssf', 1, 0, CAST(0x0000A4B3010E6DAD AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Activity] ([Activity_id], [ActivityType_id], [Activity_Name], [Activity_Description], [Activity_IsActive], [Activity_IsDeleted], [Activity_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (10, 1, N'Activity 4', N'sdsahdgs djsdjs jsdjs', 1, 0, CAST(0x0000A4B3010EE7B9 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Activity] ([Activity_id], [ActivityType_id], [Activity_Name], [Activity_Description], [Activity_IsActive], [Activity_IsDeleted], [Activity_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (11, 6, N'Activity 5', N'df dfdf dfjhdfj', 1, 0, CAST(0x0000A4B3011CD1D0 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Activity] ([Activity_id], [ActivityType_id], [Activity_Name], [Activity_Description], [Activity_IsActive], [Activity_IsDeleted], [Activity_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (12, 6, N'Activity 6', N'sd sdsd usdysd usdys', 1, 0, CAST(0x0000A4B3011F0C12 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Activity] ([Activity_id], [ActivityType_id], [Activity_Name], [Activity_Description], [Activity_IsActive], [Activity_IsDeleted], [Activity_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (13, 6, N'Activity 7', N'ds sjdsh jsdsjdhd', 1, 0, CAST(0x0000A4B3011F1C38 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Activity] ([Activity_id], [ActivityType_id], [Activity_Name], [Activity_Description], [Activity_IsActive], [Activity_IsDeleted], [Activity_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (14, 6, N'act1', N'ff dfdf fdfdf', 1, 0, CAST(0x0000A4B40114D2B6 AS DateTime), NULL, NULL, NULL)
INSERT [dbo].[Activity] ([Activity_id], [ActivityType_id], [Activity_Name], [Activity_Description], [Activity_IsActive], [Activity_IsDeleted], [Activity_DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved]) VALUES (15, 6, N'asdas', N'asasas', 1, 0, CAST(0x0000A4DE0131ED5F AS DateTime), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Activity] OFF
/****** Object:  Table [dbo].[ActionsTbl]    Script Date: 11/30/2015 16:02:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActionsTbl](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[Action_Name] [nvarchar](50) NULL,
	[Action_Description] [nvarchar](250) NULL,
	[Action_IsActive] [bit] NULL CONSTRAINT [DF_ActionsTbl_Action_IsActive]  DEFAULT ((1)),
	[Action_IsDeleted] [bit] NULL CONSTRAINT [DF_ActionsTbl_Action_IsDeleted]  DEFAULT ((0)),
	[DateCreated] [datetime] NULL,
	[IsAddApproved] [bit] NULL CONSTRAINT [DF_ActionsTbl_IsAddApproved]  DEFAULT ((0)),
	[IsDelApproved] [bit] NULL CONSTRAINT [DF_ActionsTbl_IsDelApproved]  DEFAULT ((0)),
	[IsEditApproved] [bit] NULL CONSTRAINT [DF_ActionsTbl_IsEditApproved]  DEFAULT ((0)),
	[exclusive] [bit] NULL,
	[conflicting_action] [bit] NULL,
	[actionitem_id] [bigint] NULL,
	[supplementary_action] [bit] NULL,
	[arithmetictype] [bit] NULL,
	[Action_IsSelected] [bit] NOT NULL CONSTRAINT [DF_ActionsTbl_Action_IsSelected]  DEFAULT ((0)),
 CONSTRAINT [PK_Actions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ActionsTbl] ON
INSERT [dbo].[ActionsTbl] ([id], [Action_Name], [Action_Description], [Action_IsActive], [Action_IsDeleted], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [exclusive], [conflicting_action], [actionitem_id], [supplementary_action], [arithmetictype], [Action_IsSelected]) VALUES (4, N'Discount(Stored)', N'sfsdfdf', 1, 0, CAST(0x0000A52B0152023F AS DateTime), NULL, NULL, NULL, 0, NULL, 2, 1, 1, 0)
INSERT [dbo].[ActionsTbl] ([id], [Action_Name], [Action_Description], [Action_IsActive], [Action_IsDeleted], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [exclusive], [conflicting_action], [actionitem_id], [supplementary_action], [arithmetictype], [Action_IsSelected]) VALUES (5, N'Reward Points', N'Reward Points', 1, 0, CAST(0x0000A52300CA9B0E AS DateTime), NULL, NULL, NULL, 0, NULL, 1, 1, 1, 0)
INSERT [dbo].[ActionsTbl] ([id], [Action_Name], [Action_Description], [Action_IsActive], [Action_IsDeleted], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [exclusive], [conflicting_action], [actionitem_id], [supplementary_action], [arithmetictype], [Action_IsSelected]) VALUES (6, N'Redeem Coupons', N'Redeem Coupons', 1, 0, CAST(0x0000A54601142F9F AS DateTime), NULL, NULL, NULL, 1, NULL, 3, 0, 1, 0)
INSERT [dbo].[ActionsTbl] ([id], [Action_Name], [Action_Description], [Action_IsActive], [Action_IsDeleted], [DateCreated], [IsAddApproved], [IsDelApproved], [IsEditApproved], [exclusive], [conflicting_action], [actionitem_id], [supplementary_action], [arithmetictype], [Action_IsSelected]) VALUES (7, N'Discount(Instant)', N'Discount', 1, 0, CAST(0x0000D71400C31D10 AS DateTime), NULL, NULL, NULL, 0, NULL, NULL, 1, NULL, 0)
SET IDENTITY_INSERT [dbo].[ActionsTbl] OFF
/****** Object:  Table [dbo].[actionitem]    Script Date: 11/30/2015 16:02:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[actionitem](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[actionitem_name] [varchar](255) NULL,
	[ref_value] [float] NULL,
	[IsActive] [bit] NULL CONSTRAINT [DF_actionitem_IsActive]  DEFAULT ((1)),
	[created] [datetime] NULL,
	[baseitem] [bit] NOT NULL CONSTRAINT [DF_actionitem_baseitem]  DEFAULT ((0)),
	[description] [varchar](50) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_actionitem] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[actionitem] ON
INSERT [dbo].[actionitem] ([id], [actionitem_name], [ref_value], [IsActive], [created], [baseitem], [description], [IsDeleted]) VALUES (1, N'Points', 1, 1, CAST(0x0000A52001405528 AS DateTime), 0, N'Default Reward Item', 0)
INSERT [dbo].[actionitem] ([id], [actionitem_name], [ref_value], [IsActive], [created], [baseitem], [description], [IsDeleted]) VALUES (2, N'Cash', 10, 1, CAST(0x0000A52F00B7A423 AS DateTime), 0, N'Redeem Cash from default item', 0)
INSERT [dbo].[actionitem] ([id], [actionitem_name], [ref_value], [IsActive], [created], [baseitem], [description], [IsDeleted]) VALUES (3, N'Coupons', 25, 1, CAST(0x0000A52F00B7A928 AS DateTime), 1, N'Redeem Coupons from default item', 0)
SET IDENTITY_INSERT [dbo].[actionitem] OFF
/****** Object:  Table [dbo].[AccoutingDocTypes]    Script Date: 11/30/2015 16:02:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AccoutingDocTypes](
	[Doc_Type_id] [bigint] IDENTITY(1,1) NOT NULL,
	[Doc_Type_Name] [varchar](20) NULL,
 CONSTRAINT [PK_AccoutingDocTypes] PRIMARY KEY CLUSTERED 
(
	[Doc_Type_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[AccoutingDocTypes] ON
INSERT [dbo].[AccoutingDocTypes] ([Doc_Type_id], [Doc_Type_Name]) VALUES (1, N'Sales Receipt')
INSERT [dbo].[AccoutingDocTypes] ([Doc_Type_id], [Doc_Type_Name]) VALUES (2, N'Credit Note')
INSERT [dbo].[AccoutingDocTypes] ([Doc_Type_id], [Doc_Type_Name]) VALUES (3, N'Debit Note')
INSERT [dbo].[AccoutingDocTypes] ([Doc_Type_id], [Doc_Type_Name]) VALUES (6, N'Misc Payment Voucher')
INSERT [dbo].[AccoutingDocTypes] ([Doc_Type_id], [Doc_Type_Name]) VALUES (7, N'Invoice')
INSERT [dbo].[AccoutingDocTypes] ([Doc_Type_id], [Doc_Type_Name]) VALUES (9, N'Misc voucher')
INSERT [dbo].[AccoutingDocTypes] ([Doc_Type_id], [Doc_Type_Name]) VALUES (10, N'Customer deposit')
SET IDENTITY_INSERT [dbo].[AccoutingDocTypes] OFF
/****** Object:  Table [dbo].[AccountType_Action]    Script Date: 11/30/2015 16:02:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountType_Action](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[AccTypeId] [bigint] NULL,
	[ActionId] [bigint] NULL,
 CONSTRAINT [PK_AccountType_Action] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AccountType_Action] ON
INSERT [dbo].[AccountType_Action] ([id], [AccTypeId], [ActionId]) VALUES (11, 1, 7)
INSERT [dbo].[AccountType_Action] ([id], [AccTypeId], [ActionId]) VALUES (12, 1, 6)
SET IDENTITY_INSERT [dbo].[AccountType_Action] OFF
/****** Object:  Table [dbo].[AccountType]    Script Date: 11/30/2015 16:02:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AccountType](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[AccType] [varchar](50) NULL,
	[AccDescription] [varchar](250) NULL,
	[AccIsDeleted] [bit] NULL,
	[AccDateCreated] [datetime] NULL,
 CONSTRAINT [PK_AccountType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[AccountType] ON
INSERT [dbo].[AccountType] ([id], [AccType], [AccDescription], [AccIsDeleted], [AccDateCreated]) VALUES (1, N'Bankika', N'Account for bankika customers', 0, CAST(0x0000A52501467212 AS DateTime))
SET IDENTITY_INSERT [dbo].[AccountType] OFF
/****** Object:  Table [dbo].[WeekDays]    Script Date: 11/30/2015 16:02:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WeekDays](
	[Day_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[WeekdayName] [nvarchar](10) NULL,
	[IsSelected] [bit] NOT NULL CONSTRAINT [DF_WeekDays_IsSelected]  DEFAULT ((0)),
 CONSTRAINT [PK_WeekDays] PRIMARY KEY CLUSTERED 
(
	[Day_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[WeekDays] ON
INSERT [dbo].[WeekDays] ([Day_Id], [WeekdayName], [IsSelected]) VALUES (1, N'Sunday', 0)
INSERT [dbo].[WeekDays] ([Day_Id], [WeekdayName], [IsSelected]) VALUES (2, N'Monday', 0)
INSERT [dbo].[WeekDays] ([Day_Id], [WeekdayName], [IsSelected]) VALUES (3, N'Tuesday', 0)
INSERT [dbo].[WeekDays] ([Day_Id], [WeekdayName], [IsSelected]) VALUES (4, N'Wednesday', 0)
INSERT [dbo].[WeekDays] ([Day_Id], [WeekdayName], [IsSelected]) VALUES (5, N'Thursday', 0)
INSERT [dbo].[WeekDays] ([Day_Id], [WeekdayName], [IsSelected]) VALUES (6, N'Friday', 0)
INSERT [dbo].[WeekDays] ([Day_Id], [WeekdayName], [IsSelected]) VALUES (7, N'Saturday', 0)
SET IDENTITY_INSERT [dbo].[WeekDays] OFF
/****** Object:  View [dbo].[VwVehicle_VehicleModel]    Script Date: 11/30/2015 16:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VwVehicle_VehicleModel]
AS
SELECT     dbo.Vehicle.Vehicle_Id, dbo.Vehicle.Vehicle_Make, dbo.Vehicle.VehicleIsActive, dbo.Vehicle.VehicleIsDeleted, dbo.Vehicle.VehicleDateCreated, 
                      dbo.VehicleModel.VehicleModel_Id, dbo.VehicleModel.VehicleModel_Name, dbo.VehicleModel.VehicleModelIsActive, dbo.VehicleModel.VehicleModelIsDeleted, 
                      dbo.VehicleModel.VehicleModelDateCreated, dbo.VehicleModel.VehicleId, dbo.VehicleModel.TankCapacity
FROM         dbo.Vehicle INNER JOIN
                      dbo.VehicleModel ON dbo.Vehicle.Vehicle_Id = dbo.VehicleModel.VehicleId
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[18] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Vehicle"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 183
               Right = 222
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "VehicleModel"
            Begin Extent = 
               Top = 6
               Left = 260
               Bottom = 188
               Right = 472
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwVehicle_VehicleModel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwVehicle_VehicleModel'
GO
/****** Object:  View [dbo].[VwTest]    Script Date: 11/30/2015 16:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VwTest]
AS
SELECT     dbo.PostpaidCustCreditLimits.*
FROM         dbo.PostpaidCustCreditLimits
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "PostpaidCustCreditLimits"
            Begin Extent = 
               Top = 6
               Left = 237
               Bottom = 193
               Right = 430
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwTest'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwTest'
GO
/****** Object:  View [dbo].[VwProducts_ProductTypes]    Script Date: 11/30/2015 16:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VwProducts_ProductTypes]
AS
SELECT     dbo.Products.Product_id, dbo.Products.Product_Name, dbo.Products.Product_Description, dbo.Products.Product_Type, dbo.Products.Product_Price, 
                      dbo.Products.Product_currency, dbo.Products.Product_IsActive, dbo.Products.Product_IsDeleted, dbo.Products.Product_DateCreated, 
                      dbo.ProductTypes.ProductType_id, dbo.ProductTypes.ProductType_Name, dbo.ProductTypes.ProductType_Description, dbo.ProductTypes.ProductType_IsActive, 
                      dbo.ProductTypes.ProductType_IsDeleted, dbo.ProductTypes.ProductType_DateCreated, dbo.Products.IsAddApproved, dbo.Products.IsDelApproved, 
                      dbo.Products.IsEditApproved, dbo.Products.IsDeletedFlag
FROM         dbo.Products INNER JOIN
                      dbo.ProductTypes ON dbo.Products.Product_Type = dbo.ProductTypes.ProductType_id
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -96
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Products"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 316
               Right = 232
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ProductTypes"
            Begin Extent = 
               Top = 6
               Left = 270
               Bottom = 186
               Right = 488
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1860
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwProducts_ProductTypes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwProducts_ProductTypes'
GO
/****** Object:  View [dbo].[VwProduct_ProductProperty]    Script Date: 11/30/2015 16:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VwProduct_ProductProperty]
AS
SELECT     dbo.ProductProperties.ProductProperty_id, dbo.ProductProperties.ProductProperty_Name, dbo.ProductProperties.ProductProperty_Description, 
                      dbo.ProductProperties.ProductProperty_DateCreated, dbo.ProductProperties.ProductProperty_IsActive, dbo.ProductProperties.ProductProperty_IsDeleted, 
                      dbo.ProductProperties.IsAddApproved, dbo.ProductProperties.IsDelApproved, dbo.ProductProperties.IsEditApproved, dbo.ProductProperties.IsDeletedFlag, 
                      dbo.ProductProperties.IsbeingDeleted, dbo.ProductProperties.IsbeingEdited, dbo.ProductProperties.IsbeingAdded, 
                      dbo.Lnk_Products_Properties.Lnk_Products_Properties_id, dbo.Lnk_Products_Properties.Product_id, dbo.Lnk_Products_Properties.Product_Property_id, 
                      dbo.Lnk_Products_Properties.Product_Property_DateCreated, dbo.Lnk_Products_Properties.IsActive, dbo.Lnk_Products_Properties.IsDeleted
FROM         dbo.Lnk_Products_Properties INNER JOIN
                      dbo.ProductProperties ON dbo.Lnk_Products_Properties.Product_Property_id = dbo.ProductProperties.ProductProperty_id
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[42] 4[20] 2[23] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Lnk_Products_Properties"
            Begin Extent = 
               Top = 26
               Left = 393
               Bottom = 190
               Right = 635
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ProductProperties"
            Begin Extent = 
               Top = 9
               Left = 35
               Bottom = 226
               Right = 271
            End
            DisplayFlags = 280
            TopColumn = 3
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 13
         Width = 284
         Width = 1500
         Width = 1875
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1680
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwProduct_ProductProperty'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwProduct_ProductProperty'
GO
/****** Object:  View [dbo].[VwPriceListProducts]    Script Date: 11/30/2015 16:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VwPriceListProducts]
AS
SELECT     dbo.Lnk_PriceList_Product.Product_id, dbo.Lnk_PriceList_Product.Price_List_id, dbo.Lnk_PriceList_Product.id, dbo.Lnk_PriceList_Product.Product_Price, 
                      dbo.Lnk_PriceList_Product.IsActive, dbo.Lnk_PriceList_Product.IsDeleted, dbo.Lnk_PriceList_Product.DateCreated, dbo.Products.Product_Name, 
                      dbo.Products.Product_Description, dbo.Products.Product_Price AS BuyingPrice, dbo.Products.Product_currency, dbo.Products.Product_Type
FROM         dbo.Lnk_PriceList_Product INNER JOIN
                      dbo.Products ON dbo.Lnk_PriceList_Product.Product_id = dbo.Products.Product_id
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Lnk_PriceList_Product"
            Begin Extent = 
               Top = 18
               Left = 65
               Bottom = 206
               Right = 225
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Products"
            Begin Extent = 
               Top = 18
               Left = 303
               Bottom = 220
               Right = 497
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwPriceListProducts'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwPriceListProducts'
GO
/****** Object:  View [dbo].[VwCustomerAccount]    Script Date: 11/30/2015 16:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VwCustomerAccount]
AS
SELECT     dbo.Customer_Account.AccountNumber, dbo.Customer_Account.Customer_id, dbo.Customer_Account.AccountType_id, dbo.Customer_Account.Mask_Type, 
                      dbo.Customer_Account.Mask, dbo.Customer_Account.CreditType, dbo.Customer_Account.IsDeleted, dbo.Customer_Account.DateCreated, 
                      dbo.Customer_Account.Balance, dbo.Customers.Customer_Name, dbo.AccountType.id, dbo.AccountType.AccType, dbo.Customer_Account.IsActive
FROM         dbo.Customer_Account INNER JOIN
                      dbo.Customers ON dbo.Customer_Account.Customer_id = dbo.Customers.Customer_id INNER JOIN
                      dbo.AccountType ON dbo.Customer_Account.AccountType_id = dbo.AccountType.id
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[57] 4[16] 2[9] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Customer_Account"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 202
               Right = 204
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "Customers"
            Begin Extent = 
               Top = 6
               Left = 242
               Bottom = 305
               Right = 444
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AccountType"
            Begin Extent = 
               Top = 6
               Left = 482
               Bottom = 125
               Right = 650
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwCustomerAccount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwCustomerAccount'
GO
/****** Object:  View [dbo].[VwCreditLimit]    Script Date: 11/30/2015 16:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VwCreditLimit]
AS
SELECT     dbo.Customers.Customer_Name, dbo.PostpaidCustCreditLimits.Credit_id, dbo.PostpaidCustCreditLimits.CreditLimit, 
                      dbo.PostpaidCustCreditLimits.CreditLimit_Expiration, dbo.PostpaidCustCreditLimits.DateCreated, dbo.PostpaidCustCreditLimits.IsActive, 
                      dbo.Customer_Account.CreditType, dbo.Customer_Account.Customer_id, dbo.PostpaidCustCreditLimits.Cust_id, dbo.Customers.Customer_id AS Expr1, 
                      dbo.Customer_Account.AccountNumber
FROM         dbo.Customers INNER JOIN
                      dbo.Customer_Account ON dbo.Customers.Customer_id = dbo.Customer_Account.Customer_id LEFT OUTER JOIN
                      dbo.PostpaidCustCreditLimits ON dbo.Customer_Account.Customer_id = dbo.PostpaidCustCreditLimits.Cust_id Where dbo.Customer_Account.CreditType=1
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[9] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Customers"
            Begin Extent = 
               Top = 6
               Left = 473
               Bottom = 125
               Right = 675
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Customer_Account"
            Begin Extent = 
               Top = 6
               Left = 269
               Bottom = 220
               Right = 435
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PostpaidCustCreditLimits"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 167
               Right = 231
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwCreditLimit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwCreditLimit'
GO
/****** Object:  View [dbo].[VwChannels_ChannelTypes]    Script Date: 11/30/2015 16:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VwChannels_ChannelTypes]
AS
SELECT     dbo.ChannelTypes.ChannelType_id, dbo.ChannelTypes.ChannelType_Name, dbo.ChannelTypes.ChannelType_Description, dbo.ChannelTypes.ChannelType_IsActive, 
                      dbo.ChannelTypes.ChannelType_IsDeleted, dbo.ChannelTypes.ChannelType_DateCreated, dbo.Channels.Channel_id, dbo.Channels.Channel_Name, 
                      dbo.Channels.Channel_Description, dbo.Channels.Channel_Type, dbo.Channels.Channel_Country, dbo.Channels.Channel_Address, dbo.Channels.Channel_City, 
                      dbo.Channels.Channel_IsDeleted, dbo.Channels.Channel_IsActive, dbo.Channels.Channel_DateCreated, dbo.Channels.Channel_IsSelected, 
                      dbo.Channels.IsAddApproved, dbo.Channels.IsDelApproved, dbo.Channels.IsEditApproved, dbo.Channels.IsDeletedFlag
FROM         dbo.Channels INNER JOIN
                      dbo.ChannelTypes ON dbo.Channels.Channel_Type = dbo.ChannelTypes.ChannelType_id
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[57] 4[4] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Channels"
            Begin Extent = 
               Top = 10
               Left = 286
               Bottom = 310
               Right = 482
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ChannelTypes"
            Begin Extent = 
               Top = 7
               Left = 8
               Bottom = 260
               Right = 228
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 2370
         Width = 2385
         Width = 1965
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwChannels_ChannelTypes'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwChannels_ChannelTypes'
GO
/****** Object:  View [dbo].[VwChannelProductSchedule]    Script Date: 11/30/2015 16:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VwChannelProductSchedule]
AS
SELECT     dbo.Lnk_Products_Channels.Lnk_Products_Channels_id, dbo.Lnk_Products_Channels.Product_id, dbo.Lnk_Products_Channels.Channel_id, 
                      dbo.Lnk_Products_Channels.Product_Price, dbo.Lnk_Products_Channels.Product_currency, dbo.Lnk_Products_Channels.Product_IsActive, 
                      dbo.Lnk_Products_Channels.Product_IsDeleted, dbo.Lnk_Products_Channels.Product_DateCreated, dbo.Lnk_Products_Channels.PriceSchedule_Id, 
                      dbo.Lnk_Products_Channels.Scheduled_Price, dbo.Products.Product_Name, dbo.Channels.Channel_Name, dbo.Schedule.Schedule_Name, 
                      dbo.Schedule.Effective_Date, dbo.Schedule.Schedule_IsActive, dbo.Schedule.Schedule_IsDeleted, dbo.Schedule.Schedule_DateCreated
FROM         dbo.Lnk_Products_Channels INNER JOIN
                      dbo.Products ON dbo.Lnk_Products_Channels.Product_id = dbo.Products.Product_id INNER JOIN
                      dbo.Channels ON dbo.Lnk_Products_Channels.Channel_id = dbo.Channels.Channel_id INNER JOIN
                      dbo.Schedule ON dbo.Lnk_Products_Channels.PriceSchedule_Id = dbo.Schedule.Schedule_Id
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[64] 4[11] 2[7] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Channels"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 310
               Right = 234
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Products"
            Begin Extent = 
               Top = 6
               Left = 272
               Bottom = 310
               Right = 466
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Schedule"
            Begin Extent = 
               Top = 6
               Left = 504
               Bottom = 162
               Right = 704
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Lnk_Products_Channels"
            Begin Extent = 
               Top = 162
               Left = 504
               Bottom = 351
               Right = 721
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwChannelProductSchedule'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwChannelProductSchedule'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwChannelProductSchedule'
GO
/****** Object:  View [dbo].[VwChannelProducts]    Script Date: 11/30/2015 16:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VwChannelProducts]
AS
SELECT     dbo.Channels.Channel_Name, dbo.Products.Product_Name, dbo.Lnk_Products_Channels.Product_Price, dbo.Lnk_Products_Channels.Product_currency, 
                      dbo.Lnk_Products_Channels.Product_IsActive, dbo.Lnk_Products_Channels.Product_IsDeleted, dbo.Lnk_Products_Channels.Product_DateCreated, 
                      dbo.Lnk_Products_Channels.Lnk_Products_Channels_id, dbo.Lnk_Products_Channels.Product_id, dbo.Lnk_Products_Channels.Channel_id, 
                      dbo.Lnk_Products_Channels.PriceSchedule_Id, dbo.Lnk_Products_Channels.Scheduled_Price, dbo.Lnk_Products_Channels.Price_List_id, dbo.Products.Product_Type, 
                      dbo.Products.Product_Description
FROM         dbo.Channels INNER JOIN
                      dbo.Lnk_Products_Channels ON dbo.Channels.Channel_id = dbo.Lnk_Products_Channels.Channel_id INNER JOIN
                      dbo.Products ON dbo.Lnk_Products_Channels.Product_id = dbo.Products.Product_id
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[45] 4[10] 2[22] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Channels"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 234
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Lnk_Products_Channels"
            Begin Extent = 
               Top = 6
               Left = 272
               Bottom = 235
               Right = 489
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Products"
            Begin Extent = 
               Top = 92
               Left = 550
               Bottom = 331
               Right = 744
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 17
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwChannelProducts'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwChannelProducts'
GO
/****** Object:  View [dbo].[VwChannelGadgets]    Script Date: 11/30/2015 16:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VwChannelGadgets]
AS
SELECT     dbo.Channels.Channel_id, dbo.Gadgets.Gadget_id, dbo.Gadgets.Gadget_Name, dbo.Channels.Channel_Name, dbo.Lnk_Gadgets_Channels.Lnk_Gadget_IsActive, 
                      dbo.Lnk_Gadgets_Channels.Lnk_Gadget_IsDeleted, dbo.Lnk_Gadgets_Channels.Lnk_Gadget_DateCreated, 
                      dbo.Lnk_Gadgets_Channels.Lnk_Gadgets_Channels_id
FROM         dbo.Channels INNER JOIN
                      dbo.Lnk_Gadgets_Channels ON dbo.Channels.Channel_id = dbo.Lnk_Gadgets_Channels.Channel_id INNER JOIN
                      dbo.Gadgets ON dbo.Lnk_Gadgets_Channels.Gadget_id = dbo.Gadgets.Gadget_id
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Channels"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 234
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Gadgets"
            Begin Extent = 
               Top = 6
               Left = 272
               Bottom = 125
               Right = 464
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Lnk_Gadgets_Channels"
            Begin Extent = 
               Top = 126
               Left = 38
               Bottom = 299
               Right = 253
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwChannelGadgets'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwChannelGadgets'
GO
/****** Object:  View [dbo].[VwCardUsageLimit_Products]    Script Date: 11/30/2015 16:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VwCardUsageLimit_Products]
AS
SELECT     dbo.Products.Product_Name, dbo.CardUsageLimit.Card_UsageLimit_id, dbo.CardUsageLimit.Card_UsageLimit_Card_id, 
                      dbo.CardUsageLimit.Card_UsageLimit_Product_id, dbo.CardUsageLimit.Card_UsageLimit_Value, dbo.CardUsageLimit.Card_UsageLimit_DateCreated, 
                      dbo.CardUsageLimit.Card_UsageLimit_Type, dbo.CardUsageLimit.Card_UsageLimit_IsOverall, dbo.CardUsageLimit.Card_UsageLimit_IsActive, 
                      dbo.CardUsageLimit.Card_UsageLimit_IsDeleted, dbo.TimeDuration.Value, dbo.TimeDuration.TimeDuration_id
FROM         dbo.CardUsageLimit LEFT OUTER JOIN
                      dbo.Products ON dbo.CardUsageLimit.Card_UsageLimit_Product_id = dbo.Products.Product_id INNER JOIN
                      dbo.TimeDuration ON dbo.CardUsageLimit.Card_UsageLimit_Type = dbo.TimeDuration.TimeDuration_id
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[37] 4[26] 2[17] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "CardUsageLimit"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 188
               Right = 275
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Products"
            Begin Extent = 
               Top = 6
               Left = 313
               Bottom = 196
               Right = 507
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "TimeDuration"
            Begin Extent = 
               Top = 6
               Left = 545
               Bottom = 137
               Right = 711
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 14
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwCardUsageLimit_Products'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwCardUsageLimit_Products'
GO
/****** Object:  View [dbo].[VwCardsCustomers]    Script Date: 11/30/2015 16:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VwCardsCustomers]
AS
SELECT     dbo.Customers.Customer_id, dbo.Customers.Customer_Name, dbo.Customers.Customer_OtherName, dbo.Customers.Customer_DoB, 
                      dbo.Customers.Customer_Gender, dbo.Customers.Customer_Email, dbo.Customers.Customer_Password, dbo.Customers.Customer_Phone, 
                      dbo.Customers.Customer_Country, dbo.Customers.Customer_Role, dbo.Customers.IsActive, dbo.Customers.IsDeleted, dbo.Customers.IsVerificationMailSent, 
                      dbo.Customers.IsVerified, dbo.Customers.VerificationMailDate, dbo.Customers.PasswordResetLnkDate, dbo.Customers.DateCreated, dbo.Cards.Card_id, 
                      dbo.Cards.Card_UID, dbo.Cards.Card_SNO, dbo.Cards.Card_Type, dbo.Cards.Card_Owner, dbo.Cards.Card_Owner_Employee, dbo.Cards.Card_Balance, 
                      dbo.Cards.Card_Points_Balance, dbo.Cards.Card_OverDraftValue, dbo.Cards.Card_PrepaidAmt, dbo.Cards.Card_IsAssigned, dbo.Cards.Card_IsActive, 
                      dbo.Cards.Card_IsDeleted, dbo.Cards.Card_DateAssigned, dbo.Cards.Card_UploadDate, dbo.Cards.Card_UpdateDate, dbo.Cards.Card_PIN, 
                      dbo.Cards.Card_IsAssignedtoEmp
FROM         dbo.Cards LEFT OUTER JOIN
                      dbo.Customers ON dbo.Cards.Card_Owner = dbo.Customers.Customer_id
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[9] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Cards"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 198
               Right = 240
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Customers"
            Begin Extent = 
               Top = 6
               Left = 278
               Bottom = 226
               Right = 480
            End
            DisplayFlags = 280
            TopColumn = 7
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 34
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1995
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
   ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwCardsCustomers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'      Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwCardsCustomers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwCardsCustomers'
GO
/****** Object:  View [dbo].[VwActivity_ActivityType]    Script Date: 11/30/2015 16:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VwActivity_ActivityType]
AS
SELECT     dbo.ActivityType.ActivityType_id AS Expr1, dbo.ActivityType.ActivityType_Name, dbo.ActivityType.ActivityType_Description, dbo.ActivityType.ActivityType_IsActive, 
                      dbo.ActivityType.ActivityType_IsDeleted, dbo.ActivityType.ActivityType_DateCreated, dbo.Activity.Activity_Name, dbo.Activity.Activity_Description, 
                      dbo.Activity.Activity_IsActive, dbo.Activity.Activity_IsDeleted, dbo.Activity.Activity_DateCreated, dbo.Activity.Activity_id
FROM         dbo.Activity INNER JOIN
                      dbo.ActivityType ON dbo.Activity.ActivityType_id = dbo.ActivityType.ActivityType_id
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Activity"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 185
               Right = 231
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ActivityType"
            Begin Extent = 
               Top = 6
               Left = 269
               Bottom = 181
               Right = 486
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwActivity_ActivityType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwActivity_ActivityType'
GO
/****** Object:  View [dbo].[VwAccUsageLimit_Products]    Script Date: 11/30/2015 16:02:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VwAccUsageLimit_Products]
AS
SELECT     dbo.Customer_AccountUsageLimit.UsageLimit_Product_id, dbo.TimeDuration.TimeDuration_id, dbo.Customer_AccountUsageLimit.UsageLimit_id, 
                      dbo.Customer_AccountUsageLimit.UsageLimit_AccountNumber, dbo.Customer_AccountUsageLimit.UsageLimit_Value, 
                      dbo.Customer_AccountUsageLimit.UsageLimit_DateCreated, dbo.Customer_AccountUsageLimit.UsageLimit_Type, 
                      dbo.Customer_AccountUsageLimit.UsageLimit_IsOverall, dbo.Customer_AccountUsageLimit.UsageLimit_IsActive, 
                      dbo.Customer_AccountUsageLimit.UsageLimit_IsDeleted, dbo.Products.Product_id, dbo.Products.Product_Name, dbo.Products.Product_Description, 
                      dbo.Products.Product_Type, dbo.Products.Product_Price, dbo.Products.Product_currency, dbo.Products.Product_IsActive, dbo.Products.Product_IsDeleted, 
                      dbo.Products.Product_DateCreated, dbo.TimeDuration.Value, dbo.TimeDuration.Type
FROM         dbo.Customer_AccountUsageLimit LEFT JOIN
                      dbo.Products ON dbo.Customer_AccountUsageLimit.UsageLimit_Product_id = dbo.Products.Product_id INNER JOIN
                      dbo.TimeDuration ON dbo.Customer_AccountUsageLimit.UsageLimit_Type = dbo.TimeDuration.TimeDuration_id
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[13] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Customer_AccountUsageLimit"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 208
               Right = 260
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Products"
            Begin Extent = 
               Top = 6
               Left = 298
               Bottom = 216
               Right = 492
            End
            DisplayFlags = 280
            TopColumn = 6
         End
         Begin Table = "TimeDuration"
            Begin Extent = 
               Top = 6
               Left = 530
               Bottom = 176
               Right = 696
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwAccUsageLimit_Products'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VwAccUsageLimit_Products'
GO
