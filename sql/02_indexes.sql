-- Orders is the fact table and will be queried the most
-- Index columns that are frequently filtered or joined on

CREATE INDEX idx_orders_order_id   ON orders(order_id);
CREATE INDEX idx_orders_customer_id ON orders(customer_id);
CREATE INDEX idx_orders_product_id  ON orders(product_id);
CREATE INDEX idx_orders_postal_code ON orders(postal_code);
CREATE INDEX idx_orders_order_date  ON orders(order_date);

-- Customer scores will be filtered by customer
CREATE INDEX idx_customer_scores_customer_id ON customer_scores(customer_id);