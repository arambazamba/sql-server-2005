USE AdventureWorks
GO

-- Retrieve Delivery elements
SELECT DeliveryDriver, DeliveryList.query
	('declare default namespace="http://schemas.adventure-works.com/DeliverySchedule"
     /DeliveryList/Delivery') Deliveries
FROM Sales.DeliverySchedule

--Retrieve Address for first delivery
SELECT DeliveryList.value
	('declare default namespace="http://schemas.adventure-works.com/DeliverySchedule"
     (/DeliveryList/Delivery/Address)[1]', 'nvarchar(100)') DeliveryAddress
FROM Sales.DeliverySchedule
WHERE ScheduleID = 1

--find driver for specific order
SELECT DeliveryDriver
FROM Sales.DeliverySchedule
WHERE DeliveryList.exist
	('declare default namespace="http://schemas.adventure-works.com/DeliverySchedule"
     /DeliveryList/Delivery[@SalesOrderID=43659]') = 1

--Bind relational column
SELECT DeliveryList.query
('declare default namespace="http://schemas.adventure-works.com/DeliverySchedule"
  <DeliveryRoute>
    <RouteNo>{sql:column("DeliveryRoute")}</RouteNo>
    {
      for $d in /DeliveryList/Delivery
      return $d/Address
    }
  </DeliveryRoute>')
FROM Sales.DeliverySchedule

-- Change delivery address
UPDATE Sales.DeliverySchedule
SET DeliveryList.modify
  ('declare default namespace="http://schemas.adventure-works.com/DeliverySchedule"
  replace value of (/DeliveryList/Delivery/Address)[1]
  with "7194 Fourth St. Rockhampton"')
WHERE ScheduleID = 1

SELECT DeliveryList.value
	('declare default namespace="http://schemas.adventure-works.com/DeliverySchedule"
     (/DeliveryList/Delivery/Address)[1]', 'nvarchar(100)')
FROM Sales.DeliverySchedule
WHERE ScheduleID = 1


