USE [DB_A2BA2D_agenda]
GO

/****** Object:  Table [dbo].[tblUser]    Script Date: 17/10/2020 16:58:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblUser](
	[ID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Comments] [text] NULL,
	[Email] [nvarchar](100) NULL,
	[Mobile] [nvarchar](25) NULL,
	[Provider] [text] NULL,
	[Session] [uniqueidentifier] NOT NULL,
	[Token] [text] NULL,
	[dateIssued] [datetime] NOT NULL,
	[dateCreated] [date] NOT NULL,
	[dateModified] [date] NOT NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [dbo].[tblUser] ADD  CONSTRAINT [DF_tblUser_ID]  DEFAULT (newid()) FOR [ID]
GO

ALTER TABLE [dbo].[tblUser] ADD  CONSTRAINT [DF_tblUser_dateIssued]  DEFAULT (getdate()) FOR [dateIssued]
GO

ALTER TABLE [dbo].[tblUser] ADD  CONSTRAINT [DF_tblUser_dateCreated]  DEFAULT (getdate()) FOR [dateCreated]
GO

