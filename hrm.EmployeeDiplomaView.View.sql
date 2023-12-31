ALTER view [hrm].[EmployeeDiplomaView] AS
SELECT 
e.employeesId,
e.fullName,
e.code,
e.curentJob,
e.dataDb,
c.*,
e.TenantId
FROM hrm.ViewEmployeeCapacity as e
CROSS APPLY OPENJSON(e.diploma)
WITH(
	[id] varchar(64),
    [name] nvarchar(max),
	[educationLevel] nvarchar(max) as json,
	[specialized] nvarchar(max) as json,
    [graded] nvarchar(max),
	[duration] nvarchar(25),
    [issuedDate] nvarchar(25),
	[issuedBy] nvarchar(max)
) as c
/*
left join [cat].CertificateDomain cd on cd.DomainCode = c.domain
left join [cat].CertificateType ct on ct.id = cd.certificateTypeId
*/
where json_value(e.dataDb, '$.status') = 1
GO
