USE AdventureWorks
GO

-- Retrieve order manifest
SELECT SalesOrder.SalesOrderID, 
       SalesOrder.OrderDate, 
       SalesOrder.AccountNumber,
       SalesOrder.Comment,
       Item.ProductID,
       Item.OrderQty
FROM Sales.SalesOrderHeader SalesOrder
JOIN Sales.SalesOrderDetail Item
ON SalesOrder.SalesOrderID = Item.SalesOrderID
WHERE SalesOrder.SalesOrderID = 43659
