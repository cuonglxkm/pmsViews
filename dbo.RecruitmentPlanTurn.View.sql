USE [erp_126]
GO
/****** Object:  View [dbo].[RecruitmentPlanTurn]    Script Date: 11/12/2023 9:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[RecruitmentPlanTurn] AS
SELECT id as [recruitmentPlanId], [planName],t.[requestId],td.*
  FROM [hrm].[RecruitmentPlan]
  CROSS APPLY OPENJSON(request)		
  WITH(	
	[requestId] int,
	[turn] nvarchar(max) as json
  ) as t
  CROSS APPLY OPENJSON(t.turn)
  WITH(
	[turnId] nvarchar(64),
	[turnName] nvarchar(256),
    [position] nvarchar(20),
	[description] nvarchar(max),
	[evaluationForm] int,
	[candidateEmailForm] int
  ) as td
GO
