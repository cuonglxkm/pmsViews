USE [erp_126]
GO
/****** Object:  View [pm].[ViewProjectStatus]    Script Date: 11/12/2023 9:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [pm].[ViewProjectStatus]
as 
    Select 
    projCode,
    projName,
    '' as 'statusName',
    createdDate,
    modifiedDate

    FROM [pm].[ProjGeneral] as pg
GO
