use adventureworks
go
SELECT is_broker_enabled 
FROM sys.databases 
WHERE database_id = db_id()

