ALTER view [dbo].[RecruitmentApplicantView]
as
SELECT [id]
      ,[basic]
      ,[story]
      ,[contact]
      ,[accuracy]
      ,[health]
      ,[relationships]
      ,[files]
      ,[finance]
      ,[capacityProfile]
      ,[currentTurnId]
      ,[turnHistory]
      ,[dataDb]
      ,[extend]
	  ,[offerSalary],
	  [TenantId],
      t.turnId,
	  t.appointmentSchedule,
      t.status
  FROM [hrm].[RecruitmentApplicant]
  CROSS APPLY OPENJSON(turnHistory)
  WITH(
      [turnId] nvarchar(256) '$.id',
      [status] int,
	  [appointmentSchedule]  nvarchar(MAX) '$.appointmentSchedule' AS JSON
  ) as t
GO
