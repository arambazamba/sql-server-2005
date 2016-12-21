USE AdventureWorks 
GO 
 
CREATE SCHEMA UtilityCode 
GO 
 
CREATE ASSEMBLY HelperLibrary 
FROM 'C:\Program Files\Microsoft Learning\2734\Practices\Mod07\HelperLibrary.dll' 
GO 
 
CREATE FUNCTION UtilityCode.GetOSVersion () 
RETURNS NVARCHAR(50)  
AS EXTERNAL NAME HelperLibrary.Utilities.GetOSVersion  
GO 
 
SELECT UtilityCode.GetOSVersion() 

select dbo.sayHello()