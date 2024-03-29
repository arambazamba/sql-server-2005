USE AdventureWorks
GO

-- table for batches of events
CREATE TABLE dbo.PendingReviewNotifications
(PendingReviewID integer IDENTITY PRIMARY KEY,
 ProductID integer,
 ProductName nvarchar(50),
 Rating integer,
 Comments nvarchar(2850))
GO

-- trigger to add an event to the batch when a product is reviewed
CREATE TRIGGER Production.ReviewNotificationTrigger
ON Production.ProductReview
FOR INSERT
AS
INSERT INTO dbo.PendingReviewNotifications
SELECT i.ProductID, p.Name, i.Rating, i.Comments
FROM inserted i JOIN Production.Product p
ON i.ProductID = p.ProductID
GO

-- Procedure to submit a batch of events
CREATE PROCEDURE dbo.ProcessPendingReviewNotifications
AS
-- ##### Add code to submit event batch #####



