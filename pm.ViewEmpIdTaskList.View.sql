ALTER view [pm].[ViewEmpIdTaskList] AS
select empId, workName, projectPhase, projectId, isPublic, TenantId
from [pm].[ProjectWorks]
where (projectPhase = 2  or isPublic = 1 )
GO
