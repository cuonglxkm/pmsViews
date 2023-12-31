ALTER view [hrm].[ViewRetirementEmployees]
as 
Select
JSON_VALUE(e.basic,'$.code') as 'empCode',
JSON_VALUE(e.basic,'$.fullName') as 'fullName',
CAST(JSON_VALUE(e.basic, '$.genderId') as int) as 'genderId',
JSON_VALUE(e.curentJob,'$.office.text') as 'office',
JSON_VALUE(e.curentJob,'$.department.text') as 'department',
JSON_VALUE(e.curentJob,'$.title.text') as 'title',
JSON_VALUE(e.curentJob,'$.job.text') as 'job',
JSON_VALUE(e.contracts, '$[0].type.text') AS 'contractType',
e.startDate as 'dayStart',
e.endDate as 'dayOff',
(SELECT TOP 1 dh.[decisionNumber] FROM OPENJSON(e.decisionHistory, '$') WITH(
        [decision] nvarchar(max) '$.decision.value',
        [decisionNumber] nvarchar(max)
    )as dh
    where dh.decision = 7) as  'numberOfRetirementDecisions',
(SELECT TOP 1 dh.reason FROM OPENJSON(e.decisionHistory, '$') WITH(   
        [decision] nvarchar(max) '$.decision.value',
        [reason] nvarchar(max)
    )as dh
    where dh.decision = 7) as 'note',
case e.[status] when 6 then N'Nghỉ việc' when 7 then N'Nghỉ Hưu' when 0 then N'Khởi tạo' else N'Đang làm việc' end  as 'status',
e.TenantId
FROM [hrm].[Employees] as e
where e.[status] =7
GO
