-- create a Windows login
CREATE LOGIN [COMPUTER_NAME\Alice]
FROM WINDOWS
WITH DEFAULT_DATABASE = AdventureWorks

-- create a SQL Server login
CREATE LOGIN Bob
WITH PASSWORD = 'P@ssw0rd',
	 DEFAULT_DATABASE = AdventureWorks

-- try to create a login with a weak password
CREATE LOGIN Eve
WITH PASSWORD = 'password',
     DEFAULT_DATABASE = AdventureWorks

-- force weak password (not recommended)
CREATE LOGIN Eve
WITH PASSWORD = 'password',
     DEFAULT_DATABASE = AdventureWorks,
     CHECK_EXPIRATION = OFF,
     CHECK_POLICY = OFF

-- create user accounts
USE AdventureWorks
CREATE USER Alice FOR LOGIN [COMPUTER_NAME\Alice]
CREATE USER Bob FOR LOGIN Bob
CREATE USER Eve FOR LOGIN Eve

-- create a schema
CREATE SCHEMA salesSchema
  CREATE TABLE orders
  (orderID INT IDENTITY,
   productID INT,
   quantity INT)
  GRANT SELECT, INSERT
  ON orders
  TO Alice
GO

-- set Alice's default schema
ALTER USER Alice
WITH DEFAULT_SCHEMA = salesSchema

-- control execution context
CREATE PROCEDURE GetOrders
WITH EXECUTE AS 'Alice'
AS
SELECT * FROM salesSchema.orders
GO
GRANT EXECUTE ON dbo.GetOrders TO Eve

-- grant Bob permission
GRANT SELECT ON salesSchema.orders TO Bob

-- grant Eve permission
GRANT SELECT
ON SCHEMA :: salesSchema
TO Eve

-- deny Eve permission
DENY SELECT ON salesSchema.orders TO Eve

-- create certificate
USE AdventureWorks
CREATE CERTIFICATE DemoCert 
    WITH SUBJECT = 'DemoCertificate'
		 , ENCRYPTION_PASSWORD = 'P@ssw0rd'

-- export certificate
DUMP CERTIFICATE DemoCert 
	TO FILE = 
	'C:\Program Files\Microsoft Learning\2733\DemoCode\Mod06\DemoCert.cer'

-- delete certificate
DROP CERTIFICATE DemoCert