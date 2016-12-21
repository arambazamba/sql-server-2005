USE AdventureWorks
GO

IF exists (select * from dbo.sysobjects where id = object_id(N'[Production].[GetProducts]') and OBJECTPROPERTY(id, N'IsProcedure') = 1)
	DROP PROCEDURE Production.GetProducts
GO


CREATE PROCEDURE Production.GetProducts
AS
	SELECT	ProductID,Name,ListPrice
	FROM	Production.Product
GO

CREATE ENDPOINT AWProduction  
STATE = STARTED 
AS HTTP( 
  PATH = '/AdventureWorks/Production',  
 AUTHENTICATION = (INTEGRATED), 
  PORTS = ( CLEAR )) 
FOR SOAP( 
  WEBMETHOD 'GetProducts'  
    (name='AdventureWorks.Production.GetProducts', 
     FORMAT=ROWSETS_ONLY), 
    WSDL = DEFAULT, 
    DATABASE = 'AdventureWorks', 
    NAMESPACE = 'http://AdventureWorks/' 
 )  
GO 

