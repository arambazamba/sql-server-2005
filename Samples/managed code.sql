
------------------------------- Managed Stored Proc ---------------------------------

CREATE DATABASE [CRL_DB] 
go

use crl_db
go

CREATE TABLE [dbo].[Person](
	[PersID] [varchar](4) COLLATE German_PhoneBook_CI_AS NULL,
	[Firstname] [varchar](40) COLLATE German_PhoneBook_CI_AS NULL,
	[Lastname] [varchar](60) COLLATE German_PhoneBook_CI_AS NULL,
	[Age] [int] NULL,
	[JobName] [varchar](40) COLLATE German_PhoneBook_CI_AS NULL,
	[Salary] [decimal](18, 0) NULL
) ON [PRIMARY]
go
CREATE TABLE [dbo].[Manager](
	[PersID] [varchar](4) COLLATE German_PhoneBook_CI_AS NULL,
	[MngLevel] [float] NULL,
	[mngDep] [varchar](50) COLLATE German_PhoneBook_CI_AS NULL
) ON [PRIMARY]

GO
USE master 
GO 
-- create the assym. key
-- syntax sounds strange but public key is loaded from assembly :))
CREATE ASYMMETRIC KEY AssemblyKey FROM EXECUTABLE FILE = 'E:\What is News - IAEA\Demos\Unit 2\ClrCode\bin\Debug\clrcode.dll' 
-- create the user associated with it
CREATE LOGIN sampleLogin FROM ASYMMETRIC KEY AssemblyKey
-- give the appropriate permissions
GRANT EXTERNAL ACCESS ASSEMBLY TO samplelogin
-- change db and create the db user
use clr_db
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
-- execute managed sp
exec ImportDataFromCSV 'E:\What is News - IAEA\Demos\Unit 2\ClrCode\importtemplate.csv'

-- Alternative with automatic deployment

use master
go
ALTER DATABASE [CRL_DB] SET TRUSTWORTHY on 
go
GRANT EXTERNAL ACCESS ASSEMBLY TO "webvision\administrator"
go

-- create the sp
use crl_db
go
create procedure dbo.ImportDataFromCSV(@filename nvarchar(4000))
as external name 
CLRCode.[Importer].ImportFileContent

-- execute managed sp
exec ImportDataFromCSV 'D:\Samples\NET Framework\What is News - IAEA\Demos\Unit 2\ClrCode\importtemplate.csv'

------------------------- UDT -----------------------------------------------------------

create assembly UDTDemo
from 'E:\What is News - IAEA\Demos\Unit 2\UDT\UDT\bin\udt.dll' 

create type MyPoint
external name
UDTDemo.[UDT.Point]

create type IPAddress
external name
UDTDemo.[UDT.IPAddress]

CREATE TABLE [dbo].[Hosts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Host] [nvarchar](50) COLLATE German_PhoneBook_CI_AS NULL,
	[IP] [dbo].[IPAddress] NULL,
 CONSTRAINT [PK_Hosts] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

Insert into hosts (host,ip) values ('mypc','10.11.12.18')

select * from hosts -- :-((

select id, host, ip.ToString() from hosts -- :-))

-------------------- XML ------------------------------------------------

USE [CRL_DB]
GO

CREATE TABLE [dbo].[XMLTable](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[XMLCol] [xml] NULL
) ON [PRIMARY]
GO

insert into xmltable (xmlcol) values ('<begin>myxml</begin>')

declare @myxml xml
set @myxml = convert(xml,'<end><nested>value</nested></end>')
insert into xmltable (xmlcol) values (@myxml)


select convert(nvarchar(1000),xmlcol) from xmltable

-- or if you like it better

select xmlcol from xmltable

-- declare schema

CREATE XML SCHEMA COLLECTION DemoSchema 
AS 
N'<?xml version="1.0" ?> 
  <xsd:schema  
     targetNamespace= 
           "http://schemas.adventure-works.com/EmployeeResume"  
     xmlns="http://schemas.adventure-works.com/EmployeeResume"  
     elementFormDefault="qualified"  
     attributeFormDefault="unqualified" 
     xmlns:xsd="http://www.w3.org/2001/XMLSchema" > 
    <xsd:element name="resume"> 
      <xsd:complexType> 
        <xsd:sequence> 
          <xsd:element name="name" type="xsd:string"  
                       minOccurs="1" maxOccurs="1"/> 
          <xsd:element name="employmentHistory"> 
            <xsd:complexType> 
              <xsd:sequence minOccurs="1"  
                            maxOccurs="unbounded"> 
                <xsd:element name="employer"> 
                  <xsd:complexType> 
                      <xsd:simpleContent> 
                        <xsd:extension base="xsd:string"> 
                          <xsd:attribute name="endDate"  
                                         use="optional"/> 
                        </xsd:extension> 
                      </xsd:simpleContent> 
                  </xsd:complexType> 
                </xsd:element> 
              </xsd:sequence> 
            </xsd:complexType> 
          </xsd:element> 
        </xsd:sequence> 
      </xsd:complexType> 
    </xsd:element> 
  </xsd:schema>' 

-- List Schema Info

SELECT * FROM sys.xml_schema_collections


-- use typed xml

CREATE TABLE dbo.EmployeeResume 
(EmployeeID int, 
 Resume xml (DemoSchema)) 

INSERT INTO dbo.EmployeeResume  
VALUES  
(1,  
'<?xml version="1.0" ?> 
 <resume  
    xmlns="http://schemas.adventure-works.com/EmployeeResume"> 
  <name>Guy Gilbert</name> 
  <employmentHistory> 
   <employer endDate="2000-07-07">Northwind Traders</employer> 
   <employer>Adventure Works</employer> 
 </employmentHistory> 
</resume>') 

select * from dbo.EmployeeResume 
