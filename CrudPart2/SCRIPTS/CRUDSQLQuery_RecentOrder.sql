CREATE OR ALTER PROCEDURE NewCustomerSummary_Lastname
AS
BEGIN
    SELECT TOP 10
        o.OrderNumber,
        c.FirstName + ' ' + c.LastName AS CustomerName,
        o.OrderDate,
        o.TotalAmount,
        oi.Quantity,
        o.Id AS OrderId,
        c.Id AS CustomerId
    FROM
        [Order] o
        INNER JOIN Customer c ON o.CustomerId = c.Id
        INNER JOIN OrderItem oi ON o.Id = oi.OrderId
    ORDER BY
        o.OrderDate DESC
END