
-- Create filegroups and files
USE AdventureWorks
GO
ALTER DATABASE AdventureWorks ADD FILEGROUP fg1
ALTER DATABASE AdventureWorks ADD FILEGROUP fg2
ALTER DATABASE AdventureWorks ADD FILEGROUP fg3
GO

ALTER DATABASE AdventureWorks 
ADD FILE 
( NAME = data1,
  FILENAME = 'c:\Program Files\Microsoft SQL Server\MSSQL.1\MSSQL\Data\AWd1.ndf',
  SIZE = 1MB,
  MAXSIZE = 100MB,
  FILEGROWTH = 1MB)
TO FILEGROUP fg1

ALTER DATABASE AdventureWorks 
ADD FILE 
( NAME = data2,
  FILENAME = 'c:\Program Files\Microsoft SQL Server\MSSQL.1\MSSQL\Data\AWd2.ndf',
  SIZE = 1MB,
  MAXSIZE = 100MB,
  FILEGROWTH = 1MB)
TO FILEGROUP fg2

ALTER DATABASE AdventureWorks 
ADD FILE 
( NAME = data3,
  FILENAME = 'c:\Program Files\Microsoft SQL Server\MSSQL.1\MSSQL\Data\AWd3.ndf',
  SIZE = 1MB,
  MAXSIZE = 100MB,
  FILEGROWTH = 1MB)
TO FILEGROUP fg3
GO

-- Create partition function
CREATE PARTITION FUNCTION EmailPF (nvarchar(30))
AS RANGE RIGHT FOR VALUES ('G', 'N')
GO

-- Create partition scheme
CREATE PARTITION SCHEME EmailPS
AS PARTITION EmailPF TO (fg1, fg2, fg3)
GO


-- Create partitioned table
CREATE TABLE Sales.CustomerEmail 
(CustID int, Email nvarchar(30))
ON EmailPS (Email)
GO

-- Insert data
INSERT Sales.CustomerEmail
VALUES
(1, 'andrew@adventure-works.com')

INSERT Sales.CustomerEmail
VALUES
(1, 'garth@adventure-works.com')

INSERT Sales.CustomerEmail
VALUES
(1, 'sharon@adventure-works.com')

-- Retrieve partition information
SELECT Email, $partition.EmailPF(Email) Partition 
FROM Sales.CustomerEmail

-- Clean up
DROP TABLE Sales.CustomerEmail
GO
DROP PARTITION SCHEME EmailPS
DROP PARTITION FUNCTION EmailPF
GO
ALTER DATABASE AdventureWorks REMOVE FILE data1
ALTER DATABASE AdventureWorks REMOVE FILE data2
ALTER DATABASE AdventureWorks REMOVE FILE data3
ALTER DATABASE AdventureWorks REMOVE FILEGROUP fg1
ALTER DATABASE AdventureWorks REMOVE FILEGROUP fg2
ALTER DATABASE AdventureWorks REMOVE FILEGROUP fg3

