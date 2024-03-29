-- Replace COMPUTER_NAME with the name of your computer
-- throughout this script

USE master
GO

CREATE LOGIN [COMPUTER_NAME\Bill]
FROM WINDOWS
WITH DEFAULT_DATABASE = AdventureWorks

CREATE LOGIN [COMPUTER_NAME\Ted]
FROM WINDOWS
WITH DEFAULT_DATABASE = AdventureWorks
GO

Use AdventureWorks
GO
CREATE USER Bill For LOGIN [COMPUTER_NAME\Bill]
CREATE USER Ted For LOGIN [COMPUTER_NAME\Ted]
GO


