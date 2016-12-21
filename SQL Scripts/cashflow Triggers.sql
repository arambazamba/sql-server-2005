SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

ALTER   trigger UpdateValue
on dbo.BelegeChilds
for Update
as
set nocount on
declare @brutto money, @netto money, @ust numeric
select @netto = netto from inserted
select @ust = VarSt from inserted
select @brutto = brutto from inserted

/* Ermöglicht ein wahlweises Updaten der Beträge: netto, brutto, ... */
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
/* Aktiviren des Flags für Privatanteil bei Kontenänderung */
if update(EAKontoID)
begin
	declare @privatAnteil numeric(18,0), @EAKontoID int
	select @EAKontoID = EAKontoID from inserted	
	set @privatAnteil = (Select Privatanteil from EAKonten where EAKontoID=@EAKontoID
	if @privatAnteil>0 
	begin
		Update BelegeChilds
		Set privatAnteil = @privatAnteil
		Where BelegeChilds.BelegChildsID = inserted.BelegChildsID
	end
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

