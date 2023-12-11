USE [erp_126]
GO
/****** Object:  View [hrm].[ViewChangingEmployeesContract_backup]    Script Date: 11/12/2023 9:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE view [hrm].[ViewChangingEmployeesContract_backup]
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
