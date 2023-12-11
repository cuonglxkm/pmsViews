ALTER view [pm].[ViewProjectWorksLogCR]
as
select pcr.*,
em.name as CreateByname,
em.id as CreateByID
from [pm].[ProjectWorksLogCR] as pcr 
join [pm].[Employees] as em on JSON_VALUE(pcr.dataDb,'$.createdBy') = em.userId
 where pcr.statusCreate = 3 or pcr.statusCreate = 4  or pcr.statusExtend = 3 or  pcr.statusExtend = 4

GO
