ALTER view [pm].[ViewContractValueAfterVN] AS
SELECT
pg.projCode as projCode,
convert(decimal, isnull(ex.valueExport,0)) as valueExport,
convert(decimal,JSON_VALUE(ct.data,'$.contractValueAfterVN')) as ValueAfterVN,
convert(decimal,JSON_VALUE(ct.data,'$.contractValueVN')) as contractValueVN,
JSON_VALUE(ct.data,'$.effectiveDateInfo') as effectiveDateInfo,
JSON_VALUE(ct.data,'$.parentId') as parentId,
pg.TenantId
  FROM [pm].[Contracts] as ct
  left join [pm].[ExportBill] as ex on ct.Id = ex.contractId
  join [pm].[ProjGeneral] as pg on pg.id = ct.projId
  where JSON_VALUE(ct.data,'$.hasChild') = 'true'
GO
