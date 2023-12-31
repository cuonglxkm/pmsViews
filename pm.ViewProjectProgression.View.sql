ALTER view [pm].[ViewProjectProgression]
as 
    Select 
    projCode,
    projName,
    '' as 'statusName',
    '' as 'startDatePlan',
    '' as 'endDatePlan',
    '' as 'daysPlan',
    '' as 'startDateActual',
    '' as 'endDateActual',
    '' as 'daysActual',
	pg.TenantId
    FROM [pm].[ProjGeneral] as pg
GO
