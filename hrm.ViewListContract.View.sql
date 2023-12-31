ALTER view [hrm].[ViewListContract]
as 
Select 
JSON_VALUE(e.basic, '$.fullName') as 'fullName',
c.classification as 'classification',
c.signDate as 'signDate',
c.endDate as 'endDate',
c.typeTime as 'typeTime',
JSON_VALUE(e.curentJob, '$.office.text') as 'office',
e.TenantId
FROM [hrm].[Employees] as e
CROSS APPLY OPENJSON(e.contracts,'$') with(
      [signDate] datetime2,
      [endDate] datetime2,
      [typeTime] int,
      [classification] nvarchar(max) '$.type.text'
) as c
GO
