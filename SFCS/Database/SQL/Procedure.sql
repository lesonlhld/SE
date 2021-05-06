DROP procedure IF EXISTS insert_cartItem;
DELIMITER $$
CREATE PROCEDURE insert_cartItem(
		order_id int,
		product_id int,
		quantity int,
		unit_price int
)
BEGIN
	INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES (order_id, product_id, quantity, unit_price);
END$$
DELIMITER ; 

DROP procedure IF EXISTS edit_cartItem;
DELIMITER $$
CREATE PROCEDURE edit_cartItem(
		_order_id int,
		_product_id int,
		_quantity int,
		_unit_price int
)
BEGIN
	UPDATE order_items SET order_id = _order_id, product_id = _product_id, quantity = _quantity, unit_price = _unit_price WHERE order_id = _order_id;
END$$
DELIMITER ; 

DROP procedure IF EXISTS delete_cartItem;
DELIMITER $$
CREATE PROCEDURE delete_cartItem(
		_order_id int
)
BEGIN
	DELETE FROM order_items WHERE order_id = _order_id;
END$$
DELIMITER ; 

DROP procedure IF EXISTS get_cartItem;
DELIMITER $$
CREATE PROCEDURE get_cartItem(
		_order_id int
)
BEGIN
	SELECT oi.order_id, oi.quantity, oi.unit_price, o.user_id, o.order_time, o.order_date, o.order_status_id, p.product_name, p.price
	FROM order_items oi, orders o, products p
	WHERE oi.order_id = o.order_id AND oi.product_id = p.product_id AND oi.order_id = _order_id;
END$$
DELIMITER ; 

DROP procedure IF EXISTS getAll_cartItem;
DELIMITER $$
CREATE PROCEDURE getAll_cartItem()
BEGIN
	SELECT oi.order_id, oi.quantity, oi.unit_price, o.user_id, o.order_time, o.order_date, o.order_status_id, p.product_name, p.price 
	FROM order_items oi, orders o, products p
	WHERE oi.order_id = o.order_id AND oi.product_id = p.product_id;
END$$
DELIMITER ;

DROP procedure IF EXISTS insert_category;
DELIMITER $$
CREATE PROCEDURE insert_category(
	category_name varchar(50)		
)
BEGIN
	INSERT INTO categories (category_name)
	VALUES (category_name);
END$$
DELIMITER ;	

DROP procedure IF EXISTS edit_category;
DELIMITER $$
CREATE PROCEDURE edit_category(
	_catagory_id int,
	_category_name varchar(50)
)
BEGIN
	UPDATE categories SET category_name = _category_name WHERE category_id = _catagory_id;
END$$
DELIMITER ; 

DROP procedure IF EXISTS delete_category;
DELIMITER $$
CREATE PROCEDURE delete_category(
	_catagory_id int
)
BEGIN
	DELETE FROM categories WHERE category_id = _catagory_id;
END$$
DELIMITER ; 

DROP procedure IF EXISTS get_category;
DELIMITER $$
CREATE PROCEDURE get_category(
	_catagory_id int
)
BEGIN
	SELECT * FROM categories WHERE category_id = _catagory_id;
END$$
DELIMITER ; 

DROP procedure IF EXISTS getall_category;
DELIMITER $$
CREATE PROCEDURE getall_category()
BEGIN
	SELECT * FROM categories;
END$$
DELIMITER ; 

DROP procedure IF EXISTS search_category;
DELIMITER $$
CREATE  PROCEDURE search_category(
	this varchar(50)
)
BEGIN
	SELECT * FROM categories WHERE category_name LIKE CONCAT('%',this,'%');
END$$
DELIMITER ; 

DROP procedure IF EXISTS getwithname_category;
DELIMITER $$
CREATE PROCEDURE getwithname_category(
	_category_name varchar(50)
)
BEGIN
	SELECT * FROM categories WHERE category_name LIKE _category_name;
END$$
DELIMITER ; 

DROP procedure IF EXISTS insert_invoice;
DELIMITER $$
CREATE PROCEDURE insert_invoice(
	order_id int,
	invoice_total int,
	invoice_date date,
	invoice_time time,
	code varchar(50),
	payment_id int
)
BEGIN
	INSERT INTO invoices(order_id, invoice_total, invoice_date, invoice_time, code, payment_id) VALUES (order_id, invoice_total, invoice_date, invoice_time, code, payment_id);
END$$
DELIMITER ; 

DROP procedure IF EXISTS edit_invoice;
DELIMITER $$
CREATE PROCEDURE edit_invoice(
	_order_id int,
	_invoice_total int,
	_invoice_date date,
	_invoice_time time,
	_code varchar(50),
	_payment_id int,
	_invoice_id int
)
BEGIN
	UPDATE invoices SET order_id = _order_id, invoice_total = _invoice_total, invoice_date = _invoice_date, invoice_time = _invoice_time, code = _code, payment_id = _payment_id WHERE invoice_id = _invoice_id;
END$$
DELIMITER ; 

DROP procedure IF EXISTS delete_invoice;
DELIMITER $$
CREATE PROCEDURE delete_invoice(
	_invoice_id int
)
BEGIN
	DELETE FROM invoices WHERE invoice_id = _invoice_id;
END$$
DELIMITER ; 

DROP procedure IF EXISTS get_invoice;
DELIMITER $$
CREATE PROCEDURE get_invoice(
	_order_id int
)
BEGIN
	SELECT o.order_id, o.order_date, o.order_time, u.order_id, u.cartname, u.email, os.payment_id, os.name
	FROM orders o, carts u, order_paymentMethodes os 
	WHERE o.order_id = u.order_id AND o.paymentMethod = os.payment_id AND o.order_id = _order_id;
END$$
DELIMITER ; 

DROP procedure IF EXISTS getAll_invoice;
DELIMITER $$
CREATE PROCEDURE getAll_invoice()
BEGIN
	SELECT* FROM invoices;
END$$
DELIMITER ;

DROP procedure IF EXISTS insert_orderStatus;
DELIMITER $$
CREATE PROCEDURE insert_orderStatus(
	order_status_name varchar(50)
)
BEGIN
	INSERT INTO order_statuses(order_status_name) VALUES (order_status_name);
END$$
DELIMITER ; 

DROP procedure IF EXISTS edit_orderStatus;
DELIMITER $$
CREATE  PROCEDURE edit_orderStatus(
	_order_status_name varchar(50),
	_order_status_id int
)
BEGIN
	UPDATE order_statuses SET order_status_name = _order_status_name WHERE order_status_id = _order_status_id;
END$$
DELIMITER ; 

DROP procedure IF EXISTS delete_orderStatus;
DELIMITER $$
CREATE  PROCEDURE delete_orderStatus(
	_order_status_id int
)
BEGIN
	DELETE FROM order_statuses WHERE order_status_id = _order_status_id;
END$$
DELIMITER ; 

DROP procedure IF EXISTS get_orderStatus;
DELIMITER $$
CREATE  PROCEDURE get_orderStatus(
	_order_status_id int
)
BEGIN
	SELECT * FROM order_statuses WHERE order_status_id = _order_status_id;
END$$
DELIMITER ; 

DROP procedure IF EXISTS getAll_orderStatus;
DELIMITER $$
CREATE PROCEDURE getAll_orderStatus()
BEGIN
	SELECT * FROM order_statuses;
END$$
DELIMITER ;


DROP procedure IF EXISTS search_orderStatus;
DELIMITER $$
CREATE PROCEDURE search_orderStatus(
		this varchar(50)
)
BEGIN
	SELECT * FROM order_statuses WHERE order_status_name LIKE CONCAT('%',this,'%');
END$$
DELIMITER ; 

DROP procedure IF EXISTS getwithname_orderStatus;
DELIMITER $$
CREATE PROCEDURE getwithname_orderStatus(
	_order_status_name varchar(50)
)
BEGIN
	SELECT * FROM order_statuses WHERE order_status_name = _order_status_name;
END$$
DELIMITER ; 

DROP procedure IF EXISTS insert_payment;
DELIMITER $$
CREATE PROCEDURE insert_payment(
	payment_method varchar(50)
)
BEGIN
	INSERT INTO payments(payment_method) VALUES (payment_method);
END$$
DELIMITER ;		 

DROP procedure IF EXISTS edit_payment;
DELIMITER $$
CREATE PROCEDURE edit_payment(
	_payment_method varchar(50),
	_payment_id int
)
BEGIN
	UPDATE payments SET payment_method = _payment_method WHERE payment_id = _payment_id;
END$$
DELIMITER ; 

DROP procedure IF EXISTS delete_payment;
DELIMITER $$
CREATE PROCEDURE delete_payment(
	_payment_id int
)
BEGIN
	DELETE FROM payments WHERE payment_id = _payment_id;
END$$
DELIMITER ; 

DROP procedure IF EXISTS get_payment;
DELIMITER $$
CREATE PROCEDURE get_payment(
	_payment_id int
)
BEGIN
	SELECT * FROM payments WHERE payment_id = _payment_id;
END$$
DELIMITER ; 

DROP procedure IF EXISTS getAll_payment;
DELIMITER $$
CREATE PROCEDURE getAll_payment()
BEGIN
	SELECT * FROM payments;
END$$
DELIMITER ; 

DROP procedure IF EXISTS search_payment;
DELIMITER $$
CREATE PROCEDURE search_payment(
	this varchar(50)
)
BEGIN
	SELECT * FROM payments WHERE payment_method LIKE CONCAT('%',this,'%');
END$$
DELIMITER ; 

DROP procedure IF EXISTS getwithname_payment;
DELIMITER $$
CREATE PROCEDURE getwithname_payment(
	this varchar(50)
)
BEGIN
	SELECT * FROM payments WHERE payment_method LIKE this;
END$$
DELIMITER ; 

DROP PROCEDURE IF EXISTS insert_product;
DELIMITER $$
CREATE PROCEDURE insert_product(
	product_name varchar(255),
	price int,
	quantity int,
	discount float,
	category_id int,
	stall_id int,
	description varchar(2000),
	image varchar(50)
)
BEGIN
	INSERT INTO products(product_name, price, quantity, discount, category_id, stall_id, description, image)
	VALUES (product_name, price, quantity, discount, category_id, stall_id, description, image);
END$$
DELIMITER ;
	

DROP procedure IF EXISTS edit_product;
DELIMITER $$
CREATE PROCEDURE edit_product(
	_product_name varchar(255),
	_price int,
	_quantity int,
	_discount float,
	_category_id int,
	_stall_id int,
	_description varchar(2000),
	_image varchar(50),
	_product_id int
)
BEGIN
	UPDATE products SET product_name = _product_name , price = _price, quantity = _quantity, discount = _discount, category_id = _category_id, stall_id = _stall_id, description = _description, image = _image 
	WHERE product_id = _product_id;
END$$
DELIMITER ; 

DROP procedure IF EXISTS delete_product;
DELIMITER $$
CREATE PROCEDURE delete_product(
	id int
)
BEGIN
	DELETE FROM products WHERE product_id=id;
END$$
DELIMITER ; 

DROP procedure IF EXISTS get_product;
DELIMITER $$
CREATE PROCEDURE get_product(
	product_id int
)
BEGIN
	SELECT p.product_id, p.product_name, p.price, p.quantity, p.discount, p.description, p.image, c.category_id, c.category_name AS cate_name, s.stall_id, s.stall_name AS stall_name 
	FROM products p, categories c, stalls s 
	WHERE p.category_id = c.category_id AND p.stall_id = s.stall_id AND p.product_id = product_id;
END$$

DELIMITER ;


DROP procedure IF EXISTS getall_product;
DELIMITER $$
CREATE PROCEDURE getall_product()
BEGIN
	SELECT p.product_id, p.product_name, p.price, p.quantity, p.discount, p.description, p.image, c.category_id, c.category_name AS cate_name, s.stall_id, s.stall_name AS stall_name 
	FROM products p, categories c, stalls s 
	WHERE p.category_id = c.category_id AND p.stall_id = s.stall_id;
END$$

DELIMITER ;

DROP procedure IF EXISTS search_product;
DELIMITER $$
CREATE PROCEDURE search_product(
	something nvarchar(255)
)
BEGIN
	SELECT * FROM products WHERE product_name LIKE CONCAT('%',something,'%');
END$$
DELIMITER ; 

DROP procedure IF EXISTS searchbycategory_product;
DELIMITER $$
CREATE PROCEDURE searchbycategory_product(
	_category_id int
)
BEGIN
	SELECT p.product_id, p.product_name, p.price, p.quantity, p.discount, p.description, p.image, c.category_id, c.category_name AS cate_name, s.stall_id, s.stall_name AS stall_name
	FROM products p, categories c, stalls s WHERE p.category_id = c.category_id AND p.stall_id = s.stall_id AND p.category_id = _category_id;
END$$
DELIMITER ; 

DROP procedure IF EXISTS searchbystall_product;
DELIMITER $$
CREATE PROCEDURE searchbystall_product(
	_stall_id int
)
BEGIN
	SELECT p.product_id, p.product_name, p.price, p.quantity, p.discount, p.description, p.image, c.category_id, c.category_name AS cate_name, s.stall_id, s.stall_name AS stall_name
	FROM products p, categories c, stalls s WHERE p.category_id = c.category_id AND p.stall_id = s.stall_id AND p.stall_id = _stall_id;
END$$
DELIMITER ;	

DROP procedure IF EXISTS searchByName_product;
DELIMITER $$
CREATE PROCEDURE searchByName_product(
	_name varchar(255)
)
BEGIN
	SELECT p.product_id, p.product_name, p.price, p.quantity, p.discount, p.description, p.image, c.category_id, c.category_name AS cate_name, s.stall_id, s.stall_name AS stall_name 
	FROM products p, categories c, stalls s WHERE p.category_id = c.category_id AND p.stall_id = s.stall_id AND p.product_name LIKE CONCAT('%',_name,'%');
END$$
DELIMITER ; 

DROP procedure IF EXISTS insert_stall;
DELIMITER $$
CREATE PROCEDURE insert_stall(
	stall_name varchar(255),
	item_quantity int,
	description varchar(2000),
	image mediumblob
)
BEGIN
	INSERT INTO stalls(stall_name, item_quantity, description, image) VALUES (stall_name,item_quantity,description,image);
END$$
DELIMITER ; 

DROP procedure IF EXISTS edit_stall;
DELIMITER $$
CREATE PROCEDURE edit_stall(
	_stall_name varchar(255),
	_item_quantity int,
	_description varchar(2000),
	_image mediumblob,
	_stall_id int
)
BEGIN
	UPDATE stalls SET stall_name = _stall_name, item_quantity = _item_quantity, description = _description, image = _image WHERE stall_id = _stall_id;
END$$
DELIMITER ; 

DROP procedure IF EXISTS get_stall;
DELIMITER $$
CREATE PROCEDURE get_stall(
	_stall_id int
)
BEGIN
	SELECT * FROM stalls WHERE stall_id = _stall_id;
END$$
DELIMITER ; 

DROP procedure IF EXISTS getall_stall;
DELIMITER $$
CREATE PROCEDURE getall_stall()
BEGIN
	SELECT * FROM stalls;
END$$
DELIMITER ; 

DROP procedure IF EXISTS search_stall;
DELIMITER $$
CREATE PROCEDURE search_stall(
	this varchar(255)
)
BEGIN
	SELECT * FROM stalls WHERE stall_name LIKE CONCAT('%',this,'%');
END$$
DELIMITER ; 

DROP procedure IF EXISTS getwithname_stall;
DELIMITER $$
CREATE PROCEDURE getwithname_stall(
	_stall_name varchar(255)
)
BEGIN
	SELECT * FROM stalls WHERE stall_name LIKE _stall_name;
END$$
DELIMITER ; 

DROP procedure IF EXISTS insert_user;
DELIMITER $$
CREATE PROCEDURE insert_user(
	first_name varchar(255),
	last_name varchar(255),
	username varchar(50),
	password varchar(50),
	email varchar(50),
	birth_date date,
	gender enum('M','F'),
	avatar varchar(50),
	role_id int
)
BEGIN
	INSERT INTO users(first_name, last_name, username, password, email, birth_date, gender, avatar, role_id) VALUES (first_name, last_name, username, password, email, birth_date, gender, avatar, role_id);
END$$
DELIMITER ; 

DROP procedure IF EXISTS edit_user;
DELIMITER $$
CREATE PROCEDURE edit_user(
	_first_name varchar(255),
	_last_name varchar(255),
	_username varchar(50),
	_email varchar(50),
	_birth_date date,
	_gender enum('M','F'),
	_phone varchar(50),
	_password varchar(50),
	_avatar varchar(50),
	_role_id int,
	_user_id int,
	_address varchar(2000)
)
BEGIN
	UPDATE users SET first_name = _first_name, last_name = _last_name, birth_date = _birth_date, gender = _gender, phone = _phone, email = _email, address = _address, password = _password, avatar = _avatar, role_id = _role_id WHERE user_id = _user_id;
END$$
DELIMITER ; 

DROP procedure IF EXISTS delete_user;
DELIMITER $$
CREATE PROCEDURE delete_user(
	_user_id int
)
BEGIN
	DELETE FROM users WHERE user_id = _user_id;
END$$
DELIMITER ; 

DROP procedure IF EXISTS get_user;
DELIMITER $$
CREATE PROCEDURE get_user(
	_user_name varchar(50)
)
BEGIN
	SELECT * FROM users WHERE username = _user_name;
END$$
DELIMITER ; 

DROP procedure IF EXISTS getid_user;
DELIMITER $$
CREATE PROCEDURE getid_user(
	_user_id varchar(50)
)
BEGIN
	SELECT * FROM users WHERE user_id = _user_id;
END$$
DELIMITER ; 

DROP procedure IF EXISTS getall_user;
DELIMITER $$
USE SFCS$$
CREATE PROCEDURE getall_user()
BEGIN
	SELECT * FROM users;
END$$
DELIMITER ; 

DROP procedure IF EXISTS search_user;
DELIMITER $$
CREATE PROCEDURE search_user(
	this varchar(255)
)
BEGIN
	SELECT * FROM users WHERE CONCAT(first_name,' ',last_name) LIKE CONCAT('%',this,'%');
END$$
DELIMITER ; 

DROP procedure IF EXISTS checkExistEmail_user;
DELIMITER $$
CREATE PROCEDURE checkExistEmail_user(
	_email varchar(50)
)
BEGIN
	select * from users where email = _email;
END$$
DELIMITER ; 

DROP procedure IF EXISTS checkExistUsername_user;
DELIMITER $$
CREATE PROCEDURE checkExistUsername_user(
	_username varchar(50)
)
BEGIN
	select * from users where username = _username;
END$$
DELIMITER ;
