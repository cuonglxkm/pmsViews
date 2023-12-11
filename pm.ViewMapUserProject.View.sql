USE [erp_126]
GO
/****** Object:  View [pm].[ViewMapUserProject]    Script Date: 11/12/2023 9:17:45 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE VIEW [pm].[ViewMapUserProject]
AS

select * from
(
--Nguoi phu trach cong viec
SELECT   distinct    empId, projectId projId
FROM            pm.ProjectWorks
union
--Nguoi kiem tra
SELECT   distinct    testerId, projectId projId
FROM            pm.ProjectWorks where testerId is not null
union
--Nguoi phu trach check list
SELECT  JSON_VALUE(productNeed,'$.empId') empId, JSON_VALUE(productNeed,'$.projId')  projId
FROM            pm.CheckList
union
--AM Du an
SELECT  emId empId, projecId  projId
FROM    pm.UserContractAssignmentDetail
union
--quan ly hop dong
SELECT  JSON_VALUE(negotiationResults,'$.contractManage') empId, projectId projId
FROM            pm.Negotiation
union
--Nguoi thong ke
SELECT  value empId, t.projectId  projId
FROM    pm.ContractAssignment as t
cross apply openjson (t.data, N'$.statistical')
where value is not null
union
--Chuyen vien de xuat giai phap
SELECT     distinct   contractorId empId, projId projId
FROM            pm.PackageBids where contractorId is not null
union
--ho tro ky thuat
SELECT     distinct   clueTechniquesId empId, projId projId
FROM            pm.PackageBids where clueTechniquesId is not null
union
--Chuyen vien cam ket ky thuat
SELECT     distinct   clueTechnicalSupportLeaderId empId, projId projId
FROM            pm.PackageBids where clueTechnicalSupportLeaderId is not null
union
--Rui ro
SELECT     JSON_VALUE([data],'$.responsibleId') empId, JSON_VALUE([data],'$.projId')  projId
FROM            pm.Risk
union
--van de
SELECT     JSON_VALUE([data],'$.responsibleId') empId, JSON_VALUE([data],'$.projId')  projId
FROM            pm.Issue 
union
--thay doi
SELECT     JSON_VALUE([data],'$.persionChangeId') empId, JSON_VALUE([data],'$.projId')  projId
FROM            pm.ChangeRequest 
--NguoiLapBangKe
union
SELECT   distinct    empId, projId
FROM            pm.MixOffice where status=1
--Pm don vi lien quan
union
SELECT   distinct    pmId, projId
FROM            pm.MixOffice where status=1
--Lanh dao don vi lien quan

union
select distinct e.id, o.projId  from pm.MixOffice o inner join pm.Employees e on o.officeId=e.departmentId
	inner join auth.UserRoles u on e.userId=u.UserId
	inner join auth.Roles r on u.RoleId=r.Id
	where r.Name='Deployment Department Leader' and JSON_VALUE(o.dataDb,'$.status')<>3
union
-- nhân viên mua hàng
SELECT  UserPurchaseId as empId, id as projId
FROM            pm.ProjGeneral
union
-- Presale manager
SELECT  presaleId as empId, id as projId
FROM            pm.ProjGeneral as pr
join  pm.Approval as ap on pr.id = ap.rowId
union
SELECT  pmoId as empId, id as projId
FROM            pm.ProjGeneral
) t where t.empId is not null
GO
