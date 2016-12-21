-- Create a table with an xml column
USE tempdb

CREATE TABLE #Invoices
(InvoiceID int,
 SalesDate datetime,
 CustomerID int,
 ItemList xml)

-- Use implicit casting to assign an xml variable
DECLARE @itemString nvarchar(2000)
SET @itemString = '<Items>
                     <Item ProductID="2" Quantity="3"/>
                     <Item ProductID="4" Quantity="1"/>
                   </Items>'

DECLARE @itemDoc xml
SET @itemDoc = @itemString

INSERT INTO #Invoices
VALUES
(1, GetDate(), 2, @itemDoc)

SELECT * FROM #Invoices

-- Use implicit casting to assign a string constant
INSERT INTO #Invoices
VALUES
(1, GetDate(), 2, '<Items>
                     <Item ProductID="2" Quantity="3"/>
                     <Item ProductID="4" Quantity="1"/>
                   </Items>')

SELECT * FROM #Invoices

-- Explicitly cast string to xml
DECLARE @varToCast nvarchar(2000)
SET @varToCast = '<Items>
                     <Item ProductID="2" Quantity="3"/>
                     <Item ProductID="4" Quantity="1"/>
                   </Items>'
DECLARE @castedDoc xml
SET @castedDoc = CAST(@varToCast AS xml)

INSERT INTO #Invoices
VALUES
(1, GetDate(), 2, @castedDoc)

SELECT * FROM #Invoices

-- Explicitly convert string to xml
DECLARE @varToConvert nvarchar(2000)
SET @varToConvert = '<Items>
                       <Item ProductID="2" Quantity="3"/>
                       <Item ProductID="4" Quantity="1"/>
                     </Items>'

DECLARE @convertedDoc xml
SET @convertedDoc = CONVERT(xml, @varToConvert)

INSERT INTO #Invoices
VALUES
(1, GetDate(), 2, @convertedDoc)

SELECT * FROM #Invoices

-- Well-formed document. This will succeed
INSERT INTO #Invoices
VALUES
(1, GetDate(), 2, '<?xml version="1.0" ?>
                   <Items>
                     <Item ProductID="2" Quantity="3"/>
                     <Item ProductID="4" Quantity="1"/>
                   </Items>')

SELECT * FROM #Invoices

-- Well-formed fragment. This will succeed
INSERT INTO #Invoices
VALUES
(1, GetDate(), 2, '<Item ProductID="2" Quantity="3"/>
                   <Item ProductID="4" Quantity="1"/>')

SELECT * FROM #Invoices

-- Not well-formed. This will fail
INSERT INTO #Invoices
VALUES
(1, GetDate(), 2, '<Items>
                     <Item ProductID="2" Quantity="3"/>
                     <Item ProductID="4" Quantity="1"/>')

SELECT * FROM #Invoices

