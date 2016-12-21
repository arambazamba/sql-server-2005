USE master
CREATE DATABASE PracticeDatabase
GO

USE PracticeDatabase
CREATE TABLE PracticeTable
	(Col1 int,
	 Col2 varchar(50),
	 Col3 varchar(50),
	 Col4 varchar(50))
GO


INSERT INTO PracticeTable
VALUES(1,'Lin','Graeme','Tamara')
GO


-- Clean up
USE master
DROP DATABASE PracticeDatabase