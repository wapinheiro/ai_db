CREATE TABLE fin.tbl_stores (
store_id INT PRIMARY KEY,
store_name VARCHAR(100) NOT NULL,
store_address VARCHAR(255)                    
);

CREATE TABLE fin.tbl_products (
product_id INT PRIMARY KEY,
product_name VARCHAR(100) NOT NULL,
unit_price FLOAT NOT NULL
);

CREATE TABLE fin.tbl_transactions (
trans_id INT PRIMARY KEY,
trans_date DATE NOT NULL,
store_id INT REFERENCES fin.tbl_stores(store_id),
product_id INT REFERENCES fin.tbl_products(product_id),
trans_qtd INT 
);
