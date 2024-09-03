## stored_procedures
ForLearningStored_Procedures

## pr_buy_products.sql

This stored procedure, pr_buy_products, is designed to handle the purchasing process for a specific product in an inventory system. It performs the following operations:

Fetch Product Details:
        Retrieves the product_code and price for the given product_name from the products table.

Error Handling:
        Checks if the product exists. If not, it prints an error message and terminates the procedure.

Generate Order ID:
        Generates a new unique orderId using a sequence (order_id_seq).

Insert Sale Record:
        Inserts a new record into the iphonesales table with the current date, product details, quantity ordered, and total sale price.

Update Product Inventory:
        Updates the products table to reflect the new quantities: decreases quantity_remained and increases quantity_sold based on the quantity ordered.




To execute the procedure and place an order, use the following SQL command:

sql

    EXEC pr_buy_products
    @p_product_name = 'iphone14', 
    @p_quantity = 2;

@p_product_name: The name of the product to purchase (e.g., 'iphone14').
@p_quantity: The quantity of the product being ordered (e.g., 2).

## pr_buy_products_advance.sql

Transaction Management: Added BEGIN TRANSACTION, ROLLBACK TRANSACTION, and COMMIT TRANSACTION to ensure data integrity.
Quantity Validation: Added a check to ensure the quantity is greater than zero.
Stock Check: Added a check to ensure there is sufficient stock before proceeding with the order.
Error Handling: Improved error messages and added rollback logic to handle failures gracefully.


