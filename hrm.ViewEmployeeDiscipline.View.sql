ALTER view [hrm].[ViewEmployeeDiscipline]
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
  '' as 'status',
  e.TenantId
  FROM [hrm].[Employees] as e
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
