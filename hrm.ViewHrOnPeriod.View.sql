USE [erp_126]
GO
/****** Object:  View [hrm].[ViewHrOnPeriod]    Script Date: 11/12/2023 9:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [hrm].[ViewHrOnPeriod]
as 
Select 
JSON_VALUE(e.curentJob,'$.office.text') as 'office',
JSON_VALUE(e.curentJob,'$.department.text') as 'department',
'' as 'totalNumEmBegginPeriod',
'' as 'totalNumEmIncreasing',
'' as 'recruitment',
'' as 'receive',
'' as 'totalNumEmDecreasing',
'' as 'retirement',
'' as 'quit',
'' as 'move',
'' as 'fired',
'' as 'totalNumEmEndPeriod',
'' as 'fluctuations',
'' as 'fluctuationsPercent',
'' as 'status'
FROM [erp].[hrm].[Employees] as e
GO
