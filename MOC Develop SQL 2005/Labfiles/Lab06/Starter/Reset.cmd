@echo off

echo **** Removing the service
net stop ns$AWReviewService

"C:\Program Files\Microsoft SQL Server\90\NotificationServices\9.0.242\bin\nscontrol" unRegister -n "AWReviewService"

echo **** Deleting the instance databases
"C:\Program Files\Microsoft SQL Server\90\NotificationServices\9.0.242\bin\nscontrol" delete -force -name AWReviewService -s localhost

echo **** removing database objects.
sqlcmd -i ResetDB.sql
