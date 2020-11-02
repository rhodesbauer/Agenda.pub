USE [DB_A2BA2D_agenda]
GO

/****** Object:  Table [dbo].[relScopeGroup]    Script Date: 17/10/2020 16:54:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[relScopeGroup](
	[ID] [uniqueidentifier] NOT NULL,
	[scopeID] [uniqueidentifier] NOT NULL,
	[groupID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_relScopeGroup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[relScopeGroup] ADD  CONSTRAINT [DF_relScopeGroup_ID]  DEFAULT (newid()) FOR [ID]
GO

ALTER TABLE [dbo].[relScopeGroup]  WITH CHECK ADD  CONSTRAINT [FK_relScopeGroup_tblGroup] FOREIGN KEY([groupID])
REFERENCES [dbo].[tblGroup] ([ID])
GO

ALTER TABLE [dbo].[relScopeGroup] CHECK CONSTRAINT [FK_relScopeGroup_tblGroup]
GO

ALTER TABLE [dbo].[relScopeGroup]  WITH CHECK ADD  CONSTRAINT [FK_relScopeGroup_tblScope] FOREIGN KEY([scopeID])
REFERENCES [dbo].[tblScope] ([ID])
GO

ALTER TABLE [dbo].[relScopeGroup] CHECK CONSTRAINT [FK_relScopeGroup_tblScope]
GO

