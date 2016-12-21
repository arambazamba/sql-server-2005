DECLARE @xmlDoc xml
SET @xmlDoc = '<InvoiceList 
                    xmlns="http://schemas.adventure-works.com/Invoices">
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
                   <Item Product="1" Price="1.99" Quantity="2"/>
                 </Items>
                </Invoice>
               </InvoiceList>'

SELECT @xmlDoc.query(

-- SPECIFY NAMESPACE
--       'declare namespace awi = "http://schemas.adventure-works.com/Invoices" 
--        /awi:InvoiceList/awi:Invoice[@InvoiceNo=1000]'

-- DEFAULT NAMESPACE
--       'declare default namespace = "http://schemas.adventure-works.com/Invoices" 
--        /InvoiceList/Invoice[@InvoiceNo=1000]'

)


