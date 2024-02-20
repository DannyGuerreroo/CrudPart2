CREATE OR ALTER PROCEDURE ProductList_Guerrero
AS
BEGIN
    SELECT Id, ProductName, UnitPrice, Package
    FROM Product
    WHERE IsDiscontinued = 0;
END