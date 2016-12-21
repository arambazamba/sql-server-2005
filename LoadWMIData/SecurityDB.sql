
USE [master]
GO
CREATE DATABASE SecurityDB
go

USE SecurityDB
go

CREATE TABLE [dbo].[Summary](
	[src] [varchar](60) NULL,
	[typ] [varchar](50) NULL
)

CREATE TABLE [dbo].[EventLlog](
	[evtDate] [datetime] NULL,
	[evtTime] [datetime] NULL,
	[source] [varchar](50) NULL,
	[evtType] [varchar](30) NULL,
	[category] [varchar](25) NULL,
	[eventnum] [int] NULL,
	[evtuser] [varchar](50) NULL,
	[machine] [varchar](50) NULL
) 

CREATE TABLE [dbo].[ErrorEvents](
	[Type] [varchar](50) NULL,
	[Date] [varchar](50) NULL,
	[Time] [varchar](50) NULL,
	[Source] [varchar](50) NULL
) 

CREATE TABLE [dbo].[FailureEvents](
	[Type] [varchar](50) NULL,
	[Date] [varchar](50) NULL,
	[Time] [varchar](50) NULL,
	[Source] [varchar](50) NULL


) 

CREATE TABLE [dbo].[SuccessEvents](
	[Type] [varchar](50) NULL,
	[Date] [varchar](50) NULL,
	[Time] [varchar](50) NULL,
	[Source] [varchar](50) NULL


) 

CREATE TABLE [dbo].[WarningEvents](
	[Type] [varchar](50) NULL,
	[Date] [varchar](50) NULL,
	[Time] [varchar](50) NULL,
	[Source] [varchar](50) NULL,
	[Category] [varchar](50) NULL


) 

-- Use this statement to find the amount of data that has been uploaded into the database.
Select 
(Select Count(*) from [dbo].[aggevnt]) as [aggevnt],
(Select Count(*) from [dbo].[ErrorEvents]) as [ErrorEvents],
(Select Count(*) from [dbo].[evntlog]) as [evntlog],
(Select Count(*) from [dbo].[FailureEvents]) as [FailureEvents],
(Select Count(*) from [dbo].[SuccessAuditEvents]) as [SuccessAuditEvents],
(Select Count(*) from [dbo].[WarningEvents]) as [WarningEvents]


