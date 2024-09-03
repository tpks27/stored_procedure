CREATE TABLE SalesRecords (
    ID INT PRIMARY KEY,            -- Unique identifier for each record
    SaleDate DATE,                 -- Date of the sale
    ProductCode INT,               -- Code identifying the product
    Quantity INT,                  -- Quantity sold
    TotalAmount DECIMAL(10, 2)    -- Total sale amount (assuming a precision of 10 digits, 2 decimal places)
);
