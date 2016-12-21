USE AdventureWorks
ALTER QUEUE EmailService.NewCustomerEmailQueue 
   WITH STATUS = ON,
   ACTIVATION (
   STATUS=ON,
   PROCEDURE_NAME = EmailService.ProcessMessages,
   MAX_QUEUE_READERS = 1,
   EXECUTE AS SELF)
GO
ALTER QUEUE CustomerService.NewCustomerQueue  
   WITH STATUS = ON,
   ACTIVATION (
   STATUS=ON,
   PROCEDURE_NAME = CustomerService.ProcessMessages,
   MAX_QUEUE_READERS = 1,
   EXECUTE AS SELF)
