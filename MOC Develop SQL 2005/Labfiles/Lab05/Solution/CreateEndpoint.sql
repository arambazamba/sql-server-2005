-- Create the HTTP endpoint
USE master
GO

IF EXISTS(SELECT * FROM sys.http_endpoints WHERE name = 'AWProduction')
BEGIN
	DROP ENDPOINT AWProduction
END
GO

CREATE ENDPOINT AWProduction 
STATE = STARTED
AS HTTP(
	PATH = '/AdventureWorks/Production', 
	AUTHENTICATION = (INTEGRATED),
	PORTS = ( CLEAR ))
FOR SOAP(
	WEBMETHOD 'GetProducts' (name='AdventureWorks.Production.GetProducts',FORMAT=ROWSETS_ONLY),
	WEBMETHOD 'UpdateProductPrice' (name='AdventureWorks.Production.UpdateProductPrice'),
		WSDL = DEFAULT,
		DATABASE = 'AdventureWorks',
		NAMESPACE = 'http://AdventureWorks/'
	) 
GO



