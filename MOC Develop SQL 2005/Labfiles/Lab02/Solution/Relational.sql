USE AdventureWorks
GO

CREATE VIEW Sales.OrderDetail
AS
  SELECT	ProductID, 
			YEAR(OrderDate) AS OrderYear, 
			MONTH(OrderDate) AS OrderMonth,
			DAY(OrderDate) AS OrderDay, 
			OrderQty
  FROM		Sales.SalesOrderHeader AS OH
			INNER JOIN Sales.SalesOrderDetail AS OD
				ON OH.SalesOrderID = OD.SalesOrderID
GO

select * from sales.orderdetail

SELECT *
FROM (SELECT OrderYear, OrderMonth, orderqty
      FROM Sales.OrderDetail) AS ORD
 PIVOT
 (
  SUM(orderqty)
  FOR OrderMonth IN([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12])
 ) AS PVT
ORDER BY OrderYear

GO


SELECT OrderYear,
  ISNULL([1],  0) AS Jan,
  ISNULL([2],  0) AS Feb,
  ISNULL([3],  0) AS Mar,
  ISNULL([4],  0) AS Apr,
  ISNULL([5],  0) AS May,
  ISNULL([6],  0) AS Jun,
  ISNULL([7],  0) AS Jul,
  ISNULL([8],  0) AS Aug,
  ISNULL([9],  0) AS Sep,
  ISNULL([10], 0) AS Oct,
  ISNULL([11], 0) AS Nov,
  ISNULL([12], 0) AS Dec
FROM (SELECT OrderYear, OrderMonth, orderqty
      FROM Sales.OrderDetail) AS ORD
 PIVOT
 (
  SUM(orderqty)
  FOR OrderMonth IN([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12])
 ) AS PVT
ORDER BY OrderYear
GO

SELECT OrderYear,
  ISNULL([1],  0) AS Jan,
  ISNULL([2],  0) AS Feb,
  ISNULL([3],  0) AS Mar,
  ISNULL([4],  0) AS Apr,
  ISNULL([5],  0) AS May,
  ISNULL([6],  0) AS Jun,
  ISNULL([7],  0) AS Jul,
  ISNULL([8],  0) AS Aug,
  ISNULL([9],  0) AS Sep,
  ISNULL([10], 0) AS Oct,
  ISNULL([11], 0) AS Nov,
  ISNULL([12], 0) AS Dec INTO Sales.PivotedOrder 
FROM (SELECT OrderYear, OrderMonth, orderqty
      FROM Sales.OrderDetail) AS ORD
 PIVOT
 (
  SUM(orderqty)
  FOR OrderMonth IN([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12])
 ) AS PVT
ORDER BY OrderYear
GO

select * from sales.pivotedorder

SELECT OrderYear, OrderMonth, orderqty
FROM Sales.PivotedOrder UNPIVOT (orderqty FOR OrderMonth IN([Jan],[Feb],[Mar],[Apr],[May],[Jun],[Jul],[Aug],[Sep],[Oct],[Nov],[Dec])) AS UnPVT
