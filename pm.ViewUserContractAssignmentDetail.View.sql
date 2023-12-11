ALTER view [pm].[ViewUserContractAssignmentDetail] AS
SELECT 
pj.[id]      
      ,pj.[projCode]      
      ,pj.[pmProjectId]
	  ,ud.[emId]
      ,ud.[oficeId]
	  ,pj.TenantId
  FROM [pm].[ProjGeneral] as pj
  left join [pm].[UserContractAssignmentDetail] as ud on pj.id = ud.projecId
GO
