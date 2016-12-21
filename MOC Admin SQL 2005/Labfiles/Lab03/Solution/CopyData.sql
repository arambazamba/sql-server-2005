DELETE FROM $(DestTab)
GO
INSERT INTO $(DestTab)
SELECT EmployeeID,
       NationalIDNumber, Title, HireDate, BirthDate,
       LoginID, DepartmentID,
       MaritalStatus, Gender
FROM $(SourceTab)
GO
