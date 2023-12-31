ALTER view [hrm].[ViewHrOnPeriod]
as 
Select 
JSON_VALUE(e.curentJob,'$.office.text') as 'office',
JSON_VALUE(e.curentJob,'$.department.text') as 'department',
'' as 'totalNumEmBegginPeriod',
'' as 'totalNumEmIncreasing',
'' as 'recruitment',
'' as 'receive',
'' as 'totalNumEmDecreasing',
'' as 'retirement',
'' as 'quit',
'' as 'move',
'' as 'fired',
'' as 'totalNumEmEndPeriod',
'' as 'fluctuations',
'' as 'fluctuationsPercent',
'' as 'status',
e.TenantId
FROM [hrm].[Employees] as e
GO
