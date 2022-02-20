--stored procedure for getemployes
create proc spGetEmployees
as begin
begin try
select name, gender from tblEmployee
end try
begin catch 
SELECT  
             ERROR_NUMBER() AS ErrorNumber  
            ,ERROR_SEVERITY() AS ErrorSeverity  
            ,ERROR_STATE() AS ErrorState  
            ,ERROR_PROCEDURE() AS ErrorProcedure  
            ,ERROR_LINE() AS ErrorLine  
            ,ERROR_MESSAGE() AS ErrorMessage; 
 end catch 
end

--stored procedure for Add Employee
create proc spAddEmployees
(
@Name nvarchar(20),
@Salary int,
@Gender varchar(7),
@DepartmentId int 
)
as begin
begin try
insert into tblEmployee values(@name,@Salary,@Gender,@DepartmentId)
end try
begin catch 
SELECT  
             ERROR_NUMBER() AS ErrorNumber  
            ,ERROR_SEVERITY() AS ErrorSeverity  
            ,ERROR_STATE() AS ErrorState  
            ,ERROR_PROCEDURE() AS ErrorProcedure  
            ,ERROR_LINE() AS ErrorLine  
            ,ERROR_MESSAGE() AS ErrorMessage; 
end catch 
end

spAddEmployees 'Roy',8000,'Male',7

--stored procedure for inner join
create proc spInnerJoin
as
begin
begin try
select tblProducts.Id,name,UnitPrice
from tblProducts inner join tblProductSales on tblProducts.Id = tblProductSales.ProductId
end try
begin catch 
SELECT  
             ERROR_NUMBER() AS ErrorNumber  
            ,ERROR_SEVERITY() AS ErrorSeverity  
            ,ERROR_STATE() AS ErrorState  
            ,ERROR_PROCEDURE() AS ErrorProcedure  
            ,ERROR_LINE() AS ErrorLine  
            ,ERROR_MESSAGE() AS ErrorMessage; 
end catch 
end


 update tblProductSales
 set UnitPrice = case 
	when name = 'Product-4' then 55
	when name = 'Product-3' then 42
	end
 from tblProductSales 
 join tblProducts
 on tblProducts.Id = tblProductSales.ProductId
 where (name = 'Product-2' or name = 'Product-4')






select * from tblProducts
select * from tblProductSales
