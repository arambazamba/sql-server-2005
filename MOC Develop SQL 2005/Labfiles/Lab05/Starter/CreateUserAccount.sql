USE master
GO
DECLARE @userName NVARCHAR(50)
SET @userName = left (system_user, patindex('%\%', system_user)) + 'Peter'
DECLARE @createLoginStatement NVARCHAR(100)
SET @createLoginStatement = 'CREATE LOGIN [' + @userName + '] FROM WINDOWS'
EXEC (@createLoginStatement)

USE adventureworks
DECLARE @createUserStatement NVARCHAR(100)
SET @createUserStatement = 'CREATE USER Peter FOR LOGIN [' + @userName + ']'
EXEC (@createUserStatement)
GO
