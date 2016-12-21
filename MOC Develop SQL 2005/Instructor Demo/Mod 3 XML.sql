use adventureworks

SELECT ProductID, Name, ListPrice 
FROM Production.Product 
FOR XML RAW, ELEMENTS 

-- Using XSINIL with ELEMENTS 
SELECT ProductID, Name, Color 
FROM Production.Product Product 
FOR XML auto, ELEMENTS XSINIL 

-- Using elementsxinil in EXPLICIT mode 
SELECT 1 AS Tag, 
       NULL AS Parent, 
       ProductID AS [Product!1!ProductID], 
       Name AS [Product!1!ProductName!element], 
       Color AS [Product!1!Color!elementxsinil] 
FROM Production.Product 
FOR XML EXPLICIT 

SELECT ProductID, Name, ListPrice 
FROM Production.Product Product 
FOR XML AUTO, XMLSCHEMA 

SELECT ProductID, Name, ListPrice, 
         (SELECT ReviewerName, Comments 
          FROM Production.ProductReview ProductReview 
          WHERE ProductReview.ProductID = Product.ProductID 
          FOR XML AUTO, ELEMENTS, TYPE) 
FROM Production.Product Product 
FOR XML AUTO 

SELECT ProductID AS "@ProductID", 
       Name AS "*", 
       Size AS "Description/@Size", 
       Color AS "Description/text()" 
FROM Production.Product 
FOR XML PATH 

SELECT ProductID, Name, ListPrice 
FROM Production.Product Product 
FOR XML AUTO, ROOT('Products') 


DECLARE @doc xml 
SET @doc = '<?xml version="1.0" ?> 
 <SalesInvoice InvoiceID="1000" CustomerID="123"> 
  <Items> 
    <Item ProductCode="12" Quantity="2" UnitPrice="12.99"/> 
    <Item ProductCode="41" Quantity="1" UnitPrice="17.45"/> 
    <Item ProductCode="2" Quantity="1" UnitPrice="2.99"/> 
  </Items> 
</SalesInvoice>' 
 
DECLARE @docHandle int 
EXEC sp_xml_preparedocument @docHandle OUTPUT, @doc 
 
/*SELECT * FROM 
OPENXML(@docHandle, 'SalesInvoice/Items/Item', 1) 
WITH 
(ProductCode int, 
 Quantity int, 
 UnitPrice smallmoney) */
 

SELECT * FROM 
OPENXML(@docHandle, 'SalesInvoice', 1) 
WITH 
(InvoiceID int, 
 CustomerID int, 
 OrderDate datetime, 
 Items xml 'Items') 

EXEC sp_xml_removedocument @docHandle 
 
go
-- untyped xml

CREATE TABLE Sales.Invoices 
(InvoiceID int, 
 SalesDate datetime, 
 CustomerID int, 
 ItemList xml) 

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

select * from sales.invoices

INSERT INTO Sales.Invoices 
VALUES 
(1, GetDate(), 2, '<Items> 
                     <Item ProductID="2" Quantity="3"/> 
                     <Item ProductID="4" Quantity="1"/> 
                   </Items>') 

select * from sales.invoices

-- Create Schema Collection

CREATE XML SCHEMA COLLECTION ResumeSchemaCollection 
AS 
N'<?xml version="1.0" ?> 
  <xsd:schema  
     targetNamespace= 
           "http://schemas.adventure-works.com/EmployeeResume"  
     xmlns="http://schemas.adventure-works.com/EmployeeResume"  
     elementFormDefault="qualified"  
     attributeFormDefault="unqualified" 
     xmlns:xsd="http://www.w3.org/2001/XMLSchema" > 
    <xsd:element name="resume"> 
      <xsd:complexType> 
        <xsd:sequence> 
          <xsd:element name="name" type="xsd:string"  
                       minOccurs="1" maxOccurs="1"/> 
          <xsd:element name="employmentHistory"> 
            <xsd:complexType> 
              <xsd:sequence minOccurs="1"  
                            maxOccurs="unbounded"> 
                <xsd:element name="employer"> 
                  <xsd:complexType> 
                      <xsd:simpleContent> 
                        <xsd:extension base="xsd:string"> 
                          <xsd:attribute name="endDate"  
                                         use="optional"/> 
                        </xsd:extension> 
                      </xsd:simpleContent> 
                  </xsd:complexType> 
                </xsd:element> 
              </xsd:sequence> 
            </xsd:complexType> 
          </xsd:element> 
        </xsd:sequence> 
      </xsd:complexType> 
    </xsd:element> 
  </xsd:schema>' 

-- ansehen der xml schema collection 

SELECT * FROM sys.xml_schema_collections

-- xml namespaces
SELECT * FROM sys.xml_namespaces

-- use typed xml

CREATE TABLE HumanResources.EmployeeResume 
(EmployeeID int, 
 Resume xml (ResumeSchemaCollection)) 

INSERT INTO HumanResources.EmployeeResume  
VALUES  
(1,  
'<?xml version="1.0" ?> 
 <resume  
    xmlns="http://schemas.adventure-works.com/EmployeeResume"> 
  <name>Guy Gilbert</name> 
  <employmentHistory> 
   <employer endDate="2000-07-07">Northwind Traders</employer> 
   <employer>Adventure Works</employer> 
 </employmentHistory> 
</resume>') 

select * from HumanResources.EmployeeResume 

-- xml index

USE [AdventureWorks]
GO
CREATE CLUSTERED INDEX [clInvoiceID] ON [Sales].[Invoices] 
(
	[InvoiceID] ASC
)WITH (SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF) ON [PRIMARY]

CREATE PRIMARY XML INDEX xidx_Item 
ON Sales.Invoices(ItemList) 

CREATE XML INDEX xidx_ItemPath 
ON Sales.Invoice(ItemList) 
USING XML INDEX xidx_Item 
FOR PATH 

