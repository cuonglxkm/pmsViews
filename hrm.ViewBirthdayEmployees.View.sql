ALTER view [hrm].[ViewBirthdayEmployees]
as 
Select 
JSON_VALUE(e.curentJob,'$.office.text') as 'office',
JSON_VALUE(e.curentJob,'$.department.text') as 'department',
e.code as 'empCode',
JSON_VALUE(e.basic,'$.fullName') as 'fullName',
JSON_VALUE(e.curentJob,'$.title.text') as 'title',
SWITCHOFFSET(CAST(JSON_VALUE(e.story,'$.birthDay') as datetimeoffset),'+07:00') as 'birthday',
DATEPART(MONTH,SWITCHOFFSET(CAST(JSON_VALUE(e.story,'$.birthDay') as datetimeoffset),'+07:00')) as 'month',
DATEPART(DAY,SWITCHOFFSET(CAST(JSON_VALUE(e.story,'$.birthDay') as datetimeoffset),'+07:00')) as 'day',
DATEDIFF(YEAR,SWITCHOFFSET(CAST(JSON_VALUE(e.story,'$.birthDay') as datetimeoffset),'+07:00'), GETDATE()) +1 as 'old',
g.genderName as 'gender',
case e.[status] when 6 then N'Nghỉ việc' when 7 then N'Nghỉ Hưu' when 0 then N'Khởi tạo' else N'Đang làm việc' end  as 'status',
e.TenantId
FROM [hrm].[Employees] as e
join cat.Gender as g on g.genderCode = JSON_VALUE(e.basic,'$.genderId') and JSON_VALUE(g.dataDb,'$.status') = 1
where e.[status] <> 6 and e.[status] <> 7
GO
