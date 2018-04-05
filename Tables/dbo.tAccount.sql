CREATE TABLE [dbo].[tAccount]
(
[iID] [int] NOT NULL IDENTITY(1, 1),
[uSysID] [uniqueidentifier] NULL,
[dCreate] [datetime] NULL,
[dUpdate] [datetime] NULL,
[iUpdateUserID] [int] NULL,
[iAssignedUserID] [int] NULL,
[iCreateUserID] [int] NULL,
[vName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[iParentID] [int] NULL CONSTRAINT [DF__tAccount1__iPare__07C12930] DEFAULT (NULL),
[iIndustryID] [int] NULL CONSTRAINT [DF__tAccount1__iIndu__09A971A2] DEFAULT (NULL),
[vPhoneFax] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[vBillingAddressStreet] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[vBillingAddressCity] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[vBillingAddressState] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[vBillingAddressPostalCode] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[vAccountCode] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[vPhoneOffice] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[vEmail] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[vWebsite] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[vOwnership] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[vExternalid] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[vShippingAddressStreet] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[vShippingAddressCity] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[vShippingAddressState] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[vShippingAddressPostalCode] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[bdeleted] [bit] NOT NULL CONSTRAINT [DF__tAccount1__bdele__0A9D95DB] DEFAULT ('0'),
[iRatingID] [int] NULL,
[iBillingAddressCountryID] [int] NULL,
[iShippingAddressCountryID] [int] NULL,
[vShortName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[vPrimaryAddressStreet] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[vPrimaryAddressCity] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[vPrimaryAddressState] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[vPrimaryAddressPostalCode] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[iPrimaryAddressCountryID] [int] NULL,
[vSecondaryAddressStreet] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[vSecondaryAddressCity] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[vSecondaryAddressState] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[vSecondaryAddressPostalCode] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[iSecondaryAddressCountryID] [int] NULL,
[vImportExternalID] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[iTerritoryID] [int] NULL,
[fDiscount] [float] NULL,
[iDiscountPolicy] [int] NULL,
[vCredit] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[vLimit] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[vPayment] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[bHold] [bit] NULL,
[vDescription] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[bVendor] [bit] NULL,
[bCompetitor] [bit] NULL,
[iCurrencyID] [int] NULL,
[iLeadID] [int] NULL,
[iMyPortalStatus] [int] NULL,
[iCreatePortalUserID] [int] NULL,
[iUpdatePortalUserID] [int] NULL,
[dCreatePortal] [datetime] NULL,
[dUpdatePortal] [datetime] NULL,
[iBillingAddressSameAs] [int] NULL,
[iShippingAddressSameAs] [int] NULL,
[iBillingAddressState] [int] NULL,
[iShippingAddressState] [int] NULL,
[iSecondaryAddressState] [int] NULL,
[iPrimaryAddressState] [int] NULL,
[iDefaultInvoiceTemplateID] [int] NULL,
[iDefaultInvoiceAttachmentTemplateID] [int] NULL,
[vInvoiceAddress] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[vInvoicePostalCode] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[vInvoiceState] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[vInvoiceCity] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[iInvoiceCountryID] [int] NULL,
[vInvoiceEmail] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[iInvoiceTypeOfDistributionID] [int] NULL,
[bGenerateKID] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO







CREATE TRIGGER [dbo].[deletepoludnie]
ON [dbo].[tAccount]
FOR  UPDATE
AS 

if (select count(*) from inserted)=1
begin
	declare @objID int
	declare @assigned int
	
	select @objID=iID, @assigned=iAssignedUserID from inserted
	if @assigned in (select iID from tSecurityUser where iGroupID=16)
	begin
		delete tSecurityDataItem where iEntityID=1 and iObjID=@objID and iGroupID=16
		delete tSecurityDataItem where iEntityID=2 and iGroupID=16 and iObjID in
			(select iID from tContact where iAccountID=@objID)
	end
	else
		if not exists (select * from tSecurityDataItem where iEntityID=1 and iObjID=@objID and iGroupID=16)
		begin
			insert tSecurityDataItem (iGroupID,iEntityID,iObjID,bAvailable)	values (16,1,@ObjID,0)
			insert tSecurityDataItem (iGroupID,iEntityID,iObjID,bAvailable)
				select 16,2,c.iID,0 from tContact c
				left join tSecurityDataItem sdi on c.iID=sdi.iObjID and sdi.iEntityID=2 and sdi.iGroupID=16
				where iAccountID=@ObjID and sdi.iID is null
		end
end

--end













GO
DISABLE TRIGGER [dbo].[deletepoludnie] ON [dbo].[tAccount]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE TRIGGER [dbo].[Qadd_SequentialID_tAccount] ON [dbo].[tAccount] AFTER INSERT, UPDATE, DELETE
AS 
BEGIN
	SET NOCOUNT ON;

	--Insert
    INSERT INTO tQAddData(iEntityID, iObjectID, dUpdate) SELECT 1, INSERTED.iID, GETUTCDATE() FROM INSERTED LEFT OUTER JOIN DELETED ON INSERTED.iID=DELETED.iID WHERE DELETED.iID IS NULL

	--Update
	UPDATE QD SET QD.dUpdate=GETUTCDATE() FROM tQAddData QD INNER JOIN INSERTED ON QD.iEntityID=1 AND QD.iObjectID=INSERTED.iID INNER JOIN DELETED ON INSERTED.iID=DELETED.iID

	--Delete
	UPDATE QD SET QD.iObjectID=NULL, QD.dUpdate=GETUTCDATE() FROM tQAddData QD INNER JOIN DELETED ON QD.iEntityID=1 AND DELETED.iID=QD.iObjectID LEFT OUTER JOIN INSERTED ON INSERTED.iID=DELETED.iID WHERE INSERTED.iID IS NULL

END

GO
DISABLE TRIGGER [dbo].[Qadd_SequentialID_tAccount] ON [dbo].[tAccount]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE TRIGGER [dbo].[tAccount_FU] ON [dbo].[tAccount]
FOR UPDATE
AS 
	DECLARE @iAccountID INT
					
	SELECT @iAccountID = iID FROM INSERTED 
	
	
	SET NOCOUNT ON;
	IF @iAccountID is not NULL 
	BEGIN

		DECLARE @iRefFileItemID INT
		SELECT @iRefFileItemID = iID FROM tRefFileItem WHERE vText = 'Our Company' AND iRefFileID = 80
		IF NOT EXISTS (SELECT iID FROM tMultiChoice WHERE iObjID = @iAccountID AND iEntityID = 1 AND iFieldID = 1431 
						AND iValue = @iRefFileItemID)

		
		BEGIN			
			IF NOT EXISTS (SELECT iID FROM tSecurityDataItem WHERE iObjID = @iAccountID AND iEntityID = 1)
			BEGIN 		
				INSERT tSecurityDataItem (iGroupID, iEntityID, iObjID, bAvailable, iCreateUserID)
				VALUES(4, 1, @iAccountID, 0, 5)
				
				INSERT tSecurityDataItem (iGroupID, iEntityID, iObjID, bAvailable, iCreateUserID)
				VALUES(5, 1, @iAccountID, 0, 5)

				INSERT tSecurityDataItem (iGroupID, iEntityID, iObjID, bAvailable, iCreateUserID)
				VALUES(6, 1, @iAccountID, 0, 5)

				INSERT tSecurityDataItem (iGroupID, iEntityID, iObjID, bAvailable, iCreateUserID)
				VALUES(9, 1, @iAccountID, 0, 5)

				INSERT tSecurityDataItem (iGroupID, iEntityID, iObjID, bAvailable, iCreateUserID)
				VALUES(11, 1, @iAccountID, 0, 5)

				INSERT tSecurityDataItem (iGroupID, iEntityID, iObjID, bAvailable, iCreateUserID)
				VALUES(12, 1, @iAccountID, 0, 5)


				insert tSecurityDataItem(iGroupID, iEntityID, iObjID, bAvailable)
				select 4, 2, c.iID, 0 from tContact c
				left join tSecurityDataItem s on iEntityId=2 and iGroupID=4 and iObjID=c.iID and bAvailable=0
				where iAccountID = @iAccountID and s.iID is null

				insert tSecurityDataItem(iGroupID, iEntityID, iObjID, bAvailable)
				select 5, 2, c.iID, 0 from tContact c
				left join tSecurityDataItem s on iEntityId=2 and iGroupID=5 and iObjID=c.iID and bAvailable=0
				where iAccountID = @iAccountID and s.iID is null

				insert tSecurityDataItem(iGroupID, iEntityID, iObjID, bAvailable)
				select 6, 2, c.iID, 0 from tContact c
				left join tSecurityDataItem s on iEntityId=2 and iGroupID=6 and iObjID=c.iID and bAvailable=0
				where iAccountID = @iAccountID and s.iID is null

				insert tSecurityDataItem(iGroupID, iEntityID, iObjID, bAvailable)
				select 9, 2, c.iID, 0 from tContact c
				left join tSecurityDataItem s on iEntityId=2 and iGroupID=9 and iObjID=c.iID and bAvailable=0
				where iAccountID = @iAccountID and s.iID is null

				insert tSecurityDataItem(iGroupID, iEntityID, iObjID, bAvailable)
				select 11, 2, c.iID, 0 from tContact c
				left join tSecurityDataItem s on iEntityId=2 and iGroupID=11 and iObjID=c.iID and bAvailable=0
				where iAccountID = @iAccountID and s.iID is null

				insert tSecurityDataItem(iGroupID, iEntityID, iObjID, bAvailable)
				select 12, 2, c.iID, 0 from tContact c
				left join tSecurityDataItem s on iEntityId=2 and iGroupID=12 and iObjID=c.iID and bAvailable=0
				where iAccountID = @iAccountID and s.iID is null
			
			END
		END
	END

GO
DISABLE TRIGGER [dbo].[tAccount_FU] ON [dbo].[tAccount]
GO
ALTER TABLE [dbo].[tAccount] ADD CONSTRAINT [PK_tAccount1] PRIMARY KEY CLUSTERED  ([iID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tAccount_1] ON [dbo].[tAccount] ([dCreate] DESC) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tAccount_2] ON [dbo].[tAccount] ([dUpdate] DESC) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_tAccount] ON [dbo].[tAccount] ([vName]) ON [PRIMARY]
GO
CREATE STATISTICS [bCompetitor] ON [dbo].[tAccount] ([bCompetitor])
GO
CREATE STATISTICS [bdeleted] ON [dbo].[tAccount] ([bdeleted])
GO
CREATE STATISTICS [bHold] ON [dbo].[tAccount] ([bHold])
GO
CREATE STATISTICS [bVendor] ON [dbo].[tAccount] ([bVendor])
GO
CREATE STATISTICS [dCreatePortal] ON [dbo].[tAccount] ([dCreatePortal])
GO
CREATE STATISTICS [dUpdatePortal] ON [dbo].[tAccount] ([dUpdatePortal])
GO
CREATE STATISTICS [fDiscount] ON [dbo].[tAccount] ([fDiscount])
GO
CREATE STATISTICS [iAssignedUserID] ON [dbo].[tAccount] ([iAssignedUserID])
GO
CREATE STATISTICS [iBillingAddressCountryID] ON [dbo].[tAccount] ([iBillingAddressCountryID])
GO
CREATE STATISTICS [iBillingAddressSameAs] ON [dbo].[tAccount] ([iBillingAddressSameAs])
GO
CREATE STATISTICS [iBillingAddressState] ON [dbo].[tAccount] ([iBillingAddressState])
GO
CREATE STATISTICS [iCreatePortalUserID] ON [dbo].[tAccount] ([iCreatePortalUserID])
GO
CREATE STATISTICS [iCreateUserID] ON [dbo].[tAccount] ([iCreateUserID])
GO
CREATE STATISTICS [iCurrencyID] ON [dbo].[tAccount] ([iCurrencyID])
GO
CREATE STATISTICS [iDiscountPolicy] ON [dbo].[tAccount] ([iDiscountPolicy])
GO
CREATE STATISTICS [iIndustryID] ON [dbo].[tAccount] ([iIndustryID])
GO
CREATE STATISTICS [iLeadID] ON [dbo].[tAccount] ([iLeadID])
GO
CREATE STATISTICS [iMyPortalStatus] ON [dbo].[tAccount] ([iMyPortalStatus])
GO
CREATE STATISTICS [iParentID] ON [dbo].[tAccount] ([iParentID])
GO
CREATE STATISTICS [iPrimaryAddressCountryID] ON [dbo].[tAccount] ([iPrimaryAddressCountryID])
GO
CREATE STATISTICS [iPrimaryAddressState] ON [dbo].[tAccount] ([iPrimaryAddressState])
GO
CREATE STATISTICS [iRatingID] ON [dbo].[tAccount] ([iRatingID])
GO
CREATE STATISTICS [iSecondaryAddressCountryID] ON [dbo].[tAccount] ([iSecondaryAddressCountryID])
GO
CREATE STATISTICS [iSecondaryAddressState] ON [dbo].[tAccount] ([iSecondaryAddressState])
GO
CREATE STATISTICS [iShippingAddressCountryID] ON [dbo].[tAccount] ([iShippingAddressCountryID])
GO
CREATE STATISTICS [iShippingAddressSameAs] ON [dbo].[tAccount] ([iShippingAddressSameAs])
GO
CREATE STATISTICS [iShippingAddressState] ON [dbo].[tAccount] ([iShippingAddressState])
GO
CREATE STATISTICS [iTerritoryID] ON [dbo].[tAccount] ([iTerritoryID])
GO
CREATE STATISTICS [iUpdatePortalUserID] ON [dbo].[tAccount] ([iUpdatePortalUserID])
GO
CREATE STATISTICS [iUpdateUserID] ON [dbo].[tAccount] ([iUpdateUserID])
GO
CREATE STATISTICS [uSysID] ON [dbo].[tAccount] ([uSysID])
GO
CREATE STATISTICS [vAccountCode] ON [dbo].[tAccount] ([vAccountCode])
GO
CREATE STATISTICS [vBillingAddressCity] ON [dbo].[tAccount] ([vBillingAddressCity])
GO
CREATE STATISTICS [vBillingAddressPostalCode] ON [dbo].[tAccount] ([vBillingAddressPostalCode])
GO
CREATE STATISTICS [vBillingAddressState] ON [dbo].[tAccount] ([vBillingAddressState])
GO
CREATE STATISTICS [vBillingAddressStreet] ON [dbo].[tAccount] ([vBillingAddressStreet])
GO
CREATE STATISTICS [vCredit] ON [dbo].[tAccount] ([vCredit])
GO
CREATE STATISTICS [vDescription] ON [dbo].[tAccount] ([vDescription])
GO
CREATE STATISTICS [vEmail] ON [dbo].[tAccount] ([vEmail])
GO
CREATE STATISTICS [vExternalid] ON [dbo].[tAccount] ([vExternalid])
GO
CREATE STATISTICS [vImportExternalID] ON [dbo].[tAccount] ([vImportExternalID])
GO
CREATE STATISTICS [vLimit] ON [dbo].[tAccount] ([vLimit])
GO
CREATE STATISTICS [vOwnership] ON [dbo].[tAccount] ([vOwnership])
GO
CREATE STATISTICS [vPayment] ON [dbo].[tAccount] ([vPayment])
GO
CREATE STATISTICS [vPhoneFax] ON [dbo].[tAccount] ([vPhoneFax])
GO
CREATE STATISTICS [vPhoneOffice] ON [dbo].[tAccount] ([vPhoneOffice])
GO
CREATE STATISTICS [vPrimaryAddressCity] ON [dbo].[tAccount] ([vPrimaryAddressCity])
GO
CREATE STATISTICS [vPrimaryAddressPostalCode] ON [dbo].[tAccount] ([vPrimaryAddressPostalCode])
GO
CREATE STATISTICS [vPrimaryAddressState] ON [dbo].[tAccount] ([vPrimaryAddressState])
GO
CREATE STATISTICS [vPrimaryAddressStreet] ON [dbo].[tAccount] ([vPrimaryAddressStreet])
GO
CREATE STATISTICS [vSecondaryAddressCity] ON [dbo].[tAccount] ([vSecondaryAddressCity])
GO
CREATE STATISTICS [vSecondaryAddressPostalCode] ON [dbo].[tAccount] ([vSecondaryAddressPostalCode])
GO
CREATE STATISTICS [vSecondaryAddressState] ON [dbo].[tAccount] ([vSecondaryAddressState])
GO
CREATE STATISTICS [vSecondaryAddressStreet] ON [dbo].[tAccount] ([vSecondaryAddressStreet])
GO
CREATE STATISTICS [vShippingAddressCity] ON [dbo].[tAccount] ([vShippingAddressCity])
GO
CREATE STATISTICS [vShippingAddressPostalCode] ON [dbo].[tAccount] ([vShippingAddressPostalCode])
GO
CREATE STATISTICS [vShippingAddressState] ON [dbo].[tAccount] ([vShippingAddressState])
GO
CREATE STATISTICS [vShippingAddressStreet] ON [dbo].[tAccount] ([vShippingAddressStreet])
GO
CREATE STATISTICS [vShortName] ON [dbo].[tAccount] ([vShortName])
GO
CREATE STATISTICS [vWebsite] ON [dbo].[tAccount] ([vWebsite])
GO
ALTER TABLE [dbo].[tAccount] WITH NOCHECK ADD CONSTRAINT [FK_tAccount_tAccount] FOREIGN KEY ([iParentID]) REFERENCES [dbo].[tAccount] ([iID])
GO
ALTER TABLE [dbo].[tAccount] WITH NOCHECK ADD CONSTRAINT [FK_tAccount_tRefFileItem] FOREIGN KEY ([iIndustryID]) REFERENCES [dbo].[tRefFileItem] ([iID])
GO
ALTER TABLE [dbo].[tAccount] WITH NOCHECK ADD CONSTRAINT [FK_tAccount_tRefFileItem1] FOREIGN KEY ([iRatingID]) REFERENCES [dbo].[tRefFileItem] ([iID])
GO
ALTER TABLE [dbo].[tAccount] WITH NOCHECK ADD CONSTRAINT [FK_tAccount_tRefFileItem2] FOREIGN KEY ([iBillingAddressCountryID]) REFERENCES [dbo].[tRefFileItem] ([iID])
GO
ALTER TABLE [dbo].[tAccount] WITH NOCHECK ADD CONSTRAINT [FK_tAccount_tRefFileItem3] FOREIGN KEY ([iShippingAddressCountryID]) REFERENCES [dbo].[tRefFileItem] ([iID])
GO
ALTER TABLE [dbo].[tAccount] WITH NOCHECK ADD CONSTRAINT [FK_tAccount_tRefFileItem4] FOREIGN KEY ([iPrimaryAddressCountryID]) REFERENCES [dbo].[tRefFileItem] ([iID])
GO
ALTER TABLE [dbo].[tAccount] WITH NOCHECK ADD CONSTRAINT [FK_tAccount_tRefFileItem5] FOREIGN KEY ([iSecondaryAddressCountryID]) REFERENCES [dbo].[tRefFileItem] ([iID])
GO
ALTER TABLE [dbo].[tAccount] WITH NOCHECK ADD CONSTRAINT [FK_tAccount_tRefFileItem6] FOREIGN KEY ([iTerritoryID]) REFERENCES [dbo].[tRefFileItem] ([iID])
GO
ALTER TABLE [dbo].[tAccount] WITH NOCHECK ADD CONSTRAINT [FK_tAccount_tRefFileItem7] FOREIGN KEY ([iDiscountPolicy]) REFERENCES [dbo].[tRefFileItem] ([iID])
GO
ALTER TABLE [dbo].[tAccount] WITH NOCHECK ADD CONSTRAINT [FK_tAccount_tSecurityUser] FOREIGN KEY ([iAssignedUserID]) REFERENCES [dbo].[tSecurityUser] ([iID])
GO
ALTER TABLE [dbo].[tAccount] WITH NOCHECK ADD CONSTRAINT [FK_tAccount_tSecurityUser1] FOREIGN KEY ([iUpdateUserID]) REFERENCES [dbo].[tSecurityUser] ([iID])
GO
ALTER TABLE [dbo].[tAccount] WITH NOCHECK ADD CONSTRAINT [FK_tAccount_tSecurityUser2] FOREIGN KEY ([iCreateUserID]) REFERENCES [dbo].[tSecurityUser] ([iID])
GO
