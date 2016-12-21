USE master 
GO 
-- create the assym. key
CREATE ASYMMETRIC KEY AssemblyKey FROM EXECUTABLE FILE = 'E:\What is News - IAEA\Demos\Unit 2\ClrCode\bin\Debug\clrcode.dll' 
-- create the user associated with it
CREATE LOGIN sampleLogin FROM ASYMMETRIC KEY AssemblyKey
-- give the appropriate permissions
GRANT EXTERNAL ACCESS ASSEMBLY TO samplelogin
-- change db and create the db user
use crl_db
create user sampleLogin for login sampleLogin
go
-- create the assembly
create assembly CLRDemo
authorization sampleLogin
from 'E:\What is News - IAEA\Demos\Unit 2\ClrCode\bin\Debug\clrcode.dll' 
with permission_set = external_access
-- create the sp
create procedure dbo.ImportDataFromCSV(@filename nvarchar(4000))
as external name 
CLRDemo.[Importer].ImportFileContent



use crl_db
go
exec importfilecontent 'E:\What is News - IAEA\Demos\Unit 2\ClrCode\importtemplate.csv'
