ALTER view [dbo].[ViewConfigurationApprovedEmployee]
as
    select c.id,
        json_value(c.data,'$.name') as 'name',
        CAST(json_value(c.data,'$.level') as int) as 'level',
        c.typeId,
        t.*,
        JSON_VALUE(e.basic,'$.fullName') as 'fullName',
        JSON_VALUE(e.curentJob,'$.job.text') as 'job',
        JSON_VALUE(e.curentJob,'$.title.text') as 'title',
        JSON_VALUE(e.curentJob,'$.office.text') as 'office',
		e.TenantId
    from cat.ConfigurationApproved as c
CROSS APPLY openjson(c.data,'$.employees')
with(
    [employeeId] bigint ,
    confirm bit
) as t
        join hrm.Employees as e on e.id = t.employeeId
GO
