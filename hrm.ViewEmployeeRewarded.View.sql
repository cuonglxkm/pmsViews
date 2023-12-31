ALTER view [hrm].[ViewEmployeeRewarded]
as 
    Select 
    JSON_VALUE(emp.basic,'$.empCode') as 'empCode',
    JSON_VALUE(emp.basic,'$.fullName') as 'fullName',
    JSON_VALUE(emp.curentJob,'$.department.text') as 'department',
    JSON_VALUE(emp.curentJob,'$.position.text') as 'position',
    JSON_VALUE(emp.curentJob,'$.job.text') as 'job',
    '' as 'trophyOfReward',
    '' as 'departReward',
    '' as 'decisionRewardCode',
    '' as 'rewardAmount',
    '' as 'note',
    '' as 'status',
	emp.TenantId
    FROM [hrm].[Employees] as emp
GO
