USE AdventureWorks
GO

-- Grant object permissions
GRANT INSERT, SELECT
ON NewProduct 
TO Bill, Ted
GO

-- Grant schema permissions
GRANT INSERT, SELECT 
ON SCHEMA :: MarketingSchema 
TO Ted
GO

-- Grant database permissions
GRANT ALTER ANY SCHEMA
TO Bill

GRANT CONTROL
TO Ted
GO