ALTER view [hrm].[EmployeeTimeKeepingConfirmationView] AS
SELECT 
      t.*, 
	  json_value(e.basic, '$.fullName') as fullName,
	  e.code,
	  e.curentJob
FROM hrm.TimekeepingConfirmation as t
inner join hrm.Employees as e on t.employeesId = e.id
GO
