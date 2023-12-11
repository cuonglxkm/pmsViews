USE [erp_126]
GO
/****** Object:  View [dbo].[RecruitmentApplicantView]    Script Date: 11/12/2023 9:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [dbo].[RecruitmentApplicantView]
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
