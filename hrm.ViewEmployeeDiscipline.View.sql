USE [erp_126]
GO
/****** Object:  View [hrm].[ViewEmployeeDiscipline]    Script Date: 11/12/2023 9:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [hrm].[ViewEmployeeDiscipline]
as 
  Select 
  JSON_VALUE(e.curentJob,'$.office.text') as 'office',
  JSON_VALUE(e.curentJob,'$.department.text') as 'department',
  JSON_VALUE(e.basic,'$.empCode') as 'empCode',
  JSON_VALUE(e.basic,'$.fullName') as 'fullName',
  JSON_VALUE(e.curentJob,'$.title.text') as 'title',
  JSON_VALUE(e.curentJob,'$.job.text') as 'job',
  d.name as 'disciplineType',
  d.typeId as 'disciplineLevel',
  d.id as 'disciplineNumber',
  '' as 'disciplineDescription',
  d.startDate as 'disciplineStartDate',
  d.endDate as 'disciplineEndDate',
  d.value as 'disciplineMoney',
  d.note as 'disciplineNote',
  '' as 'status'
  FROM [erp].[hrm].[Employees] as e
  CROSS APPLY OPENJSON(e.capacityProfile,'$.discipline') with(
      [id] nvarchar(max),
      [startDate] datetime2,
      [endDate] datetime2,
      [typeId] nvarchar(max),
      [name] nvarchar(max),
      [value] nvarchar(max),
      [note] nvarchar(max)
  ) as d
  WHERE d.id is not null
GO
