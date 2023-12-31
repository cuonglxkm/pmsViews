ALTER view [hrm].[MeetingCalendarView] AS
SELECT 
	m.id, 
	m.meetingRoomName, 
	r.id as rid, 
	e.fullNameUnsigned as fullName,
	c.companyName as departmentName,
	r.meetingTitle, 
	r.importantLevel, 
	r.meetingDate, 
	DATEPART(week, r.meetingDate) as 'week',
	r.meetingDescription,
	IIF(DATEPART(WEEKDAY, r.meetingDate)=2, r.meetingTitle, '') as T2,
	IIF(DATEPART(WEEKDAY, r.meetingDate)=3, r.meetingTitle, '') as T3,
	IIF(DATEPART(WEEKDAY, r.meetingDate)=4, r.meetingTitle, '') as T4,
	IIF(DATEPART(WEEKDAY, r.meetingDate)=5, r.meetingTitle, '') as T5,
	IIF(DATEPART(WEEKDAY, r.meetingDate)=6, r.meetingTitle, '') as T6,
	IIF(DATEPART(WEEKDAY, r.meetingDate)=7, r.meetingTitle, '') as T7,
	IIF(DATEPART(WEEKDAY, r.meetingDate)=1, r.meetingTitle, '') as CN,
	r.fromTime, 
	r.toTime,
	r.status,
	m.TenantId
from [cat].[MeetingRoom] as m
	inner join [hrm].[MeetingRoomRegister] AS r on r.meetingRoomId = m.id
	inner join [hrm].[Employees] e on r.employeesId = e.id
	inner join [cat].CompanyInfo c on r.departmentId = c.id
GO
