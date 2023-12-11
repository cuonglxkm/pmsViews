ALTER view [pm].[ViewProjectStatus]
as 
    Select 
    projCode,
    projName,
    '' as 'statusName',
    createdDate,
    modifiedDate,
	pg.TenantId

    FROM [pm].[ProjGeneral] as pg
GO
