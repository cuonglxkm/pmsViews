USE [erp_126]
GO
/****** Object:  View [pm].[ViewProjectProgression]    Script Date: 11/12/2023 9:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [pm].[ViewProjectProgression]
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
    '' as 'daysActual'

    FROM [pm].[ProjGeneral] as pg
GO
