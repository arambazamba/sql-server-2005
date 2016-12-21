USE AdventureWorks
GO

CREATE PARTITION FUNCTION StorePF (int)
AS RANGE RIGHT FOR VALUES (350)

CREATE PARTITION SCHEME StorePS AS 
PARTITION StorePF TO (FG1, FG2)
GO

CREATE TABLE Sales.PartitionedStore(
	StoreID int NOT NULL PRIMARY KEY,
	Name nvarchar(50)) 
ON StorePS (StoreID)

INSERT INTO Sales.PartitionedStore SELECT CustomerID, Name FROM Sales.store
GO

SELECT StoreID, Name, $partition.StorePF(StoreID)
FROM Sales.PartitionedStore

SELECT $partition.StorePF (349)
SELECT $partition.StorePF (350)
GO

