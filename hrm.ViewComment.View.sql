ALTER view [hrm].[ViewComment] AS
SELECT c.*, json_value(e1.basic, '$.fullName') as creatorName, json_value(e2.basic, '$.fullName') as responseName 
from hrm.Comments c
left join hrm.Employees e1 on c.creatorId = e1.id
left join hrm.Employees e2 on c.responseId = e2.id
GO
