USE [erp_126]
GO
/****** Object:  View [pm].[ViewContractValueAfterVNDateMonth]    Script Date: 11/12/2023 9:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [pm].[ViewContractValueAfterVNDateMonth] AS
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
