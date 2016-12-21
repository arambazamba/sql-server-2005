USE AdventureWorks
GO

IF EXISTS(SELECT * FROM sys.tables
          WHERE name='DeliveryReport'
          AND schema_id = (SELECT schema_id FROM sys.schemas WHERE name = 'Sales'))
BEGIN
  DROP TABLE Sales.DeliveryReport
END

IF EXISTS(SELECT * FROM sys.tables
          WHERE name='DeliverySchedule'
          AND schema_id = (SELECT schema_id FROM sys.schemas WHERE name = 'Sales'))
BEGIN
  DROP TABLE Sales.DeliverySchedule
END

IF EXISTS(SELECT * FROM sys.xml_schema_collections
          WHERE name='DeliverySchemas')
BEGIN
  DROP XML SCHEMA COLLECTION DeliverySchemas
END

-- Create a table for untyped XML
CREATE TABLE Sales.DeliveryReport
(DeliveryReportID int IDENTITY PRIMARY KEY,
 SalesOrderID int,
 DeliveryDriver nvarchar(20),
 DeliveredFlag bit,
 Comments xml
 )

-- Insert untyped XML
INSERT INTO Sales.DeliveryReport
VALUES
(43659, 'Bill', 0, '<Comment>Address not found</Comment>')

SELECT * FROM Sales.DeliveryReport

-- Create an XML schema collection
CREATE XML SCHEMA COLLECTION DeliverySchemas
AS
N'<?xml version="1.0" ?>
<xs:schema xmlns="http://schemas.adventure-works.com/DeliverySchedule" 
           attributeFormDefault="unqualified" elementFormDefault="qualified" 
           targetNamespace="http://schemas.adventure-works.com/DeliverySchedule" 
           xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <xs:element name="DeliveryList">
    <xs:complexType>
      <xs:sequence>
        <xs:element maxOccurs="unbounded" name="Delivery">
          <xs:complexType>
            <xs:sequence>
              <xs:element name="CustomerName" type="xs:string" />
              <xs:element name="Address" type="xs:string" />
            </xs:sequence>
            <xs:attribute name="SalesOrderID" type="xs:int" />
          </xs:complexType>
        </xs:element>
      </xs:sequence>
    </xs:complexType>
  </xs:element>
</xs:schema>'
GO

SELECT * FROM sys.xml_schema_collections
SELECT * FROM sys.xml_namespaces

-- Create a table for typed XML
CREATE TABLE Sales.DeliverySchedule
(ScheduleID int IDENTITY PRIMARY KEY,
 ScheduleDate DateTime,
 DeliveryRoute int,
 DeliveryDriver nvarchar(20),
 DeliveryList xml(DOCUMENT DeliverySchemas))

-- Insert typed XML
INSERT INTO Sales.DeliverySchedule
VALUES
(GetDate(), 3, 'Bill', '<?xml version="1.0" ?>
                        <DeliveryList xmlns="http://schemas.adventure-works.com/DeliverySchedule">
                          <Delivery SalesOrderID="43659">
                            <CustomerName>Steve Schmidt</CustomerName>
                            <Address>6126 North Sixth Street, Rockhampton</Address>
                          </Delivery>
                          <Delivery SalesOrderID="43660">
                            <CustomerName>Tony Lopez</CustomerName>
                            <Address>6445 Cashew Street, Rockhampton</Address>
                          </Delivery>
                        </DeliveryList>')

SELECT * FROM Sales.DeliverySchedule

