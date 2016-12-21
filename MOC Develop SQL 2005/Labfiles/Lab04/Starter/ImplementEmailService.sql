USE AdventureWorks
GO

SET QUOTED_IDENTIFIER ON
GO


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

CREATE TABLE EmailService.MessageLog(
	messageID int IDENTITY PRIMARY KEY,
	queueName nvarchar(25), 
	message nvarchar(max), 
	conversationID uniqueidentifier)
GO

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

CREATE PROCEDURE EmailService.ProcessMessages
AS
	WHILE (1 = 1)
	BEGIN

        --##### Add  code to process messages here #####

	END
GO

SET QUOTED_IDENTIFIER OFF
GO


