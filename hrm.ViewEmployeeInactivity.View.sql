ALTER view [hrm].[ViewEmployeeInactivity]
as
SELECT 
    JSON_VALUE(emp.basic, '$.code') as 'empCode',
    JSON_VALUE(emp.basic, '$.fullName') as 'fullName',
    CAST(JSON_VALUE(emp.basic, '$.genderId') as int) as 'genderId',
	JSON_VALUE(emp.curentJob,'$.office.text') as 'office',
    JSON_VALUE(emp.curentJob, '$.department.text') as 'department',
	emp.startDate  as 'startWorkDate',
    JSON_VALUE(emp.contracts, '$[0].type.text') AS 'contractType',
	emp.endDate as 'endWorkDate',
    (SELECT TOP 1 dh.reason FROM OPENJSON(emp.decisionHistory, '$') WITH(
        [decision] nvarchar(max) '$.decision.value',       
        [reason] nvarchar(max)
    )as dh
    where dh.decision = 6) as 'reason',
    '' AS 'departDecision',
    '' AS 'educationFees',
    (SELECT TOP 1 dh.decisionNumber FROM OPENJSON(emp.decisionHistory, '$') WITH(
        [decision] nvarchar(max) '$.decision.value',       
        [decisionNumber] nvarchar(max)
    )as dh
    where dh.decision = 6) as 'decisionNumber',
	case emp.status when 6 then N'Nghỉ việc' when 7 then N'Nghỉ Hưu' when 0 then N'Khởi tạo' else N'Đang làm việc' end  as 'status',
	emp.TenantId
    FROM [hrm].[Employees] as emp
    WHERE emp.status = 6--JSON_VALUE(emp.basic,'$.status.value') = 3
GO
