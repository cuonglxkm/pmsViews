ALTER view [pm].[ViewTimeSheet]
as
select 
tenbang.projData,
tenbang.workData,
tenbang.empData,
ts.DayStartWeek,
ts.data

from 
(select
(select projGeneralId as 'projGeneralId', ProjName as 'projName' from pm.ProjGeneral as pr where pr.id = pw.projGeneralId for json path, WITHOUT_ARRAY_WRAPPER) as 'projData',
(select id as 'projWorkId',
	PerrentId as 'perrentId',
	Listparent as 'listParent',
	WorkName as 'workName',
	BeginDate as 'beginDate', 
	EndDate as 'endDate',
    StatusId as 'statusId', (select statusName from dm.[Status] as s where s.id = pw.StatusId) as 'statusName',
	case
		when (select top 1 id from pm.Projworks as pw2 where pw2.PerrentId = pw.id and (pw2.[delete] != 3 or pw2.[delete] is NULL)) is null then 'alone'
		else 'parent'
	end as 'checkparent'
	for json path, WITHOUT_ARRAY_WRAPPER ) as 'workData',
(select empId as 'empId', fullNameUnsigned as 'empName' from hrm.Employees as e where e.id = pw.empid for json path, WITHOUT_ARRAY_WRAPPER) as 'empData'
FROM [erp].[pm].[Projworks] as pw
where [delete] != 3 or [delete] is null ) as tenbang
full Outer Join (select 
DISTINCT
dayStartWeek,
projWorkId,
(select id, [hours], date, daysOfWeek from pm.TimeSheetDetail as t3 
where t3.DayStartWeek = t2.DayStartWeek and t3.ProjWorkId = t2.ProjWorkId  for json auto) as 'data'
from pm.TimeSheetDetail as t2 where [delete] != 3) as ts
on ts.projWorkId = JSON_VALUE(tenbang.workData, '$.projWorkId')
GO
