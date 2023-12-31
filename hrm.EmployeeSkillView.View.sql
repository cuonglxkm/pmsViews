ALTER view [hrm].[EmployeeSkillView] AS
SELECT 
e.employeesId,
e.fullName,
e.code,
e.curentJob,
e.dataDb,
c.*,
e.TenantId
FROM hrm.ViewEmployeeCapacity as e
CROSS APPLY OPENJSON(e.skills)
WITH(
	[id] varchar(64),
    [name] nvarchar(max),
	[level] nvarchar(max),
    [exper] nvarchar(max)
) as c
where json_value(e.dataDb, '$.status') = 1
GO
