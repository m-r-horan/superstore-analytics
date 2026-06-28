-- CUSTOMERS (dimension)
CREATE TABLE customers (
    customer_id     VARCHAR(20) PRIMARY KEY,
    customer_name   VARCHAR(100),
    segment         VARCHAR(50)
);

-- CUSTOMER SCORES (analytical output)
CREATE TABLE customer_scores (
    customer_id      VARCHAR(20) REFERENCES customers(customer_id),
    run_date         DATE,
    recency          INT,
    frequency        INT,
    monetary         DECIMAL(10,2),
    r_score          INT,
    f_score          INT,
    m_score          INT,
    rfm_total        INT,
    customer_segment VARCHAR(50),
    PRIMARY KEY (customer_id, run_date)
);

-- PRODUCTS (dimension)
CREATE TABLE products (
    product_id      VARCHAR(50) PRIMARY KEY,
    category        VARCHAR(50),
    sub_category    VARCHAR(50),
    product_name    VARCHAR(255)
);

-- GEOGRAPHY (dimension)
CREATE TABLE geography (
    postal_code     VARCHAR(10) PRIMARY KEY,
    city            VARCHAR(100),
    state           VARCHAR(100),
    country         VARCHAR(100),
    region          VARCHAR(50)
);

-- ORDERS (fact)
CREATE TABLE orders (
    row_id          INT PRIMARY KEY,
    order_id        VARCHAR(20),
    order_date      DATE,
    ship_date       DATE,
    ship_mode       VARCHAR(50),
    customer_id     VARCHAR(20) REFERENCES customers(customer_id),
    product_id      VARCHAR(50) REFERENCES products(product_id),
    postal_code     VARCHAR(10) REFERENCES geography(postal_code),
    sales           DECIMAL(10,2)
);

-- FORECAST (analytical output)
CREATE TABLE forecast (
    region          VARCHAR(50),
    month           DATE,
    forecast        DECIMAL(10,2),
    run_date        DATE,
    PRIMARY KEY (region, month)
);

