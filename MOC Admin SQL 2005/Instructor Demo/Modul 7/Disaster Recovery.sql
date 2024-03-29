

-- Erzeugen eines Database Snapshots
CREATE DATABASE AdventureWorks_dbsnapshot_1800
ON (NAME = AdventureWorks_Data,
FILENAME = 'C:\SnapshotData\AdventureWorks_Data.mdf')
AS SNAPSHOT OF AdventureWorks

-- Anzeigen der Mitarbeiter mit Hilfe des Snapshots
USE AdventureWorks_dbsnapshot_1800
SELECT *
FROM HumanResources.Employee

-- Ändern von Werten im Snapshot!!!! NICHT FUNKTIONAL
USE AdventureWorks_dbsnapshot_1800
UPDATE HumanResources.Employee
SET LoginID = 'Secret' + LoginID

-- Ändern von Werten in der DB
USE AdventureWorks
UPDATE HumanResources.Employee
SET LoginID = 'Secret' + LoginID

USE AdventureWorks
SELECT *
FROM HumanResources.Employee
GO
USE AdventureWorks_dbsnapshot_1800
SELECT *
FROM HumanResources.Employee

