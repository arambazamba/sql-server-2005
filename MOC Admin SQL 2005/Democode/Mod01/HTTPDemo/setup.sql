USE master
GO
DECLARE @userName NVARCHAR(50)
SET @userName = left (system_user, patindex('%\%', system_user)) + 'Peter'
DECLARE @createLoginStatement NVARCHAR(100)
SET @createLoginStatement = 'CREATE LOGIN [' + @userName + '] FROM WINDOWS'
EXEC (@createLoginStatement)

USE adventureworks
DECLARE @createUserStatement NVARCHAR(100)
SET @createUserStatement = 'CREATE USER Peter FOR LOGIN [' + @userName + ']'
EXEC (@createUserStatement)
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


