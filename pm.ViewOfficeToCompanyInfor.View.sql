ALTER view [pm].[ViewOfficeToCompanyInfor] AS
SELECT 
 e.id,
 e.dataDb,
 e.companyCode as acronyms,
 e.typeId,
 e.companyName as nameOffice,
 e.parentId,
 e.companyName_EN as OfficeClue,
 e.TenantId
FROM [cat].[CompanyInfo] as e
where JSON_VALUE(e.dataDb, '$.status') !=3
GO
