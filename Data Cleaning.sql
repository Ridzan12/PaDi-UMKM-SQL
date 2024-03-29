-- Delete duplicate rows from order_detail table. 

DELETE FROM 
	order_detail
WHERE 
	(order_id, product_id) 
	IN 
	(
	SELECT 
		order_id, product_id
	FROM 
		order_detail
	GROUP BY 
		order_id, product_id
	HAVING 
		COUNT(*) > 1
	)
	;
-- There is 0 duplicate data deleted.
		


-- Delete duplicate rows from order_transaction table. 

DELETE FROM 
	order_transaction
WHERE 
	(po_number, order_id) 
	IN 
	(
	SELECT 
		po_number, order_id
	FROM 
		order_transaction
	GROUP BY 
		po_number, order_id
	HAVING 
		COUNT(*) > 1
	)
	;
-- There is 0 duplicate data deleted.

		
		
-- Delete duplicate rows Product table. 

DELETE FROM 
	product
WHERE 
	(product_id, product_name) 
	IN 
	(
	SELECT 
		product_id, product_name
	FROM 
		product
	GROUP BY 
		product_id, product_name
	HAVING 
		COUNT(*) > 1
	)
	;
-- There is 0 duplicate data deleted.
		


-- Delete duplicate rows Product table. 

DELETE FROM 
	users
WHERE 
	(uid, flag) 
	IN 
	(
	SELECT 
		uid, flag
	FROM 
		users
	GROUP BY 
		uid, flag
	HAVING 
		COUNT(*) > 1 
	)
	;
-- There is 75 duplicate data deleted.
		
		
		
		
		
		