ALTER view [pm].[ViewRole] AS
Select ur.id as RoleId,
	   ur.Description,
	   ur.Name
  FROM  [auth].[Roles] as ur
  where ur.Description like '%PMS%'
GO
