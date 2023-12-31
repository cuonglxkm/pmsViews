ALTER view [hrm].[EmployeeTimeKeepingConfirmationDetailView] AS
SELECT 
	t.[id]
      ,t.[employeesId]	  
      ,t.[month]
	  ,t.[year]
      ,t.[confirmation]
      ,t.[approver]
      ,t.[signer]
      ,t.[approvalStatus]
      ,t.[checkInId]
      ,t.[data]
      ,t.[dataDb]
      ,t.[orderIndex]
      ,t.[status]
	  , c.*, 
	  tp.reasonTypeName,
	  json_value(e.basic, '$.fullName') as fullName,
	  e.code,
	  e.curentJob,
	  t.TenantId
FROM hrm.TimekeepingConfirmation as t
CROSS APPLY OPENJSON(t.confirmation)
WITH(
    [fromDate] DateTimeOffset,
    [toDate] DateTimeOffset,
    [fromTime] DateTimeOffset,
	[toTime] DateTimeOffset,
	[reasonTypeId] int,
	[reasonText] nvarchar(max)
) as c
inner join hrm.Employees as e on t.employeesId = e.id
left join cat.TypeOfConfirmationReason as tp on c.reasonTypeId = tp.id
GO
