ALTER view [hrm].[ViewLaborContractTiming]
as 
  Select 
JSON_VALUE(e.curentJob,'$.office.text') as 'office',
JSON_VALUE(e.curentJob,'$.department.text') as 'department',
JSON_VALUE(e.basic, '$.empCode') as 'empCode',
JSON_VALUE(e.basic, '$.fullName') as 'fullName',
JSON_VALUE(e.curentJob, '$.title.text') as 'positionType',
JSON_VALUE(e.curentJob,'$.job.text') as 'job',
c.contractNumber as 'contractNumber',
c.type as 'contractType',
c.effectiveDate as 'startDate',
c.expirationDate as 'endDate',
'' as 'note',
'' as 'status',
e.TenantId
FROM [hrm].[Employees] as e
CROSS APPLY OPENJSON(e.contracts,'$') with(
    [contractNumber] nvarchar(max),
    [type] nvarchar(max) '$.type.text',
    [effectiveDate] datetime2,
    [expirationDate] datetime2
) as c
GO
