create database products

use products

Create Table tblProducts
(
 [Id] int identity primary key,
 [Name] nvarchar(50),
 [Description] nvarchar(250)
)

Create Table tblProductSales
(
 Id int primary key identity,
 ProductId int foreign key references tblProducts(Id),
 UnitPrice int,
 QuantitySold int
)
Insert into tblProducts values ('Product-1','Product-1 Description')
 Insert into tblProducts values ('Product-2','Product-2 Description')
 Insert into tblProducts values ('Product-3','Product-3 Description')
Insert into tblProducts values ('Product-4','Product-4 Description')
Insert into tblProducts values ('Product-5','Product-5 Description')

Insert into tblProductSales values (5,5,3)
Insert into tblProductSales values (4,23,4)
Insert into tblProductSales values (3,31,2)
Insert into tblProductSales values (4,93,9)
Insert into tblProductSales values (5,72,5)

							 select * from tblProducts
 							 select * from tblProductSales
--desplaying  name and productid
Declare @ProductId int
Declare @Name nvarchar(30)

-- Declare the cursor using the declare keyword
Declare ProductCursor CURSOR FOR 
select Id,Name from tblProducts where Id<=5

open ProductCursor

Fetch Next from ProductCursor into @ProductId, @Name -- we got 1 row

-- If the result set still has rows, @@FETCH_STATUS will be ZERO
While(@@FETCH_STATUS = 0)
Begin
	print 'Id = ' + cast (@ProductId as nvarchar(10)) + ' Name = ' + @Name

	Fetch Next from ProductCursor into @ProductId, @Name -- we got all 5 rows
	End
-- Release the row set	
close ProductCursor

-- Deallocate, the resources associated with the cursor
DEALLOCATE ProductCursor
	