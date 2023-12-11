USE [erp_126]
GO
/****** Object:  View [pm].[ViewBillValueAfterVNDateMonth]    Script Date: 11/12/2023 9:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [pm].[ViewBillValueAfterVNDateMonth] AS
SELECT 
pg.projCode as projCode,
pg.PO as PO,
convert(decimal, isnull(ex.valueExport,0)) as valueExport,
ex.dateExport as [DATE],
 MONTH(ex.dateExport) as DateMonth,
 Year(ex.dateExport) as DateYear,
JSON_VALUE(ct.data,'$.parentId') as parentId
  FROM [pm].[Contracts] as ct
  left join [pm].[ExportBill] as ex on ct.Id = ex.contractId
  join [pm].[ViewProjectPO] as pg on pg.id = ct.projId
  where JSON_VALUE(ct.dataDb,'$.status') != 3
GO
