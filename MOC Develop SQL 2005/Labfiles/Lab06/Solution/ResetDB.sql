USE AdventureWorks
GO

DROP TRIGGER Production.ReviewNotificationTrigger
GO

DROP PROCEDURE dbo.ProcessPendingReviewNotifications
GO

DROP TABLE dbo.PendingReviewNotifications
GO

DELETE Production.ProductReview
WHERE ProductID BETWEEN 953 AND 993
GO