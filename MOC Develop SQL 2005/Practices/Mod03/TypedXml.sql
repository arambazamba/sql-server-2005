-- Create an xml schema collection for resumes
USE tempdb
CREATE XML SCHEMA COLLECTION ResumeSchemaCollection
AS
N'<?xml version="1.0" ?>
  <xsd:schema 
     targetNamespace="http://schemas.adventure-works.com/EmployeeResume" 
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
              <xsd:sequence minOccurs="1" maxOccurs="unbounded">
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
GO

-- Retrieve information about the schema collection
SELECT * FROM sys.xml_schema_collections
WHERE name = 'ResumeSchemaCollection'

-- Retrieve information about the namespaces in the schema collection
SELECT n.* 
FROM sys.xml_namespaces n
JOIN sys.xml_schema_collections c
ON n.xml_collection_id = c.xml_collection_id
WHERE c.name = 'ResumeSchemaCollection'
GO

-- Retrieve information about the components in the schema collection
SELECT cp.* 
FROM sys.xml_components cp
JOIN sys.xml_schema_collections c
ON cp.xml_collection_id = c.xml_collection_id
WHERE c.name = 'ResumeSchemaCollection'
GO

-- Create a table with a typed xml column for documents
CREATE TABLE #EmployeeResume
(EmployeeID int,
 Resume xml (ResumeSchemaCollection))
GO

--Insert valid XML
INSERT INTO #EmployeeResume
VALUES
(1, '<?xml version="1.0" ?>
     <resume xmlns="http://schemas.adventure-works.com/EmployeeResume">
       <name>Guy Gilbert</name>
       <employmentHistory>
         <employer endDate="2000-07-07">Northwind Traders</employer>
         <employer>Adventure Works</employer>
       </employmentHistory>
     </resume>')

SELECT * FROM #EmployeeResume

-- Try to insert invalid XML (this will fail)
INSERT INTO #EmployeeResume
VALUES
(1, '<?xml version="1.0" ?>
     <resume xmlns = "http://schemas.adventure-works.com/EmployeeResume">
       <name>Guy Gilbert</name>
     </resume>')


-- Use CONTENT keyword
CREATE TABLE #EmployeeResumeContent
(EmployeeID int,
 Resume xml (CONTENT ResumeSchemaCollection))
GO

-- Insert a single document into a CONTENT column
INSERT INTO #EmployeeResumeContent 
VALUES
(1, '<?xml version="1.0" ?>
     <resume xmlns="http://schemas.adventure-works.com/EmployeeResume">
       <name>Guy Gilbert</name>
       <employmentHistory>
         <employer endDate="2000-07-07">Northwind Traders</employer>
         <employer>Adventure Works</employer>
       </employmentHistory>
     </resume>')

SELECT * FROM #EmployeeResumeContent

-- Insert multiple valid elements into a CONTENT column
INSERT INTO #EmployeeResumeContent
VALUES
(1, '
     <resume xmlns="http://schemas.adventure-works.com/EmployeeResume">
       <name>Guy Gilbert</name>
       <employmentHistory>
         <employer endDate="2000-07-07">Northwind Traders</employer>
       </employmentHistory>
     </resume>
     <resume xmlns="http://schemas.adventure-works.com/EmployeeResume">
       <name>Guy Gilbert</name>
       <employmentHistory>
         <employer endDate="2000-07-07">Northwind Traders</employer>
         <employer>Adventure Works</employer>
       </employmentHistory>
     </resume>')

SELECT * FROM #EmployeeResumeContent

-- Use DOCUMENT keyword
CREATE TABLE #EmployeeResumeDocument
(EmployeeID int,
 Resume xml (DOCUMENT ResumeSchemaCollection)) 
GO

-- Insert a single document into a DOCUMENT column
INSERT INTO #EmployeeResumeDocument 
VALUES
(1, '<?xml version="1.0" ?>
     <resume xmlns="http://schemas.adventure-works.com/EmployeeResume">
       <name>Guy Gilbert</name>
       <employmentHistory>
         <employer endDate="2000-07-07">Northwind Traders</employer>
         <employer>Adventure Works</employer>
       </employmentHistory>
     </resume>')

SELECT * FROM #EmployeeResumeDocument

-- Insert multiple valid elements into a DOCUMENT column. This will fail.
INSERT INTO #EmployeeResumeDocument
VALUES
(1, '
     <resume xmlns="http://schemas.adventure-works.com/EmployeeResume">
       <name>Guy Gilbert</name>
       <employmentHistory>
         <employer endDate="2000-07-07">Northwind Traders</employer>
       </employmentHistory>
     </resume>
     <resume xmlns="http://schemas.adventure-works.com/EmployeeResume">
       <name>Guy Gilbert</name>
       <employmentHistory>
         <employer endDate="2000-07-07">Northwind Traders</employer>
         <employer>Adventure Works</employer>
       </employmentHistory>
     </resume>')

SELECT * FROM #EmployeeResumeDocument


-- Try to drop the schema collection
DROP XML SCHEMA COLLECTION ResumeSchemaCollection

--Drop the tables and XML schema collection
DROP TABLE #EmployeeResume
DROP TABLE #EmployeeResumeContent
DROP TABLE #EmployeeResumeDocument
DROP XML SCHEMA COLLECTION ResumeSchemaCollection