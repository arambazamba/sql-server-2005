-- Update some rows
-- Run on <computer_name>

USE AdventureWorks

UPDATE person.contact 
SET LastName = 'Able' 
WHERE LastName = 'Abel'



-- Query mirror server
-- Run on <computer_name>\sqlinstance2

USE AdventureWorks

SELECT * FROM person.contact


