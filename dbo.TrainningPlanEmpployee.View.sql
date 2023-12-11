USE [erp_126]
GO
/****** Object:  View [dbo].[TrainningPlanEmpployee]    Script Date: 11/12/2023 9:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[TrainningPlanEmpployee]
as 
select e.id, t.id as 'tranningPlanId', ep.id as 'employeeId', ep.basic, ep.contact, ep.curentJob, ep.dataDb, e.result, JSON_VALUE(s.data,'$.skillName') as 'skillName', JSON_VALUE(ce.data, 
'$.certificateName') as 'certificateName', JSON_VALUE(p.data,'$.performanceName') as 'performanceName'
from [hrm].[TrainningPlan] as t
cross apply OPENJSON(t.trainningPlanEmployee) 
with(
  [id] nvarchar(64),
  [employeeId] bigint,
  result nvarchar(max) as json
)as e
JOIN hrm.Employees as ep on ep.id = e.[employeeId]
LEFT JOIN cat.Skill as s on s.id = JSON_VALUE(e.result,'$.skillId')
LEFT JOIN cat.Certificate as ce on ce.id =  JSON_VALUE(e.result,'$.certificateId') 
LEFT JOIN cat.Performance as p on p.id =  JSON_VALUE(e.result,'$.performanceId') 
GO
