USE [erp_126]
GO
/****** Object:  View [hrm].[ViewListCompany]    Script Date: 11/12/2023 9:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [hrm].[ViewListCompany]
as 
    Select 
    JSON_VALUE(e.basic, '$.empCode') as 'empCode',
    JSON_VALUE(e.basic, '$.fullName') as 'fullName',
    JSON_VALUE(e.contact, '$.phoneLocation') as 'phoneLocation',
    JSON_VALUE(e.contact, '$.phone') as 'phone',
    JSON_VALUE(e.contact, '$.email') as 'email',
    JSON_VALUE(e.curentJob, '$.office.text') as 'office'
    FROM [erp].[hrm].[Employees] as e
GO
