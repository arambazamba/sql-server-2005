@echo off


"C:\Program Files\Microsoft SQL Server\90\NotificationServices\9.0.242\bin\nscontrol" create -in Config.xml

"C:\Program Files\Microsoft SQL Server\90\NotificationServices\9.0.242\bin\nscontrol" register -name "AWReviewService" -server "%COMPUTERNAME%" -service -serviceusername "SQLServer" -servicepassword "P@ssw0rd"

"C:\Program Files\Microsoft SQL Server\90\NotificationServices\9.0.242\bin\nscontrol" enable -name AWReviewService

net start NS$AWReviewService

