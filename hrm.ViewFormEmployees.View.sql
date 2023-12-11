USE [erp_126]
GO
/****** Object:  View [hrm].[ViewFormEmployees]    Script Date: 11/12/2023 9:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [hrm].[ViewFormEmployees]
as 
Select 
JSON_VALUE(e.basic, '$.empCode') as 'empCode',
JSON_VALUE(e.basic, '$.fullName') as 'fullName',
JSON_VALUE(e.contact, '$.phone') as 'phone',
JSON_VALUE(e.contact, '$.email') as 'email',
JSON_VALUE(e.curentJob, '$.department.text') as 'department',
JSON_VALUE(e.curentJob, '$.job.text') as 'job',
JSON_VALUE(e.curentJob, '$.status.text') as 'status'
FROM [erp].[hrm].[Employees] as e
GO
