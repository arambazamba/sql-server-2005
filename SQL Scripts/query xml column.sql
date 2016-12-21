/** 
alexander.pajer@webvision.at
online references
http://www.15seconds.com/issue/050803.htm
http://www.w3schools.com/xquery/xquery_flwor.asp
MOC 2734
Books Online
*//


CREATE TABLE [dbo].[XMLTable](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[XMLCol] [xml] NULL
) ON [PRIMARY]

truncate table xmltable

insert into xmltable (xmlcol) values ('<InvoiceList>
                 <Invoice InvoiceNo="1001">
                   <Customer>Rajneesh Chandra Mohan</Customer>
                   <Items>
                     <Item Product="1" Price="1.99" Quantity="2"/>
                     <Item Product="3" Price="2.49" Quantity="1"/>
                   </Items>
                 </Invoice>
                 <Invoice InvoiceNo="1000">
                   <Customer>Bhagwan Shree Rajneesh</Customer> 
                 <Items>
                   <Item Product="33" Price="88" Quantity="2"/>
                 </Items>
                </Invoice>
               </InvoiceList>')

insert into xmltable (xmlcol) values ('<InvoiceList>
                 <Invoice InvoiceNo="1007">
                   <Customer>Don Juan Matus</Customer>
                   <Items>
                     <Item Product="1" Price="31.99" Quantity="2"/>
                     <Item Product="3" Price="28" Quantity="1"/>
                   </Items>
                 </Invoice>
                 <Invoice InvoiceNo="1004">
                   <Customer>Questembetsa</Customer> 
                 <Items>
                   <Item Product="1" Price="1.99" Quantity="2"/>
                 </Items>
                </Invoice>
               </InvoiceList>')

insert into xmltable (xmlcol) values ('<InvoiceList>
                 <Invoice InvoiceNo="1002">
                   <Customer>Drunvalo Melchizedek</Customer>
                   <Items>
                     <Item Product="56" Price="99" Quantity="22"/>
                     <Item Product="3" Price="2.49" Quantity="1"/>
                   </Items>
                 </Invoice>
               </InvoiceList>')

select * from xmltable

-- return data starting from the node invoice+

select xmlcol.query('/InvoiceList/Invoice') 
from xmltable

-- return only data from invoice no 1003

select xmlcol.query('/InvoiceList/Invoice[@InvoiceNo="1002"]/Customer') 
from xmltable

-- we can use FLOWER statmens to model the output

select xmlcol.query('
<OurCustomers>
{
	for $i in /InvoiceList/Invoice
	return $i/Customer
}
</OurCustomers>') ColumnAlias
from xmltable

-- using order by		

select xmlcol.query('
<OurCustomers>
{
	for $i in /InvoiceList/Invoice
	order by $i/@InvoiceNo
	return $i/*
}
</OurCustomers>') ColumnAlias
from xmltable

-- modelling again

select xmlcol.query('
<OurCustomers>
{
	for $i in /InvoiceList/Invoice
	order by $i/@InvoiceNo
	return <InvoiceNo>
	{
	number($i/@InvoiceNo)
	}
	{$i/*}
	</InvoiceNo>
}
</OurCustomers>') ColumnAlias
from xmltable

-- using where

select xmlcol.query('<OurCustomers>
{
	for $i in /InvoiceList/Invoice
	where $i/Customer="Don Juan Matus"
	return $i/Customer
}
</OurCustomers>') ColumnAlias
from xmltable

-- make it more convenient to use

create proc up_simplexmlquery(@customer nvarchar(max))
as
select xmlcol.query('<OurCustomers>
{
	for $i in /InvoiceList/Invoice
	where $i/Customer=sql:variable("@customer")
	return $i/Customer
}
</OurCustomers>') ColumnAlias
from xmltable


exec up_simplexmlquery 'Questembetsa'