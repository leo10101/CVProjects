USE [aspnetdb]
GO
SET @ApplicationName = '/secured'
EXECUTE @RC = [dbo].[aspnet_Roles_CreateRole] @ApplicationName,'Managers'
GO
EXECUTE @RC = [dbo].[aspnet_Roles_CreateRole] @ApplicationName,'Users'
GO

