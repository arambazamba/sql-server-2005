-- enable service broker on the AdventureWorks database
USE AdventureWorks
ALTER DATABASE AdventureWorks SET ENABLE_BROKER;


-- drop and create the AuditLog table for storing event notification message information
IF exists (select * from dbo.sysobjects where id = object_id(N'dbo.AuditLog') and OBJECTPROPERTY(id, N'IsTable') = 1)
	DROP TABLE dbo.AuditLog
GO
CREATE TABLE AuditLog
	(Command NVARCHAR(1000),
	PostTime NVARCHAR(24),
	HostName NVARCHAR(100),
	LoginName NVARCHAR(100)
	)
GO


-- create a queue
CREATE QUEUE NotifyQueue 
GO


-- create a service on the queue that references 
-- the event notifications contract
CREATE SERVICE NotifyService
ON QUEUE NotifyQueue
(
	[http://schemas.microsoft.com/SQL/Notifications/PostEventNotification]
)
GO


-- create a route on the service to define the address to 
-- which Service Broker sends messages for the service
CREATE ROUTE NotifyRoute
WITH SERVICE_NAME = 'NotifyService',
ADDRESS = 'LOCAL'
GO


-- create the database event notification
CREATE EVENT NOTIFICATION NotifyCREATE_TABLE
ON DATABASE
FOR CREATE_TABLE
TO SERVICE [NotifyService] 


-- create a table to fire the NotifyCREATE_TABLE event
CREATE TABLE T1 (col1 int)
GO


-- process the event notifications and enter data in the AuditLog table
DECLARE		@messageTypeName NVARCHAR(256),
			@messageBody XML
;RECEIVE TOP(1) 
			@messageTypeName = message_type_name,
			@messageBody = message_body
		FROM dbo.NotifyQueue;

IF @@ROWCOUNT = 0
	RETURN

PRINT CONVERT(NVARCHAR(1000),@messagebody)

DECLARE @cmd NVARCHAR(1000)
DECLARE @posttime NVARCHAR(24)
DECLARE @spid NVARCHAR(6)
DECLARE @hostname NVARCHAR(100)
DECLARE @loginname NVARCHAR(100)
SET @cmd = CONVERT(NVARCHAR(100),@messagebody.query('data(//TSQLCommand//CommandText)'))
SET @posttime = CONVERT(NVARCHAR(24),@messagebody.query('data(//PostTime)'))
SET @spid = CONVERT(NVARCHAR(6),@messagebody.query('data(//SPID)'))
SET @hostname = HOST_NAME()
SET @loginname = SYSTEM_USER

INSERT INTO AuditLog(Command,PostTime,HostName,LoginName)
VALUES(@cmd, @posttime, @hostname, @loginname)
GO

SELECT * FROM AuditLog


-- create a table event on T1
CREATE EVENT NOTIFICATION NotifyALTER_TABLE
ON TABLE dbo.T1
FOR ALTER_TABLE
TO SERVICE [NotifyService] 
GO


-- alter the table to fire the NotifyALTER_TABLE event
ALTER TABLE T1 ADD col2 int
GO


-- process the event notifications and enter data in the AuditLog table
DECLARE		@messageTypeName NVARCHAR(256),
			@messageBody XML
;RECEIVE TOP(1) 
			@messageTypeName = message_type_name,
			@messageBody = message_body
		FROM dbo.NotifyQueue;

IF @@ROWCOUNT = 0
	RETURN

PRINT CONVERT(NVARCHAR(1000),@messagebody)

DECLARE @cmd NVARCHAR(1000)
DECLARE @posttime NVARCHAR(24)
DECLARE @spid NVARCHAR(6)
DECLARE @hostname NVARCHAR(100)
DECLARE @loginname NVARCHAR(100)
SET @cmd = CONVERT(NVARCHAR(100),@messagebody.query('data(//TSQLCommand//CommandText)'))
SET @posttime = CONVERT(NVARCHAR(24),@messagebody.query('data(//PostTime)'))
SET @spid = CONVERT(NVARCHAR(6),@messagebody.query('data(//SPID)'))
SET @hostname = HOST_NAME()
SET @loginname = SYSTEM_USER

INSERT INTO AuditLog(Command,PostTime,HostName,LoginName)
VALUES(@cmd, @posttime, @hostname, @loginname)
GO

SELECT * FROM AuditLog


-- clean up
DROP EVENT NOTIFICATION NotifyCREATE_TABLE ON DATABASE
DROP EVENT NOTIFICATION NotifyALTER_TABLE ON TABLE dbo.T1
DROP ROUTE NotifyRoute
DROP SERVICE NotifyService
DROP QUEUE NotifyQueue
DROP TABLE T1
DROP TABLE AuditLog
GO
