USE AdventureWorks

-- Find all rows in the Person.Address table for addresses in Denver
SELECT * FROM Person.Address
WHERE City = 'Denver'

-- Create an index over the City column
CREATE INDEX IX_City
ON Person.Address(City)
WITH (ONLINE = ON)

-- Query the Person.Address table again
SELECT * FROM Person.Address
WHERE City = 'Denver'

-- Disable the IX_City index
ALTER INDEX IX_City
ON Person.Address
DISABLE

-- Query the Person.Address table again
SELECT * FROM Person.Address
WHERE City = 'Denver'

-- Re-enable the IX_City index
ALTER INDEX IX_City
ON Person.Address
REBUILD

-- Find all rows in the Person.Address table for addresses in State/Province 14
SELECT AddressLine1, AddressLine2 FROM Person.Address
WHERE StateProvinceID = 14

-- Drop the spanning index fromthe Person.Address table
DROP INDEX IX_Address_AddressLine1_AddressLine2_City_StateProvinceID_PostalCode
ON Person.Address

-- Find all rows in State/Province 14 again
SELECT AddressLine1, AddressLine2 FROM Person.Address
WHERE StateProvinceID = 14

-- Create an index over the StateProvinceID column that includes AddressLine1 and AddressLine2
CREATE INDEX IX_State_Address
ON Person.Address(StateProvinceID)
INCLUDE (AddressLine1, AddressLine2)

-- Find all rows in State/Province 14 again
SELECT AddressLine1, AddressLine2 FROM Person.Address
WHERE StateProvinceID = 14

-- Disable the clustered index on the Person.Address table
ALTER INDEX PK_Address_AddressID
ON Person.Address
DISABLE

-- Try and add a new row to the Person.Address table
INSERT INTO Person.Address(AddressLine1, AddressLine2, City, StateProvinceID, PostalCode, ModifiedDate)
VALUES('1400 Firestone Drive', 'Unit 2', 'Bothell', 79, '66150', GetDate())

-- Re-enable the PK_Address_AddressID index
ALTER INDEX PK_Address_AddressID
ON Person.Address
REBUILD

-- Add a new row to the Person.Address table
INSERT INTO Person.Address(AddressLine1, AddressLine2, City, StateProvinceID, PostalCode, ModifiedDate)
VALUES('1400 Firestone Drive', 'Unit 2', 'Bothell', 79, '66150', GetDate())

-- Re-enable the foreign key constraints
ALTER TABLE Purchasing.VendorAddress 
CHECK CONSTRAINT FK_VendorAddress_Address_AddressID

ALTER TABLE Sales.SalesOrderHeader 
CHECK CONSTRAINT FK_SalesOrderHeader_Address_ShipToAddressID

ALTER TABLE Sales.SalesOrderHeader 
CHECK CONSTRAINT FK_SalesOrderHeader_Address_BillToAddressID

ALTER TABLE HumanResources.Employee 
CHECK CONSTRAINT FK_Employee_Address_AddressID

ALTER TABLE Sales.CustomerAddress 
CHECK CONSTRAINT FK_CustomerAddress_Address_AddressID

ALTER TABLE Person.Address 
CHECK CONSTRAINT FK_Address_StateProvince_StateProvinceID
