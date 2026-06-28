CREATE VIEW orders_enriched AS
SELECT 
    o.row_id,
    o.order_id,
    o.order_date,
    o.sales,
    c.customer_id,
    c.customer_name,
    c.segment,
    p.product_id,
    p.product_name,
    p.category,
    p.sub_category,
    g.postal_code,
    g.city,
    g.state,
    g.region
FROM orders o
JOIN customers c  ON o.customer_id  = c.customer_id
JOIN products p   ON o.product_id   = p.product_id
JOIN geography g  ON o.postal_code  = g.postal_code


