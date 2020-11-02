USE [DB_A2BA2D_agenda]
GO

/****** Object:  Table [dbo].[tblGroup]    Script Date: 17/10/2020 16:56:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblGroup](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Comments] [text] NULL,
	[dateAdded] [date] NOT NULL,
	[dateModified] [date] NOT NULL,
	[nameUser] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblGroup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[tblGroup] ADD  CONSTRAINT [DF_tblGroup_ID]  DEFAULT (newid()) FOR [ID]
GO

