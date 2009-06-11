﻿CREATE PROCEDURE [dbo].[netsqlazman_DeleteDelegate](@AUTHORIZATIONID INT, @OWNERSID VARBINARY(85))
AS
DECLARE @APPLICATIONID int
SELECT @APPLICATIONID = Items.ApplicationId FROM dbo.Items() Items INNER JOIN dbo.Authorizations() Authorizations ON Items.ItemId = Authorizations.ItemId WHERE Authorizations.AuthorizationId = @AUTHORIZATIONID
IF @APPLICATIONID IS NOT NULL AND dbo.CheckApplicationPermissions(@ApplicationId, 1) = 1
	DELETE FROM dbo.[netsqlazman_AuthorizationsTable] WHERE AuthorizationId = @AUTHORIZATIONID AND ownerSid = @OWNERSID
ELSE
	RAISERROR ('Item NOT Found or Application permission denied.', 16, 1)

