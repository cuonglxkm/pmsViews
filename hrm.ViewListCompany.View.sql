ALTER view [hrm].[ViewListCompany]
as 
    Select 
    JSON_VALUE(e.basic, '$.empCode') as 'empCode',
    JSON_VALUE(e.basic, '$.fullName') as 'fullName',
    JSON_VALUE(e.contact, '$.phoneLocation') as 'phoneLocation',
    JSON_VALUE(e.contact, '$.phone') as 'phone',
    JSON_VALUE(e.contact, '$.email') as 'email',
    JSON_VALUE(e.curentJob, '$.office.text') as 'office',
	e.TenantId
    FROM [hrm].[Employees] as e
GO
