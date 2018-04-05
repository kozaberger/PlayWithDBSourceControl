CREATE TABLE [dbo].[tRefFileItem]
(
[iID] [int] NOT NULL IDENTITY(1, 1),
[uSysID] [uniqueidentifier] NULL,
[iRefFileID] [int] NOT NULL,
[vText] [nvarchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[vText2] [nvarchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[vColor] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[iValue] [int] NULL,
[vImportExternalID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[iSortCode] [int] NULL,
[iCreateUserID] [int] NULL,
[iUpdateUserID] [int] NULL,
[dCreate] [datetime] NULL,
[dUpdate] [datetime] NULL,
[vIcon] [nvarchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[vValue] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[vLocalizationTag] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[vLocalizationText_1] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[vLocalizationText_2] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[vLocalizationText_3] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[vLocalizationText_4] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[vLocalizationText_5] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[vLocalizationText_6] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[vLocalizationText_7] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[vLocalizationText_8] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[vLocalizationText_9] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[vLocalizationText_10] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[tRefFileItem] ADD CONSTRAINT [PK_tRefFileItem] PRIMARY KEY CLUSTERED  ([iID]) ON [PRIMARY]
GO
CREATE STATISTICS [dCreate] ON [dbo].[tRefFileItem] ([dCreate])
GO
CREATE STATISTICS [dUpdate] ON [dbo].[tRefFileItem] ([dUpdate])
GO
CREATE STATISTICS [iCreateUserID] ON [dbo].[tRefFileItem] ([iCreateUserID])
GO
CREATE STATISTICS [iRefFileID] ON [dbo].[tRefFileItem] ([iRefFileID])
GO
CREATE STATISTICS [iSortCode] ON [dbo].[tRefFileItem] ([iSortCode])
GO
CREATE STATISTICS [iUpdateUserID] ON [dbo].[tRefFileItem] ([iUpdateUserID])
GO
CREATE STATISTICS [iValue] ON [dbo].[tRefFileItem] ([iValue])
GO
CREATE STATISTICS [uSysID] ON [dbo].[tRefFileItem] ([uSysID])
GO
CREATE STATISTICS [vColor] ON [dbo].[tRefFileItem] ([vColor])
GO
CREATE STATISTICS [vIcon] ON [dbo].[tRefFileItem] ([vIcon])
GO
CREATE STATISTICS [vImportExternalID] ON [dbo].[tRefFileItem] ([vImportExternalID])
GO
CREATE STATISTICS [vLocalizationText_1] ON [dbo].[tRefFileItem] ([vLocalizationText_1])
GO
CREATE STATISTICS [vLocalizationText_10] ON [dbo].[tRefFileItem] ([vLocalizationText_10])
GO
CREATE STATISTICS [vLocalizationText_2] ON [dbo].[tRefFileItem] ([vLocalizationText_2])
GO
CREATE STATISTICS [vLocalizationText_3] ON [dbo].[tRefFileItem] ([vLocalizationText_3])
GO
CREATE STATISTICS [vLocalizationText_4] ON [dbo].[tRefFileItem] ([vLocalizationText_4])
GO
CREATE STATISTICS [vLocalizationText_5] ON [dbo].[tRefFileItem] ([vLocalizationText_5])
GO
CREATE STATISTICS [vLocalizationText_6] ON [dbo].[tRefFileItem] ([vLocalizationText_6])
GO
CREATE STATISTICS [vLocalizationText_7] ON [dbo].[tRefFileItem] ([vLocalizationText_7])
GO
CREATE STATISTICS [vLocalizationText_8] ON [dbo].[tRefFileItem] ([vLocalizationText_8])
GO
CREATE STATISTICS [vLocalizationText_9] ON [dbo].[tRefFileItem] ([vLocalizationText_9])
GO
CREATE STATISTICS [vText] ON [dbo].[tRefFileItem] ([vText])
GO
CREATE STATISTICS [vText2] ON [dbo].[tRefFileItem] ([vText2])
GO
CREATE STATISTICS [vValue] ON [dbo].[tRefFileItem] ([vValue])
GO
ALTER TABLE [dbo].[tRefFileItem] WITH NOCHECK ADD CONSTRAINT [FK_tRefFileItem_tSecurityUser] FOREIGN KEY ([iCreateUserID]) REFERENCES [dbo].[tSecurityUser] ([iID])
GO
ALTER TABLE [dbo].[tRefFileItem] WITH NOCHECK ADD CONSTRAINT [FK_tRefFileItem_tSecurityUser1] FOREIGN KEY ([iUpdateUserID]) REFERENCES [dbo].[tSecurityUser] ([iID])
GO
ALTER TABLE [dbo].[tRefFileItem] WITH NOCHECK ADD CONSTRAINT [FK_tRefFileItemPL_tSecurityUser] FOREIGN KEY ([iCreateUserID]) REFERENCES [dbo].[tSecurityUser] ([iID])
GO
ALTER TABLE [dbo].[tRefFileItem] WITH NOCHECK ADD CONSTRAINT [FK_tRefFileItemPL_tSecurityUser1] FOREIGN KEY ([iUpdateUserID]) REFERENCES [dbo].[tSecurityUser] ([iID])
GO
