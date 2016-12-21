use adventureworks

-- Create Demo Table



CREATE TABLE Sales.Invoices 
(InvoiceID int, 
 SalesDate datetime, 
 CustomerID int, 
 ItemList xml)

-- Load Data

DECLARE @itemString nvarchar(2000) 
SET @itemString = '<Items> 
                     <Item ProductID="2" Quantity="3"/> 
                     <Item ProductID="4" Quantity="1"/> 
                   </Items>' 
 
DECLARE @itemDoc xml 
SET @itemDoc = @itemString 
 
INSERT INTO Sales.Invoices 
VALUES 
(1, GetDate(), 2, @itemDoc) 

-- Load Data - Variante 2


INSERT INTO Sales.Invoices 
VALUES 
(1, GetDate(), 2, '<Items> 
                     <Item ProductID="2" Quantity="3"/> 
                     <Item ProductID="4" Quantity="1"/> 
                   </Items>') 

Select * from Sales.invoices