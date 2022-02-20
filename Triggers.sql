Create Table tblEmployee
(
 [Id] int identity primary key,
 [Name] nvarchar(50),
 [Salary] int not null,
 [Gender] nvarchar(7),
 [DepartmentId] int not null
)

create Table tblEmployeeAudit
(
 Id int primary key identity,
 AuditData nvarchar(300)
)

select * from tblEmployee
select * from tblEmployeeAudit
Insert into tblEmployee values ('John', 5000, 'Male',3 );
Insert into tblEmployee values ('Mike', 3400, 'Male',2 );
Insert into tblEmployee values ('Pam', 6000, 'Female',1 );
Insert into tblEmployee values ('Todd', 4800, 'Male',4 );
Insert into tblEmployee values ('Sara', 3200, 'Female',1 );
Insert into tblEmployee values ('Ben', 4800, 'Male',3 );

--creating insert trigger
Alter TRIGGER tr_tblEMployee_ForInsert
ON tblEmployee
FOR INSERT
AS
BEGIN

	select * from inserted --select all rows and columns from inserted table
 Declare @Id int
 Select @Id = Id from inserted
 
 insert into tblEmployeeAudit 
 values('New employee with Id  = ' + Cast(@Id as nvarchar(5)) + ' is added at ' + cast(Getdate() as nvarchar(20)))
END;

Insert into tblEmployee values ('Darla', 1800, 'Female', 3);
Insert into tblEmployee values ('Jimmy', 2800, 'Male', 3);



--creater trigger for delete
CREATE TRIGGER tr_tblEMployee_ForDelete
ON tblEmployee
FOR DELETE
AS
BEGIN
 Declare @Id int
 Select @Id = Id from deleted
 
 insert into tblEmployeeAudit 
 values('An existing employee with Id  = ' + Cast(@Id as nvarchar(5)) + ' is deleted at ' + Cast(Getdate() as nvarchar(20)))
END;

--delete query
Delete from tblEmployee where Id = 6;

--updating a trigger
alter trigger tr_tblEmployee_ForUpdate
on tblEmployee
for Update
as
Begin
 Select * from deleted
 Select * from inserted 
End

Update tblEmployee set Name = 'Todd', Salary = 6000, 
Gender = 'Female' where Id = 3

select * from tblEmployee
select * from tblEmployeeAudit