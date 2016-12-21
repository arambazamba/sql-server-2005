USE AdventureWorks
GO
WITH TopSales (SalesPersonID, NumSales) AS
( SELECT SalesPersonID, Count(*)
FROM Sales.SalesOrderHeader GROUP BY SalesPersonId )
SELECT ts.SalesPersonID, sp.SalesYTD, ts.NumSales
FROM Sales.SalesPerson sp INNER JOIN TopSales ts
ON ts.SalesPersonID = sp.SalesPersonID
ORDER BY NumSales DESC

SELECT SalesPersonID, Count(*)
FROM Sales.SalesOrderHeader GROUP BY SalesPersonId

-- rekursion

WITH Managers AS
( SELECT ManagerID, EmployeeID
FROM HumanResources.Employee
WHERE ManagerID IS NULL
UNION ALL
SELECT e.ManagerID, e.EmployeeID
FROM HumanResources.Employee e
INNER JOIN Managers mgr ON
e.ManagerID = mgr.EmployeeID )
SELECT * FROM Managers


SELECT ManagerID, EmployeeID
FROM HumanResources.Employee
WHERE ManagerID IS NULL