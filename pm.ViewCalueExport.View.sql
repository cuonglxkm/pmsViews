USE [erp_126]
GO
/****** Object:  View [pm].[ViewCalueExport]    Script Date: 11/12/2023 9:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE VIEW [pm].[ViewCalueExport] AS
SELECT contractId as contractId,
SUM(eb.valueExport) as valueExport,
pg.projCode as projCode
  FROM [pm].[Contracts] as ct
  join [pm].[ExportBill] eb on ct.id = eb.contractId
  join [pm].[ProjGeneral] as pg on ct.projId = pg.id
  where JSON_VALUE(ct.data,'$.hasChild') = 'false'
  group by pg.projCode, eb.contractId
GO
