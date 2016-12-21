USE AdventureWorks
GO

CREATE TABLE dbo.PendingReviewNotifications
(PendingReviewID integer IDENTITY PRIMARY KEY,
 ProductID integer,
 ProductName nvarchar(50),
 Rating integer,
 Comments nvarchar(2850))
GO

CREATE TRIGGER Production.ReviewNotificationTrigger
ON Production.ProductReview
FOR INSERT
AS
INSERT INTO dbo.PendingReviewNotifications
SELECT i.ProductID, p.Name, i.Rating, i.Comments
FROM inserted i JOIN Production.Product p
ON i.ProductID = p.ProductID
GO

CREATE PROCEDURE dbo.ProcessPendingReviewNotifications
AS
EXECUTE AWReviewServiceAWReviews.dbo.NSEventSubmitBatchProductReviewEvent 
          'AWReviewEventProvider', 
          'SELECT ProductID, ProductName, Rating, Comments FROM AdventureWorks.dbo.PendingReviewNotifications',
	  'TRUNCATE TABLE AdventureWorks.dbo.PendingReviewNotifications'


