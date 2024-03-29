USE AdventureWorks
GO

-- Create object in dbo schema
CREATE TABLE dbo.NewProduct
(ProductID INT IDENTITY,
 ProductName NVARCHAR(50))
GO

-- Create a schema
CREATE SCHEMA MarketingSchema
  CREATE TABLE Adverts
  (AdvertID INT IDENTITY,
   ProductID INT,
   AdCopy NVARCHAR(50))

  GRANT ALL PRIVILEGES ON Adverts TO Bill
GO

-- Set a user's default schema
ALTER USER Bill
WITH DEFAULT_SCHEMA = MarketingSchema