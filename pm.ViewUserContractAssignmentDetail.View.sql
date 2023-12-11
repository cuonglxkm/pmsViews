USE [erp_126]
GO
/****** Object:  View [pm].[ViewUserContractAssignmentDetail]    Script Date: 11/12/2023 9:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [pm].[ViewUserContractAssignmentDetail] AS
SELECT 
pj.[id]      
      ,pj.[projCode]      
      ,pj.[pmProjectId]
	  ,ud.[emId]
      ,ud.[oficeId]
  FROM [pm].[ProjGeneral] as pj
  left join [pm].[UserContractAssignmentDetail] as ud on pj.id = ud.projecId
GO
