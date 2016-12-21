use hcbaudb
go
select convert(xml,xmlebenen) as ebene, convert(xml, xmlpreis) as preis
from units

select   convert(xml, xmlProjectContext) as projcontext
from projectdetails

update projectdetails
set xmlProjectContext=null