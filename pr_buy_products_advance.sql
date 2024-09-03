CREATE OR ALTER PROCEDURE pr_buy_products_updated
    @p_product_name NVARCHAR(100),  -- Input parameter for product name
    @p_quantity INT       -- Input parameter for quantity ordered
AS
BEGIN
--Start a transaction--
    BEGIN TRANSACTION;

      declare @v_product_code int ;
      declare  @v_price int ; 
      declare @v_orderId int ;
      declare @v_quantity_remained INT;

--Check if quantity is Positive--
IF @p_quantity <= 0
    BEGIN
        PRINT 'Error: Quantity must be greater than zero';
        ROLLBACK TRANSACTION;
        RETURN;
    END
-- Fetch product code and price for the given product name and quantity remained for the given product name
  select @v_product_code = product_code, @v_price = price, @v_quantity_remained = quantity_remained
  from products
  where product_name = @p_product_name;

  --Check if the product code was found
  if @v_product_code is NULL
  Begin 
     print 'Error: Product not found';
     ROLLBACK TRANSACTION;
     return;
  end

  -- Check if there is sufficient stock
    IF @v_quantity_remained < @p_quantity
    BEGIN
        PRINT 'Error: Insufficient stock';
        ROLLBACK TRANSACTION;
        RETURN;
    END

  --Generate a new orderID using the sequence
  set @v_orderId = NEXT VALUE For order_id_seq;

  -- Insert the sale record into iphonesales

  insert into iphonesales(orderId, order_date, product_code, quantity_ordered, sale_price)
  values(@v_orderId, Getdate(), @v_product_code, @p_quantity, @v_price*@p_quantity);

-- Update quantity remained and quantity sold

  update products
  set quantity_remained = quantity_remained - @p_quantity,
      quantity_sold = quantity_sold + @p_quantity
  where product_name = @p_product_name;

   -- Commit the transaction
    COMMIT TRANSACTION;

    PRINT 'Order processed successfully';

END;


-------execution example----
-- exec pr_buy_products
   --  @p_product_name = 'iphone14', 
   -- @p_quantity = 2;

    