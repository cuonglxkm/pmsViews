USE [erp_126]
GO
/****** Object:  View [pm].[ViewUserRoleCoordinator]    Script Date: 11/12/2023 9:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [pm].[ViewUserRoleCoordinator] AS
Select ur.UserId as userId,
       ur.RoleId,
	   em.[name]as name,
	   em.[name]as fullName,
	   em.id,
	   em.id as employeeId,
	   em.departmentName,
	   em.userName,
	   em.officeName,
	   em.officeId,
	   em.employeeCode
  FROM [auth].[UserRoles] as ur
  join [pm].[Employees] em on ur.UserId = em.UserId
  where ur.RoleId = '65fa022f-4740-4ccd-8c6f-0af02d49c984'
GO
