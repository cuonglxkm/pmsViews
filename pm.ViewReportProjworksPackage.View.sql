ALTER view [pm].[ViewReportProjworksPackage]
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
pn.partnerNameVn,
g.TenantId
from pm.ProjGeneral as g
join pm.Approval as ap on g.id = ap.rowId
join pm.PackageBids as pa on g.id = pa.projId
join dm.Partner as pn on g.investorId = pn.id
left join pm.Employees as em on g.collectorFileId = em.id 
where (g.[delete] is null or g.[delete] = 1)  and JSON_VALUE(ap.lastStatus, '$.lastProjPhase') >= 2
GO
