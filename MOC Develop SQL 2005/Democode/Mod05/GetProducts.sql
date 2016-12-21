USE AdventureWorks
GO

IF exists (select * from dbo.sysobjects where id = object_id(N'[Production].[GetProducts]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE Production.GetProducts
GO


CREATE PROCEDURE Production.GetProducts
AS
	SELECT	ProductID,Name,ListPrice
	FROM	Production.Product
GO


exec production.getproducts
