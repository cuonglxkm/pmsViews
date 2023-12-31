ALTER view [hrm].[EmployeeCheckInOutView] AS
/*Duongdx - Giai phap cu
SELECT UserEnrollNumber, [TimeDate], TimeKeepingConfirmationId, approvalStatus, MIN(TimeStr) AS TimeIn, MAX(TimeStr) AS TimeOut
FROM [sal].[CheckInOut]
GROUP BY UserEnrollNumber, [TimeDate], TimeKeepingConfirmationId, approvalStatus
*/
Select c.id, e.id as empId, e.code, e.fullNameUnsigned as 'fullName', e.curentJob, gc.UserEnrollNumber, gc.[TimeDate], [TimeIn], [TimeOut], TimeKeepingConfirmationId, t.approvalStatus, e.dataDb,c.TenantId from [sal].[CheckInOut] c
Join(
	SELECT UserEnrollNumber, [TimeDate], MIN(TimeStr) AS TimeIn, MAX(TimeStr) AS TimeOut
	FROM [sal].[CheckInOut] 
	GROUP BY UserEnrollNumber, [TimeDate]
) gc
on c.UserEnrollNumber = gc.UserEnrollNumber AND c.[TimeDate] = gc.[TimeDate] and c.TimeStr = gc.TimeIn 
left join [hrm].TimekeepingConfirmation t on c.TimeKeepingConfirmationId = t.id
left join [hrm].Employees e on gc.UserEnrollNumber = e.UserEnrollNumber
GO
