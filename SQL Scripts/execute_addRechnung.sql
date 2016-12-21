alter  trigger rechnungUpdateValue
on dbo.BelegeRechnung
for Update
as
declare @Einheiten numeric, @Satz money, @NettoBetrag money, @BelegChildsID int
select @Einheiten = RechnungEinheiten from inserted
select @Satz = RechnungSatz from inserted
select @BelegChildsID = BelegeRechnungID from inserted

select @NettoBetrag = @Einheiten * @Satz
select @nettoBetrag

if update(RechnungEinheiten) or update(RechnungSatz)
begin
	
	update BelegeChilds
	set netto = @NettoBetrag
	from inserted
	where BelegeChilds.BelegChildsID = inserted.BelegeRechnungID
end

select * from BelegeRechnung
select * from belegechilds

update BelegeRechnung
set RechnungSatz = 3
--set RechnungEinheiten = 100
where BelegeRechnungID = 5

alter proc addRechnung(
@BelegID int,
@EAKontoID int,
@PositionsText nvarchar(50),
@RechnungVon datetime,
@RechnungBis datetime,
@RechnungEinheit numeric(18,0),
@RechnungSatz money,
@VarSt int,
@BelegChildsID int output
)
as 


insert into BelegeChilds
(BelegID, EAKontoID, PositionsText, varSt)
values
(@BelegID,@EAKontoID,@PositionsText,@VarSt)

set @BelegChildsID = @@identity

insert into BelegeRechnung
(BelegRechnungsID,RechnungVon,RechnungBis,RechnungEinheiten,RechnungSatz)
values
(@BelegChildsID,@RechnungVon,@RechnungBis,@RechnungEinheit,@RechnungSatz)


exec  addRechnung
@BelegID=1, 
@EAKontoID=1,
@PositionsText='sdfsdf',
@RechnungEinheit=5,
@RechnungSatz=400,
@VarSt=20,
@RechnungVon='2004.11.11',
@RechnungBis='2004.11.11', 
@BelegChildsID=null

sp_settriggerorder @triggername = 'setBelegSum', @order = 'last', @stmttype='update'

SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

ALTER  trigger setBelegSum on BelegeChilds after insert, update
as
set nocount on
SET ANSI_WARNINGS OFF
declare @sumNetto money, @sumBrutto money, @sumVarSt money, @BelegID int, @hasChilds int

set @BelegID = (select BelegID from inserted)

select @sumNetto = (select sum(netto) from belegeChilds where BelegID = @BelegID)
select @sumBrutto = (select sum(brutto) from belegeChilds where BelegID = @BelegID)
select @sumVarSt = (select sum(brutto)-sum(netto) as  sumVarSt from belegeChilds where BelegID = @BelegID)
select @hasChilds = (select count(*) from belegeChilds where BelegID = @BelegID)

update Belege
set SumNetto=@sumNetto, SumVarST=@sumVarSt, SumBrutto=@sumBrutto, hasChilds=@hasChilds
where BelegID=@BelegID
set nocount off
SET ANSI_WARNINGS on
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

