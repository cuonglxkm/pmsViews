ALTER view [dbo].[EmployeeDecisionHistory]
as
select e.id as [employeesId], d.*, e.dataDb,e.TenantId
from hrm.Employees as e
cross apply openjson(e.decisionHistory)
with(
    [id] nvarchar(max),
    [decision] nvarchar(max) as json,
    [decisionNumber] nvarchar(max),
    [effectiveDate] datetime2,
    [endDate] datetime2,
    [decisionFile] nvarchar(max) as json,    
    [reason] nvarchar(max),
    [company] nvarchar(max) as json,
    [office] nvarchar(max) as json,    
    [department] nvarchar(max) as json,
    [part] nvarchar(max) as json,
    [nature] nvarchar(max) as json,
    [job] nvarchar(max) as json,
    [type] nvarchar(max) as json,
    [manager] nvarchar(max),
    [title] nvarchar(max) as json,
    [position] nvarchar(max) as json,
    [status] nvarchar(max) as json,
    [bindingContract] nvarchar(max) as json,
    [subtasks] nvarchar(max) as json,
    [statusActive] nvarchar(max) as json,
    [unConcurrentlyId] nvarchar(max)
) as d
GO
