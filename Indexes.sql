select * from tblEmployee

--creating index
create Index IX_tblEmployee_Salary
on tblEmployee (salary ASC)

sp_Helpindex tblEmployee

select * from tblEmployee

--droping the index
drop index tblEmployee.IX_tblEmployee_Salary

--creating cluster Index
Create Clustered Index IX_tblEmployee_Gender_Salary
ON tblEmployee(Gender DESC, Salary ASC)

--Creating NonClusters Index
Create NonClustered Index IX_tblEmployee_Name
ON tblEmployee(Name)