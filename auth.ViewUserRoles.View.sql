USE [erp_126]
GO
/****** Object:  View [auth].[ViewUserRoles]    Script Date: 11/12/2023 9:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [auth].[ViewUserRoles] AS
SELECT 
	UserId as UserId,
	RoleId as RoleId

FROM [auth].[UserRoles]
GO
