-- create endpoint

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

select * from sys.http_endpoints