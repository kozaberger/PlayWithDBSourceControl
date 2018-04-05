CREATE TABLE [dbo].[tSecurityGroup]
(
[iID] [int] NOT NULL IDENTITY(1, 1),
[uSysId] [uniqueidentifier] NULL,
[vName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[vDescription] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[iCreateUserID] [int] NULL,
[iUpdateUserID] [int] NULL,
[dCreate] [datetime] NULL,
[dUpdate] [datetime] NULL,
[iSystemRole] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tSecurityGroup] ADD CONSTRAINT [PK_tSecurityGroup] PRIMARY KEY CLUSTERED  ([iID]) ON [PRIMARY]
GO
CREATE STATISTICS [dCreate] ON [dbo].[tSecurityGroup] ([dCreate])
GO
CREATE STATISTICS [dUpdate] ON [dbo].[tSecurityGroup] ([dUpdate])
GO
CREATE STATISTICS [iCreateUserID] ON [dbo].[tSecurityGroup] ([iCreateUserID])
GO
CREATE STATISTICS [iSystemRole] ON [dbo].[tSecurityGroup] ([iSystemRole])
GO
CREATE STATISTICS [iUpdateUserID] ON [dbo].[tSecurityGroup] ([iUpdateUserID])
GO
CREATE STATISTICS [uSysId] ON [dbo].[tSecurityGroup] ([uSysId])
GO
CREATE STATISTICS [vDescription] ON [dbo].[tSecurityGroup] ([vDescription])
GO
CREATE STATISTICS [vName] ON [dbo].[tSecurityGroup] ([vName])
GO
ALTER TABLE [dbo].[tSecurityGroup] WITH NOCHECK ADD CONSTRAINT [FK_tSecurityGroup_tSecurityUser] FOREIGN KEY ([iCreateUserID]) REFERENCES [dbo].[tSecurityUser] ([iID])
GO
ALTER TABLE [dbo].[tSecurityGroup] WITH NOCHECK ADD CONSTRAINT [FK_tSecurityGroup_tSecurityUser1] FOREIGN KEY ([iUpdateUserID]) REFERENCES [dbo].[tSecurityUser] ([iID])
GO
EXEC sp_addextendedproperty N'MS_Description', N'1 - ukryta', 'SCHEMA', N'dbo', 'TABLE', N'tSecurityGroup', 'COLUMN', N'iSystemRole'
GO
