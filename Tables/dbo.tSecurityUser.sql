CREATE TABLE [dbo].[tSecurityUser]
(
[iID] [int] NOT NULL IDENTITY(1, 1),
[uSysID] [uniqueidentifier] NULL,
[vLogin] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[vPassword] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[iGroupID] [int] NULL,
[dPasswordChange] [datetime] NULL,
[dBlock] [datetime] NULL,
[iBlockUserID] [int] NULL,
[vEmail] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[vFirstName] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[vSurname] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[iRoleID] [int] NULL,
[dCreate] [datetime] NULL,
[iCreateUserID] [int] NULL,
[dUpdate] [datetime] NULL,
[iUpdateUserID] [int] NULL,
[bPasswordExpiration] [bit] NULL,
[iTimeZoneID] [int] NULL,
[fDiscount] [float] NULL,
[bBCCEnabled] [bit] NULL,
[bGuardAttachment] [bit] NULL,
[bGuardSubject] [bit] NULL,
[vKeywords] [nvarchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[vLocalDir] [nvarchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[vServer] [nvarchar] (256) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[bSynchronize] [bit] NULL,
[iTimeDifference] [int] NULL CONSTRAINT [DF_tSecurityUser_iTimeDifference] DEFAULT ((0)),
[bFullScreen] [bit] NULL CONSTRAINT [DF_tSecurityUser_bFullScreen] DEFAULT ((1)),
[iPhoto] [image] NULL,
[bUsesEmailClient] [bit] NULL,
[bAdminMode] [bit] NULL,
[vMobilePhone] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[iCompanyID] [int] NULL,
[iInternalRole] [int] NULL,
[iAppDefRemTimeID] [int] NULL,
[iTaskDefRemTimeID] [int] NULL,
[iSystemRole] [int] NULL,
[iReportsUserID] [int] NULL,
[dExpirationDate] [datetime] NULL,
[bUseTextMode] [bit] NULL,
[iMonitoringGroupID] [int] NULL,
[bForceHttps] [bit] NULL,
[bShareCalendar] [bit] NULL,
[vExchangeLogin] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[vExchangePassword] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[iExchangeVersionID] [int] NULL,
[vExchangeUrl] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[bExchangeSynchronization] [bit] NULL,
[iExchangeSyncTimePeriodID] [int] NULL,
[vAllowedIP] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[bAppDefRemTimeOn] [bit] NULL,
[bTaskDefRemTimeOn] [bit] NULL,
[iSelectDateFormatID] [int] NULL,
[bPeriodic] [bit] NULL,
[iDefaultTimeActivityID] [int] NULL,
[vSwift] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[vIBAN] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[vAdditionalInvoiceInfo] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[vBankAccountNumber] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[vBankName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[vBankAddress] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[iDefaultInvoiceTemplateID] [int] NULL,
[iDefaultInvoiceAttachmentTemplateID] [int] NULL,
[iDefaultCreditTemplateID] [int] NULL,
[iDefaultCreditAttachmentTemplateID] [int] NULL,
[vMaskInvoiceBatch] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[vMaskInvoice] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[iNumberInvoice] [int] NULL,
[iNumberInvoiceBatch] [int] NULL,
[iUseInformationFromID] [int] NULL,
[iInvoiceNumberFrom] [int] NULL,
[iInvoiceNumberTo] [int] NULL,
[iInvoiceBatchNumberFrom] [int] NULL,
[iInvoiceBatchNumberTo] [int] NULL,
[iDefaultInvoicePerID] [int] NULL,
[iDefaultDueDays] [int] NULL,
[iServiceSplittingInvoiceWithVAT] [int] NULL,
[iServiceSplittingInvoiceWithoutVAT] [int] NULL,
[iBadLoginCounter] [int] NULL,
[bMobile] [bit] NULL,
[bOffline] [bit] NULL,
[bGenerateKID] [bit] NULL,
[iCompanyNumber] [int] NULL,
[bCustomKID] [bit] NULL,
[iKIDFirstPartID] [int] NULL,
[iKIDSecondPartID] [int] NULL,
[iKIDThirdPartID] [int] NULL,
[iKIDFirstPartLengthID] [int] NULL,
[iKIDSecondPartLengthID] [int] NULL,
[iKIDThirdPartLengthID] [int] NULL,
[iKIDControlDigitID] [int] NULL,
[bFiltersClear] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[tSecurityUser] ADD CONSTRAINT [PK_tSecurityUser] PRIMARY KEY CLUSTERED  ([iID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tSecurityUser_3] ON [dbo].[tSecurityUser] ([vFirstName]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tSecurityUser] ADD CONSTRAINT [IX_tSecurityUser] UNIQUE NONCLUSTERED  ([vLogin]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tSecurityUser_2] ON [dbo].[tSecurityUser] ([vSurname]) ON [PRIMARY]
GO
CREATE STATISTICS [bAdminMode] ON [dbo].[tSecurityUser] ([bAdminMode])
GO
CREATE STATISTICS [bBCCEnabled] ON [dbo].[tSecurityUser] ([bBCCEnabled])
GO
CREATE STATISTICS [bCustomKID] ON [dbo].[tSecurityUser] ([bCustomKID])
GO
CREATE STATISTICS [bExchangeSynchronization] ON [dbo].[tSecurityUser] ([bExchangeSynchronization])
GO
CREATE STATISTICS [bForceHttps] ON [dbo].[tSecurityUser] ([bForceHttps])
GO
CREATE STATISTICS [bFullScreen] ON [dbo].[tSecurityUser] ([bFullScreen])
GO
CREATE STATISTICS [bGuardAttachment] ON [dbo].[tSecurityUser] ([bGuardAttachment])
GO
CREATE STATISTICS [bGuardSubject] ON [dbo].[tSecurityUser] ([bGuardSubject])
GO
CREATE STATISTICS [bPasswordExpiration] ON [dbo].[tSecurityUser] ([bPasswordExpiration])
GO
CREATE STATISTICS [bPeriodic] ON [dbo].[tSecurityUser] ([bPeriodic])
GO
CREATE STATISTICS [bShareCalendar] ON [dbo].[tSecurityUser] ([bShareCalendar])
GO
CREATE STATISTICS [bSynchronize] ON [dbo].[tSecurityUser] ([bSynchronize])
GO
CREATE STATISTICS [bUsesEmailClient] ON [dbo].[tSecurityUser] ([bUsesEmailClient])
GO
CREATE STATISTICS [dBlock] ON [dbo].[tSecurityUser] ([dBlock])
GO
CREATE STATISTICS [dCreate] ON [dbo].[tSecurityUser] ([dCreate])
GO
CREATE STATISTICS [dExpirationDate] ON [dbo].[tSecurityUser] ([dExpirationDate])
GO
CREATE STATISTICS [dPasswordChange] ON [dbo].[tSecurityUser] ([dPasswordChange])
GO
CREATE STATISTICS [dUpdate] ON [dbo].[tSecurityUser] ([dUpdate])
GO
CREATE STATISTICS [fDiscount] ON [dbo].[tSecurityUser] ([fDiscount])
GO
CREATE STATISTICS [iAppDefRemTimeID] ON [dbo].[tSecurityUser] ([iAppDefRemTimeID])
GO
CREATE STATISTICS [iBadLoginCounter] ON [dbo].[tSecurityUser] ([iBadLoginCounter])
GO
CREATE STATISTICS [iBlockUserID] ON [dbo].[tSecurityUser] ([iBlockUserID])
GO
CREATE STATISTICS [iCreateUserID] ON [dbo].[tSecurityUser] ([iCreateUserID])
GO
CREATE STATISTICS [iDefaultCreditAttachmentTemplateID] ON [dbo].[tSecurityUser] ([iDefaultCreditAttachmentTemplateID])
GO
CREATE STATISTICS [iDefaultCreditTemplateID] ON [dbo].[tSecurityUser] ([iDefaultCreditTemplateID])
GO
CREATE STATISTICS [iDefaultDueDays] ON [dbo].[tSecurityUser] ([iDefaultDueDays])
GO
CREATE STATISTICS [iDefaultInvoiceAttachmentTemplateID] ON [dbo].[tSecurityUser] ([iDefaultInvoiceAttachmentTemplateID])
GO
CREATE STATISTICS [iDefaultInvoiceTemplateID] ON [dbo].[tSecurityUser] ([iDefaultInvoiceTemplateID])
GO
CREATE STATISTICS [iExchangeVersionID] ON [dbo].[tSecurityUser] ([iExchangeVersionID])
GO
CREATE STATISTICS [iGroupID] ON [dbo].[tSecurityUser] ([iGroupID])
GO
CREATE STATISTICS [iInternalRole] ON [dbo].[tSecurityUser] ([iInternalRole])
GO
CREATE STATISTICS [iInvoiceBatchNumberFrom] ON [dbo].[tSecurityUser] ([iInvoiceBatchNumberFrom])
GO
CREATE STATISTICS [iInvoiceBatchNumberTo] ON [dbo].[tSecurityUser] ([iInvoiceBatchNumberTo])
GO
CREATE STATISTICS [iInvoiceNumberFrom] ON [dbo].[tSecurityUser] ([iInvoiceNumberFrom])
GO
CREATE STATISTICS [iInvoiceNumberTo] ON [dbo].[tSecurityUser] ([iInvoiceNumberTo])
GO
CREATE STATISTICS [iKIDControlDigitID] ON [dbo].[tSecurityUser] ([iKIDControlDigitID])
GO
CREATE STATISTICS [iKIDFirstPartID] ON [dbo].[tSecurityUser] ([iKIDFirstPartID])
GO
CREATE STATISTICS [iKIDFirstPartLengthID] ON [dbo].[tSecurityUser] ([iKIDFirstPartLengthID])
GO
CREATE STATISTICS [iKIDSecondPartID] ON [dbo].[tSecurityUser] ([iKIDSecondPartID])
GO
CREATE STATISTICS [iKIDSecondPartLengthID] ON [dbo].[tSecurityUser] ([iKIDSecondPartLengthID])
GO
CREATE STATISTICS [iKIDThirdPartID] ON [dbo].[tSecurityUser] ([iKIDThirdPartID])
GO
CREATE STATISTICS [iKIDThirdPartLengthID] ON [dbo].[tSecurityUser] ([iKIDThirdPartLengthID])
GO
CREATE STATISTICS [iMonitoringGroupID] ON [dbo].[tSecurityUser] ([iMonitoringGroupID])
GO
CREATE STATISTICS [iNumberInvoice] ON [dbo].[tSecurityUser] ([iNumberInvoice])
GO
CREATE STATISTICS [iNumberInvoiceBatch] ON [dbo].[tSecurityUser] ([iNumberInvoiceBatch])
GO
CREATE STATISTICS [iPhoto] ON [dbo].[tSecurityUser] ([iPhoto])
GO
CREATE STATISTICS [iRoleID] ON [dbo].[tSecurityUser] ([iRoleID])
GO
CREATE STATISTICS [iSelectDateFormatID] ON [dbo].[tSecurityUser] ([iSelectDateFormatID])
GO
CREATE STATISTICS [iServiceSplittingInvoiceWithoutVAT] ON [dbo].[tSecurityUser] ([iServiceSplittingInvoiceWithoutVAT])
GO
CREATE STATISTICS [iServiceSplittingInvoiceWithVAT] ON [dbo].[tSecurityUser] ([iServiceSplittingInvoiceWithVAT])
GO
CREATE STATISTICS [iSystemRole] ON [dbo].[tSecurityUser] ([iSystemRole])
GO
CREATE STATISTICS [iTaskDefRemTimeID] ON [dbo].[tSecurityUser] ([iTaskDefRemTimeID])
GO
CREATE STATISTICS [iTimeDifference] ON [dbo].[tSecurityUser] ([iTimeDifference])
GO
CREATE STATISTICS [iTimeZoneID] ON [dbo].[tSecurityUser] ([iTimeZoneID])
GO
CREATE STATISTICS [iUpdateUserID] ON [dbo].[tSecurityUser] ([iUpdateUserID])
GO
CREATE STATISTICS [uSysID] ON [dbo].[tSecurityUser] ([uSysID])
GO
CREATE STATISTICS [vAdditionalInvoiceInfo] ON [dbo].[tSecurityUser] ([vAdditionalInvoiceInfo])
GO
CREATE STATISTICS [vAllowedIP] ON [dbo].[tSecurityUser] ([vAllowedIP])
GO
CREATE STATISTICS [vBankAccountNumber] ON [dbo].[tSecurityUser] ([vBankAccountNumber])
GO
CREATE STATISTICS [vBankAddress] ON [dbo].[tSecurityUser] ([vBankAddress])
GO
CREATE STATISTICS [vBankName] ON [dbo].[tSecurityUser] ([vBankName])
GO
CREATE STATISTICS [vEmail] ON [dbo].[tSecurityUser] ([vEmail])
GO
CREATE STATISTICS [vExchangeLogin] ON [dbo].[tSecurityUser] ([vExchangeLogin])
GO
CREATE STATISTICS [vExchangePassword] ON [dbo].[tSecurityUser] ([vExchangePassword])
GO
CREATE STATISTICS [vExchangeUrl] ON [dbo].[tSecurityUser] ([vExchangeUrl])
GO
CREATE STATISTICS [vIBAN] ON [dbo].[tSecurityUser] ([vIBAN])
GO
CREATE STATISTICS [vKeywords] ON [dbo].[tSecurityUser] ([vKeywords])
GO
CREATE STATISTICS [vLocalDir] ON [dbo].[tSecurityUser] ([vLocalDir])
GO
CREATE STATISTICS [vMaskInvoice] ON [dbo].[tSecurityUser] ([vMaskInvoice])
GO
CREATE STATISTICS [vMaskInvoiceBatch] ON [dbo].[tSecurityUser] ([vMaskInvoiceBatch])
GO
CREATE STATISTICS [vMobilePhone] ON [dbo].[tSecurityUser] ([vMobilePhone])
GO
CREATE STATISTICS [vPassword] ON [dbo].[tSecurityUser] ([vPassword])
GO
CREATE STATISTICS [vServer] ON [dbo].[tSecurityUser] ([vServer])
GO
CREATE STATISTICS [vSwift] ON [dbo].[tSecurityUser] ([vSwift])
GO
ALTER TABLE [dbo].[tSecurityUser] WITH NOCHECK ADD CONSTRAINT [FK_tSecurityUser_tSecurityGroup] FOREIGN KEY ([iGroupID]) REFERENCES [dbo].[tSecurityGroup] ([iID])
GO
ALTER TABLE [dbo].[tSecurityUser] WITH NOCHECK ADD CONSTRAINT [FK_tSecurityUser_tSecurityUser] FOREIGN KEY ([iBlockUserID]) REFERENCES [dbo].[tSecurityUser] ([iID])
GO
ALTER TABLE [dbo].[tSecurityUser] WITH NOCHECK ADD CONSTRAINT [FK_tSecurityUser_tSecurityUser1] FOREIGN KEY ([iCreateUserID]) REFERENCES [dbo].[tSecurityUser] ([iID])
GO
ALTER TABLE [dbo].[tSecurityUser] WITH NOCHECK ADD CONSTRAINT [FK_tSecurityUser_tSecurityUser2] FOREIGN KEY ([iUpdateUserID]) REFERENCES [dbo].[tSecurityUser] ([iID])
GO
ALTER TABLE [dbo].[tSecurityUser] ADD CONSTRAINT [FK_tSecurityUser_tSecurityUser3] FOREIGN KEY ([iReportsUserID]) REFERENCES [dbo].[tSecurityUser] ([iID])
GO
GRANT INSERT ON  [dbo].[tSecurityUser] TO [public]
GO
GRANT INSERT ON  [dbo].[tSecurityUser] TO [SPExecute]
GO
EXEC sp_addextendedproperty N'MS_Description', N'1 - crmadmin, 2 - synchronizationservice', 'SCHEMA', N'dbo', 'TABLE', N'tSecurityUser', 'COLUMN', N'iSystemRole'
GO
