-- clean up Service Broker demo
USE AdventureWorks
GO

DROP PROCEDURE CustomerService.AddNewCustomer
DROP TABLE CustomerService.MessageLog
DROP PROCEDURE CustomerService.LogMessage
DROP PROCEDURE CustomerService.ProcessMessages
DROP PROCEDURE EmailService.GetDetailsFromXML
DROP TABLE EmailService.MessageLog
DROP PROCEDURE EmailService.LogMessage
DROP PROCEDURE EmailService.ProcessMessages
DROP SERVICE [//Adventure-Works.com/Sales/EmailService]
DROP SERVICE [//Adventure-Works.com/Sales/CustomerService]
DROP QUEUE EmailService.NewCustomerEmailQueue
DROP QUEUE CustomerService.NewCustomerQueue
DROP CONTRACT [//Adventure-Works.com/Sales/SendCustomerDetails]
DROP MESSAGE TYPE [//Adventure-Works.com/Sales/CustomerDetails]
DROP SCHEMA EmailService
DROP SCHEMA CustomerService
