USE [erp_126]
GO
/****** Object:  View [hrm].[EmployeeApplicationForLeaveView]    Script Date: 11/12/2023 9:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









Create VIEW [hrm].[EmployeeApplicationForLeaveView] AS
SELECT 
e.fullNameUnsigned as 'fullName',
e.code,
c.* ,
t.reasonTypeName,
e.curentJob
FROM hrm.ApplicationForLeave c 
inner join hrm.Employees as e on e.id = c.employeesId
left join cat.TypeOfLeave t on c.reasonTypeId = t.id
GO
