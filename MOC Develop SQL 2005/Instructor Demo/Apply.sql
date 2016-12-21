Use Adventureworks
go

CREATE FUNCTION Sales.MostRecentOrders(@CustID AS int)
RETURNS TABLE AS
RETURN
SELECT TOP (3) SalesOrderID, OrderDate
FROM Sales.SalesOrderHeader
WHERE CustomerID = @CustID
ORDER BY OrderDate DESC
GO

SELECT Name AS Customer, MostRecent.* FROM Sales.Store
CROSS APPLY Sales.MostRecentOrders(CustomerID)
AS MostRecent
WHERE Name Like 'A%' ORDER BY Customer

SELECT Name AS Customer, MostRecent.* FROM Sales.Store
OUTER APPLY Sales.MostRecentOrders(CustomerID)
AS MostRecent
WHERE Name Like 'A%' ORDER BY Customer