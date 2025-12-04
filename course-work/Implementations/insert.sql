

DECLARE @UserID1 INT, @UserID2 INT, @UserID3 INT, @UserID4 INT, @UserID5 INT;
DECLARE @OrderID1 INT, @OrderID2 INT, @OrderID3 INT, @OrderID4 INT, @OrderID5 INT;
DECLARE @ProductID1 INT, @ProductID2 INT, @ProductID3 INT, @ProductID4 INT, @ProductID5 INT;
DECLARE @CategoryID1 INT, @CategoryID2 INT, @CategoryID3 INT, @CategoryID4 INT, @CategoryID5 INT;
DECLARE @AddressID1 INT, @AddressID2 INT;





INSERT INTO USERS (Username, PasswordHash, Email, Role, IsActive)
VALUES ('alice_smith', 'hashed_pass1', 'alice.smith@example.com', 'Admin', 1);
SET @UserID1 = SCOPE_IDENTITY();

INSERT INTO USERS (Username, PasswordHash, Email, Role, IsActive)
VALUES ('bob_johnson', 'hashed_pass2', 'bob.johnson@example.com', 'User', 1);
SET @UserID2 = SCOPE_IDENTITY();

INSERT INTO USERS (Username, PasswordHash, Email, Role, IsActive)
VALUES ('charlie_brown', 'hashed_pass3', 'charlie.brown@example.com', 'User', 1);
SET @UserID3 = SCOPE_IDENTITY();

INSERT INTO USERS (Username, PasswordHash, Email, Role, IsActive)
VALUES ('diana_prince', 'hashed_pass4', 'diana.prince@example.com', 'User', 1);
SET @UserID4 = SCOPE_IDENTITY();

INSERT INTO USERS (Username, PasswordHash, Email, Role, IsActive)
VALUES ('eve_adams', 'hashed_pass5', 'eve.adams@example.com', 'User', 1);
SET @UserID5 = SCOPE_IDENTITY();





INSERT INTO CATEGORIES (Name, Description, ImageUrl)
VALUES ('Electronics', 'Devices and gadgets.', 'https://example.com/cat/electronics.jpg');
SET @CategoryID1 = SCOPE_IDENTITY();

INSERT INTO CATEGORIES (Name, Description, ImageUrl)
VALUES ('Books', 'Fiction and non-fiction titles.', 'https://example.com/cat/books.jpg');
SET @CategoryID2 = SCOPE_IDENTITY();

INSERT INTO CATEGORIES (Name, Description, ImageUrl)
VALUES ('Apparel', 'Clothing and accessories.', 'https://example.com/cat/apparel.jpg');
SET @CategoryID3 = SCOPE_IDENTITY();

INSERT INTO CATEGORIES (Name, Description, ImageUrl)
VALUES ('Home Goods', 'Kitchen and decor items.', 'https://example.com/cat/homegoods.jpg');
SET @CategoryID4 = SCOPE_IDENTITY();

INSERT INTO CATEGORIES (Name, Description, ImageUrl)
VALUES ('Toys', 'Games and children''s items.', 'https://example.com/cat/toys.jpg');
SET @CategoryID5 = SCOPE_IDENTITY();





INSERT INTO PRODUCTS (Name, Description, Price, StockQuantity, ImageUrl)
VALUES ('Laptop Pro X', 'High performance computing machine.', 1200.00, 15, 'https://example.com/product/laptop.jpg');
SET @ProductID1 = SCOPE_IDENTITY();

INSERT INTO PRODUCTS (Name, Description, Price, StockQuantity, ImageUrl)
VALUES ('The Great Novel', 'A compelling story of adventure.', 15.50, 500, 'https://example.com/product/novel.jpg');
SET @ProductID2 = SCOPE_IDENTITY();

INSERT INTO PRODUCTS (Name, Description, Price, StockQuantity, ImageUrl)
VALUES ('Cotton T-Shirt', 'Basic everyday wear.', 25.00, 200, 'https://example.com/product/tshirt.jpg');
SET @ProductID3 = SCOPE_IDENTITY();

INSERT INTO PRODUCTS (Name, Description, Price, StockQuantity, ImageUrl)
VALUES ('Smart Blender', 'Blends anything in seconds.', 89.99, 45, 'https://example.com/product/blender.jpg');
SET @ProductID4 = SCOPE_IDENTITY();

INSERT INTO PRODUCTS (Name, Description, Price, StockQuantity, ImageUrl)
VALUES ('Wireless Mouse', 'Ergonomic design, long battery life.', 35.99, 110, 'https://example.com/product/mouse.jpg');
SET @ProductID5 = SCOPE_IDENTITY();





INSERT INTO ORDERS (UserId, AddressId, OrderDate, Status, TotalAmount)
VALUES (@UserID1, @AddressID1, '2025-11-20', 'Paid', 1215.50);
SET @OrderID1 = SCOPE_IDENTITY();

INSERT INTO ORDERS (UserId, AddressId, OrderDate, Status, TotalAmount)
VALUES (@UserID2, @AddressID1, '2025-11-21', 'Pending', 89.99);
SET @OrderID2 = SCOPE_IDENTITY();

INSERT INTO ORDERS (UserId, AddressId, OrderDate, Status, TotalAmount)
VALUES (@UserID3, @AddressID1, '2025-11-22', 'Shipped', 25.00);
SET @OrderID3 = SCOPE_IDENTITY();

INSERT INTO ORDERS (UserId, AddressId, OrderDate, Status, TotalAmount)
VALUES (@UserID4, @AddressID1, '2025-11-23', 'Paid', 35.99);
SET @OrderID4 = SCOPE_IDENTITY();

INSERT INTO ORDERS (UserId, AddressId, OrderDate, Status, TotalAmount)
VALUES (@UserID5, @AddressID2, '2025-11-24', 'Pending', 0.00);
SET @OrderID5 = SCOPE_IDENTITY();





INSERT INTO ADDRESSES (UserId, Country, City, Street, PostalCode)
VALUES (@UserID1, 'USA', 'New York', '123 Tech Lane', '10001');
SET @AddressID1 = SCOPE_IDENTITY();

INSERT INTO ADDRESSES (UserId, Country, City, Street, PostalCode)
VALUES (@UserID1, 'USA', 'New York', '123 Tech Lane ALT', '10002');
SET @AddressID2 = SCOPE_IDENTITY();

INSERT INTO ADDRESSES (UserId, Country, City, Street, PostalCode)
VALUES (@UserID2, 'USA', 'Los Angeles', '456 Blender Blvd', '90001');

INSERT INTO ADDRESSES (UserId, Country, City, Street, PostalCode)
VALUES (@UserID3, 'USA', 'Chicago', '789 Cotton Road', '60601');

INSERT INTO ADDRESSES (UserId, Country, City, Street, PostalCode)
VALUES (@UserID4, 'USA', 'Houston', '101 Mouse Way', '77001');





INSERT INTO ORDER_ITEMS (OrderId, ProductId, Quantity, UnitPrice)
VALUES
(@OrderID1, @ProductID1, 1, 1200.00),
(@OrderID1, @ProductID2, 1, 15.50),
(@OrderID2, @ProductID4, 1, 89.99),
(@OrderID3, @ProductID3, 1, 25.00),
(@OrderID4, @ProductID5, 1, 35.99);





INSERT INTO PRODUCT_CATEGORIES (ProductId, CategoryId)
VALUES
(@ProductID1, @CategoryID1),
(@ProductID2, @CategoryID2),
(@ProductID3, @CategoryID3),
(@ProductID4, @CategoryID4),
(@ProductID5, @CategoryID1);






INSERT INTO PAYMENTS (OrderId, Provider, TransactionId, Status, PaymentDate)
VALUES
(@OrderID1, 'Stripe', 'TXN-ALICE-001', 'Completed', '2025-11-20'),
(@OrderID4, 'PayPal', 'TXN-DIANA-001', 'Completed', '2025-11-23');
