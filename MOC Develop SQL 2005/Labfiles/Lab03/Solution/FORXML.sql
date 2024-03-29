USE AdventureWorks
GO

-- Retrieve order manifest as row elements
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
FOR XML RAW, ELEMENTS

-- Retrieve order manifest with schema
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
FOR XML AUTO, ELEMENTS, XMLSCHEMA

-- Retrieve order manifest with null values
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
FOR XML AUTO, ELEMENTS XSINIL

-- Retrieve nested order manifest
SELECT SalesOrder.SalesOrderID, 
       SalesOrder.OrderDate, 
       SalesOrder.AccountNumber,
       SalesOrder.Comment,
       (SELECT Item.ProductID,
               Item.OrderQty
        FROM Sales.SalesOrderDetail Item
        WHERE Item.SalesOrderID = SalesOrder.SalesOrderID
        FOR XML AUTO, TYPE)
FROM Sales.SalesOrderHeader SalesOrder
WHERE SalesOrder.SalesOrderID = 43659
FOR XML AUTO, ELEMENTS XSINIL