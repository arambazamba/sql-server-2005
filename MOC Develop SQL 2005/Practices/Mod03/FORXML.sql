 -- ELEMENTS with RAW mode
USE AdventureWorks
SELECT ProductID, Name, ListPrice
FROM Production.Product
FOR XML RAW, ELEMENTS

-- NULL columns with ELEMENTS
SELECT ProductID, Name, Color
FROM Production.Product Product
FOR XML AUTO, ELEMENTS XSINIL

-- NULL columns with EXPLICIT
SELECT 1 AS Tag,
       NULL AS Parent,
       ProductID AS [Product!1!ProductID],
       Name AS [Product!1!ProductName!element],
       Color AS [Product!1!Color!elementxsinil]
FROM Production.Product
FOR XML EXPLICIT

-- Inline XSD schema
SELECT ProductID, Name, ListPrice
FROM Production.Product Product
FOR XML AUTO, XMLSCHEMA


-- Nested XML with TYPE
SELECT ProductID, 
       Name, ListPrice,
       (SELECT ReviewerName, Comments
        FROM Production.ProductReview ProductReview
        WHERE ProductReview.ProductID = Product.ProductID
        FOR XML AUTO, ELEMENTS, TYPE)
FROM Production.Product Product
FOR XML AUTO


-- PATH mode
SELECT ProductID AS "@ProductID",
       Name AS "*",
       Size AS "Description/@Size",
       Color AS "Description/text()"
FROM Production.Product
FOR XML PATH 

-- ROOT directive
SELECT ProductID, Name, ListPrice
FROM Production.Product Product
FOR XML AUTO, ROOT('Products') 

-- Named element in RAW modes
SELECT ProductID, Name, ListPrice
FROM Production.Product
FOR XML RAW('Product')