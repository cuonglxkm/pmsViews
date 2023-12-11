ALTER view [pm].[ViewProjectPO] AS
	select pg.Id, pg.projCode , isnull((select top 1 1  from [pm].[Contracts] as ct where ct.projId = pg.id and JSON_VALUE(ct.dataDb,'$.status') != 3 and JSON_VALUE(ct.data,'$.parentId') is not null),0) as PO from [pm].[ProjGeneral] as pg
	
GO
