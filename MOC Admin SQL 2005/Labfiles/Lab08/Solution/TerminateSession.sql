-- Terminate session
-- Run on <computer_name>\sqlinstance2
USE master
GO

ALTER DATABASE AdventureWorks
SET PARTNER OFF


-- View session properties
-- Run on <computer_name>\sqlinstance3
SELECT database_name, principal_server_name, mirror_server_name, safety_level_desc
FROM sys.database_mirroring_witnesses


-- Recover database
-- Run on <computer_name>
RESTORE DATABASE AdventureWorks
WITH RECOVERY

--Verify mirror is now available
-- Run on <computer_name>
USE AdventureWorks
SELECT * FROM person.contact 

