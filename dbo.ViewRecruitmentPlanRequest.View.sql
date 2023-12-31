ALTER view [dbo].[ViewRecruitmentPlanRequest]
as
SELECT p.id as 'planId',
      t.requestId,
      q.department,
	  p.TenantId
  FROM [hrm].[RecruitmentPlan] as p
  cross apply openjson(p.groups) WITH
  (
      [requests] nvarchar(max) as json
  ) as g
  cross apply openjson(g.requests) with
  (
      [requestId] bigint
  ) as t
  join hrm.RecruitmentRequest as q on q.id = t.requestId
GO
