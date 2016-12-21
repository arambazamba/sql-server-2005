-- Execute the failover
-- Run on <computer_name>
USE master 
GO

ALTER DATABASE AdventureWorks
SET PARTNER FAILOVER
GO


-- View session properties
-- Run on <computer_name>\sqlinstance3
SELECT database_name, principal_server_name, mirror_server_name, safety_level_desc
FROM sys.database_mirroring_witnesses


-- Query the new principal database
-- Run on <computer_name>\sqlinstance2
USE AdventureWorks
SELECT * FROM person.contact


-- Query the new mirror database
-- Run on <computer_name>
USE AdventureWorks
SELECT * FROM person.contact
