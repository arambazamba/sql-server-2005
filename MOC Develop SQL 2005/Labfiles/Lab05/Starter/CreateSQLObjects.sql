USE AdventureWorks
GO

IF exists (select * from dbo.sysobjects where id = object_id(N'[Production].[GetProducts]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE Production.GetProducts
GO

IF exists (select * from dbo.sysobjects where id = object_id(N'[Production].[UpdateProductPrice]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE Production.UpdateProductPrice
GO

CREATE PROCEDURE Production.GetProducts
AS
	SELECT	ProductID,Name,ListPrice
	FROM	Production.Product
GO

CREATE PROCEDURE Production.UpdateProductPrice(
	@ProductID int, @NewPrice money
)
AS
	UPDATE Production.Product
	SET ListPrice = @NewPrice
	WHERE ProductID = @ProductID
GO


