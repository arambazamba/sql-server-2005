-- Create backup devices
USE master
EXEC sp_addumpdevice 'disk', 'AWBackupDev', 'C:\AWBackupDev.bak'
EXEC sp_addumpdevice 'disk', 'AWMirrorDev', 'C:\AWMirrorDev.bak'
GO

-- Backup AdventureWorks with mirror and checksum
BACKUP DATABASE AdventureWorks
TO AWBackupDev
MIRROR TO AWMirrorDev
WITH FORMAT, CHECKSUM

-- Drop AdventureWorks database
DROP DATABASE AdventureWorks

-- Restore AdventureWorks from mirror device
RESTORE DATABASE AdventureWorks
FROM AWMirrorDev
WITH CHECKSUM

-- Verify database has been restored
USE AdventureWorks
SELECT * FROM Production.Product

-- Drop backup devices
EXEC sp_dropdevice 'AWBackupDev', delfile
EXEC sp_dropdevice 'AWMirrorDev', delfile