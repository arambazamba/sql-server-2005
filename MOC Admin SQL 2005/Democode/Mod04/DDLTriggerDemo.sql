/* Create the AuditLog table */
USE AdventureWorks
GO
CREATE TABLE dbo.AuditLog
(Command NVARCHAR(1000),
 PostTime NVARCHAR(24),
 HostName NVARCHAR(100),
 LoginName NVARCHAR(100)
)
GO

/* Create the trigger */
CREATE TRIGGER AuditOperations
ON DATABASE
FOR DDL_DATABASE_LEVEL_EVENTS
AS
DECLARE @data XML
DECLARE @cmd NVARCHAR(1000)
DECLARE @posttime NVARCHAR(24)
DECLARE @spid NVARCHAR(6)
DECLARE @hostname NVARCHAR(100)
DECLARE @loginname NVARCHAR(100)

SET @data = eventdata()
SET @cmd = CONVERT(NVARCHAR(100),@data.query('data(//TSQLCommand//CommandText)'))
SET @posttime = CONVERT(NVARCHAR(24),@data.query('data(//PostTime)'))
SET @spid = CONVERT(NVARCHAR(6),@data.query('data(//SPID)'))
SET @hostname = HOST_NAME()
SET @loginname = SYSTEM_USER

INSERT INTO dbo.AuditLog(Command,PostTime,HostName,LoginName)
VALUES(@cmd, @posttime, @hostname, @loginname)
GO

/* Test the trigger */
UPDATE STATISTICS Production.Product
GO
CREATE TABLE dbo.Test(col INT)
GO
DROP TABLE dbo.Test
GO

/*Examine the AuditLog table */
SELECT *
FROM dbo.AuditLog
GO

/* Drop the trigger */
DROP TRIGGER AuditOperations
ON DATABASE
GO