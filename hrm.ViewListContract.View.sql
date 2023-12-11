USE [erp_126]
GO
/****** Object:  View [hrm].[ViewListContract]    Script Date: 11/12/2023 9:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [hrm].[ViewListContract]
as 
Select 
JSON_VALUE(e.basic, '$.fullName') as 'fullName',
c.classification as 'classification',
c.signDate as 'signDate',
c.endDate as 'endDate',
c.typeTime as 'typeTime',
JSON_VALUE(e.curentJob, '$.office.text') as 'office'
FROM [erp].[hrm].[Employees] as e
CROSS APPLY OPENJSON(e.contracts,'$') with(
      [signDate] datetime2,
      [endDate] datetime2,
      [typeTime] int,
      [classification] nvarchar(max) '$.type.text'
) as c
GO
