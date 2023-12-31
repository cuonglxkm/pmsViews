ALTER view [hrm].[ViewEmployeesAlmostRetired]
as 
Select 
JSON_VALUE(e.curentJob,'$.office.text') as 'office',
JSON_VALUE(e.curentJob,'$.department.text') as 'department',
JSON_VALUE(e.basic,'$.empCode') as 'empCode',
JSON_VALUE(e.basic,'$.fullName') as 'fullName',
JSON_VALUE(e.curentJob,'$.title.text') as 'title',
JSON_VALUE(e.curentJob,'$.job.text') as 'job',
JSON_VALUE(e.story,'$.birthDay') as 'birthday',
g.genderName as 'gender',
'' as 'expectedRetirementDate',
'' as 'seniority',
'' as 'note',
'' as 'status',
e.TenantId
FROM [hrm].[Employees] as e
join cat.Gender as g on  g.genderCode = JSON_VALUE(e.basic, '$.genderId')  
GO
