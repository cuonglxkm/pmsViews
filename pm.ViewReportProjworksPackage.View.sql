USE [erp_126]
GO
/****** Object:  View [pm].[ViewReportProjworksPackage]    Script Date: 11/12/2023 9:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [pm].[ViewReportProjworksPackage]
as
select 
g.id,
g.projCode,
g.projName,
--g.collectorFileId, 
em.name as 'collectorFileName',
pa.packageBidName,
--pa.startDay,
--pa.lastDay,
pa.bidDeadlineSubmissionDate,
pn.partnerNameVn
from pm.ProjGeneral as g
join pm.Approval as ap on g.id = ap.rowId
join pm.PackageBids as pa on g.id = pa.projId
join dm.Partner as pn on g.investorId = pn.id
left join pm.Employees as em on g.collectorFileId = em.id 
where (g.[delete] is null or g.[delete] = 1)  and JSON_VALUE(ap.lastStatus, '$.lastProjPhase') >= 2
GO
