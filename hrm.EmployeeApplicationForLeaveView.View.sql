ALTER view [hrm].[EmployeeApplicationForLeaveView] AS
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
