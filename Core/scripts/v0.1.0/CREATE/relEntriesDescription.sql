USE [DB_A2BA2D_agenda]
GO

/****** Object:  Table [dbo].[relEntriesDescription]    Script Date: 17/10/2020 16:53:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[relEntriesDescription](
	[ID] [uniqueidentifier] NOT NULL,
	[descriptionID] [uniqueidentifier] NOT NULL,
	[entryID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_relEntriesDescription] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[relEntriesDescription] ADD  CONSTRAINT [DF_relEntriesDescription_ID]  DEFAULT (newid()) FOR [ID]
GO

ALTER TABLE [dbo].[relEntriesDescription]  WITH CHECK ADD  CONSTRAINT [FK_relEntriesDescription_tblEntries] FOREIGN KEY([entryID])
REFERENCES [dbo].[tblEntries] ([ID])
GO

ALTER TABLE [dbo].[relEntriesDescription] CHECK CONSTRAINT [FK_relEntriesDescription_tblEntries]
GO

ALTER TABLE [dbo].[relEntriesDescription]  WITH CHECK ADD  CONSTRAINT [FK_relEntriesDescription_tblEntryDescription] FOREIGN KEY([descriptionID])
REFERENCES [dbo].[tblEntryDescription] ([ID])
GO

ALTER TABLE [dbo].[relEntriesDescription] CHECK CONSTRAINT [FK_relEntriesDescription_tblEntryDescription]
GO

