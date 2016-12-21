-- CATALOG VIEWS

-- View sys.databases from master
USE master
SELECT * FROM sys.databases

-- View sys.databases from AdventureWorks
USE AdventureWorks
SELECT * FROM sys.databases

-- View sys.tables from AdventureWorks
USE AdventureWorks
SELECT * FROM sys.tables

-- View sys.columns from AdventureWorks
USE AdventureWorks
SELECT * FROM sys.columns

-- View sys.columns for Person.Contact table in AdventureWorks
USE AdventureWorks
SELECT * FROM sys.columns
WHERE [object_id] = 
	(SELECT [object_id] FROM sys.tables ST 
	JOIN sys.schemas SS 
	ON ST.schema_id = SS.schema_id
	WHERE ST.name='Contact' AND SS.name = 'Person')

-- View assemblies in AdventureWorks
USE AdventureWorks
SELECT * FROM sys.assemblies

-- View events in AdventureWorks
USE AdventureWorks
SELECT * FROM sys.events

-- View server configuration
USE AdventureWorks
SELECT * FROM sys.configurations


-- DYNAMIC MANAGEMENT VIEWS

-- View partitioning of AdventureWorks
USE AdventureWorks
SELECT * FROM sys.dm_db_partition_stats

-- View transaction locks in AdventureWorks
USE AdventureWorks
SELECT * FROM sys.dm_tran_locks

-- Hold a lock and view locks in AdventureWorks
USE AdventureWorks
BEGIN TRAN
SELECT * FROM Person.Contact WITH (HOLDLOCK)

USE AdventureWorks
SELECT * FROM sys.dm_tran_locks

-- Release the locks and view locks in AdventureWorks
COMMIT TRAN

USE AdventureWorks
SELECT * FROM sys.dm_tran_locks
