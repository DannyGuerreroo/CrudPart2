CREATE OR ALTER PROCEDURE InsertCustomerAndOrder_Lastname
(
    -- Customer parameters
    @FirstName NVARCHAR(50),
    @LastName NVARCHAR(50),
    @City NVARCHAR(50),
    @Country NVARCHAR(50),
    @Phone NVARCHAR(20),

    -- Order parameters
    @OrderDate DATETIME,

    -- OrderItem parameters
    @ProductId INT,
    @Quantity INT
)
AS
BEGIN
    DECLARE @CustomerId INT;
    DECLARE @OrderId INT;
    DECLARE @OrderNumber NVARCHAR(20);
    DECLARE @RandomNumber INT;
    DECLARE @UnitPrice MONEY;
    DECLARE @TotalAmount MONEY;
	DECLARE @ProductName NVARCHAR(100);

    -- Generate a random number between 1 and 10000
    SELECT @RandomNumber = ROUND((RAND(CHECKSUM(NEWID())) * (10000-1)), 0) + 1;

    -- Generate the OrderNumber using the random number and first two characters of the LastName
    SET @OrderNumber = CAST(@RandomNumber AS NVARCHAR(20)) + '_' + LEFT(@LastName, 2);

    -- Retrieve UnitPrice & ProductName for the given ProductId
    SELECT @UnitPrice = UnitPrice FROM Product WHERE Id = @ProductId;
	SELECT @ProductName = ProductName FROM Product WHERE Id = @ProductId;

    -- Calculate the total amount
    SET @TotalAmount = @UnitPrice * @Quantity;

    -- Insert into Customer table
    INSERT INTO Customer (FirstName, LastName, City, Country, Phone)
    VALUES (@FirstName, @LastName, @City, @Country, @Phone);
    
    -- Get the newly created CustomerId
    SET @CustomerId = SCOPE_IDENTITY();

    -- Insert into Order table with the new CustomerId and generated OrderNumber
    INSERT INTO [Order] (OrderDate, OrderNumber, CustomerId, TotalAmount)
    VALUES (@OrderDate, @OrderNumber, @CustomerId, @TotalAmount);
    
    -- Get the newly created OrderId
    SET @OrderId = SCOPE_IDENTITY();

    -- Insert into OrderItem table with the new OrderId
    INSERT INTO [OrderItem] (OrderId, ProductId, UnitPrice, Quantity)
    VALUES (@OrderId, @ProductId, @UnitPrice, @Quantity);

	-- Return message
	SELECT CONCAT('Welcome ', @FirstName, ', your Customer Number is ', @CustomerId, 
                  ' and your order number is ', @OrderNumber, 
                  '. Your order of ', @ProductName, ' is on the way!') AS ConfirmationMessage;
END