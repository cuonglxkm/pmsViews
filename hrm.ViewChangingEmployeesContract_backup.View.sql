ALTER view [hrm].[ViewChangingEmployeesContract_backup]
as 
SELECT 
e.code as 'code',
e.id as 'employeesId',
JSON_VALUE(e.basic,'$.fullName') as 'fullName',
JSON_VALUE(e.curentJob,'$.office.text') as 'office',
JSON_VALUE(e.curentJob,'$.department.text') as 'department',
JSON_VALUE(e.curentJob,'$.title.text') as 'title',
JSON_VALUE(e.curentJob,'$.job.text') as 'job',
c.type as 'contractType',
c.contractNumber as 'oldContractNumber',
c.effectiveDate as 'startDate',
c.expirationDate as 'endDate',
'' as 'newContractType',
'' as 'newContractNumber',
'' as 'newStartDate',
'' as 'newEndDate',
'' as 'status'
FROM [hrm].[Employees] as e

CROSS APPLY OPENJSON(e.contracts,'$') with(
      [contractNumber] nvarchar(max),
      [type] nvarchar(max) '$.type.text',
      [effectiveDate] datetime2,
      [expirationDate] datetime2
) as c
GO
