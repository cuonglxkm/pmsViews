ALTER VIEW [dbo].[Contracts] AS
SELECT 
e.id as 'employeesId', 
e.fullNameUnsigned as 'fullName',
e.code,
c.* ,
e.jobs,e.curentJob
FROM hrm.Employees as e
CROSS APPLY OPENJSON(e.contracts)
WITH(
    [id]  varchar(64),
    [name] nvarchar(256),
    [contractNumber] nvarchar(256),
    [decisionNumber] nvarchar(256),
    [type] nvarchar(max) as json,
    [typeTime] int,
    [classification] nvarchar(max) as json,
    [parent] nvarchar(max) as json,
    [signDate] datetime2,
    [effectiveDate] datetime2,
    [expirationDate] datetime2,
    [endDate] datetime2,
    [theSigner] nvarchar(max) as json,
    [agencySigned] nvarchar(max) as json,
    [files] nvarchar(max) as json,
    [content] nvarchar(max) as json,
    [note] nvarchar(max),
    [status] nvarchar(max) as json,
	[work_salary_level] int,
	[work_salary_level_rank] nvarchar(max),
	[work_salary_level_salary] int
) as c
GO
