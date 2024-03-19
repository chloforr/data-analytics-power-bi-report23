SELECT 
    dim_store.store_type, SUM(orders.product_quantity * dim_product.sale_price ) AS total_rev
FROM    
    orders
    INNER JOIN dim_product ON dim_product.product_code = orders.product_code
    INNER JOIN dim_date ON dim_date.date = orders.order_date
    INNER JOIN dim_store ON dim_store.store_code = orders.store_code
WHERE 
    dim_store.country = 'Germany'
AND 
    dim_date.year = '2022'
GROUP BY
    dim_store.store_type
ORDER BY
    total_rev DESC
LIMIT 1;
