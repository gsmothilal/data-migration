CREATE TABLE IF NOT EXISTS customers (
    customerid BIGINT,
    customername VARCHAR(200),
    city VARCHAR(200),
    email VARCHAR(200)
);

CREATE TABLE IF NOT EXISTS inventory (
    productid BIGINT,
    stock BIGINT,
    warehouse VARCHAR(200)
);

CREATE TABLE IF NOT EXISTS orders (
    orderid BIGINT,
    customerid BIGINT,
    orderdate VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS products (
    productid BIGINT,
    productname VARCHAR(200),
    category VARCHAR(200),
    price BIGINT
);

CREATE TABLE IF NOT EXISTS sales (
    saleid BIGINT,
    orderid BIGINT,
    productid BIGINT,
    quantity BIGINT,
    totalamount BIGINT
);