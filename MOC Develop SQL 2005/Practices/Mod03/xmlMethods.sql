-- Create a table that includes XML data
USE tempdb
CREATE TABLE #Stores
(StoreID integer IDENTITY PRIMARY KEY,
 StoreName nvarchar(40),
 Manager nvarchar(40),
 Invoices xml)

INSERT INTO #Stores
VALUES
('Astro Mountain Bike Company', 'Jeff Adell', '<InvoiceList xmlns="http://schemas.adventure-works.com/Invoices">
                                                 <Invoice InvoiceNo="1000">
                                                   <Customer>Kim Abercrombie</Customer>
                                                   <Items>
                                                     <Item Product="1" Price="1.99" Quantity="2"/>
                                                     <Item Product="3" Price="2.49" Quantity="1"/>
                                                   </Items>
                                                  </Invoice>
                                                  <Invoice InvoiceNo="1001">
                                                    <Customer>Sean Chai</Customer> 
                                                    <Items>
                                                      <Item Product="1" Price="2.45" Quantity="2"/>
                                                    </Items>
                                                  </Invoice>
                                                </InvoiceList>')

INSERT INTO #Stores
VALUES
('Clocktower Sporting Goods', 'Karen Berge', '<InvoiceList xmlns="http://schemas.adventure-works.com/Invoices">
                                                 <Invoice InvoiceNo="999">
                                                   <Customer>Sarah Akhtar</Customer>
                                                   <Items>
                                                     <Item Product="8" Price="2.99" Quantity="3"/>
                                                   </Items>
                                                  </Invoice>
                                                  <Invoice InvoiceNo="1000">
                                                    <Customer>Bei-Jing Guo</Customer> 
                                                    <Items>
                                                      <Item Product="1" Price="1.95" Quantity="7"/>
                                                      <Item Product="100" Price="112.99" Quantity="1"/>
                                                    </Items>
                                                  </Invoice>
                                                </InvoiceList>')

INSERT INTO #Stores
VALUES
('HiaBuy Toys', 'Scott Cooper', NULL)

-- Use the query method
SELECT StoreName, Invoices.query('declare default namespace="http://schemas.adventure-works.com/Invoices"
                                  <SoldItems>
                                    {
                                      for $i in /InvoiceList/Invoice/Items/Item
                                      return $i
                                    }
                                   </SoldItems>') SoldItems
FROM #Stores

-- Use the value method
SELECT StoreName, Invoices.value('declare default namespace="http://schemas.adventure-works.com/Invoices"
                                  (InvoiceList/Invoice/@InvoiceNo)[1]', 'int') FirstInvoice
FROM #Stores

-- Use the exist method
SELECT StoreName StoresWithInvoices
FROM #Stores
WHERE Invoices.exist('declare default namespace="http://schemas.adventure-works.com/Invoices"
                      InvoiceList/Invoice') = 1

-- Use multiple methods
SELECT StoreName, Invoices.query('declare default namespace="http://schemas.adventure-works.com/Invoices"
                                  <SalePrices>
                                    {
                                      for $i in InvoiceList/Invoice/Items/Item[@Product=1]
                                      return <Product> {$i/@Product} {number($i/@Price)} </Product>
                                    }
                                  </SalePrices>') SalesOfProduct1
FROM #Stores
WHERE Invoices.exist('declare default namespace="http://schemas.adventure-works.com/Invoices"
                      InvoiceList/Invoice/Items/Item[@Product=1]') = 1

-- Bind a relational column
SELECT Invoices.query('declare default namespace="http://schemas.adventure-works.com/Invoices"
                                      <Invoices>
                                        <Store>{sql:column("StoreName")}</Store>
                                        {
                                         for $i in /InvoiceList/Invoice
                                         return $i
                                        }
                                        </Invoices>') InvoicesWithStoreName
FROM #Stores

-- Use the modify method to insert XML
UPDATE #Stores
SET Invoices.modify('declare default namespace ="http://schemas.adventure-works.com/Invoices"
  insert element SalesPerson {"Bill"}
  as first
  into (/InvoiceList/Invoice)[1]')
WHERE StoreID = 1

SELECT Invoices.query('declare default namespace="http://schemas.adventure-works.com/Invoices"
                      (InvoiceList/Invoice)[1]') InsertedSalesPerson
FROM #Stores
WHERE StoreID = 1

-- Use the modify method to update XML
UPDATE #Stores
SET Invoices.modify('declare default namespace ="http://schemas.adventure-works.com/Invoices"
  replace value of (/InvoiceList/Invoice/SalesPerson/text())[1]
  with "Ted"')
WHERE StoreID = 1

SELECT Invoices.query('declare default namespace="http://schemas.adventure-works.com/Invoices"
                      (InvoiceList/Invoice)[1]') UpdatedSalesPerson
FROM #Stores
WHERE StoreID = 1

-- Use the modify method to delete XML
UPDATE #Stores
SET Invoices.modify('declare default namespace ="http://schemas.adventure-works.com/Invoices"
  delete (/InvoiceList/Invoice/SalesPerson)[1]')
WHERE StoreID = 1

SELECT Invoices.query('declare default namespace="http://schemas.adventure-works.com/Invoices"
                      (InvoiceList/Invoice)[1]') DeletedSalesPerson
FROM #Stores
WHERE StoreID = 1

-- Use the nodes method to extract relational data
SELECT nCol.value('../../@InvoiceNo[1]', 'int') InvoiceNo,
       nCol.value('@Product[1]', 'int') ProductID,
       nCol.value('@Price[1]', 'money') Price,
       nCol.value('@Quantity[1]', 'int') Quantity
FROM #Stores CROSS APPLY Invoices.nodes('declare default namespace="http://schemas.adventure-works.com/Invoices" /InvoiceList/Invoice/Items/Item') AS nTable(nCol)
ORDER BY InvoiceNo


DROP TABLE #Stores