USE [erp_126]
GO
/****** Object:  View [pm].[ViewContractValueAfterVNDateYear]    Script Date: 11/12/2023 9:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
















CREATE VIEW [pm].[ViewContractValueAfterVNDateYear] AS
SELECT 
pg.projCode as projCode,
convert(decimal, isnull(ex.valueExport,0)) as valueExport,
convert(decimal,JSON_VALUE(ct.data,'$.contractValueAfterVN')) as ValueAfterVN,
convert(decimal,JSON_VALUE(ct.data,'$.contractValueVN')) as contractValueVN,
YEAR( JSON_VALUE(ct.data,'$.effectiveDateInfo')) as DateYear,
JSON_VALUE(ct.data,'$.parentId') as parentId
  FROM [pm].[Contracts] as ct
  left join [pm].[ExportBill] as ex on ct.Id = ex.contractId
  join [pm].[ProjGeneral] as pg on pg.id = ct.projId
   where JSON_VALUE(ct.dataDb,'$.status') != 3
GO
