USE AdventureWorks
GO

WITH Managers AS 
(
    SELECT	EmployeeID, 
			LoginID, 
			ManagerID, 
			CAST(NULL as nvarchar(100)) AS MgrLogin
    FROM HumanResources.Employee
    WHERE ManagerID IS NULL

	UNION ALL

    SELECT	emp.EmployeeID, 
			emp.LoginID, 
			emp.ManagerID, 
			CAST(mgr.LoginID as nvarchar(100))
	FROM HumanResources.Employee emp INNER JOIN Managers mgr
		ON emp.ManagerID = mgr.EmployeeID 
)
SELECT * FROM Managers ORDER BY ManagerID
--OPTION (MAXRECURSION 5)
--OPTION (MAXRECURSION 4)
