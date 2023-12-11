USE [erp_126]
GO
/****** Object:  View [pm].[ViewRole]    Script Date: 11/12/2023 9:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [pm].[ViewRole] AS
Select ur.id as RoleId,
	   ur.Description,
	   ur.Name
  FROM  [auth].[Roles] as ur
  where ur.Description like '%PMS%'
GO
