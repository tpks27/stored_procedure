CREATE TABLE Products (
    product_code INT PRIMARY KEY,       -- Unique identifier for each product
    product_name NVARCHAR(100),         -- Name of the product
    price DECIMAL(10, 2),               -- Price of the product
    quantity_remained INT,              -- Quantity of the product remaining in stock
    quantity_sold INT                   -- Quantity of the product sold
);
