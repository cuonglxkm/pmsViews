USE [erp_126]
GO
/****** Object:  View [auth].[Employees]    Script Date: 11/12/2023 9:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO











CREATE VIEW [auth].[Employees] AS
SELECT 
	id as EmployeeId,
	code as EmployeeCode,
	JSON_VALUE(basic, '$.account.value') as UserId,
	JSON_VALUE(basic, '$.account.text') as UserName,
	JSON_VALUE(basic, '$.avatar.url') as Avatar,
	JSON_VALUE(basic, '$.fullName') as FullName,
	JSON_VALUE(contact, '$.email') as Email,
	CAST(JSON_VALUE(curentJob, '$.department.value') AS int) as DepartmentId,
	JSON_VALUE(curentJob, '$.department.text') as DepartmentName,
	JSON_VALUE(curentJob, '$.position.text') as Position,
	JSON_VALUE(curentJob, '$.title.text') as Title,
	case when JSON_VALUE(basic, '$.status.value') = 2 and (JSON_VALUE(curentJob, '$.status.value') = 2  or JSON_VALUE(curentJob, '$.status.value') = 6 or JSON_VALUE(curentJob, '$.status.value') = 7)
and JSON_VALUE(dataDb, '$.status') != 3 and JSON_VALUE (basic, '$.account.text') is not null then 1 else 0 end as Active
FROM [hrm].[Employees]
WHERE JSON_VALUE(dataDb, '$.status') = 1
--(JSON_VALUE(basic, '$.status.value') = 2 and (JSON_VALUE(curentJob, '$.status.value') = 2  or JSON_VALUE(curentJob, '$.status.value') = 6 or JSON_VALUE(curentJob, '$.status.value') = 7)
--and JSON_VALUE(dataDb, '$.status') != 3) and JSON_VALUE (basic, '$.account.text') is not null
GO
