use cashflowdb
go


-- Leistungserlöse
select acct.*
from income_account_type iat inner join account acct
on iat.id=acct.income_account_typeid
inner join voucher_entry ve
on acct.id=ve.accountid
where iat.id=1