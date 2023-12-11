USE [erp_126]
GO
/****** Object:  View [dbo].[RecruitmentApplicantResult]    Script Date: 11/12/2023 9:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE View [dbo].[RecruitmentApplicantResult]
as
select ra.id, ra.dataDb, t.turnId,r.*
from hrm.RecruitmentApplicant as ra
cross apply openjson(ra.turnHistory)
with(
    turnId nvarchar(64) '$.id',
    resultDetail nvarchar(max) as json
) as t
cross apply openjson(t.resultDetail)
with(
    interviewerId int,
    evaluation nvarchar(max) as json,
    [status] int,
    advantages nvarchar(max),
    defect nvarchar(max),
    note nvarchar(max)
) as r
GO
