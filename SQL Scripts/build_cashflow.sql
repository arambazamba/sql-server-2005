--USE [master]
--GO
--/****** Object:  Database [CashflowDB]    Script Date: 08/07/2005 15:32:10 ******/
--CREATE DATABASE [CashflowDB] ON  PRIMARY 
--( NAME = N'CashflowDB', FILENAME = N'G:\_Databases\CashflowDB.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
-- LOG ON 
--( NAME = N'CashflowDB_log', FILENAME = N'D:\_DatabaseLogs\CashflowDB_log.ldf' , SIZE = 3072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
-- COLLATE Latin1_General_CI_AI
--GO
--EXEC dbo.sp_dbcmptlevel @dbname=N'CashflowDB', @new_cmptlevel=90
--GO
--EXEC [CashflowDB].[dbo].[sp_fulltext_database] @action = 'disable'
--GO
--ALTER DATABASE [CashflowDB] SET ANSI_NULL_DEFAULT OFF 
--GO
--ALTER DATABASE [CashflowDB] SET ANSI_NULLS OFF 
--GO
--ALTER DATABASE [CashflowDB] SET ANSI_PADDING OFF 
--GO
--ALTER DATABASE [CashflowDB] SET ANSI_WARNINGS OFF 
--GO
--ALTER DATABASE [CashflowDB] SET ARITHABORT OFF 
--GO
--ALTER DATABASE [CashflowDB] SET AUTO_CLOSE OFF 
--GO
--ALTER DATABASE [CashflowDB] SET AUTO_CREATE_STATISTICS ON 
--GO
--ALTER DATABASE [CashflowDB] SET AUTO_SHRINK OFF 
--GO
--ALTER DATABASE [CashflowDB] SET AUTO_UPDATE_STATISTICS ON 
--GO
--ALTER DATABASE [CashflowDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
--GO
--ALTER DATABASE [CashflowDB] SET CURSOR_DEFAULT  GLOBAL 
--GO
--ALTER DATABASE [CashflowDB] SET CONCAT_NULL_YIELDS_NULL OFF 
--GO
--ALTER DATABASE [CashflowDB] SET NUMERIC_ROUNDABORT OFF 
--GO
--ALTER DATABASE [CashflowDB] SET QUOTED_IDENTIFIER OFF 
--GO
--ALTER DATABASE [CashflowDB] SET RECURSIVE_TRIGGERS OFF 
--GO
--ALTER DATABASE [CashflowDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
--GO
--ALTER DATABASE [CashflowDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
--GO
--ALTER DATABASE [CashflowDB] SET  READ_WRITE 
--GO
--ALTER DATABASE [CashflowDB] SET RECOVERY FULL 
--GO
--ALTER DATABASE [CashflowDB] SET  MULTI_USER 
--GO
--ALTER DATABASE [CashflowDB] SET PAGE_VERIFY CHECKSUM  
--GO
--ALTER DATABASE [CashflowDB] SET DB_CHAINING OFF 
--
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[account]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[account](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[entityID] [int] NOT NULL,
	[income_account_typeID] [int] NULL,
	[accnumber] [int] NULL,
	[accname] [nvarchar](50) NOT NULL,
	[private_quota] [numeric](5, 2) NULL,
 CONSTRAINT [PK_Konto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[asset]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[asset](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[entityID] [int] NOT NULL,
	[voucher_entryID] [int] NOT NULL,
	[asset_name] [nvarchar](50) NOT NULL,
	[asset_activated_on] [smalldatetime] NOT NULL,
	[amortisation_period] [int] NOT NULL,
	[acquisition_value] [money] NOT NULL,
	[actual_value] [money] NOT NULL,
	[ifb] [money] NULL,
	[asset_number] [nvarchar](50) NULL,
 CONSTRAINT [PK_asset] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[cash_account]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[cash_account](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[entity_ID] [int] NULL,
	[account_name] [nvarchar](50) NULL,
	[amount] [numeric](18, 2) NULL,
	[synchronised_date] [smalldatetime] NULL,
 CONSTRAINT [PK_cash_account] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[country]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[country](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_country] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[entity]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[entity](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[countryID] [int] NULL,
	[etnumber] [int] NOT NULL,
	[etname] [nvarchar](50) NOT NULL,
	[etdetails] [ntext] NULL,
	[taxnumber] [nvarchar](50) NULL,
	[sozialinsurance] [nvarchar](50) NULL,
 CONSTRAINT [PK_entity] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'entity specific info serialised as XML ' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'entity', @level2type=N'COLUMN', @level2name=N'etdetails'

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[income_account_type]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[income_account_type](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[income_typeID] [int] NULL,
	[iaccname] [nvarchar](50) NULL,
 CONSTRAINT [PK_income_account_type] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[income_type]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[income_type](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[itname] [nvarchar](50) NULL,
	[expense_flag] [nchar](1) NULL,
 CONSTRAINT [PK_income_type] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[recurring]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[recurring](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[backreference] [int] NULL,
	[entrytext] [nvarchar](50) NULL,
	[estimate_cost] [bit] NULL CONSTRAINT [DF_recurring_estimate_cost]  DEFAULT (0),
	[net_amount] [money] NULL,
	[tax_rate] [numeric](5, 2) NULL,
	[accountID] [int] NULL,
	[tax_free_flag] [bit] NULL,
	[private_quota] [numeric](5, 2) NULL,
	[active] [bit] NULL,
	[start_date] [smalldatetime] NULL,
	[end_date] [smalldatetime] NULL,
	[recurring_interval] [int] NULL CONSTRAINT [DF_recurring_recurring_interval]  DEFAULT (1),
	[recurring_interval_periode] [nvarchar](50) NULL CONSTRAINT [DF_recurring_recurring_interval_periode]  DEFAULT (N'month'),
 CONSTRAINT [PK_recurring] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[sozial_insurance]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[sozial_insurance](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[countryID] [int] NULL,
	[validdate] [smalldatetime] NULL,
 CONSTRAINT [PK_sozial_insurance] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[tax_exceptions]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[tax_exceptions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[tax_moduleID] [int] NULL,
	[exception_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_tax_exceptions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[tax_module]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[tax_module](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[countryID] [int] NULL,
	[validdate] [smalldatetime] NULL,
 CONSTRAINT [PK_tax_module] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[voucher]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[voucher](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[entityID] [int] NULL,
	[customerID] [int] NULL,
	[vounumber] [int] NULL,
	[voutext] [nvarchar](50) NULL,
	[voudate] [smalldatetime] NULL,
	[due_date] [smalldatetime] NULL,
	[paid_date] [smalldatetime] NULL,
 CONSTRAINT [PK_voucher] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[voucher_entry]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[voucher_entry](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[voucherID] [int] NOT NULL,
	[accountID] [int] NULL,
	[entrytext] [nvarchar](50) NULL,
	[net_amount] [money] NULL,
	[tax_rate] [numeric](5, 2) NULL,
	[tax_free_flag] [bit] NULL CONSTRAINT [DF_voucher_entry_tax_free_flag]  DEFAULT (0),
	[private_quota] [numeric](5, 2) NULL CONSTRAINT [DF_voucher_entry_private_quota]  DEFAULT (0),
	[probability] [int] NULL,
 CONSTRAINT [PK_voucher_entry] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW dbo.Kostenübersicht
AS
SELECT     TOP 100 PERCENT dbo.voucher.ID, dbo.voucher.voudate, dbo.voucher.voutext, dbo.voucher_entry.entrytext, dbo.voucher_entry.accountID, 
                      dbo.voucher_entry.net_amount, dbo.account.private_quota, dbo.voucher_entry.tax_rate
FROM         dbo.voucher INNER JOIN
                      dbo.voucher_entry ON dbo.voucher.ID = dbo.voucher_entry.voucherID INNER JOIN
                      dbo.account ON dbo.voucher_entry.accountID = dbo.account.ID
WHERE     (dbo.voucher_entry.accountID <> 1) AND (dbo.voucher.voudate > CONVERT(DATETIME, '2005-01-01 00:00:00', 102))
ORDER BY dbo.voucher.voudate

GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[up_getExpenses]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE  PROCEDURE dbo.up_getExpenses
(@entityID int)
AS
	SET NOCOUNT ON;
SELECT     income_type.itname, income_account_type.iaccname, account.accname, voucher_entry.net_amount, voucher_entry.tax_rate, 
                      voucher_entry.net_amount * voucher_entry.tax_rate / 100 AS tax, 
                      voucher_entry.net_amount + voucher_entry.net_amount * voucher_entry.tax_rate / 100 AS brutto_amount, 
                      voucher_entry.net_amount * account.private_quota / 100 AS private_quota_money
FROM         income_account_type INNER JOIN
                      account ON income_account_type.ID = account.income_account_typeID INNER JOIN
                      voucher_entry ON account.ID = voucher_entry.accountID INNER JOIN
                      voucher ON voucher_entry.voucherID = voucher.ID INNER JOIN
                      income_type ON income_account_type.income_typeID = income_type.ID INNER JOIN
                      entity ON account.entityID = entity.ID AND voucher.entityID = entity.ID
WHERE     (income_type.expense_flag = N''-'') AND (entity.ID = @entityid)
order by income_type.itname, income_account_type.iaccname
' 
END
GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getText]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'create function getText (@id as int)
returns nvarchar(50)
as
begin
declare @text nvarchar(50)
set @text=(select entrytext from voucher_entry where voucherid=@id)
return @text
end' 
END

GO
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'FK_account_entity') AND parent_object_id = OBJECT_ID(N'[dbo].[account]'))
ALTER TABLE [dbo].[account]  WITH NOCHECK ADD  CONSTRAINT [FK_account_entity] FOREIGN KEY(	[entityID])
REFERENCES [dbo].[entity] (	[ID])
GO
ALTER TABLE [dbo].[account] CHECK CONSTRAINT [FK_account_entity]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'FK_account_income_account_type') AND parent_object_id = OBJECT_ID(N'[dbo].[account]'))
ALTER TABLE [dbo].[account]  WITH NOCHECK ADD  CONSTRAINT [FK_account_income_account_type] FOREIGN KEY(	[income_account_typeID])
REFERENCES [dbo].[income_account_type] (	[ID])
GO
ALTER TABLE [dbo].[account] CHECK CONSTRAINT [FK_account_income_account_type]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'FK_asset_voucher_entry') AND parent_object_id = OBJECT_ID(N'[dbo].[asset]'))
ALTER TABLE [dbo].[asset]  WITH NOCHECK ADD  CONSTRAINT [FK_asset_voucher_entry] FOREIGN KEY(	[voucher_entryID])
REFERENCES [dbo].[voucher_entry] (	[ID])
GO
ALTER TABLE [dbo].[asset] CHECK CONSTRAINT [FK_asset_voucher_entry]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'FK_cash_account_entity') AND parent_object_id = OBJECT_ID(N'[dbo].[cash_account]'))
ALTER TABLE [dbo].[cash_account]  WITH CHECK ADD  CONSTRAINT [FK_cash_account_entity] FOREIGN KEY(	[entity_ID])
REFERENCES [dbo].[entity] (	[ID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'FK_entity_country') AND parent_object_id = OBJECT_ID(N'[dbo].[entity]'))
ALTER TABLE [dbo].[entity]  WITH CHECK ADD  CONSTRAINT [FK_entity_country] FOREIGN KEY(	[countryID])
REFERENCES [dbo].[country] (	[ID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'FK_income_account_type_income_type') AND parent_object_id = OBJECT_ID(N'[dbo].[income_account_type]'))
ALTER TABLE [dbo].[income_account_type]  WITH NOCHECK ADD  CONSTRAINT [FK_income_account_type_income_type] FOREIGN KEY(	[income_typeID])
REFERENCES [dbo].[income_type] (	[ID])
GO
ALTER TABLE [dbo].[income_account_type] CHECK CONSTRAINT [FK_income_account_type_income_type]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'FK_sozial_insurance_country') AND parent_object_id = OBJECT_ID(N'[dbo].[sozial_insurance]'))
ALTER TABLE [dbo].[sozial_insurance]  WITH CHECK ADD  CONSTRAINT [FK_sozial_insurance_country] FOREIGN KEY(	[countryID])
REFERENCES [dbo].[country] (	[ID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'FK_tax_exceptions_tax_module') AND parent_object_id = OBJECT_ID(N'[dbo].[tax_exceptions]'))
ALTER TABLE [dbo].[tax_exceptions]  WITH NOCHECK ADD  CONSTRAINT [FK_tax_exceptions_tax_module] FOREIGN KEY(	[tax_moduleID])
REFERENCES [dbo].[tax_module] (	[ID])
GO
ALTER TABLE [dbo].[tax_exceptions] CHECK CONSTRAINT [FK_tax_exceptions_tax_module]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'FK_tax_module_country') AND parent_object_id = OBJECT_ID(N'[dbo].[tax_module]'))
ALTER TABLE [dbo].[tax_module]  WITH NOCHECK ADD  CONSTRAINT [FK_tax_module_country] FOREIGN KEY(	[countryID])
REFERENCES [dbo].[country] (	[ID])
GO
ALTER TABLE [dbo].[tax_module] CHECK CONSTRAINT [FK_tax_module_country]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'FK_voucher_entity') AND parent_object_id = OBJECT_ID(N'[dbo].[voucher]'))
ALTER TABLE [dbo].[voucher]  WITH NOCHECK ADD  CONSTRAINT [FK_voucher_entity] FOREIGN KEY(	[entityID])
REFERENCES [dbo].[entity] (	[ID])
GO
ALTER TABLE [dbo].[voucher] CHECK CONSTRAINT [FK_voucher_entity]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'FK_voucher_entry_account') AND parent_object_id = OBJECT_ID(N'[dbo].[voucher_entry]'))
ALTER TABLE [dbo].[voucher_entry]  WITH NOCHECK ADD  CONSTRAINT [FK_voucher_entry_account] FOREIGN KEY(	[accountID])
REFERENCES [dbo].[account] (	[ID])
GO
ALTER TABLE [dbo].[voucher_entry] CHECK CONSTRAINT [FK_voucher_entry_account]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'FK_voucher_entry_voucher') AND parent_object_id = OBJECT_ID(N'[dbo].[voucher_entry]'))
ALTER TABLE [dbo].[voucher_entry]  WITH NOCHECK ADD  CONSTRAINT [FK_voucher_entry_voucher] FOREIGN KEY(	[voucherID])
REFERENCES [dbo].[voucher] (	[ID])
GO
ALTER TABLE [dbo].[voucher_entry] CHECK CONSTRAINT [FK_voucher_entry_voucher]
GO
