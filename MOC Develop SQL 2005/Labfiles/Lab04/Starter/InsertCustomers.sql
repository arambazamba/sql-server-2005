--Add customers
USE AdventureWorks
GO

EXEC CustomerService.AddNewCustomer 
	'Trevor', 
	'Bryant', 
	'administrator@adventure-works.com'

EXEC CustomerService.AddNewCustomer 
	'Caroline', 
	'Russel', 
	'administrator@adventure-works.com'

-- View the Email service queue
SELECT * FROM EmailService.NewCustomerEmailQueue

-- Process the messages in the Email service queue
EXEC EmailService.ProcessMessages

-- Read the Email service log table
SELECT * FROM EmailService.MessageLog

-- View the Customer service queue
SELECT * FROM CustomerService.NewCustomerQueue

-- Process the messages in the Customer service queue
EXEC CustomerService.ProcessMessages

-- Read the Customer service log table
SELECT * FROM CustomerService.MessageLog
