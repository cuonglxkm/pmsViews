USE [erp_126]
GO
/****** Object:  View [pm].[ViewReportWeek]    Script Date: 11/12/2023 9:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE view [pm].[ViewReportWeek]
as 
 Select
projName,
JSON_VALUE(c.data, '$.contractNumberInfo') as 'contractNumberInfo'
,projCode
,JSON_VALUE(p.data, '$.partnerNameVn') as 'partnerNameVn'
,CAST(JSON_VALUE(c.data, '$.contractValueVN') as money) as 'contractValueVN'
,CAST(JSON_VALUE(c.data, '$.contractValueAfterVN') as money) as 'contractValueAfterVN'
,CAST(JSON_VALUE(c.data, '$.signDayInfo')as datetime )as 'signDayInfo'
,CAST(JSON_VALUE(c.data, '$.effectiveDateInfo')as datetime) as 'effectiveDateInfo'
,CAST(dateAcceptance as datetime) as 'dateAcceptance'
,CAST(dateActual as datetime) as 'dateActual'
,'' as 'deployWork '
,'' as 'payWork'
FROM [pm].[ProjGeneral] as g
left join [pm].[Contracts] as c on c.projId = g.id
left join [dm].[Partner] as p on p.id = g.investorId
left join [pm].[Acceptance] a on a.contractId = c.Id
GO
