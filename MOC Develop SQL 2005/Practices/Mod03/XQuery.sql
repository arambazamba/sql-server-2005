DECLARE @xmlDoc xml
SET @xmlDoc = '<InvoiceList>
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

-- SIMPLE PATH
--       '/InvoiceList/Invoice'

-- SIMPLE PATH WITH XQUERY CONDITION
--       '/InvoiceList/Invoice[@InvoiceNo=1000]'

-- FOR-RETURN
--         'for $i in /InvoiceList/Invoice/Items/Item[../../@InvoiceNo=1000]
--          return $i' 

-- FOR-RETURN WITH LITERAL XML
--            '<OrderedItems>
--              {
--                for $i in /InvoiceList/Invoice/Items/Item
--                return $i
--              }
--             </OrderedItems>'

-- FOR-RETURN ATTRIBUTES AND VALUES
--              '<OrderedItems>
--                {
--                  for $i in /InvoiceList/Invoice/Items/Item
--                  return <Product>
--                           {$i/@Quantity}
--                           {string($i/@Product)}
--                         </Product>
--                }
--               </OrderedItems>'

---- FOR-WHERE-RETURN
--                 '<MultiItemInvoices>
--                    {
--                      for $i in /InvoiceList/Invoice
--                      where count($i/Items/Item) > 1
--                      return $i
--                    }
--                  </MultiItemInvoices>'


)


