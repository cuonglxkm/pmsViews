USE [erp_126]
GO
/****** Object:  View [hrm].[ViewEmployeeCapacity]    Script Date: 11/12/2023 9:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








CREATE VIEW [hrm].[ViewEmployeeCapacity] AS
SELECT 
e.id as 'employeesId', 
e.fullNameUnsigned as 'fullName',
e.code,
e.curentJob,
e.dataDb,
c.*
FROM hrm.Employees as e
CROSS APPLY OPENJSON(e.capacityProfile)
WITH(
    [capacity] nvarchar(max) as json,    
    [skills] nvarchar(max) as json,
    [diploma] nvarchar(max) as json,
    [certificate] nvarchar(max) as json,
	[workExperience] nvarchar(max) as json,
	[commendation] nvarchar(max) as json,
	[discipline] nvarchar(max) as json
) as c
GO
