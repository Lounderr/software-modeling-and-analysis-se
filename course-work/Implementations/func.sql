CREATE FUNCTION CalculateUserTotalOrdersValue
(
    @UserID INT
)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @TotalValue DECIMAL(10, 2);

    
    SELECT @TotalValue = SUM(TotalAmount)
    FROM ORDERS
    WHERE UserId = @UserID;

    
    RETURN ISNULL(@TotalValue, 0.00);
END
GO


