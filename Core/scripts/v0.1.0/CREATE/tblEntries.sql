USE [DB_A2BA2D_agenda]
GO

/****** Object:  Table [dbo].[tblEntries]    Script Date: 17/10/2020 16:55:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblEntries](
	[ID] [uniqueidentifier] NOT NULL,
	[Sequence] [int] IDENTITY(1,1) NOT NULL,
	[isNegative] [bit] NOT NULL,
	[Value] [money] NOT NULL,
	[dateValue] [date] NOT NULL,
	[dateClearing] [date] NOT NULL,
	[dateAdded] [date] NOT NULL,
	[dateModified] [date] NOT NULL,
	[nameUser] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblEntries] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tblEntries] ADD  CONSTRAINT [DF_tblEntries_ID]  DEFAULT (newid()) FOR [ID]
GO

ALTER TABLE [dbo].[tblEntries] ADD  CONSTRAINT [DF_tblEntries_isNegative]  DEFAULT ((1)) FOR [isNegative]
GO

ALTER TABLE [dbo].[tblEntries] ADD  CONSTRAINT [DF_tblEntries_Value]  DEFAULT ((0)) FOR [Value]
GO

