
CREATE  trigger insertPage on dbo.pages after insert
as 
declare @hasChilds int, @parentpage int

select @parentpage = (select parentPage from inserted)
select @hasChilds = (select count(*) from pages where parentpage = @parentpage)
if (@hasChilds>0)
begin
	update pages
	set haschilds = 1
	where pageid=@parentpage
end

go

CREATE  trigger updatePage on dbo.pages after update
as 
declare @oldParentChilds int, @newParentChilds int, @oldParent int, @newParent int

select @oldParent = (select parentPage from deleted)
select @newParent = (select parentPage from inserted)
select @oldParentChilds = (select count(*) from pages where parentpage = @oldParent)
select @newParentChilds = (select count(*) from pages where parentpage = @newParent)
if (@oldParentChilds<1)
begin
	update pages
	set haschilds = 0
	where pageid=@oldParent
end
if (@newParentChilds>0)
begin
	update pages
	set haschilds = 1
	where pageid=@newParent
end

go
CREATE trigger deletePage on dbo.pages after delete
as 
declare @hasChilds int, @parentpage int

select @parentpage = (select parentPage from deleted)
select @hasChilds = (select count(*) from pages where parentpage = @parentpage)
if (@hasChilds<1)
begin
	update pages
	set haschilds = 0
	where pageid=@parentpage
end

GO


