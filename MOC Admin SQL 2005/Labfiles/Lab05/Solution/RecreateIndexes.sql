USE [AdventureWorks]
GO

-- ******************************************************
-- Rebuild Indexes
-- ******************************************************
CREATE INDEX [IX_Address_StateProvinceID] ON [Person].[Address]([StateProvinceID]) ON [PRIMARY] ;

CREATE INDEX [IX_BillOfMaterials_UnitMeasureCode] ON [Production].[BillOfMaterials]([UnitMeasureCode]) ON [PRIMARY] ;
CREATE INDEX [IX_CountryCurrency_CurrencyCode] ON [Sales].[CountryCurrency]([CurrencyCode]) ON [PRIMARY] ;

CREATE INDEX [IX_Customer_TerritoryID] ON [Sales].[Customer]([TerritoryID]) ON [PRIMARY] ;
CREATE INDEX [IX_Customer_SalesPersonID] ON [Sales].[Customer]([SalesPersonID]) ON [PRIMARY] ;

CREATE INDEX [IX_Employee_ShiftID] ON [HumanResources].[Employee]([ShiftID]) ON [PRIMARY] ;
CREATE INDEX [IX_Employee_AddressID] ON [HumanResources].[Employee]([AddressID]) ON [PRIMARY] ;
CREATE INDEX [IX_Employee_ManagerID] ON [HumanResources].[Employee]([ManagerID]) ON [PRIMARY] ;

CREATE INDEX [IX_EmployeeDepartmentHistory_DepartmentID] ON [HumanResources].[EmployeeDepartmentHistory]([DepartmentID]) ON [PRIMARY] ;

CREATE INDEX [IX_JobCandidate_EmployeeID] ON [HumanResources].[JobCandidate]([EmployeeID]) ON [PRIMARY] ;

CREATE INDEX [IX_ProductInventory_ProductID] ON [Production].[ProductInventory]([ProductID]) ON [PRIMARY] ;

CREATE NONCLUSTERED INDEX [IX_ProductReview_ProductID_Name] ON [Production].[ProductReview]([ProductID], [ReviewerName]) INCLUDE ([Comments]) ON [PRIMARY] ;

CREATE INDEX [IX_ProductVendor_UnitMeasureCode] ON [Purchasing].[ProductVendor]([UnitMeasureCode]) ON [PRIMARY] ;
CREATE INDEX [IX_ProductVendor_VendorID] ON [Purchasing].[ProductVendor]([VendorID]) ON [PRIMARY] ;

CREATE INDEX [IX_PurchaseOrderDetail_ProductID] ON [Purchasing].[PurchaseOrderDetail]([ProductID]) ON [PRIMARY] ;

CREATE INDEX [IX_PurchaseOrderHeader_VendorID] ON [Purchasing].[PurchaseOrderHeader]([VendorID]) ON [PRIMARY] ;
CREATE INDEX [IX_PurchaseOrderHeader_EmployeeID] ON [Purchasing].[PurchaseOrderHeader]([EmployeeID]) ON [PRIMARY] ;

CREATE INDEX [IX_SalesOrderDetail_ProductID] ON [Sales].[SalesOrderDetail]([ProductID]) ON [PRIMARY] ;

CREATE INDEX [IX_SalesOrderHeader_CustomerID] ON [Sales].[SalesOrderHeader]([CustomerID]) ON [PRIMARY] ;
CREATE INDEX [IX_SalesOrderHeader_SalesPersonID] ON [Sales].[SalesOrderHeader]([SalesPersonID]) ON [PRIMARY] ;

CREATE INDEX [IX_ShoppingCartItem_ShoppingCartID_ProductID] ON [Sales].[ShoppingCartItem]([ShoppingCartID], [ProductID]) ON [PRIMARY] ;

CREATE INDEX [IX_SpecialOfferProduct_ProductID] ON [Sales].[SpecialOfferProduct]([ProductID]) ON [PRIMARY] ;

CREATE INDEX [IX_StoreContact_ContactID] ON [Sales].[StoreContact]([ContactID]) ON [PRIMARY] ;
CREATE INDEX [IX_StoreContact_ContactTypeID] ON [Sales].[StoreContact]([ContactTypeID]) ON [PRIMARY] ;

CREATE INDEX [IX_TransactionHistory_ProductID] ON [Production].[TransactionHistory]([ProductID]) ON [PRIMARY] ;
CREATE INDEX [IX_TransactionHistory_ReferenceOrderID_ReferenceOrderLineNumber] ON [Production].[TransactionHistory]([ReferenceOrderID], [ReferenceOrderLineNumber]) ON [PRIMARY] ;

CREATE INDEX [IX_TransactionHistoryArchive_ProductID] ON [Production].[TransactionHistoryArchive]([ProductID]) ON [PRIMARY] ;
CREATE INDEX [IX_TransactionHistoryArchive_ReferenceOrderID_ReferenceOrderLineNumber] ON [Production].[TransactionHistoryArchive]([ReferenceOrderID], [ReferenceOrderLineNumber]) ON [PRIMARY] ;

CREATE INDEX [IX_VendorAddress_AddressID] ON [Purchasing].[VendorAddress]([AddressID]) ON [PRIMARY] ;

CREATE INDEX [IX_VendorContact_ContactID] ON [Purchasing].[VendorContact]([ContactID]) ON [PRIMARY] ;
CREATE INDEX [IX_VendorContact_ContactTypeID] ON [Purchasing].[VendorContact]([ContactTypeID]) ON [PRIMARY] ;

CREATE INDEX [IX_WorkOrder_ScrapReasonID] ON [Production].[WorkOrder]([ScrapReasonID]) ON [PRIMARY] ;
CREATE INDEX [IX_WorkOrder_ProductID] ON [Production].[WorkOrder]([ProductID]) ON [PRIMARY] ;

CREATE INDEX [IX_WorkOrderRouting_ProductID] ON [Production].[WorkOrderRouting]([ProductID]) ON [PRIMARY] ;
GO
