USE [erp_126]
GO
/****** Object:  View [hrm].[EmployeeSkillView]    Script Date: 11/12/2023 9:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








CREATE VIEW [hrm].[EmployeeSkillView] AS
SELECT 
e.employeesId,
e.fullName,
e.code,
e.curentJob,
e.dataDb,
c.*
FROM hrm.ViewEmployeeCapacity as e
CROSS APPLY OPENJSON(e.skills)
WITH(
	[id] varchar(64),
    [name] nvarchar(max),
	[level] nvarchar(max),
    [exper] nvarchar(max)
) as c
where json_value(e.dataDb, '$.status') = 1
GO
