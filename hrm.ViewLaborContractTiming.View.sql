USE [erp_126]
GO
/****** Object:  View [hrm].[ViewLaborContractTiming]    Script Date: 11/12/2023 9:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [hrm].[ViewLaborContractTiming]
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
'' as 'status'
FROM [erp].[hrm].[Employees] as e
CROSS APPLY OPENJSON(e.contracts,'$') with(
    [contractNumber] nvarchar(max),
    [type] nvarchar(max) '$.type.text',
    [effectiveDate] datetime2,
    [expirationDate] datetime2
) as c
GO
