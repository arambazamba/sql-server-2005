-- Specify witness server
-- Run on <computer_name>

USE master
GO

ALTER DATABASE AdventureWorks
SET WITNESS = '<computer_name>\sqlinstance3' 

-- View session properties
-- Run on <computer_name>\sqlinstance3
SELECT database_name, principal_server_name, mirror_server_name, safety_level_desc
FROM sys.database_mirroring_witnesses