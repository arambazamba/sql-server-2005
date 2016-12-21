-- IMPORTANT: Enable SQL Server Authentication before running this code


-- Execute while logged on as Administrator
USE master
GO
CREATE LOGIN Paul WITH PASSWORD = 'P@ssw0rd'
CREATE LOGIN Mary WITH PASSWORD = 'P@ssw0rd'

USE AdventureWorks
GO
CREATE USER Paul FOR LOGIN Paul
CREATE USER Mary FOR LOGIN Mary


CREATE SCHEMA salesdata
CREATE TABLE salespromotions 
(id integer IDENTITY, name nvarchar(20) )
GRANT ALL ON salespromotions TO Paul
-----------------------------------------------


-- Execute while logged on as Paul
USE AdventureWorks
GO
INSERT salespromotions VALUES ('Summer Sale')

INSERT salesdata.salespromotions VALUES ('Summer Sale')
-----------------------------------------------

-- Execute while logged on as Administrator
USE AdventureWorks
GO
ALTER USER Paul
WITH DEFAULT_SCHEMA = salesdata
-----------------------------------------------


-- Execute while logged on as Paul
USE AdventureWorks
GO
INSERT salespromotions VALUES ('Christmas Offers')
-----------------------------------------------


-- Execute while logged on as Mary
USE AdventureWorks
GO
SELECT * FROM salesdata.salespromotions
-----------------------------------------------


-- Execute while logged on as Administrator
USE AdventureWorks
GO
GRANT SELECT ON SCHEMA::salesdata TO Mary
-----------------------------------------------


-- Execute while logged on as Mary
USE AdventureWorks
GO
SELECT * FROM salesdata.salespromotions
-----------------------------------------------




