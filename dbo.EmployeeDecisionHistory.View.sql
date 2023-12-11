USE [erp_126]
GO
/****** Object:  View [dbo].[EmployeeDecisionHistory]    Script Date: 11/12/2023 9:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[EmployeeDecisionHistory]
as
select e.id as [employeesId], d.*, e.dataDb
from hrm.Employees as e
cross apply openjson(e.decisionHistory)
with(
    [id] nvarchar(max),
    [decision] nvarchar(max) as json,
    [decisionNumber] nvarchar(max),
    [effectiveDate] datetime2,
    [endDate] datetime2,
    [decisionFile] nvarchar(max) as json,    
    [reason] nvarchar(max),
    [company] nvarchar(max) as json,
    [office] nvarchar(max) as json,    
    [department] nvarchar(max) as json,
    [part] nvarchar(max) as json,
    [nature] nvarchar(max) as json,
    [job] nvarchar(max) as json,
    [type] nvarchar(max) as json,
    [manager] nvarchar(max),
    [title] nvarchar(max) as json,
    [position] nvarchar(max) as json,
    [status] nvarchar(max) as json,
    [bindingContract] nvarchar(max) as json,
    [subtasks] nvarchar(max) as json,
    [statusActive] nvarchar(max) as json,
    [unConcurrentlyId] nvarchar(max)
) as d
GO
