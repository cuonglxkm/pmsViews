ALTER view [pm].[ViewContractValueAfterVNDateMonth] AS
SELECT 
pg.projCode as projCode,
pg.PO as PO,
convert(decimal,JSON_VALUE(ct.data,'$.contractValueAfterVN')) as ValueAfterVN,
convert(decimal,JSON_VALUE(ct.data,'$.contractValueVN')) as contractValueVN,
JSON_VALUE(ct.data,'$.effectiveDateInfo') as [DATE],
 MONTH(JSON_VALUE(ct.data,'$.effectiveDateInfo')) as DateMonth,
 Year(JSON_VALUE(ct.data,'$.effectiveDateInfo')) as DateYear,
JSON_VALUE(ct.data,'$.parentId') as parentId
  FROM [pm].[Contracts] as ct
  join [pm].[ViewProjectPO] as pg on pg.id = ct.projId
   where JSON_VALUE(ct.dataDb,'$.status') != 3
GO
