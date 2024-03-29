use adventureworks

CREATE TABLE dbo.DataTable (ColA int PRIMARY KEY, ColB int)
CREATE TABLE dbo.ErrorLog (ColA int, ColB int, error int,
date datetime)
GO
CREATE PROCEDURE dbo.AddData @a int, @b int AS
SET XACT_ABORT ON
BEGIN TRY
BEGIN TRAN
INSERT INTO dbo.DataTable VALUES (@a, @b)
COMMIT TRAN
END TRY
BEGIN CATCH TRAN_ABORT
DECLARE @err int
SET @err = @@error --trap the error number
ROLLBACK TRAN
INSERT INTO dbo.ErrorLog VALUES (@a, @b, @err, GETDATE())
END CATCH
GO
EXEC dbo.AddData 1, 1
EXEC dbo.AddData 2, 2
EXEC dbo.AddData 1, 3 --violates the primary key

select * from datatable