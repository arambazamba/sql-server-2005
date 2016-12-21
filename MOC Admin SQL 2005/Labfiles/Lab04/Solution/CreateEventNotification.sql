USE AdventureWorks
GO

-- Create the log table
CREATE TABLE dbo.EventLog
(eventinfo XML)
GO

-- Create the stored procedure triggered by the event
CREATE PROCEDURE dbo.EventLogProc
AS
	DECLARE		@message_body XML
	;WAITFOR(
				RECEIVE TOP(1)
				@message_body=message_body
				FROM EventLogQueue 
			), TIMEOUT 2000 ; 
	IF @@ROWCOUNT = 0
		RETURN
	INSERT INTO dbo.EventLog(eventinfo)
	VALUES (@message_body)
GO

-- Create the queue used by the service
CREATE QUEUE EventLogQueue
WITH STATUS = ON,
ACTIVATION (
  PROCEDURE_NAME = dbo.EventLogProc,
  MAX_QUEUE_READERS = 5,
  EXECUTE AS SELF)
GO

-- Create the service
CREATE SERVICE EventLogService
ON QUEUE EventLogQueue
(
	[http://schemas.microsoft.com/SQL/Notifications/PostEventNotification]
)
GO

-- Create a route on the service
CREATE ROUTE EventLogRoute
WITH SERVICE_NAME = 'EventLogService',
ADDRESS = 'LOCAL'
GO

-- Create the event notification, sending events to the service
CREATE EVENT NOTIFICATION EventLogNotification
ON DATABASE
FOR CREATE_TABLE, DROP_TABLE
TO SERVICE EventLogService
GO

-- Test the event notification - create and drop a table
CREATE TABLE Test
(col char)
GO
DROP TABLE Test
GO

-- Query the EventLog table - both events should be recorded
SELECT *
FROM EventLog
GO

-- Remove the event notification objects
DROP EVENT NOTIFICATION EventLogNotification ON DATABASE
GO
DROP SERVICE EventLogService
GO
DROP ROUTE EventLogRoute
GO
DROP QUEUE EventLogQueue
GO
DROP PROCEDURE EventLogProc
GO
DROP TABLE dbo.EventLog
GO