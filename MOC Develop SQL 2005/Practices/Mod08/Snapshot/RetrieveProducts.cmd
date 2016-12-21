sqlcmd -Y 20 -d AdventureWorks -Q "SET TRANSACTION ISOLATION LEVEL SNAPSHOT; BEGIN TRAN; SELECT ProductID, Name, ListPrice FROM Production.Product WHERE ProductID < 10; COMMIT TRAN"
Pause