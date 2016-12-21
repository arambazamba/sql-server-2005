USE AdventureWorks
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS(SELECT * FROM sys.procedures p 
          JOIN sys.schemas s ON p.schema_id = s.schema_id
		  WHERE p.name = 'GetProducts'
		  AND s.name = 'Production')
BEGIN
	DROP PROCEDURE Production.GetProducts
END
GO
IF EXISTS(SELECT * FROM sys.procedures p 
          JOIN sys.schemas s ON p.schema_id = s.schema_id
		  WHERE p.name = 'UpdateProduct'
		  AND s.name = 'Production')
BEGIN
	DROP PROCEDURE Production.UpdateProduct
END
GO
CREATE PROCEDURE Production.GetProducts
AS
SELECT ProductID, [Name], ListPrice
FROM Production.Product
ORDER BY ProductID
GO


CREATE  PROCEDURE Production.UpdateProduct

	(
		@productid integer,
		@name nvarchar(40),
		@listprice money
	)

AS
	UPDATE Production.Product
	SET  [Name] = @name,
		 ListPrice = @ListPrice
	WHERE ProductID = @productid

GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF