use adventureworks
Select * from person.contact
go
create login homer with password='homer'

use demodb
go
create schema myschema
go
create table myschema.largeTable (varCol varchar(max))

create table myschema.xmltable (idCol int, xmlCol xml)

select * from myschema.xmltable