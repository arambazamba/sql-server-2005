USE AdventureWorks
GO

SET QUOTED_IDENTIFIER ON
GO

-- stored procedure to send customer details to Email service
CREATE PROCEDURE CustomerService.AddNewCustomer
@firstName Name,
@lastName Name,
@emailAddress Name
AS
BEGIN
	DECLARE @message NVARCHAR(MAX)
	SET @message = NCHAR(0xFEFF) 
		+ '<Customer>' 
			+ '<CustomerName>' + @firstName + ' ' + @lastName + '</CustomerName>'
			+ '<EmailAddress>' + @emailAddress + '</EmailAddress>'
		+ '</Customer>'

	DECLARE @conversationHandle UNIQUEIDENTIFIER

	BEGIN DIALOG CONVERSATION @conversationHandle
	FROM SERVICE [//Adventure-Works.com/Sales/CustomerService]
	TO SERVICE '//Adventure-Works.com/Sales/EmailService'
	ON CONTRACT [//Adventure-Works.com/Sales/SendCustomerDetails]

	;SEND ON CONVERSATION @conversationHandle
	MESSAGE TYPE [//Adventure-Works.com/Sales/CustomerDetails]
	(@message)

END
GO

-- log table for received messages
CREATE TABLE CustomerService.MessageLog(
	messageID int IDENTITY PRIMARY KEY,
	queueName nvarchar(25), 
	message nvarchar(max), 
	conversationID uniqueidentifier)
GO

-- stored procedure to log messages
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

-- stored procedure to read and process messages from queue
CREATE PROCEDURE CustomerService.ProcessMessages
AS
	WHILE (1 = 1)
	BEGIN
		DECLARE @conversationHandle UNIQUEIDENTIFIER,
				@messageTypeName NVARCHAR(256)
      
		;RECEIVE TOP(1)
			@conversationHandle = conversation_handle,
			@messageTypeName = message_type_name
		FROM CustomerService.NewCustomerQueue

		IF @@ROWCOUNT = 0
		BEGIN
			EXEC CustomerService.LogMessage 'NewCustomerQueue', 'No further messages found.'
			RETURN
		END

		END CONVERSATION @conversationHandle
		EXEC CustomerService.LogMessage 'NewCustomerQueue', @messageTypeName, @conversationHandle
  END
GO

SET QUOTED_IDENTIFIER OFF
GO