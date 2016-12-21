use Adventureworks
go

CREATE TRIGGER UpdStats
ON DATABASE 
FOR UPDATE_STATISTICS 
AS 
DECLARE @data XML 
DECLARE @posttime NVARCHAR(24) 
DECLARE @database NVARCHAR(100) 
DECLARE @targetobject NVARCHAR(100) 
SET @data = eventdata() 
SET @posttime = CONVERT(NVARCHAR(24),@data.query('data(//PostTime)')) 
SET @database = CONVERT(NVARCHAR(100), @data.query('data(//DatabaseName)')) 
SET @targetobject = CONVERT(NVARCHAR(100), @data.query('data(//TargetObjectName)')) 
PRINT @posttime 
PRINT @database 
PRINT @targetobject 

update statistics person.address
 
-- Erstellen eines Server Triggers
Alter TRIGGER safetySRV 
ON all server
FOR create_login
AS 
   PRINT 'You have created a Login' 

 
-- Anzeigen der Server Trigger
use master
go
select * from sys.server_triggers
