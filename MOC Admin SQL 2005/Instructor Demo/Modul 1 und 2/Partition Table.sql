use adventureworks
go

CREATE PARTITION FUNCTION emailPF (nvarchar(30))
AS RANGE RIGHT FOR VALUES ('G', 'N')

CREATE PARTITION SCHEME emailPS
AS PARTITION emailPF TO (fg1, fg2, fg3)

CREATE TABLE Sales.CustomerEmail
(CustID int, email nvarchar(30))
ON emailPS (Email)
