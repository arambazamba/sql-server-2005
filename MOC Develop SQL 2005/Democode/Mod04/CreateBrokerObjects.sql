USE tempdb
GO

-- Create a message type for an expense claim
CREATE MESSAGE TYPE
   [//Adventure-Works.com/Expenses/ExpenseClaim]
   VALIDATION = WELL_FORMED_XML

-- create a contract for submitting expense claims
CREATE CONTRACT 
   [//Adventure-Works.com/Expenses/ProcessExpense]
   ( [//Adventure-Works.com/Expenses/ExpenseClaim]
      SENT BY INITIATOR
   )

-- create a queue for expense claim messages
CREATE QUEUE ExpenseQueue

-- create a service to process expense claims
CREATE SERVICE [//Adventure-Works.com/ProcessExpense] ON QUEUE ExpenseQueue
   ([//Adventure-Works.com/Expenses/ProcessExpense]) 

-- create a queue for responses
CREATE QUEUE ExpenseQueueResponse

-- create a service for submitting expense claims
CREATE SERVICE [//Adventure-Works.com/SubmitExpense] ON QUEUE ExpenseQueueResponse
   ([//Adventure-Works.com/Expenses/ProcessExpense])
GO

-- create a procedure that submits expense claims
CREATE PROCEDURE SubmitExpense
	(@ExpenseID int, @EmployeeID int, @Expense varchar(100), @Amount money)
AS 
	DECLARE @msgString NVARCHAR(MAX)

	SET @msgString = NCHAR(0xFEFF) 
					+ '<Expense>' 
					+ '<ExpenseID>' + CAST(@ExpenseID as NVARCHAR) + '</ExpenseID>'
					+ '<EmpID>' + CAST(@EmployeeID as NVARCHAR) + '</EmpID>'
					+ '<Expense>' + @Expense + '</Expense>'
					+ '<Amount>' + CAST(@Amount as NVARCHAR)  + '</Amount>'
				+ '</Expense>'
	
	DECLARE @dialog_handle uniqueidentifier

	BEGIN DIALOG CONVERSATION @dialog_handle
	FROM SERVICE [//Adventure-Works.com/SubmitExpense]
	TO SERVICE '//Adventure-Works.com/ProcessExpense'
	ON CONTRACT [//Adventure-Works.com/Expenses/ProcessExpense]

	;SEND ON CONVERSATION @dialog_handle
	MESSAGE TYPE [//Adventure-Works.com/Expenses/ExpenseClaim]
	(@msgString)

GO

-- create a procedure that processes expense claims
CREATE PROCEDURE ProcessExpense
AS
	DECLARE @msgString NVARCHAR(MAX), @dialog_handle uniqueidentifier, @messageTypeName NVARCHAR(256)

	;RECEIVE TOP(1) 
		@dialog_handle = conversation_handle, 
		@msgString = message_body,
		@messageTypeName = message_type_name
	FROM ExpenseQueue

	IF (@@ROWCOUNT = 0) RETURN

	PRINT 'TYPE: ' + @messageTypeName 
	PRINT 'BODY: ' + COALESCE(@msgString, 'NULL')

	END CONVERSATION @dialog_handle
GO

-- create a procedure that processes responses from the expense claim processing service
CREATE PROCEDURE ProcessExpenseResponse
AS
	DECLARE @dialog_handle uniqueidentifier, @messageTypeName NVARCHAR(256)

	;RECEIVE TOP(1) 
		@dialog_handle = conversation_handle, 
		@messageTypeName = message_type_name
	FROM ExpenseQueueResponse

	IF (@@ROWCOUNT = 0) RETURN

	PRINT 'TYPE: ' + @messageTypeName 

	END CONVERSATION @dialog_handle
GO
