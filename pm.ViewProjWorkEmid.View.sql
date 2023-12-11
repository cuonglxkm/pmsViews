USE [erp_126]
GO
/****** Object:  View [pm].[ViewProjWorkEmid]    Script Date: 11/12/2023 9:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [pm].[ViewProjWorkEmid] AS
SELECT pr.projectId, count(empId) empidSum, empId

  FROM [pm].[ProjectWorks] as pr
  GROUP BY projectId, empId
HAVING COUNT(empId) >= 1
GO
