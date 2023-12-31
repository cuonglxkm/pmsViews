ALTER view [dbo].[RecruitmentApplicantPending]
as
    SELECT
    ra.id,    
        ra.basic,
        ra.extend,
        ra.story,
        ra.contact,
        ra.accuracy,
        ra.health,
        ra.relationships,
        ra.finance,
        ra.capacityProfile,
        ra.currentTurnId,
        ra.turnHistory,
        ra.offerSalary,
        ra.files,
        ra.dataDb     
        ,rq.jobPosition
        ,rq.department
		,rq.requestName
        ,th.status
		,pt.requestId
		,pt.recruitmentPlanId
		,pt.planName
		,th.appointmentSchedule,
		ra.TenantId
    FROM [hrm].[RecruitmentApplicant] as ra
        JOIN [dbo].[RecruitmentPlanTurn] as pt on ra.currentTurnId = pt.turnId
        JOIN hrm.RecruitmentRequest as rq on rq.id = pt.requestId  
  CROSS APPLY OPENJSON(ra.turnHistory)
  WITH(
      id nvarchar(max),
      [status] int,
	   [appointmentSchedule]  nvarchar(MAX) '$.appointmentSchedule' AS JSON
  ) as th
    where th.id = ra.currentTurnId
GO
