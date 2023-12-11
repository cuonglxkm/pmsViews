USE [erp_126]
GO
/****** Object:  View [pm].[ViewUserRole]    Script Date: 11/12/2023 9:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [pm].[ViewUserRole] AS
Select ur.UserId as userId,
       ur.RoleId,
	   em.[name]as name,
	   em.id,
	   em.userName,
	   em.departmentId,
	    ro.Description,
	   ro.[Name] as RoleName
  FROM [auth].[UserRoles] as ur
  join [pm].[Employees] em on ur.UserId = em.UserId
  join [auth].[Roles] ro on ro.Id = ur.RoleId
GO
