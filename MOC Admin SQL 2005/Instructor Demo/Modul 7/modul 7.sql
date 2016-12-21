sp_configure 'clr enabled', 1
go
-- show configuration
sp_configure
reconfigure
go

use adventureworks
go
create schema utilCode

create assembly helperlibrary from
'c:\program files\microsoft learning\2734\practices\mod07\HelperLibrary.dll'

create function utilcode.getosversion()
returns nvarchar(50)
as external name Helperlibrary.Utilities.GetOSVersion

select utilcode.getosversion()