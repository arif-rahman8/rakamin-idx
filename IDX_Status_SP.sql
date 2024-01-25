CREATE OR ALTER PROCEDURE summary_order_status
(@statusID int) AS
BEGIN
	SELECT
		a.OrderID,
		b.CustomerName,
		c.ProductName,
		a.Quantity,
		d.StatusOrder
	FROM FactSalesOrder a
	INNER JOIN DimCustomer b ON a.CustomerID = b.CustomerID
	INNER JOIN DimProduct c ON a.ProductID = c.ProductId
	INNER JOIN DimStatusOrder d ON a.StatusID = d.StatusID
	WHERE a.StatusID = @statusID
END;

EXEC summary_order_status @statusID = 4