use adventureworks
go
create table #Products
(ProductID int identity,
ProductName nvarchar(20),
Price money)

Declare @insertDetails Table
(ProductID int, Insertedby sysname)

Insert into #Products
Output inserted.productid, suser_name() into @insertDetails
values ('Racing Bike', 299.99)

select * from #Products

select * from @insertDetails