ALTER view [hrm].[ViewFormEmployees]
as 
Select 
JSON_VALUE(e.basic, '$.empCode') as 'empCode',
JSON_VALUE(e.basic, '$.fullName') as 'fullName',
JSON_VALUE(e.contact, '$.phone') as 'phone',
JSON_VALUE(e.contact, '$.email') as 'email',
JSON_VALUE(e.curentJob, '$.department.text') as 'department',
JSON_VALUE(e.curentJob, '$.job.text') as 'job',
JSON_VALUE(e.curentJob, '$.status.text') as 'status',
e.TenantId
FROM [hrm].[Employees] as e
GO
