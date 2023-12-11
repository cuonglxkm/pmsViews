USE [erp_126]
GO
/****** Object:  View [dbo].[ViewRecruitmentRequestHistory]    Script Date: 11/12/2023 9:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[ViewRecruitmentRequestHistory]
as
SELECT t.id as [requestId],h.*,
json_value(e.basic,'$.fullName') as [approverName],
json_value(e2.basic,'$.fullName') as [employeeName]
FROM [erp].[hrm].[RecruitmentRequest] as t
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
