USE master
ALTER DATABASE AdventureWorks SET ENABLE_BROKER 
GO

USE AdventureWorks
GO
CREATE SCHEMA CustomerService
GO
CREATE SCHEMA EmailService
GO


CREATE MESSAGE TYPE [//Adventure-Works.com/Sales/CustomerDetails]
  VALIDATION = WELL_FORMED_XML

CREATE CONTRACT [//Adventure-Works.com/Sales/SendCustomerDetails]
(
   [//Adventure-Works.com/Sales/CustomerDetails]
   SENT BY INITIATOR
)

CREATE QUEUE CustomerService.NewCustomerQueue

CREATE QUEUE EmailService.NewCustomerEmailQueue

CREATE SERVICE [//Adventure-Works.com/Sales/CustomerService]
ON QUEUE CustomerService.NewCustomerQueue

CREATE SERVICE [//Adventure-Works.com/Sales/EmailService]
ON QUEUE EMailService.NewCustomerEmailQueue
([//Adventure-Works.com/Sales/SendCustomerDetails])


GO

