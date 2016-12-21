-- Enable Service Broker in AdventureWorks database
USE Master
ALTER DATABASE AdventureWorks SET ENABLE_BROKER 
GO

-- Create the service broker objects
USE AdventureWorks
GO

CREATE SCHEMA CustomerService
GO
CREATE SCHEMA EmailService
GO

-- message type used by services to exchange customer details (as XML)
CREATE MESSAGE TYPE [//Adventure-Works.com/Sales/CustomerDetails]
  VALIDATION = WELL_FORMED_XML

-- contract defining the operation used to submit customer details to the Email service
CREATE CONTRACT [//Adventure-Works.com/Sales/SendCustomerDetails]
(
   [//Adventure-Works.com/Sales/CustomerDetails]
   SENT BY INITIATOR
)

-- queue used by the Email service to receive incoming customer details
CREATE QUEUE EmailService.NewCustomerEmailQueue

-- queue used by Customer service to receive responses
CREATE QUEUE CustomerService.NewCustomerQueue

-- The Email service
CREATE SERVICE [//Adventure-Works.com/Sales/EmailService]
ON QUEUE EMailService.NewCustomerEmailQueue
([//Adventure-Works.com/Sales/SendCustomerDetails])

-- The Customer service
CREATE SERVICE [//Adventure-Works.com/Sales/CustomerService]
ON QUEUE CustomerService.NewCustomerQueue

GO

