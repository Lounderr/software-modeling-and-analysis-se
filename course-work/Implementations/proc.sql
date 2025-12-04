CREATE PROCEDURE UpdateOrderStatus
    @OrderID INT,
    @NewStatus NVARCHAR(10)
AS
BEGIN
    SET NOCOUNT ON;

    
    IF @NewStatus NOT IN ('Pending','Paid','Shipped')
    BEGIN
        RAISERROR('Error: Invalid status.', 16, 1);
        RETURN;
    END

    
    IF NOT EXISTS (SELECT 1 FROM ORDERS WHERE OrderId = @OrderID)
    BEGIN
        RAISERROR('Error: Order ID %d not found.', 16, 1, @OrderID);
        RETURN;
    END

    
    UPDATE ORDERS
    SET Status = @NewStatus
    WHERE OrderId = @OrderID;

    
    SELECT *
    FROM ORDERS
    WHERE OrderId = @OrderID;
END
GO


