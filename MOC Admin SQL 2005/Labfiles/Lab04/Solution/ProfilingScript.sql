USE master
CREATE DATABASE AWData 
GO

USE AWData
CREATE TABLE ContactsCopy
	(FirstName varchar(50),
	 LastName varchar(50),
	 EmailAddress varchar(50),
	 AdditionalContactInfo xml)
GO
CREATE TABLE AddressCopy
	(AddressLine1 varchar(60),
	 AddressLine2 varchar(60),
	 City varchar(30),
	 PostalCode varchar(15))
GO

INSERT INTO ContactsCopy 
	SELECT FirstName, LastName, EmailAddress, AdditionalContactInfo FROM AdventureWorks.Person.Contact
GO

INSERT INTO AddressCopy
	SELECT AddressLine1, AddressLine2, City, PostalCode FROM AdventureWorks.Person.Address
GO


-- Clean up
USE master
DROP DATABASE AWData