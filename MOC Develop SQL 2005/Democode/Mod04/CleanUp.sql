USE tempdb
GO

DROP SERVICE [//Adventure-Works.com/ProcessExpense]
DROP SERVICE [//Adventure-Works.com/SubmitExpense]
DROP QUEUE ExpenseQueue
DROP QUEUE ExpenseQueueResponse
DROP CONTRACT [//Adventure-Works.com/Expenses/ProcessExpense]
DROP MESSAGE TYPE [//Adventure-Works.com/Expenses/ExpenseClaim]
DROP PROCEDURE SubmitExpense
DROP PROCEDURE ProcessExpense
DROP PROCEDURE ProcessExpenseResponse

GO