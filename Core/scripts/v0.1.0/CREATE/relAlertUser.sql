USE [DB_A2BA2D_agenda]
GO

/****** Object:  Table [dbo].[relAlertUser]    Script Date: 17/10/2020 16:52:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[relAlertUser](
	[ID] [uniqueidentifier] NOT NULL,
	[alertID] [uniqueidentifier] NOT NULL,
	[userID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_relAlertUser] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[relAlertUser] ADD  CONSTRAINT [DF_relAlertUser_ID]  DEFAULT (newid()) FOR [ID]
GO

ALTER TABLE [dbo].[relAlertUser]  WITH CHECK ADD  CONSTRAINT [FK_relAlertUser_tblAlert] FOREIGN KEY([alertID])
REFERENCES [dbo].[tblAlert] ([ID])
GO

ALTER TABLE [dbo].[relAlertUser] CHECK CONSTRAINT [FK_relAlertUser_tblAlert]
GO

ALTER TABLE [dbo].[relAlertUser]  WITH CHECK ADD  CONSTRAINT [FK_relAlertUser_tblUser] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUser] ([ID])
GO

ALTER TABLE [dbo].[relAlertUser] CHECK CONSTRAINT [FK_relAlertUser_tblUser]
GO

