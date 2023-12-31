ALTER view [hrm].[ViewEmployeeCapacity] AS
SELECT 
e.id as 'employeesId', 
e.fullNameUnsigned as 'fullName',
e.code,
e.curentJob,
e.dataDb,
e.TenantId,
c.*
FROM hrm.Employees as e
CROSS APPLY OPENJSON(e.capacityProfile)
WITH(
    [capacity] nvarchar(max) as json,    
    [skills] nvarchar(max) as json,
    [diploma] nvarchar(max) as json,
    [certificate] nvarchar(max) as json,
	[workExperience] nvarchar(max) as json,
	[commendation] nvarchar(max) as json,
	[discipline] nvarchar(max) as json
) as c
GO
