SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SecurityTrouble]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SecurityTrouble](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EventCode] [int] NULL,
	[SecurityPrincipal] [nvarchar](50) NULL,
	[LocalTime] [datetime] NULL,
	[Ressource] [nvarchar](max) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ErrorTable]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ErrorTable](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Computer] [varchar](50) NULL,
	[EventCode] [int] NULL,
	[Source] [varchar](50) NULL,
	[SecurityPrincipal] [varchar](50) NULL,
	[LocalTime] [datetime] NULL,
	[TimeOffset] [varchar](50) NULL
) ON [PRIMARY]
END
