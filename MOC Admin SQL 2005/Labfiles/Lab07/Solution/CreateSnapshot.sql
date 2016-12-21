-- Check to see if the snapshot exists, and drop it if it does
USE master
GO
IF EXISTS(SELECT * FROM sys.databases WHERE name = 'AdventureWorks_dbsnapshot')
BEGIN
  DROP DATABASE AdventureWorks_dbsnapshot
END
GO

-- Create the database snapshot
CREATE DATABASE AdventureWorks_dbsnapshot
ON (NAME = AdventureWorks_Data,
    FILENAME = 'C:\SnapshotData\AdventureWorks_Data.mdf')
AS SNAPSHOT OF AdventureWorks
GO