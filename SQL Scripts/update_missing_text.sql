USE [CashflowDB]
GO

create function getText (@id as int)
returns nvarchar(50)
as
begin
RETURN(
	select entrytext 
	from dbo.voucher_entry
	where voucherID=@id)
end

-- update - slow but works

declare @myid int
set @myid=269

update voucher set voutext=dbo.gettext(@myid)
where id=@myid


select voutext from voucher where id = @myid
select entrytext from voucher_entry where voucherid = @myid


select * from voucher where voutext=null