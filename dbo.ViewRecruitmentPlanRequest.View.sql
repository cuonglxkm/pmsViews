USE [erp_126]
GO
/****** Object:  View [dbo].[ViewRecruitmentPlanRequest]    Script Date: 11/12/2023 9:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[ViewRecruitmentPlanRequest]
as
SELECT p.id as 'planId',
      t.requestId,
      q.department
  FROM [erp].[hrm].[RecruitmentPlan] as p
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
