USE [erp_126]
GO
/****** Object:  View [hrm].[ViewOverAndLackingEm]    Script Date: 11/12/2023 9:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [hrm].[ViewOverAndLackingEm]
as 
Select
'' as 'idDepartment',
JSON_VALUE(e.curentJob,'$.department.text') as 'department',
JSON_VALUE(e.curentJob,'$.job.value') as 'idJob',
JSON_VALUE(e.curentJob,'$.job.text') as 'job',
'' as 'effectiveDate',
'' as 'location',
'' as 'planningStaffing',
'' as 'numbStaff',
'' as 'upDownStaff',
'' as 'status'
FROM [erp].[hrm].[Employees] as e
GO
