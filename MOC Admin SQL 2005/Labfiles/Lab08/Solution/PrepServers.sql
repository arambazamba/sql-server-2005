-- Back up database on principal server
-- Run on <computer_name>

USE master
GO

BACKUP DATABASE AdventureWorks TO DISK = N'C:\Program Files\Microsoft Learning\2733\Labfiles\Lab08\AWBackup.bak' 
	WITH CHECKSUM, NOFORMAT		
GO


-- Restore database on mirror server
-- Run on <computer_name>\sqlinstance2

USE master
GO

RESTORE DATABASE AdventureWorks FROM  DISK = N'C:\Program Files\Microsoft Learning\2733\Labfiles\Lab08\AWBackup.bak' 
	WITH  FILE = 1,  
	MOVE N'AdventureWorks_Data' TO N'C:\Program Files\Microsoft SQL Server\MSSQL.4\MSSQL\DATA\AdventureWorks_Data.NDF',  
	MOVE N'AdventureWorks_Log' TO N'C:\Program Files\Microsoft SQL Server\MSSQL.4\MSSQL\DATA\AdventureWorks_Log.NDF',  
	CHECKSUM, NORECOVERY
GO