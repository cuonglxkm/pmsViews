ALTER view [pm].[ViewUserRole] AS
Select ur.UserId as userId,
       ur.RoleId,
	   em.[name]as name,
	   em.id,
	   em.userName,
	   em.departmentId,
	   ro.Description,
	   ro.[Name] as RoleName,
	   em.TenantId
  FROM [auth].[UserRoles] as ur
  join [pm].[Employees] em on ur.UserId = em.UserId
  join [auth].[Roles] ro on ro.Id = ur.RoleId
GO
