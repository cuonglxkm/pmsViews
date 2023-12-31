ALTER view [pm].[ViewCalueExport] AS
SELECT contractId as contractId,
SUM(eb.valueExport) as valueExport,
pg.projCode as projCode,
pg.TenantId as TenantId
  FROM [pm].[Contracts] as ct
  join [pm].[ExportBill] eb on ct.id = eb.contractId
  join [pm].[ProjGeneral] as pg on ct.projId = pg.id
  where JSON_VALUE(ct.data,'$.hasChild') = 'false'
  group by pg.projCode, eb.contractId , pg.TenantId
GO
