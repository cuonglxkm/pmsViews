USE [erp_126]
GO
/****** Object:  View [dbo].[ViewConfigurationApprovedEmployee]    Script Date: 11/12/2023 9:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewConfigurationApprovedEmployee]
as
    select c.id,
        json_value(c.data,'$.name') as 'name',
        CAST(json_value(c.data,'$.level') as int) as 'level',
        c.typeId,
        t.*,
        JSON_VALUE(e.basic,'$.fullName') as 'fullName',
        JSON_VALUE(e.curentJob,'$.job.text') as 'job',
        JSON_VALUE(e.curentJob,'$.title.text') as 'title',
        JSON_VALUE(e.curentJob,'$.office.text') as 'office'
    from cat.ConfigurationApproved as c
CROSS APPLY openjson(c.data,'$.employees')
with(
    [employeeId] bigint ,
    confirm bit
) as t
        join hrm.Employees as e on e.id = t.employeeId
GO
