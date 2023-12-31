ALTER view [dbo].[RecruitmentPlanTurn] AS
SELECT id as [recruitmentPlanId], [planName],t.[requestId],td.*, [TenantId]
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
