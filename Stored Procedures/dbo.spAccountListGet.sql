SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[spAccountListGet]
@iUserID int
WITH EXEC AS CALLER
AS
select * from tAccount
GO
GRANT EXECUTE ON  [dbo].[spAccountListGet] TO [SPExecute]
GO
