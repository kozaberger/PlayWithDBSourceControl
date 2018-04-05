SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[spAccountListGet]
@iUserID int

AS
select iID,vName
  ,(select t.vText from tRefFileItem t where t.iID=a.iPrimaryAddressCountryID)
from tAccount a
GO
GRANT EXECUTE ON  [dbo].[spAccountListGet] TO [SPExecute]
GO
