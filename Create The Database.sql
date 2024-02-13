--  Create the database and set the data type.

CREATE TABLE 
	product
	(
	product_id VARCHAR (50),
	product_name VARCHAR (100),
	main_cat VARCHAR (50), 
	sub_cat1 VARCHAR (50),
	sub_cat2 VARCHAR (50),
	brand VARCHAR (100),
	rating NUMERIC,
	price_per_item BIGINT,
	weight NUMERIC,
	weight_unit VARCHAR (10),
	unit VARCHAR (50)										
	)
	;

CREATE TABLE 
	order_detail
	(
	order_id INT,
	product_id VARCHAR (50),
	quantity INT,
	price_total INT,
	free_shipping BOOLEAN,
	ppn INT,
	weight_total INT,
	unit VARCHAR (50),
	weight_unit VARCHAR(50)
	)
	;
	
CREATE TABLE
	order_transaction
	(
	po_number VARCHAR (100),
	transaction_date DATE,
	order_id INT,
	order_status VARCHAR (50),
	payment_group VARCHAR (10),
	payment_method VARCHAR (100),
	shipping_agency VARCHAR (50),
	shipping_cost INT,
	total_project_value INT,
	voucher_val BIGINT,
	voucher_code VARCHAR (50),
	revenue INT,
	seller_id VARCHAR (50),
	seller_category VARCHAR (20),
	buyer_id VARCHAR (50)
	)
	;

CREATE TABLE
	users
	(
	uid VARCHAR (50),
	province VARCHAR (50),
	city VARCHAR (50),
	flag VARCHAR (50)
	)
	;



--  Import the csv file manually to table then double check the table and column.

SELECT
	*
FROM order_detail
	;

SELECT
	*
FROM order_transaction
	;
	
SELECT
	*
FROM product
	;
	
SELECT
	*
FROM 
	users
	;
	

	
	
	
	
	
	
	
	
	