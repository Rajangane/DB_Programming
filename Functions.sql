use products
--FUNCTIONS
SELECT Abs(-243.5) AS AbsNum;

SELECT COUNT(Id) AS NumberOfProducts FROM tblProductSales

SELECT REVERSE('PRATIKSHA');

SELECT GETDATE()

SELECT CEILING(22.75) AS CeilValue;

SELECT FLOOR(23.75) AS FloorValue;

SELECT DEGREES(1.5);


--User defined functions

--getting product name by id
CREATE FUNCTION GetProduct(@Id INT)  
 RETURNS VARCHAR(50)  
 AS  
BEGIN  
    RETURN (SELECT Name FROM tblProducts WHERE Id=@Id)  
END 

PRINT dbo.GetProduct(1) ;



-- getting all products of user
CREATE FUNCTION GetAllProductss(@Id INT)  
RETURNS TABLE  
AS  
RETURN  
    SELECT *FROM tblProducts WHERE Id<=@Id 

SELECT *FROM GetAllProductss(10) 
