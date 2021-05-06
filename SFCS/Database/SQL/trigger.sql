/** UPDATE PRODUCT STATUSES**/
DROP TRIGGER IF EXISTS update_Product_Statuses;
delimiter //
CREATE TRIGGER update_Product_Statuses BEFORE UPDATE
ON products
FOR EACH ROW
  BEGIN
    IF NEW.quantity <=> 0 OR NEW.quantity <=> NULL THEN
		SET NEW.product_status_id = 2; /*Het hang*/
	END IF;
  END//
delimiter ;

/** UPDATE QUANTITY OF PRODUCT AFTER INSERT order_items **/
DROP TRIGGER IF EXISTS update_quantity_product;
delimiter //
CREATE TRIGGER update_quantity_product AFTER INSERT
ON order_items
FOR EACH ROW
  BEGIN
	UPDATE products SET quantity = quantity - NEW.quantity WHERE product_id = NEW.product_id;
  END//
delimiter ;

/** UPDATE QUANTITY ITEM OF STALL AFTER INSERT NEW PRODUCT **/
DROP TRIGGER IF EXISTS update_quantity_item_of_stall_insert;
delimiter //
CREATE TRIGGER update_quantity_item_of_stall_insert AFTER INSERT
ON products
FOR EACH ROW
  BEGIN
	UPDATE Stalls SET item_quantity = item_quantity + 1 WHERE stall_id = NEW.stall_id;
  END//
delimiter ;

/** UPDATE QUANTITY ITEM OF STALL AFTER DELETE PRODUCT **/
DROP TRIGGER IF EXISTS update_quantity_item_of_stall_delete;
delimiter //
CREATE TRIGGER update_quantity_item_of_stall_delete AFTER DELETE
ON products
FOR EACH ROW
  BEGIN
	UPDATE Stalls SET item_quantity = item_quantity - 1 WHERE stall_id = OLD.stall_id;
  END//
delimiter ;

