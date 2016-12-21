USE AdventureWorks

DECLARE @iterations INT
DECLARE @account INT

SET @iterations = 0

WHILE @iterations < 10
BEGIN

SELECT *
FROM Production.Product
WHERE Name LIKE 'A%'

SELECT *
FROM HumanResources.Employee
ORDER BY LoginID

SELECT Name, ProductNumber, StandardCost
FROM Production.Product
WHERE ProductID = 8

UPDATE Production.Product
SET ListPrice = ListPrice * 1.05

UPDATE Production.Product
SET ListPrice = ListPrice / 1.05

SELECT Name, ListPrice, StandardCost, ReorderPoint
FROM Production.Product
ORDER BY ListPrice

INSERT INTO Sales.Customer(CustomerType, ModifiedDate)
VALUES ('I', getdate())

SELECT @account = @@identity

SELECT P.Name, V.Name, OnOrderQty, AverageLeadTime
FROM Purchasing.ProductVendor PV JOIN Production.Product P
ON PV.ProductID = P.ProductID
JOIN Purchasing.Vendor V
ON V.VendorID = PV.VendorID
ORDER BY P.Name

SELECT *
FROM HumanResources.Department
WHERE NAME LIKE 'D%'

DELETE FROM Sales.Customer
WHERE AccountNumber = @account

SELECT *
FROM Purchasing.PurchaseOrderHeader H JOIN Purchasing.PurchaseOrderDetail D
ON H.PurchaseOrderID = D.PurchaseOrderID
WHERE OrderDate BETWEEN getdate() - 7 AND getdate()

SELECT Name, SUM(S.Salesquota), SUM(S.SalesYTD)
FROM Sales.SalesPerson S JOIN Sales.SalesTerritory T
ON S.TerritoryID = T.TerritoryID
GROUP BY Name 

SELECT *
FROM Sales.Customer
WHERE CustomerType = 'I'

SELECT EmployeeID, LoginID, ManagerID, Title, AddressLine1, AddressLine2, City
FROM HumanResources.Employee E JOIN Person.Address A
ON E.AddressID = A.AddressID
ORDER BY EmployeeID

UPDATE Person.Address
SET AddressLine1 = AddressLine1, AddressLine2 = AddressLine2
WHERE City = 'Leeds'

SELECT AddressLine1, AddressLine2
FROM Person.Address
WHERE PostalCode LIKE '98%'

SET @iterations = @iterations + 1
END
