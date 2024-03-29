
USE AdventureWorks 

SELECT EmployeeID, ManagerID 
FROM HumanResources.Employee 
WHERE ManagerID = 21 

-- deaktiviren des Index

USE AdventureWorks 
ALTER INDEX IX_Employee_ManagerID 
ON HumanResources.Employee 
DISABLE 

-- rebuilding the index
USE AdventureWorks 
ALTER INDEX IX_Employee_ManagerID 
ON HumanResources.Employee 
REBUILD 

-- Anzeigen der Fragmentierung eines Index
SELECT 
  TableName, IndexName, AvgFragmentation 
FROM sys.fn_indexinfo(DEFAULT, '*', DEFAULT, 'DETAILED') 