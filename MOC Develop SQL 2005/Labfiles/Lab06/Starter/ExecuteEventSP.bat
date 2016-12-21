@Echo off
sqlcmd -d AdventureWorks -Q "EXECUTE dbo.ProcessPendingReviewNotifications"
pause