-- Create the stored procedure
USE AdventureWorks
GO
CREATE PROCEDURE Sales.SaveOrder (@OrderData xml, @FileName nvarchar(50))
AS
EXTERNAL NAME AWXmlMessaging.FileOperations.SaveOrder

-- Test the stored procedure
DECLARE @order xml
SET @order = 
	(SELECT SalesOrder.SalesOrderID, AccountNumber, ProductID, OrderQty, UnitPrice, UnitPriceDiscount, LineTotal
     FROM Sales.SalesOrderHeader SalesOrder
     JOIN Sales.SalesOrderDetail LineItem
     ON SalesOrder.SalesOrderID = LineItem.SalesOrderID
     WHERE SalesOrder.SalesOrderID = 75123
     FOR XML AUTO, TYPE)
EXEC Sales.SaveOrder @order, 'C:\Order75123.xml'

