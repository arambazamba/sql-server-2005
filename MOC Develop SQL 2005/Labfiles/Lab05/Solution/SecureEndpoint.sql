-- Secure the HTTP endpoint:
USE Master
GO
GRANT CONNECT ON ENDPOINT:: AWProduction TO [SQL2005PC\Peter]
GO

USE AdventureWorks
GO

GRANT EXECUTE ON Production.GetProducts TO [Peter]
GO