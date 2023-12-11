USE [erp_126]
GO
/****** Object:  View [pm].[ViewOfficeToCompanyInfor]    Script Date: 11/12/2023 9:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [pm].[ViewOfficeToCompanyInfor] AS
SELECT 
 e.id,
 e.dataDb,
 e.companyCode as acronyms,
 e.typeId,
 e.companyName as nameOffice,
 e.parentId,
 e.companyName_EN as OfficeClue
FROM [cat].[CompanyInfo] as e
where JSON_VALUE(e.dataDb, '$.status') !=3
GO
