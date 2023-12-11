USE [erp_126]
GO
/****** Object:  View [hrm].[EmployeeCheckInOutView]    Script Date: 11/12/2023 9:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [hrm].[EmployeeCheckInOutView] AS
/*Duongdx - Giai phap cu
SELECT UserEnrollNumber, [TimeDate], TimeKeepingConfirmationId, approvalStatus, MIN(TimeStr) AS TimeIn, MAX(TimeStr) AS TimeOut
FROM [sal].[CheckInOut]
GROUP BY UserEnrollNumber, [TimeDate], TimeKeepingConfirmationId, approvalStatus
*/
Select c.id, e.id as empId, e.code, e.fullNameUnsigned as 'fullName', e.curentJob, gc.UserEnrollNumber, gc.[TimeDate], [TimeIn], [TimeOut], TimeKeepingConfirmationId, t.approvalStatus, e.dataDb from [sal].[CheckInOut] c
Join(
	SELECT UserEnrollNumber, [TimeDate], MIN(TimeStr) AS TimeIn, MAX(TimeStr) AS TimeOut
	FROM [sal].[CheckInOut] 
	GROUP BY UserEnrollNumber, [TimeDate]
) gc
on c.UserEnrollNumber = gc.UserEnrollNumber AND c.[TimeDate] = gc.[TimeDate] and c.TimeStr = gc.TimeIn 
left join [hrm].TimekeepingConfirmation t on c.TimeKeepingConfirmationId = t.id
left join [hrm].Employees e on gc.UserEnrollNumber = e.UserEnrollNumber
GO
