USE [DB_A2BA2D_agenda]
GO

/****** Object:  Table [dbo].[tblEntryDescription]    Script Date: 17/10/2020 16:56:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblEntryDescription](
	[ID] [uniqueidentifier] NOT NULL,
	[Sequence] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[dateAdded] [date] NOT NULL,
	[dateModified] [date] NOT NULL,
	[nameUser] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblEntryDescription] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tblEntryDescription] ADD  CONSTRAINT [DF_tblEntryDescription_ID]  DEFAULT (newid()) FOR [ID]
GO

