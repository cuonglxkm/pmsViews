ALTER view [dbo].[ViewTrainningRequestHistory]
as
SELECT t.id as [requestId],h.*,
json_value(e.basic,'$.fullName') as [approverName],
json_value(e2.basic,'$.fullName') as [employeeName],
t.TenantId
FROM [hrm].[TrainningRequest] as t
Cross apply OPENJSON(t.[history]) with(
	[id] nvarchar(max),
	[approver] bigint,
	[note] nvarchar(max),
	[employeeId] bigint,
	[createDate] datetime2
) as h
join hrm.Employees as e on e.id = h.[approver]
join hrm.Employees as e2 on e2.id = h.[employeeId]
GO
