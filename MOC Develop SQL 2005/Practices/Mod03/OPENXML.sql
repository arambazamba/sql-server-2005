DECLARE @doc xml
SET @doc = '<?xml version="1.0" ?>
            <SalesInvoice InvoiceID="1000" CustomerID="123" OrderDate="2004-03-07">
              <Items>
                <Item ProductCode="12" Quantity="2" UnitPrice="12.99"/>
                <Item ProductCode="41" Quantity="1" UnitPrice="17.45"/>
                <Item ProductCode="2" Quantity="1" UnitPrice="2.99"/>
              </Items>
            </SalesInvoice>'

DECLARE @docHandle int
EXEC sp_xml_preparedocument @docHandle OUTPUT, @doc

SELECT * FROM
OPENXML(@docHandle, 'SalesInvoice', 1)
WITH
(InvoiceID int,
 CustomerID int,
 OrderDate datetime,
 Items xml 'Items')

EXEC sp_xml_removedocument @docHandle
GO
