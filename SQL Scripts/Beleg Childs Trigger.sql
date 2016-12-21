SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

CREATE   trigger setBelegSum on dbo.BelegeChilds after insert, update
as
set nocount on
SET ANSI_WARNINGS OFF
declare @sumNetto money, @sumBrutto money, @sumVarSt money, @BelegID int, @BelegChilds int

set @BelegID = (select BelegID from inserted)

select @sumNetto = (select sum(netto) from belegeChilds where BelegID = @BelegID)
select @sumBrutto = (select sum(brutto) from belegeChilds where BelegID = @BelegID)
select @sumVarSt = (select sum(brutto)-sum(netto) as  sumVarSt from belegeChilds where BelegID = @BelegID)
select @BelegChilds = (select count(*) from belegeChilds where BelegID = @BelegID)

update Belege
set SumNetto=@sumNetto, SumVarST=@sumVarSt, SumBrutto=@sumBrutto, BelegChilds=@BelegChilds
where BelegID=@BelegID
set nocount off
SET ANSI_WARNINGS on

GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

Create trigger insertBelegChild
on dbo.BelegeChilds
for insert
as
set nocount on

/* Ermöglicht ein wahlweises Eingeben der Beträge: netto, brutto, ... */
declare @brutto money, @netto money, @ust numeric
set @netto = (select netto from inserted)
set @ust = (select VarSt from inserted)
set @brutto = (select brutto from inserted)
if @ust is null 
begin
	select @ust = 20
	update BelegeChilds
	set VarSt = @ust
	from inserted
	where BelegeChilds.BelegChildsID = inserted.BelegChildsID	
end
if (@netto is null) 
begin
	set @netto = @brutto / (1 + @ust / 100)
	update BelegeChilds
	set netto = @netto
	from inserted
	where BelegeChilds.BelegChildsID = inserted.BelegChildsID
end

if (@brutto is null)
begin 
	set @brutto = @netto + @netto * (@ust /100)
	update BelegeChilds
	set brutto = @brutto
	from inserted
	where BelegeChilds.BelegChildsID = inserted.BelegChildsID
end

/* Protokollierung der Änderung */
declare @currentUser nvarchar(40), @currentTime datetime
select @currentUser = SUSER_SNAME()
select @currentTime = current_timestamp

	update belegeChilds
	set CreatedBy = @currentuser, CreatedOn = @currentTime
	from inserted
	where belegechilds.belegchildsid = inserted.belegchildsid
set nocount off


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

Create Trigger updateBelegChild
on dbo.BelegeChilds
for Update
as
set nocount on

/* Ermöglicht ein wahlweises Updaten der Beträge: netto, brutto, ... */
declare @brutto money, @netto money, @ust numeric
select @netto = netto from inserted
select @ust = VarSt from inserted
select @brutto = brutto from inserted
if @ust is null 
begin
	select @ust = 20
	update BelegeChilds
	set VarSt = @ust
	from inserted
	where BelegeChilds.BelegChildsID = inserted.BelegChildsID	
end

if update(brutto)
begin
	select @netto = @brutto / (1 + @ust / 100)
	update BelegeChilds
	set netto = @netto
	from inserted
	where BelegeChilds.BelegChildsID = inserted.BelegChildsID
end

if update(netto)
begin
	set @brutto = @netto + @netto * (@ust /100)
	update BelegeChilds
	set brutto = @brutto
	from inserted
	where BelegeChilds.BelegChildsID = inserted.BelegChildsID
end

if update(VarSt)
begin
	set @brutto = @netto + @netto * (@ust /100)
	update BelegeChilds
	set brutto = @brutto
	from inserted
	where BelegeChilds.BelegChildsID = inserted.BelegChildsID
end

/* Protokollierung der Änderung */
declare @currentUser nvarchar(40), @currentTime datetime
select @currentUser = SUSER_SNAME()
select @currentTime = current_timestamp

	update belegeChilds
	set ModifiedBy = @currentuser, ModifiedON = @currentTime
	from inserted
	where belegechilds.belegchildsid = inserted.belegchildsid
set nocount off


GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

