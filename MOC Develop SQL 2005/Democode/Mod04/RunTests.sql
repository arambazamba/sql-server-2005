-- submit expense claims
USE tempdb
GO
EXEC SubmitExpense 1, 123, 'Petrol', 10.50
EXEC SubmitExpense 2, 124, 'Dinner', 70.00
GO

-- view the expense claim processing queue
SELECT * FROM ExpenseQueue ORDER BY queuing_order

-- process the first message in the queue
EXEC ProcessExpense

-- view the response queue
SELECT * FROM ExpenseQueueResponse ORDER BY queuing_order

-- process the first response
EXEC ProcessExpenseResponse

GO
