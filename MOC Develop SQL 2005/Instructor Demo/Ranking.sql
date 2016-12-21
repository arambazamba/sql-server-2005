use adventureworks
go
SELECT P.Name Product, P.ListPrice, PSC.Name Category,
RANK() OVER(PARTITION BY PSC.Name ORDER BY P.ListPrice DESC)
AS PriceRank
FROM Production.Product P
JOIN Production.ProductSubCategory PSC
ON P.ProductSubCategoryID = PSC.ProductSubCategoryID


SELECT P.Name Product, P.ListPrice, PSC.Name Category,
DENSE_RANK()
OVER(PARTITION BY PSC.Name ORDER BY P.ListPrice DESC)
AS PriceRank
FROM Production.Product P
JOIN Production.ProductSubCategory PSC
ON P.ProductSubCategoryID = PSC.ProductSubCategoryID

SELECT ROW_NUMBER()
OVER(PARTITION BY PC.Name ORDER BY ListPrice) AS Row,
PC.Name Category, P.Name Product, P.ListPrice
FROM Production.Product P
JOIN Production.ProductSubCategory PSC
ON P.ProductSubCategoryID = PSC.ProductSubCategoryID
JOIN Production.ProductCategory PC
ON PSC.ProductCategoryID = PC.ProductCategoryID

SELECT NTILE(3) OVER(PARTITION BY PC.Name ORDER BY ListPrice)
AS PriceBand, PC.Name Category, P.Name Product, P.ListPrice
FROM Production.Product P
JOIN Production.ProductSubCategory PSC
ON P.ProductSubCategoryID = PSC.ProductSubCategoryID
JOIN Production.ProductCategory PC
ON PSC.ProductCategoryID = PC.ProductCategoryID