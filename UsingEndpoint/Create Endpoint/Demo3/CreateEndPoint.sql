USE clrDB

GO

IF EXISTS (SELECT * FROM sys.endpoints WHERE name='PersonEndpoint')
   DROP ENDPOINT PersonEndpoint

GO

create proc ListPersons
as 
return select * from Person

go

create ENDPOINT PersonEndpoint
STATE = STARTED
AS HTTP (
   PATH = '/Person',
   AUTHENTICATION = ( INTEGRATED ),
   PORTS = ( CLEAR ),
	SITE='localhost'
)
FOR SOAP (
   WEBMETHOD 'ListPerson'
      (
       NAME = 'CLRDB.dbo.ListPersons',
       SCHEMA = DEFAULT,
	Format=Rowsets_only

      ),
	WSDL = DEFAULT,
   DATABASE = 'CLRDB',
   NAMESPACE = 'http://webvision.at/demo',
   CHARACTER_SET = XML
)

select * from sys.endpoints

exec listpersons