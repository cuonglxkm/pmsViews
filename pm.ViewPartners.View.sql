ALTER view [pm].[ViewPartners] AS
select 
id,
JSON_VALUE(data, '$.partnerNameVn') as 'partnerName',
JSON_VALUE(data, '$.partCode') as 'partCode',
JSON_VALUE(data, '$.note') as 'note',
JSON_VALUE(data,'$.nameDetail') as 'partnerNameDetail',
JSON_VALUE(data,'$.rankPartner') as 'rankPartner',
TenantId,
(select count(*) from pm.ProjGeneral as proj where proj.investorId = pn.id and (select projPhase from pm.Approval as ap where ap.rowId = proj.id) in (5,6)) as 'totalProjectDeployment',
(select count(*) from pm.ProjGeneral as proj where proj.investorId = pn.id 
	and ((select projPhase from pm.Approval as ap where ap.rowId = proj.id)=7 or proj.isRefuse=1 )) as 'totalProjectClose',
(select pngroup.partnerGroupNameVn from dm.PartnerGroup as pngroup where pngroup.id= JSON_VALUE(pn.data,'$.idPartGroup')) as 'partnerGroupName',
(select count(*) from pm.ProjGeneral as proj where proj.investorId = pn.id) as 'totalProject',
(select count(*) from pm.ProjGeneral as proj where proj.investorId = pn.id and (select YEAR(JSON_VALUE(ct.data,'$.effectiveDateInfo')) from pm.Contracts as ct where ct.projId=proj.id  and JSON_VALUE(data, '$.parentId') is null) = (select YEAR(GETDATE()))) as 'totalProjectInYear',
(select 
	id, 
	projName,
	projCode,
	(select YEAR(JSON_VALUE(ct.data,'$.effectiveDateInfo') ) from pm.Contracts as ct where ct.projId=pg.id and JSON_VALUE(data, '$.parentId') is null) as 'year',
	(select JSON_VALUE(data,'$.contractValueAfterVN') from pm.Contracts as ct where ct.projId = pg.id  and JSON_VALUE(data, '$.parentId') is null  ) as 'priceOfContracts',
	(select JSON_VALUE(data,'$.effectiveDateInfo') startDate from pm.Contracts as ct where ct.projId = pg.id  and JSON_VALUE(data, '$.parentId') is null  ) as 'startDateOfContract',
	(select JSON_VALUE(data,'$.totalDateInfo') from pm.Contracts as ct where ct.projId = pg.id   and JSON_VALUE(data, '$.parentId') is null ) as 'timesOfContract',
	(select JSON_VALUE(data,'$.unitTotal') from pm.Contracts as ct where ct.projId = pg.id   and JSON_VALUE(data, '$.parentId') is null ) as 'unitTimesOfContract',
	(select sum(ac.amountOfMoney * ac.exchangeRate) from pm.ActualCosts as ac where ac.projectId = pg.id COLLATE SQL_Latin1_General_CP1_CI_AI ) as 'totalMoneyOfActualCosts',
	(select projPhase from pm.Approval as ap where ap.rowId = pg.id ) as 'projPhase'
	from pm.ProjGeneral as pg where pg.investorId = pn.id for json path) as 'project'
from dm.Partner as pn  where JSON_VALUE(dataDb,'$.status')=1  and ((select count(*) from pm.ProjGeneral as proj where proj.investorId = pn.id) >0)
GO
