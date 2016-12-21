USE AdventureWorks
GO

-- Create the trigger
CREATE TRIGGER CheckDropTable
ON DATABASE
FOR DROP_TABLE 
AS
DECLARE @data XML
DECLARE @tablename sysname
DECLARE @schemaname sysname

SET @data = eventdata()
SET @tablename = CONVERT(sysname, @data.query('data(//ObjectName)'))
SET @schemaname = CONVERT(sysname, @data.query('data(//SchemaName)'))

IF @schemaname = 'Production'
BEGIN
  PRINT 'Cannot drop ' + @tablename + ' as it belongs to the Production schema'
  ROLLBACK TRANSACTION
END
GO

-- Copy Product data into the ProductCopy table in the Production schema
SELECT * INTO Production.ProductCopy
FROM Production.Product

-- Try to drop the ProductCopy table
DROP TABLE Production.ProductCopy

-- Create another copy of the Product table in the guest schema
SELECT * INTO guest.ProductCopy
FROM Production.Product

-- Drop the table - should be successful
DROP TABLE guest.ProductCopy

-- The table should no longer exist
SELECT * FROM guest.ProductCopy

-- Drop the table from the Production schema - should be successful this time
DROP TABLE Production.ProductCopy 