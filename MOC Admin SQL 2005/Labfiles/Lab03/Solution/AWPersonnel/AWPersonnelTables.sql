SET ANSI_NULLS ON
GO
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Department]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Department](
	[DepartmentID] [smallint] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[GroupName] [nvarchar](50) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[rowguid] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [DF_Department_rowguid]  DEFAULT (newid())
,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS OFF
GO
SET ANSI_NULLS ON
GO
if not exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Employee]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[Employee](
	[EmployeeID] [int] NOT NULL,
	[NationalIDNumber] [nvarchar](15) NULL,
	[Title] [nvarchar](50) NULL,
	[HireDate] [datetime] NULL,
	[BirthDate] [datetime] NULL,
	[LoginID] [nvarchar](256) NULL,
	[DepartmentID] [smallint] NULL,
	[MaritalStatus] [nchar](1) NULL,
	[Gender] [nchar](1) NULL

) ON [PRIMARY]
END
GO
SET ANSI_NULLS OFF
GO
