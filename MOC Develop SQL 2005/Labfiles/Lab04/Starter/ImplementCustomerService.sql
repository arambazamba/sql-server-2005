USE AdventureWorks
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE CustomerService.AddNewCustomer
@firstName Name,
@lastName Name,
@emailAddress Name
AS
BEGIN

	--##### Add code to send message here #####


END

GO
CREATE TABLE CustomerService.MessageLog(
	messageID int IDENTITY PRIMARY KEY,
	queueName nvarchar(25), 
	message nvarchar(max), 
	conversationID uniqueidentifier)
GO

CREATE PROCEDURE CustomerService.LogMessage
(@queuename nvarchar(25), @message nvarchar(max), @conversation_id uniqueidentifier=NULL)
AS
	IF (@conversation_id IS NULL)
		PRINT 'Queue: ' + @queuename 
			+ ' Message: ' + @message
	ELSE
		PRINT 'Queue: ' + @queuename 
			+ ' Message: ' + @message 
			+ ' Conversation: ' + CAST(@conversation_id AS NVARCHAR(MAX))
	
	INSERT INTO CustomerService.MessageLog (queueName, message, conversationID) 
    VALUES (@queuename, @message, @conversation_id)
GO

CREATE PROCEDURE CustomerService.ProcessMessages
AS
	WHILE (1 = 1)
	BEGIN
	--##### Add code to process messages here #####



  END

GO
