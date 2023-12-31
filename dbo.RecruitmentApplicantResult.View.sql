ALTER view [dbo].[RecruitmentApplicantResult]
as
select ra.id, ra.dataDb, t.turnId,r.*, ra.TenantId
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
