CREATE TABLE SalesRecords (
    orderId INT PRIMARY KEY,            -- Unique identifier for each record
    order_date DATE,                 -- Date of the sale
    product_code INT,               -- Code identifying the product
    quantity_ordered INT,                  -- Quantity sold
    sale_price DECIMAL(10, 2)    -- Total sale amount (assuming a precision of 10 digits, 2 decimal places)
);
