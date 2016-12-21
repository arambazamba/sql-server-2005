SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[country]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[country](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_country] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[income_type]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[income_type](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[itname] [nvarchar](50) NULL,
	[expense_flag] [nchar](1) NULL,
 CONSTRAINT [PK_income_type] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[recurring]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[recurring](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[backreference] [int] NULL,
	[entrytext] [nvarchar](50) NULL,
	[estimate_cost] [bit] NULL CONSTRAINT [DF_recurring_estimate_cost]  DEFAULT ((0)),
	[net_amount] [money] NULL,
	[tax_rate] [numeric](5, 2) NULL,
	[accountID] [int] NULL,
	[tax_free_flag] [bit] NULL,
	[private_quota] [numeric](5, 2) NULL,
	[active] [bit] NULL,
	[start_date] [smalldatetime] NULL,
	[end_date] [smalldatetime] NULL,
	[recurring_interval] [int] NULL CONSTRAINT [DF_recurring_recurring_interval]  DEFAULT ((1)),
	[recurring_interval_periode] [nvarchar](50) NULL CONSTRAINT [DF_recurring_recurring_interval_periode]  DEFAULT (N'month'),
 CONSTRAINT [PK_recurring] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sysdiagrams]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sysdiagrams](
	[name] [sysname] NOT NULL,
	[principal_id] [int] NOT NULL,
	[diagram_id] [int] IDENTITY(1,1) NOT NULL,
	[version] [int] NULL,
	[definition] [varbinary](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[diagram_id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_principal_name] UNIQUE NONCLUSTERED 
(
	[principal_id] ASC,
	[name] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[fn_diagramobjects]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'
	CREATE FUNCTION [dbo].[fn_diagramobjects]() 
	RETURNS int
	WITH EXECUTE AS N''dbo''
	AS
	BEGIN
		declare @id_upgraddiagrams		int
		declare @id_sysdiagrams			int
		declare @id_helpdiagrams		int
		declare @id_helpdiagramdefinition	int
		declare @id_creatediagram	int
		declare @id_renamediagram	int
		declare @id_alterdiagram 	int 
		declare @id_dropdiagram		int
		declare @InstalledObjects	int

		select @InstalledObjects = 0

		select 	@id_upgraddiagrams = object_id(N''dbo.sp_upgraddiagrams''),
			@id_sysdiagrams = object_id(N''dbo.sysdiagrams''),
			@id_helpdiagrams = object_id(N''dbo.sp_helpdiagrams''),
			@id_helpdiagramdefinition = object_id(N''dbo.sp_helpdiagramdefinition''),
			@id_creatediagram = object_id(N''dbo.sp_creatediagram''),
			@id_renamediagram = object_id(N''dbo.sp_renamediagram''),
			@id_alterdiagram = object_id(N''dbo.sp_alterdiagram''), 
			@id_dropdiagram = object_id(N''dbo.sp_dropdiagram'')

		if @id_upgraddiagrams is not null
			select @InstalledObjects = @InstalledObjects + 1
		if @id_sysdiagrams is not null
			select @InstalledObjects = @InstalledObjects + 2
		if @id_helpdiagrams is not null
			select @InstalledObjects = @InstalledObjects + 4
		if @id_helpdiagramdefinition is not null
			select @InstalledObjects = @InstalledObjects + 8
		if @id_creatediagram is not null
			select @InstalledObjects = @InstalledObjects + 16
		if @id_renamediagram is not null
			select @InstalledObjects = @InstalledObjects + 32
		if @id_alterdiagram  is not null
			select @InstalledObjects = @InstalledObjects + 64
		if @id_dropdiagram is not null
			select @InstalledObjects = @InstalledObjects + 128
		
		return @InstalledObjects 
	END
	' 
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[sozial_insurance]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[sozial_insurance](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[countryID] [int] NULL,
	[validdate] [smalldatetime] NULL,
 CONSTRAINT [PK_sozial_insurance] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tax_module]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tax_module](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[countryID] [int] NULL,
	[validdate] [smalldatetime] NULL,
 CONSTRAINT [PK_tax_module] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[entity]') AND type in (N'U'))
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
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'entity specific info serialised as XML ' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'entity', @level2type=N'COLUMN', @level2name=N'etdetails'

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[voucher]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[voucher](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[EntityID] [int] NOT NULL,
	[CustomerID] [int] NULL,
	[Type] [int] NULL,
	[Number] [nvarchar](10) COLLATE Latin1_General_CI_AI NULL,
	[Description] [nvarchar](100) COLLATE Latin1_General_CI_AI NULL,
	[CreateDate] [smalldatetime] NULL,
	[DueDate] [smalldatetime] NULL,
	[PaidDate] [smalldatetime] NULL,
 CONSTRAINT [PK_voucher] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The Type of the Voucher' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'voucher', @level2type=N'COLUMN', @level2name=N'TypeEnum'

GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A textual description about the Voucher' ,@level0type=N'SCHEMA', @level0name=N'dbo', @level1type=N'TABLE', @level1name=N'voucher', @level2type=N'COLUMN', @level2name=N'Description'

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[account]') AND type in (N'U'))
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
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cash_account]') AND type in (N'U'))
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
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[income_account_type]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[income_account_type](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[income_typeID] [int] NULL,
	[iaccname] [nvarchar](50) NULL,
 CONSTRAINT [PK_income_account_type] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tax_exceptions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tax_exceptions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[tax_moduleID] [int] NULL,
	[exception_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_tax_exceptions] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[asset]') AND type in (N'U'))
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
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[voucher_entry]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[voucher_entry](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[voucherID] [int] NOT NULL,
	[accountID] [int] NULL,
	[Text] [nvarchar](50) NULL,
	[netAamount (money, null)] [money] NULL,
	[taxRate (numeric(5,2), null)] [numeric](5, 2) NULL,
	[TaxFree (bit, null) (bit, null)] [bit] NULL CONSTRAINT [DF_voucher_entry_tax_free_flag]  DEFAULT ((0)),
	[privateQuota (numeric(5,2), null)] [numeric](5, 2) NULL CONSTRAINT [DF_voucher_entry_private_quota]  DEFAULT ((0)),
	[probability] [int] NULL,
 CONSTRAINT [PK_voucher_entry] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[up_getExpenses]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE  PROCEDURE [dbo].[up_getExpenses]
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
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[getText]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'create function [dbo].[getText] (@id as int)
returns nvarchar(50)
as
begin
RETURN(
	select entrytext 
	from dbo.voucher_entry
	where voucherID=@id)
end' 
END

GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[Kostenübersicht]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[Kostenübersicht]
AS
SELECT     TOP 100 PERCENT dbo.voucher.ID, dbo.voucher.voudate, dbo.voucher.voutext, dbo.voucher_entry.entrytext, dbo.voucher_entry.accountID, 
                      dbo.voucher_entry.net_amount, dbo.account.private_quota, dbo.voucher_entry.tax_rate
FROM         dbo.voucher INNER JOIN
                      dbo.voucher_entry ON dbo.voucher.ID = dbo.voucher_entry.voucherID INNER JOIN
                      dbo.account ON dbo.voucher_entry.accountID = dbo.account.ID
WHERE     (dbo.voucher_entry.accountID <> 1) AND (dbo.voucher.voudate > CONVERT(DATETIME, ''2005-01-01 00:00:00'', 102))
ORDER BY dbo.voucher.voudate

' 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[up_UpdateVoucherEntry]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[up_UpdateVoucherEntry]
(
	@voucherID int,
	@accountID int,
	@entryText nvarchar(50),
	@p1 money,
	@p4 numeric(5, 2),
	@p7 numeric(5, 2),
	@probability int,
	@p10 bit,
	@Original_ID int,
	@Original_voucherID int,
	@IsNull_accountID int,
	@Original_accountID int,
	@IsNull_entryText nvarchar(50),
	@Original_entryText nvarchar(50),
	@p3 money,
	@p2 money,
	@p6 numeric(5, 2),
	@p5 numeric(5, 2),
	@p9 numeric(5, 2),
	@p8 numeric(5, 2),
	@IsNull_probability int,
	@Original_probability int,
	@p12 bit,
	@p11 bit,
	@ID int
)
AS
	SET NOCOUNT OFF;
UPDATE [voucher_entry] SET [voucherID] = @voucherID, [accountID] = @accountID, [entryText] = @entryText, [netAamount (money, null)] = @p1, [taxRate (numeric(5,2), null)] = @p4, [privateQuota (numeric(5,2), null)] = @p7, [probability] = @probability, [TaxFree (bit, null) (bit, null)] = @p10 WHERE (([ID] = @Original_ID) AND ([voucherID] = @Original_voucherID) AND ((@IsNull_accountID = 1 AND [accountID] IS NULL) OR ([accountID] = @Original_accountID)) AND ((@IsNull_entryText = 1 AND [entryText] IS NULL) OR ([entryText] = @Original_entryText)) AND ((@p3 = 1 AND [netAamount (money, null)] IS NULL) OR ([netAamount (money, null)] = @p2)) AND ((@p6 = 1 AND [taxRate (numeric(5,2), null)] IS NULL) OR ([taxRate (numeric(5,2), null)] = @p5)) AND ((@p9 = 1 AND [privateQuota (numeric(5,2), null)] IS NULL) OR ([privateQuota (numeric(5,2), null)] = @p8)) AND ((@IsNull_probability = 1 AND [probability] IS NULL) OR ([probability] = @Original_probability)) AND ((@p12 = 1 AND [TaxFree (bit, null) (bit, null)] IS NULL) OR ([TaxFree (bit, null) (bit, null)] = @p11)));
	
SELECT ID, voucherID, accountID, entryText, [netAamount (money, null)], [taxRate (numeric(5,2), null)], [privateQuota (numeric(5,2), null)], probability, [TaxFree (bit, null) (bit, null)] FROM voucher_entry WHERE (ID = @ID)' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[up_DeleteVoucherEntry]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[up_DeleteVoucherEntry]
(
	@Original_ID int,
	@Original_voucherID int,
	@IsNull_accountID int,
	@Original_accountID int,
	@IsNull_entryText nvarchar(50),
	@Original_entryText nvarchar(50),
	@p3 money,
	@p2 money,
	@p6 numeric(5, 2),
	@p5 numeric(5, 2),
	@p9 numeric(5, 2),
	@p8 numeric(5, 2),
	@IsNull_probability int,
	@Original_probability int,
	@p12 bit,
	@p11 bit
)
AS
	SET NOCOUNT OFF;
DELETE FROM [voucher_entry] WHERE (([ID] = @Original_ID) AND ([voucherID] = @Original_voucherID) AND ((@IsNull_accountID = 1 AND [accountID] IS NULL) OR ([accountID] = @Original_accountID)) AND ((@IsNull_entryText = 1 AND [entryText] IS NULL) OR ([entryText] = @Original_entryText)) AND ((@p3 = 1 AND [netAamount (money, null)] IS NULL) OR ([netAamount (money, null)] = @p2)) AND ((@p6 = 1 AND [taxRate (numeric(5,2), null)] IS NULL) OR ([taxRate (numeric(5,2), null)] = @p5)) AND ((@p9 = 1 AND [privateQuota (numeric(5,2), null)] IS NULL) OR ([privateQuota (numeric(5,2), null)] = @p8)) AND ((@IsNull_probability = 1 AND [probability] IS NULL) OR ([probability] = @Original_probability)) AND ((@p12 = 1 AND [TaxFree (bit, null) (bit, null)] IS NULL) OR ([TaxFree (bit, null) (bit, null)] = @p11)))' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[up_GetVoucherEntry]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[up_GetVoucherEntry]
AS
	SET NOCOUNT ON;
SELECT     ID, voucherID, accountID, entryText, [netAamount (money, null)], [taxRate (numeric(5,2), null)], [privateQuota (numeric(5,2), null)], probability, 
                      [TaxFree (bit, null) (bit, null)]
FROM         voucher_entry' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[up_InsertVoucherEntry]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[up_InsertVoucherEntry]
(
	@voucherID int,
	@accountID int,
	@entryText nvarchar(50),
	@p1 money,
	@p4 numeric(5, 2),
	@p7 numeric(5, 2),
	@probability int,
	@p10 bit
)
AS
	SET NOCOUNT OFF;
INSERT INTO [voucher_entry] ([voucherID], [accountID], [entryText], [netAamount (money, null)], [taxRate (numeric(5,2), null)], [privateQuota (numeric(5,2), null)], [probability], [TaxFree (bit, null) (bit, null)]) VALUES (@voucherID, @accountID, @entryText, @p1, @p4, @p7, @probability, @p10);
	
SELECT ID, voucherID, accountID, entryText, [netAamount (money, null)], [taxRate (numeric(5,2), null)], [privateQuota (numeric(5,2), null)], probability, [TaxFree (bit, null) (bit, null)] FROM voucher_entry WHERE (ID = SCOPE_IDENTITY())' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[up_UpdateVoucher]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[up_UpdateVoucher]
(
	@entityID int,
	@customerID int,
	@TypeEnum int,
	@Number nvarchar(10),
	@Description nvarchar(100),
	@Date smalldatetime,
	@DueDate smalldatetime,
	@PaidDate smalldatetime,
	@Original_Id int,
	@Original_entityID int,
	@IsNull_customerID int,
	@Original_customerID int,
	@IsNull_TypeEnum int,
	@Original_TypeEnum int,
	@IsNull_Number nvarchar(10),
	@Original_Number nvarchar(10),
	@IsNull_Description nvarchar(100),
	@Original_Description nvarchar(100),
	@IsNull_Date smalldatetime,
	@Original_Date smalldatetime,
	@IsNull_DueDate smalldatetime,
	@Original_DueDate smalldatetime,
	@IsNull_PaidDate smalldatetime,
	@Original_PaidDate smalldatetime,
	@Id int
)
AS
	SET NOCOUNT OFF;
UPDATE [voucher] SET [entityID] = @entityID, [customerID] = @customerID, [TypeEnum] = @TypeEnum, [Number] = @Number, [Description] = @Description, [Date] = @Date, [DueDate] = @DueDate, [PaidDate] = @PaidDate WHERE (([Id] = @Original_Id) AND ([entityID] = @Original_entityID) AND ((@IsNull_customerID = 1 AND [customerID] IS NULL) OR ([customerID] = @Original_customerID)) AND ((@IsNull_TypeEnum = 1 AND [TypeEnum] IS NULL) OR ([TypeEnum] = @Original_TypeEnum)) AND ((@IsNull_Number = 1 AND [Number] IS NULL) OR ([Number] = @Original_Number)) AND ((@IsNull_Description = 1 AND [Description] IS NULL) OR ([Description] = @Original_Description)) AND ((@IsNull_Date = 1 AND [Date] IS NULL) OR ([Date] = @Original_Date)) AND ((@IsNull_DueDate = 1 AND [DueDate] IS NULL) OR ([DueDate] = @Original_DueDate)) AND ((@IsNull_PaidDate = 1 AND [PaidDate] IS NULL) OR ([PaidDate] = @Original_PaidDate)));
	
SELECT Id, entityID, customerID, TypeEnum, Number, Description, Date, DueDate, PaidDate FROM voucher WHERE (Id = @Id)' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[up_DeleteVoucher]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[up_DeleteVoucher]
(
	@Original_Id int,
	@Original_entityID int,
	@IsNull_customerID int,
	@Original_customerID int,
	@IsNull_TypeEnum int,
	@Original_TypeEnum int,
	@IsNull_Number nvarchar(10),
	@Original_Number nvarchar(10),
	@IsNull_Description nvarchar(100),
	@Original_Description nvarchar(100),
	@IsNull_Date smalldatetime,
	@Original_Date smalldatetime,
	@IsNull_DueDate smalldatetime,
	@Original_DueDate smalldatetime,
	@IsNull_PaidDate smalldatetime,
	@Original_PaidDate smalldatetime
)
AS
	SET NOCOUNT OFF;
DELETE FROM [voucher] WHERE (([Id] = @Original_Id) AND ([entityID] = @Original_entityID) AND ((@IsNull_customerID = 1 AND [customerID] IS NULL) OR ([customerID] = @Original_customerID)) AND ((@IsNull_TypeEnum = 1 AND [TypeEnum] IS NULL) OR ([TypeEnum] = @Original_TypeEnum)) AND ((@IsNull_Number = 1 AND [Number] IS NULL) OR ([Number] = @Original_Number)) AND ((@IsNull_Description = 1 AND [Description] IS NULL) OR ([Description] = @Original_Description)) AND ((@IsNull_Date = 1 AND [Date] IS NULL) OR ([Date] = @Original_Date)) AND ((@IsNull_DueDate = 1 AND [DueDate] IS NULL) OR ([DueDate] = @Original_DueDate)) AND ((@IsNull_PaidDate = 1 AND [PaidDate] IS NULL) OR ([PaidDate] = @Original_PaidDate)))' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[up_GetVoucher]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[up_GetVoucher]
AS
	SET NOCOUNT ON;
SELECT     Id, entityID, customerID, TypeEnum, Number, Description, Date, DueDate, PaidDate
FROM         voucher' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[up_InsertVoucher]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[up_InsertVoucher]
(
	@entityID int,
	@customerID int,
	@TypeEnum int,
	@Number nvarchar(10),
	@Description nvarchar(100),
	@Date smalldatetime,
	@DueDate smalldatetime,
	@PaidDate smalldatetime
)
AS
	SET NOCOUNT OFF;
INSERT INTO [voucher] ([entityID], [customerID], [TypeEnum], [Number], [Description], [Date], [DueDate], [PaidDate]) VALUES (@entityID, @customerID, @TypeEnum, @Number, @Description, @Date, @DueDate, @PaidDate);
	
SELECT Id, entityID, customerID, TypeEnum, Number, Description, Date, DueDate, PaidDate FROM voucher WHERE (Id = SCOPE_IDENTITY())' 
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[up_GetSingleVoucher]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[up_GetSingleVoucher]
(
	@ID int
)
AS
	SET NOCOUNT ON;
SELECT     Id, entityID, customerID, TypeEnum, Number, Description, Date, DueDate, PaidDate
FROM         voucher
WHERE     (Id = @ID)' 
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_sozial_insurance_country]') AND parent_object_id = OBJECT_ID(N'[dbo].[sozial_insurance]'))
ALTER TABLE [dbo].[sozial_insurance]  WITH CHECK ADD  CONSTRAINT [FK_sozial_insurance_country] FOREIGN KEY([countryID])
REFERENCES [dbo].[country] ([ID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_tax_module_country]') AND parent_object_id = OBJECT_ID(N'[dbo].[tax_module]'))
ALTER TABLE [dbo].[tax_module]  WITH NOCHECK ADD  CONSTRAINT [FK_tax_module_country] FOREIGN KEY([countryID])
REFERENCES [dbo].[country] ([ID])
GO
ALTER TABLE [dbo].[tax_module] CHECK CONSTRAINT [FK_tax_module_country]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_entity_country]') AND parent_object_id = OBJECT_ID(N'[dbo].[entity]'))
ALTER TABLE [dbo].[entity]  WITH CHECK ADD  CONSTRAINT [FK_entity_country] FOREIGN KEY([countryID])
REFERENCES [dbo].[country] ([ID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_voucher_entity]') AND parent_object_id = OBJECT_ID(N'[dbo].[voucher]'))
ALTER TABLE [dbo].[voucher]  WITH NOCHECK ADD  CONSTRAINT [FK_voucher_entity] FOREIGN KEY([entityID])
REFERENCES [dbo].[entity] ([ID])
GO
ALTER TABLE [dbo].[voucher] CHECK CONSTRAINT [FK_voucher_entity]
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[repl_identity_range_D53776D6_E96B_4706_A91D_C40220C080FA]') AND parent_object_id = OBJECT_ID(N'[dbo].[voucher]'))
ALTER TABLE [dbo].[voucher]  WITH NOCHECK ADD  CONSTRAINT [repl_identity_range_D53776D6_E96B_4706_A91D_C40220C080FA] CHECK NOT FOR REPLICATION (([Id]>(269) AND [Id]<=(1269) OR [Id]>(1269) AND [Id]<=(2269)))
GO
ALTER TABLE [dbo].[voucher] CHECK CONSTRAINT [repl_identity_range_D53776D6_E96B_4706_A91D_C40220C080FA]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_account_entity]') AND parent_object_id = OBJECT_ID(N'[dbo].[account]'))
ALTER TABLE [dbo].[account]  WITH NOCHECK ADD  CONSTRAINT [FK_account_entity] FOREIGN KEY([entityID])
REFERENCES [dbo].[entity] ([ID])
GO
ALTER TABLE [dbo].[account] CHECK CONSTRAINT [FK_account_entity]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_account_income_account_type]') AND parent_object_id = OBJECT_ID(N'[dbo].[account]'))
ALTER TABLE [dbo].[account]  WITH NOCHECK ADD  CONSTRAINT [FK_account_income_account_type] FOREIGN KEY([income_account_typeID])
REFERENCES [dbo].[income_account_type] ([ID])
GO
ALTER TABLE [dbo].[account] CHECK CONSTRAINT [FK_account_income_account_type]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_cash_account_entity]') AND parent_object_id = OBJECT_ID(N'[dbo].[cash_account]'))
ALTER TABLE [dbo].[cash_account]  WITH CHECK ADD  CONSTRAINT [FK_cash_account_entity] FOREIGN KEY([entity_ID])
REFERENCES [dbo].[entity] ([ID])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_income_account_type_income_type]') AND parent_object_id = OBJECT_ID(N'[dbo].[income_account_type]'))
ALTER TABLE [dbo].[income_account_type]  WITH NOCHECK ADD  CONSTRAINT [FK_income_account_type_income_type] FOREIGN KEY([income_typeID])
REFERENCES [dbo].[income_type] ([ID])
GO
ALTER TABLE [dbo].[income_account_type] CHECK CONSTRAINT [FK_income_account_type_income_type]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_tax_exceptions_tax_module]') AND parent_object_id = OBJECT_ID(N'[dbo].[tax_exceptions]'))
ALTER TABLE [dbo].[tax_exceptions]  WITH NOCHECK ADD  CONSTRAINT [FK_tax_exceptions_tax_module] FOREIGN KEY([tax_moduleID])
REFERENCES [dbo].[tax_module] ([ID])
GO
ALTER TABLE [dbo].[tax_exceptions] CHECK CONSTRAINT [FK_tax_exceptions_tax_module]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_asset_voucher_entry]') AND parent_object_id = OBJECT_ID(N'[dbo].[asset]'))
ALTER TABLE [dbo].[asset]  WITH NOCHECK ADD  CONSTRAINT [FK_asset_voucher_entry] FOREIGN KEY([voucher_entryID])
REFERENCES [dbo].[voucher_entry] ([ID])
GO
ALTER TABLE [dbo].[asset] CHECK CONSTRAINT [FK_asset_voucher_entry]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_voucher_entry_account]') AND parent_object_id = OBJECT_ID(N'[dbo].[voucher_entry]'))
ALTER TABLE [dbo].[voucher_entry]  WITH NOCHECK ADD  CONSTRAINT [FK_voucher_entry_account] FOREIGN KEY([accountID])
REFERENCES [dbo].[account] ([ID])
GO
ALTER TABLE [dbo].[voucher_entry] CHECK CONSTRAINT [FK_voucher_entry_account]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_voucher_entry_voucher]') AND parent_object_id = OBJECT_ID(N'[dbo].[voucher_entry]'))
ALTER TABLE [dbo].[voucher_entry]  WITH NOCHECK ADD  CONSTRAINT [FK_voucher_entry_voucher] FOREIGN KEY([voucherID])
REFERENCES [dbo].[voucher] ([Id])
GO
ALTER TABLE [dbo].[voucher_entry] CHECK CONSTRAINT [FK_voucher_entry_voucher]
