
CREATE TRIGGER TR_OrderItems_RecalculateTotal
ON ORDER_ITEMS
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    ;WITH ChangedOrders AS (
        SELECT DISTINCT OrderId
        FROM (
            SELECT OrderId FROM inserted
            UNION ALL
            SELECT OrderId FROM deleted
        ) d
        WHERE OrderId IS NOT NULL
    )
    UPDATE o
    SET TotalAmount = ISNULL(t.Total, 0.00)
    FROM ORDERS o
    INNER JOIN ChangedOrders co ON o.OrderId = co.OrderId
    OUTER APPLY (
        SELECT SUM(oi.Quantity * oi.UnitPrice) AS Total
        FROM ORDER_ITEMS oi
        WHERE oi.OrderId = o.OrderId
    ) t;
END;
GO


