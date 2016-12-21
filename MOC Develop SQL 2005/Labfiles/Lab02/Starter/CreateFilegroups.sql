USE AdventureWorks
GO

ALTER DATABASE AdventureWorks ADD FILEGROUP FG1
ALTER DATABASE AdventureWorks ADD FILEGROUP FG2
GO

ALTER DATABASE AdventureWorks 
ADD FILE 
( NAME = dat1,
  FILENAME = 'c:\Program Files\Microsoft SQL Server\MSSQL.1\MSSQL\Data\dat1.ndf',
  SIZE = 1MB,
  MAXSIZE = 100MB,
  FILEGROWTH = 1MB)
TO FILEGROUP FG1

ALTER DATABASE AdventureWorks 
ADD FILE 
( NAME = dat2,
  FILENAME = 'c:\Program Files\Microsoft SQL Server\MSSQL.1\MSSQL\Data\dat2.ndf',
  SIZE = 1MB,
  MAXSIZE = 100MB,
  FILEGROWTH = 1MB)
TO FILEGROUP FG2
GO