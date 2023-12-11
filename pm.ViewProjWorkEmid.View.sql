ALTER view [pm].[ViewProjWorkEmid] AS
SELECT pr.projectId, count(empId) empidSum, empId, TenantId

  FROM [pm].[ProjectWorks] as pr
  GROUP BY projectId, empId, TenantId
HAVING COUNT(empId) >= 1
GO
