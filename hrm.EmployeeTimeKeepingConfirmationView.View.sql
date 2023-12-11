USE [erp_126]
GO
/****** Object:  View [hrm].[EmployeeTimeKeepingConfirmationView]    Script Date: 11/12/2023 9:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*

ALTER VIEW [hrm].[EmployeeTimeKeepingConfirmationView] AS
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
	  e.curentJob
FROM hrm.TimekeepingConfirmation as t
CROSS APPLY OPENJSON(t.confirmation)
WITH(
    [fromDate] DateTime2,
    [toDate] DateTime2,
    [fromTime] DateTime2,
	[toTime] DateTime2,
	[reasonTypeId] int,
	[reasonText] nvarchar(max)
) as c
inner join hrm.Employees as e on t.employeesId = e.id
left join cat.TypeOfConfirmationReason as tp on c.reasonTypeId = tp.id
GO

*/



CREATE VIEW [hrm].[EmployeeTimeKeepingConfirmationView] AS
SELECT 
      t.*, 
	  json_value(e.basic, '$.fullName') as fullName,
	  e.code,
	  e.curentJob
FROM hrm.TimekeepingConfirmation as t
inner join hrm.Employees as e on t.employeesId = e.id
GO
