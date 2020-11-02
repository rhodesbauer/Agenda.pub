USE [DB_A2BA2D_agenda]
GO

/****** Object:  Table [dbo].[relEntriesScope]    Script Date: 17/10/2020 16:53:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[relEntriesScope](
	[ID] [uniqueidentifier] NOT NULL,
	[scopeID] [uniqueidentifier] NOT NULL,
	[entryID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_relEntriesScope] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[relEntriesScope] ADD  CONSTRAINT [DF_relEntriesScope_ID]  DEFAULT (newid()) FOR [ID]
GO

ALTER TABLE [dbo].[relEntriesScope]  WITH CHECK ADD  CONSTRAINT [FK_relEntriesScope_tblEntries] FOREIGN KEY([entryID])
REFERENCES [dbo].[tblEntries] ([ID])
GO

ALTER TABLE [dbo].[relEntriesScope] CHECK CONSTRAINT [FK_relEntriesScope_tblEntries]
GO

ALTER TABLE [dbo].[relEntriesScope]  WITH CHECK ADD  CONSTRAINT [FK_relEntriesScope_tblScope] FOREIGN KEY([scopeID])
REFERENCES [dbo].[tblScope] ([ID])
GO

ALTER TABLE [dbo].[relEntriesScope] CHECK CONSTRAINT [FK_relEntriesScope_tblScope]
GO

