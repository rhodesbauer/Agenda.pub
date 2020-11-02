USE [DB_A2BA2D_agenda]
GO

/****** Object:  Table [dbo].[tblAlert]    Script Date: 17/10/2020 16:55:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblAlert](
	[ID] [uniqueidentifier] NOT NULL,
	[Nome] [nvarchar](50) NOT NULL,
	[textAlert] [text] NOT NULL,
	[dateTimeAlert] [datetime] NOT NULL,
	[dateAdded] [date] NOT NULL,
	[dateModified] [date] NOT NULL,
	[nameUser] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblAlert] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[tblAlert] ADD  CONSTRAINT [DF_tblAlert_ID]  DEFAULT (newid()) FOR [ID]
GO

