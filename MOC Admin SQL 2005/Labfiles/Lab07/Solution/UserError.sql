-- Query the source database and the snapshot
USE AdventureWorks
SELECT ProductID, Name, ListPrice
FROM Production.Product
WHERE ProductID = 999
UNION ALL
SELECT ProductID, Name, ListPrice
FROM AdventureWorks_dbsnapshot.Production.Product
WHERE ProductID = 999

-- Update the source database. The original values
-- will be copied to the database snapshot
UPDATE Production.Product
SET ListPrice = ListPrice * 1.1
WHERE ProductID = 999

-- Restore the original value to the source database
USE AdventureWorks
UPDATE Production.Product
SET ListPrice = 
  (SELECT ListPrice 
   FROM AdventureWorks_dbsnapshot.Production.Product
   WHERE ProductID = 999)
WHERE ProductID = 999

-- Drop the snapshot
DROP DATABASE AdventureWorks_dbsnapshot