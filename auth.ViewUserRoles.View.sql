ALTER VIEW [auth].[ViewUserRoles] AS
SELECT 
	UserId as UserId,
	RoleId as RoleId

FROM [auth].[UserRoles]
GO
