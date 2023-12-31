ALTER view [hrm].[ViewOverAndLackingEm]
as 
Select
'' as 'idDepartment',
JSON_VALUE(e.curentJob,'$.department.text') as 'department',
JSON_VALUE(e.curentJob,'$.job.value') as 'idJob',
JSON_VALUE(e.curentJob,'$.job.text') as 'job',
'' as 'effectiveDate',
'' as 'location',
'' as 'planningStaffing',
'' as 'numbStaff',
'' as 'upDownStaff',
'' as 'status',
e.TenantId
FROM [hrm].[Employees] as e
GO
