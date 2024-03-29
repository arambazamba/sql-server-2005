USE AdventureWorks
GO

SET QUOTED_IDENTIFIER ON
GO

-- stored procedure used to extract information from the customer details message
CREATE PROCEDURE EmailService.GetDetailsFromXML
(@XMLstring NVARCHAR(MAX), @customerName Name OUTPUT, @emailAddress Name OUTPUT)
AS
	DECLARE @idoc int
	EXEC sp_xml_preparedocument @idoc OUTPUT, @XMLstring

	SELECT	@customerName = CustomerName, 
			@emailAddress = EmailAddress
	FROM OPENXML (@idoc, '/Customer',2) 
	WITH (CustomerName  Name, EmailAddress Name)

	EXEC sp_xml_removedocument @idoc
GO

-- log table for received messages
CREATE TABLE EmailService.MessageLog(
	messageID int IDENTITY PRIMARY KEY,
	queueName nvarchar(25), 
	message nvarchar(max), 
	conversationID uniqueidentifier)
GO

-- stored procedure to log messages
CREATE PROCEDURE EmailService.LogMessage
(@queuename nvarchar(25), @message nvarchar(max), @conversation_id uniqueidentifier=NULL)
AS
	IF (@conversation_id IS NULL)
		PRINT 'Queue: ' + @queuename 
			+ ' Message: ' + @message
	ELSE
		PRINT 'Queue: ' + @queuename 
			+ ' Message: ' + @message 
			+ ' Conversation: ' + CAST(@conversation_id AS NVARCHAR(MAX))
	
	INSERT INTO EmailService.MessageLog (queueName, message, conversationID) 
    VALUES (@queuename, @message, @conversation_id)
GO

-- stored procedure to read and process messages from queue 
CREATE PROCEDURE EmailService.ProcessMessages
AS
	WHILE (1 = 1)
	BEGIN
		DECLARE @conversationHandle UNIQUEIDENTIFIER,
			@messageTypeName NVARCHAR(256),
			@messageBody NVARCHAR(MAX)

		;RECEIVE TOP(1) 
			@conversationHandle = conversation_handle,
			@messageTypeName = message_type_name,
			@messageBody = message_body
		FROM NewCustomerEmailQueue

		IF @@ROWCOUNT = 0
		BEGIN
			EXEC EmailService.LogMessage 'NewCustomerEmailQueue', 'No further messages found.'
			RETURN
		END
  
		IF	@messageTypeName = 'http://schemas.microsoft.com/SQL/ServiceBroker/Error' OR
			@messageTypeName = 'http://schemas.microsoft.com/SQL/ServiceBroker/EndDialog'
		BEGIN
			END CONVERSATION @conversationHandle
			EXEC EmailService.LogMessage 'NewCustomerEmailQueue', @messageTypeName, @conversationHandle
			CONTINUE
		END

		IF @messageTypeName <> '//Adventure-Works.com/Sales/CustomerDetails'
		BEGIN
			END CONVERSATION @conversationHandle
				WITH ERROR = 500
					DESCRIPTION = 'Invalid message type.'
			EXEC EmailService.LogMessage 'NewCustomerEmailQueue', 'Invalid message type found.', @conversationHandle
			CONTINUE
		END

		DECLARE @customerName Name, @emailAddress Name
		EXEC EmailService.GetDetailsFromXML @messageBody, @customerName OUTPUT, @emailAddress OUTPUT

		-- send an email using SQLiMail
		--EXEC sendimail_sp @profile_name = 'Email Service Mail Profile', 
		--				  @recipients= @emailAddress, 
        --                @subject='Welome to Adventure Works', 
		--				  @body='Your account has been created'

		-- log the message
		DECLARE @output NVARCHAR(MAX)
		SET @output = 'Received Customer ' 
				+ @customerName  + '. '
				+ 'Email sent to ' + @emailAddress + '.'

	    EXEC EmailService.LogMessage 'NewCustomerEmailQueue', @output, @conversationHandle

		END CONVERSATION @conversationHandle
	END
GO

SET QUOTED_IDENTIFIER OFF
GO


