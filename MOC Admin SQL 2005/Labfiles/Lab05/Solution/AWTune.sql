use [AdventureWorks]
go

IF EXISTS (SELECT name FROM sys.indexes WHERE name = N'IX_Employee_AddressID' and object_id = object_id(N'[HumanResources].[Employee]') )
DROP INDEX [IX_Employee_AddressID] ON [HumanResources].[Employee] WITH ( ONLINE = OFF )
go

IF EXISTS (SELECT name FROM sys.indexes WHERE name = N'IX_Employee_ManagerID' and object_id = object_id(N'[HumanResources].[Employee]') )
DROP INDEX [IX_Employee_ManagerID] ON [HumanResources].[Employee] WITH ( ONLINE = OFF )
go

IF EXISTS (SELECT name FROM sys.indexes WHERE name = N'IX_Employee_ShiftID' and object_id = object_id(N'[HumanResources].[Employee]') )
DROP INDEX [IX_Employee_ShiftID] ON [HumanResources].[Employee] WITH ( ONLINE = OFF )
go

CREATE NONCLUSTERED INDEX [_dta_index_Employee_8_709577566__K10_K1_4_6_8_9987] ON [HumanResources].[Employee] 
(
	[AddressID] ASC,
	[EmployeeID] ASC
)
INCLUDE ( [LoginID],
[ManagerID],
[Title]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = ON) ON [PRIMARY]
go

IF EXISTS (SELECT name FROM sys.indexes WHERE name = N'IX_EmployeeDepartmentHistory_DepartmentID' and object_id = object_id(N'[HumanResources].[EmployeeDepartmentHistory]') )
DROP INDEX [IX_EmployeeDepartmentHistory_DepartmentID] ON [HumanResources].[EmployeeDepartmentHistory] WITH ( ONLINE = OFF )
go

IF EXISTS (SELECT name FROM sys.indexes WHERE name = N'IX_JobCandidate_EmployeeID' and object_id = object_id(N'[HumanResources].[JobCandidate]') )
DROP INDEX [IX_JobCandidate_EmployeeID] ON [HumanResources].[JobCandidate] WITH ( ONLINE = OFF )
go

IF EXISTS (SELECT name FROM sys.indexes WHERE name = N'IX_Address_StateProvinceID' and object_id = object_id(N'[Person].[Address]') )
DROP INDEX [IX_Address_StateProvinceID] ON [Person].[Address] WITH ( ONLINE = OFF )
go

IF EXISTS (SELECT name FROM sys.indexes WHERE name = N'IX_City' and object_id = object_id(N'[Person].[Address]') )
DROP INDEX [IX_City] ON [Person].[Address] WITH ( ONLINE = OFF )
go

IF EXISTS (SELECT name FROM sys.indexes WHERE name = N'IX_State_Address' and object_id = object_id(N'[Person].[Address]') )
DROP INDEX [IX_State_Address] ON [Person].[Address] WITH ( ONLINE = OFF )
go

CREATE NONCLUSTERED INDEX [_dta_index_Address_8_2089058478__K1_2_3_4_4364] ON [Person].[Address] 
(
	[AddressID] ASC
)
INCLUDE ( [AddressLine1],
[AddressLine2],
[City]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = ON) ON [PRIMARY]
go

CREATE NONCLUSTERED INDEX [_dta_index_Address_8_2089058478__K4_1_2_3] ON [Person].[Address] 
(
	[City] ASC
)
INCLUDE ( [AddressID],
[AddressLine1],
[AddressLine2]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = ON) ON [PRIMARY]
go

CREATE NONCLUSTERED INDEX [_dta_index_Address_8_2089058478__K6_2_3] ON [Person].[Address] 
(
	[PostalCode] ASC
)
INCLUDE ( [AddressLine1],
[AddressLine2]) WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = ON) ON [PRIMARY]
go

IF EXISTS (SELECT name FROM sys.indexes WHERE name = N'IX_BillOfMaterials_UnitMeasureCode' and object_id = object_id(N'[Production].[BillOfMaterials]') )
DROP INDEX [IX_BillOfMaterials_UnitMeasureCode] ON [Production].[BillOfMaterials] WITH ( ONLINE = OFF )
go

IF EXISTS (SELECT name FROM sys.indexes WHERE name = N'IX_ProductInventory_ProductID' and object_id = object_id(N'[Production].[ProductInventory]') )
DROP INDEX [IX_ProductInventory_ProductID] ON [Production].[ProductInventory] WITH ( ONLINE = OFF )
go

IF EXISTS (SELECT name FROM sys.indexes WHERE name = N'IX_ProductReview_ProductID_Name' and object_id = object_id(N'[Production].[ProductReview]') )
DROP INDEX [IX_ProductReview_ProductID_Name] ON [Production].[ProductReview] WITH ( ONLINE = OFF )
go

IF EXISTS (SELECT name FROM sys.indexes WHERE name = N'IX_TransactionHistory_ProductID' and object_id = object_id(N'[Production].[TransactionHistory]') )
DROP INDEX [IX_TransactionHistory_ProductID] ON [Production].[TransactionHistory] WITH ( ONLINE = OFF )
go

IF EXISTS (SELECT name FROM sys.indexes WHERE name = N'IX_TransactionHistory_ReferenceOrderID_ReferenceOrderLineNumber' and object_id = object_id(N'[Production].[TransactionHistory]') )
DROP INDEX [IX_TransactionHistory_ReferenceOrderID_ReferenceOrderLineNumber] ON [Production].[TransactionHistory] WITH ( ONLINE = OFF )
go

IF EXISTS (SELECT name FROM sys.indexes WHERE name = N'IX_TransactionHistoryArchive_ProductID' and object_id = object_id(N'[Production].[TransactionHistoryArchive]') )
DROP INDEX [IX_TransactionHistoryArchive_ProductID] ON [Production].[TransactionHistoryArchive] WITH ( ONLINE = OFF )
go

IF EXISTS (SELECT name FROM sys.indexes WHERE name = N'IX_TransactionHistoryArchive_ReferenceOrderID_ReferenceOrderLineNumber' and object_id = object_id(N'[Production].[TransactionHistoryArchive]') )
DROP INDEX [IX_TransactionHistoryArchive_ReferenceOrderID_ReferenceOrderLineNumber] ON [Production].[TransactionHistoryArchive] WITH ( ONLINE = OFF )
go

IF EXISTS (SELECT name FROM sys.indexes WHERE name = N'IX_WorkOrder_ProductID' and object_id = object_id(N'[Production].[WorkOrder]') )
DROP INDEX [IX_WorkOrder_ProductID] ON [Production].[WorkOrder] WITH ( ONLINE = OFF )
go

IF EXISTS (SELECT name FROM sys.indexes WHERE name = N'IX_WorkOrder_ScrapReasonID' and object_id = object_id(N'[Production].[WorkOrder]') )
DROP INDEX [IX_WorkOrder_ScrapReasonID] ON [Production].[WorkOrder] WITH ( ONLINE = OFF )
go

IF EXISTS (SELECT name FROM sys.indexes WHERE name = N'IX_WorkOrderRouting_ProductID' and object_id = object_id(N'[Production].[WorkOrderRouting]') )
DROP INDEX [IX_WorkOrderRouting_ProductID] ON [Production].[WorkOrderRouting] WITH ( ONLINE = OFF )
go

IF EXISTS (SELECT name FROM sys.indexes WHERE name = N'IX_ProductVendor_UnitMeasureCode' and object_id = object_id(N'[Purchasing].[ProductVendor]') )
DROP INDEX [IX_ProductVendor_UnitMeasureCode] ON [Purchasing].[ProductVendor] WITH ( ONLINE = OFF )
go

IF EXISTS (SELECT name FROM sys.indexes WHERE name = N'IX_ProductVendor_VendorID' and object_id = object_id(N'[Purchasing].[ProductVendor]') )
DROP INDEX [IX_ProductVendor_VendorID] ON [Purchasing].[ProductVendor] WITH ( ONLINE = OFF )
go

IF EXISTS (SELECT name FROM sys.indexes WHERE name = N'IX_PurchaseOrderDetail_ProductID' and object_id = object_id(N'[Purchasing].[PurchaseOrderDetail]') )
DROP INDEX [IX_PurchaseOrderDetail_ProductID] ON [Purchasing].[PurchaseOrderDetail] WITH ( ONLINE = OFF )
go

IF EXISTS (SELECT name FROM sys.indexes WHERE name = N'IX_PurchaseOrderHeader_EmployeeID' and object_id = object_id(N'[Purchasing].[PurchaseOrderHeader]') )
DROP INDEX [IX_PurchaseOrderHeader_EmployeeID] ON [Purchasing].[PurchaseOrderHeader] WITH ( ONLINE = OFF )
go

IF EXISTS (SELECT name FROM sys.indexes WHERE name = N'IX_PurchaseOrderHeader_VendorID' and object_id = object_id(N'[Purchasing].[PurchaseOrderHeader]') )
DROP INDEX [IX_PurchaseOrderHeader_VendorID] ON [Purchasing].[PurchaseOrderHeader] WITH ( ONLINE = OFF )
go

IF EXISTS (SELECT name FROM sys.indexes WHERE name = N'IX_VendorAddress_AddressID' and object_id = object_id(N'[Purchasing].[VendorAddress]') )
DROP INDEX [IX_VendorAddress_AddressID] ON [Purchasing].[VendorAddress] WITH ( ONLINE = OFF )
go

IF EXISTS (SELECT name FROM sys.indexes WHERE name = N'IX_VendorContact_ContactID' and object_id = object_id(N'[Purchasing].[VendorContact]') )
DROP INDEX [IX_VendorContact_ContactID] ON [Purchasing].[VendorContact] WITH ( ONLINE = OFF )
go

IF EXISTS (SELECT name FROM sys.indexes WHERE name = N'IX_VendorContact_ContactTypeID' and object_id = object_id(N'[Purchasing].[VendorContact]') )
DROP INDEX [IX_VendorContact_ContactTypeID] ON [Purchasing].[VendorContact] WITH ( ONLINE = OFF )
go

IF EXISTS (SELECT name FROM sys.indexes WHERE name = N'IX_CountryCurrency_CurrencyCode' and object_id = object_id(N'[Sales].[CountryCurrency]') )
DROP INDEX [IX_CountryCurrency_CurrencyCode] ON [Sales].[CountryCurrency] WITH ( ONLINE = OFF )
go

IF EXISTS (SELECT name FROM sys.indexes WHERE name = N'IX_Customer_SalesPersonID' and object_id = object_id(N'[Sales].[Customer]') )
DROP INDEX [IX_Customer_SalesPersonID] ON [Sales].[Customer] WITH ( ONLINE = OFF )
go

IF EXISTS (SELECT name FROM sys.indexes WHERE name = N'IX_Customer_TerritoryID' and object_id = object_id(N'[Sales].[Customer]') )
DROP INDEX [IX_Customer_TerritoryID] ON [Sales].[Customer] WITH ( ONLINE = OFF )
go

IF EXISTS (SELECT name FROM sys.indexes WHERE name = N'IX_SalesOrderDetail_ProductID' and object_id = object_id(N'[Sales].[SalesOrderDetail]') )
DROP INDEX [IX_SalesOrderDetail_ProductID] ON [Sales].[SalesOrderDetail] WITH ( ONLINE = OFF )
go

IF EXISTS (SELECT name FROM sys.indexes WHERE name = N'IX_SalesOrderHeader_CustomerID' and object_id = object_id(N'[Sales].[SalesOrderHeader]') )
DROP INDEX [IX_SalesOrderHeader_CustomerID] ON [Sales].[SalesOrderHeader] WITH ( ONLINE = OFF )
go

IF EXISTS (SELECT name FROM sys.indexes WHERE name = N'IX_SalesOrderHeader_SalesPersonID' and object_id = object_id(N'[Sales].[SalesOrderHeader]') )
DROP INDEX [IX_SalesOrderHeader_SalesPersonID] ON [Sales].[SalesOrderHeader] WITH ( ONLINE = OFF )
go

IF EXISTS (SELECT name FROM sys.indexes WHERE name = N'IX_ShoppingCartItem_ShoppingCartID_ProductID' and object_id = object_id(N'[Sales].[ShoppingCartItem]') )
DROP INDEX [IX_ShoppingCartItem_ShoppingCartID_ProductID] ON [Sales].[ShoppingCartItem] WITH ( ONLINE = OFF )
go

IF EXISTS (SELECT name FROM sys.indexes WHERE name = N'IX_SpecialOfferProduct_ProductID' and object_id = object_id(N'[Sales].[SpecialOfferProduct]') )
DROP INDEX [IX_SpecialOfferProduct_ProductID] ON [Sales].[SpecialOfferProduct] WITH ( ONLINE = OFF )
go

IF EXISTS (SELECT name FROM sys.indexes WHERE name = N'IX_StoreContact_ContactID' and object_id = object_id(N'[Sales].[StoreContact]') )
DROP INDEX [IX_StoreContact_ContactID] ON [Sales].[StoreContact] WITH ( ONLINE = OFF )
go

IF EXISTS (SELECT name FROM sys.indexes WHERE name = N'IX_StoreContact_ContactTypeID' and object_id = object_id(N'[Sales].[StoreContact]') )
DROP INDEX [IX_StoreContact_ContactTypeID] ON [Sales].[StoreContact] WITH ( ONLINE = OFF )
go

IF EXISTS (SELECT name FROM sys.indexes WHERE name = N'IX_vProductAndDescription' and object_id = object_id(N'[Production].[vProductAndDescription]') )
DROP INDEX [IX_vProductAndDescription] ON [Production].[vProductAndDescription] WITH ( ONLINE = OFF )
go

