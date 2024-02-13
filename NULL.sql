-- order_detail Table
-- Delete error data with 0 values in the first row. 

SELECT 
	COUNT(quantity) AS null_count
FROM 
	order_detail
WHERE 
	quantity = 0
	;
DELETE FROM
	order_detail
WHERE
	quantity = 0
	;

-- Rename Column Price_total.

ALTER TABLE order_detail
RENAME COLUMN price_total TO GMV

-- Check the table 

SELECT
	*
FROM
	order_detail
	;


ALTER TABLE order_detail
RENAME COLUMN price_total TO GMV






-- order_transaction
--  Delete voucher_code column because its a lot null.

ALTER TABLE
	order_transaction
DROP COLUMN
	voucher_code
	;

--  Delete voucher_code column because its a lot null.

ALTER TABLE
	order_transaction
DROP COLUMN
	voucher_val
	;

-- Find sales status.

SELECT 
	order_status,
	COUNT (order_id)
FROM
	order_transaction
GROUP BY 
	order_status
ORDER BY 
	COUNT (order_id) DESC
	;

--  Create group for order_status.
						
UPDATE 
	order_transaction
SET 
	order_status = 'Transaksi Gagal'
WHERE 
	order_status IN (
					 'Dibatalkan', 
					 'Ditolak Penjual', 
					 'Expired',
					 'Ditolak',
					 'Refund Selesai',
					 'Refund',
					 'Dibatalkan Otomatis',
					 'Revisi',
					 'Tagihan Ditolak'
					)
					;
					
UPDATE 
	order_transaction
SET 
	order_status = 'Dalam Proses'
WHERE 
	order_status IN (
					 'Dibayar', 
					 'Dikirim', 
					 'Diproses Penjual',
					 'Disetujui',
					 'Diterima',
					 'Menunggu Pembayaran',
					 'Menunggu Persetujuan',
					 'Pembayaran Terverifikasi',
					 'Penagihan',
					 'Permintaan Perubahan',
					 'Permintaan Upload Document',
					 'Tagihan Diterima'
					)
					;

-- Check the order_status.

SELECT DISTINCT
	order_status
FROM
	order_transaction

-- Grouping payment_Method.

UPDATE 
	order_transaction
SET 
	payment_method =
  CASE 
    WHEN payment_method IN ('xmandiriva', 'xendit_va_bsi', 'xendit_va_bri', 'xcredit-card', 'xbriva', 'xbniva') THEN 'Xendit'
    WHEN payment_method = 'QREN' THEN 'QRen'
    WHEN payment_method IN ('mps-qris', 'mps-linkaja', 'mps-btnva', 'mps-bsiva', 'mps-briva', 'mps-bniva') THEN 'Mobile Payment System'
    WHEN payment_method IN ('mandiriva', 'mandiri_va_billing_fixed') THEN 'Mandiri Virtual Account'
    WHEN payment_method = 'link_aja_wco' THEN 'Web Check Out'
    WHEN payment_method = 'finpay_cc' THEN 'Finpay'
    WHEN payment_method = 'BTNATM' THEN 'ATM BTN'
    WHEN payment_method = 'bni_ecoll_va' THEN 'BNI E-Collection'
	END
	;

-- Check the payment_method. 

SELECT 
	COUNT(order_id),
	payment_method
FROM
	order_transaction
GROUP BY
	payment_method
ORDER BY
	COUNT(order_id) DESC
	;








-- product 
-- Delete error data in row 1 

DELETE FROM 
	product
WHERE 
	product_id IS NULL;

-- Count null values in columns sub_cat1 and 2.

SELECT
	COUNT(*) AS sub_cat1_null
FROM
	product
WHERE
	sub_cat1 IS null
	;
	
SELECT
	COUNT(*) AS sub_cat2_null
FROM
	product
WHERE
	sub_cat2 IS null
	;

-- Delete sub_cat2 columns beacause it has so many null	values.

ALTER TABLE
	product
DROP COLUMN
	sub_cat2 
	;
SELECT
	*
FROM
	product

-- Rating column has 160131 zero values from 182040 rows data and decide to delete it. 

SELECT
	COUNT (rating)
FROM
	product
WHERE
	rating = 0
	;

-- Remove rating column 

ALTER TABLE
	product
DROP COLUMN
	rating
	;

-- Check product table.

SELECT
	*
FROM
	product
	
	

	
	


-- users
-- 

SELECT
	*
FROM 
	order_detail
	

SELECT
	*
FROM 
	order_transaction
	

SELECT
	*
FROM 
	product
	

SELECT
	*
FROM 
	users





	
