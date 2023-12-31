ALTER view [hrm].[EmployeeCertificateView] AS
SELECT 
e.employeesId,
e.fullName,
e.code,
e.curentJob,
e.dataDb,
e.TenantId,
/*cd.DomainName,
ct.id as typeId,
ct.typeName,
*/
c.*
FROM hrm.ViewEmployeeCapacity as e
CROSS APPLY OPENJSON(e.certificate)
WITH(
	[id] varchar(64),
    [name] nvarchar(max),
	[type] nvarchar(max) as json,
    [domain] nvarchar(max) as json,
    [issuedBy] nvarchar(256),
    [dateOfIssue] datetime2,
    [expirationDate] datetime2,
    [renewalDate] datetime2
) as c
/*
left join [cat].CertificateDomain cd on cd.DomainCode = c.domain
left join [cat].CertificateType ct on ct.id = cd.certificateTypeId
*/
where json_value(e.dataDb, '$.status') = 1
GO
