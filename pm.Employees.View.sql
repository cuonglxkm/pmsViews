ALTER view [pm].[Employees]
as
select
em.id,
em.code as employeeCode,
JSON_VALUE(basic, '$.account.value') as userId,
JSON_VALUE(basic, '$.fullName') as name,
JSON_VALUE(contact, '$.email') as email,
JSON_VALUE(contact, '$.phone') as phone,
JSON_VALUE(basic, '$.account.text') as userName,
CAST( JSON_VALUE(curentJob, '$.department.value')as bigint) as departmentId,
JSON_VALUE(curentJob, '$.department.text') as departmentName,
CAST( JSON_VALUE(curentJob, '$.office.value')as bigint) as officeId,
JSON_VALUE(curentJob, '$.office.text') as officeName,
JSON_VALUE(curentJob, '$.position.text') as position,
ofi.Acronyms  as departmentCode,
case when JSON_VALUE(basic, '$.status.value') = 2 and (JSON_VALUE(curentJob, '$.status.value') = 2  or JSON_VALUE(curentJob, '$.status.value') = 6 or JSON_VALUE(curentJob, '$.status.value') = 7)
and JSON_VALUE(em.dataDb, '$.status') != 3 and JSON_VALUE (basic, '$.account.text') is not null then 1 else 0 end as Active,
em.TenantId
from [hrm].[Employees] as em
left join dm.Office as ofi on ofi.Id =  JSON_VALUE(em.curentJob, '$.department.value')
where JSON_VALUE(basic, '$.account.text') is not null and JSON_VALUE(em.dataDb, '$.status') = 1
 --(JSON_VALUE(basic, '$.status.value') = 2 and (JSON_VALUE(curentJob, '$.status.value') = 2  or JSON_VALUE(curentJob, '$.status.value') = 6 or JSON_VALUE(curentJob, '$.status.value') = 7)
--and JSON_VALUE(em.dataDb, '$.status') != 3) and JSON_VALUE (basic, '$.account.text') is not null
GO
