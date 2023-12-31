ALTER view [hrm].[ViewNewEmployees]
as 
Select 
JSON_VALUE(e.curentJob,'$.office.text') as 'office',
JSON_VALUE(e.curentJob,'$.department.text') as 'department',
JSON_VALUE(e.basic,'$.code') as 'empCode',
JSON_VALUE(e.basic,'$.fullName') as 'fullName',
JSON_VALUE(e.curentJob,'$.title.text') as 'title',
JSON_VALUE(e.curentJob,'$.job.text') as 'job',
c.contractType as 'contractType',
c.effectiveDate as 'effectiveDate',
c.expirationDate as 'expirationDate',
CAST(JSON_VALUE(e.story,'$.birthDay') as datetime2) as 'birthday',
g.genderName as 'gender',
JSON_VALUE(e.contact,'$.currentAddress') as 'address',
JSON_VALUE(e.contact,'$.phone') as 'phone',
JSON_VALUE(e.contact,'$.email') as 'email',
a.identityCard as 'identityCard',
a.dateOfIssue as 'dateOfIssue',
a.issuedBy as 'issuedBy',
--d.name as 'certificate',
--d.issuedBy as 'college',
--d.specialized as 'specialized',
JSON_VALUE(e.basic,'$.educationLevel.text')  as 'certificate',
JSON_VALUE(e.basic,'$.profile_school')  as 'college',
JSON_VALUE(e.basic,'$.profile_major')  as 'specialized',
e.startDate,
e.endDate,
case e.status when 6 then N'Nghỉ việc' when 7 then N'Nghỉ Hưu' when 0 then N'Khởi tạo' else N'Đang làm việc' end  as 'status',
e.TenantId
FROM [hrm].[Employees] as e
join cat.Gender as g on g.genderCode = JSON_VALUE(e.basic,'$.genderId') and JSON_VALUE(g.dataDb,'$.status') = 1

OUTER  APPLY OPENJSON(e.contracts,'$[0]') with(
      [contractType] nvarchar(max) '$.type.text',
      [effectiveDate] datetime2,
      [expirationDate] datetime2
) as c

OUTER  APPLY OPENJSON(e.accuracy,'$[0]') with(
      identityCard nvarchar(max) '$.code',
      dateOfIssue datetime2 '$.dateOfIssue',
      issuedBy nvarchar(max) '$.placeOfIssue'
) as a
--OUTER  APPLY OPENJSON(e.capacityProfile,'$.diploma') with(
--      [name] nvarchar(max),
--      [specialized] nvarchar(max),
--      [graded] nvarchar(max),
--      [issuedBy] nvarchar(max)
--) as d
GO
