--- Beispiele SQLCMD

SELECT name
FROM sys.databases
GO
:ServerList
go
use adventureworks
go
select * from person.address
go
:out "c:\_anotherout.txt"
select * from person.address
go
:out stdout
:listvar
go


-- Arbeiten mitVariablen
:out "c;\varout.txt"
select addressid, city 
from person.address
where city=$(mycity)
go
