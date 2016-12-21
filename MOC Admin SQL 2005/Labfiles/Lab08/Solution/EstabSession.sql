-- Specify principal server from mirror server
-- Run on <computer_name>\sqlinstance2

USE master
GO
ALTER DATABASE AdventureWorks
SET PARTNER = '<computer_name>'



-- Specify mirror server from principal server
-- Run on <computer_name>

USE master
GO
ALTER DATABASE AdventureWorks
SET PARTNER = '<computer_name>\sqlinstance2' 



-- View mirror information
-- Run on <computer_name> and <computer_name>\sqlinstance2

SELECT mirroring_state_desc, mirroring_partner_name, mirroring_witness_name, mirroring_witness_state_desc, mirroring_role_desc, mirroring_safety_level_desc 
FROM sys.databases 

