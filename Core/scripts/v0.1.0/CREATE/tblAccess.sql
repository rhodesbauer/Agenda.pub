USE [DB_A2BA2D_agenda]
GO

/****** Object:  Table [dbo].[tblAccess]    Script Date: 17/10/2020 16:54:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblAccess](
	[ID] [uniqueidentifier] NOT NULL,
	[isReadAndWrite] [int] NOT NULL,
	[userID] [uniqueidentifier] NOT NULL,
	[groupID] [uniqueidentifier] NOT NULL,
	[dateAdded] [date] NOT NULL,
	[dateModified] [date] NOT NULL,
	[nameUser] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblAccess] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[tblAccess] ADD  CONSTRAINT [DF_tblAccess_ID]  DEFAULT (newid()) FOR [ID]
GO

ALTER TABLE [dbo].[tblAccess] ADD  CONSTRAINT [DF_tblAccess_Level]  DEFAULT ((0)) FOR [isReadAndWrite]
GO

ALTER TABLE [dbo].[tblAccess]  WITH CHECK ADD  CONSTRAINT [FK_tblAccess_tblGroup] FOREIGN KEY([groupID])
REFERENCES [dbo].[tblGroup] ([ID])
GO

ALTER TABLE [dbo].[tblAccess] CHECK CONSTRAINT [FK_tblAccess_tblGroup]
GO

ALTER TABLE [dbo].[tblAccess]  WITH CHECK ADD  CONSTRAINT [FK_tblAccess_tblUser] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUser] ([ID])
GO

ALTER TABLE [dbo].[tblAccess] CHECK CONSTRAINT [FK_tblAccess_tblUser]
GO

