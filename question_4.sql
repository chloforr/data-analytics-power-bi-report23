SELECT dim_store.store_type AS "Store Type", 
    SUM(orders.product_quantity * dim_product.sale_price) AS "Total Sales",
    (SUM(orders.product_quantity * dim_product.sale_price) / SUM(SUM(orders.product_quantity * dim_product.sale_price)) over())*100  AS "Percentage of Total Sales",
    COUNT(orders.order_date) AS "Count of Orders"
FROM 
    orders
    INNER JOIN dim_product ON dim_product.product_code = orders.product_code
    INNER JOIN dim_store ON dim_store.store_code = orders.store_code
GROUP BY
    dim_store.store_type;