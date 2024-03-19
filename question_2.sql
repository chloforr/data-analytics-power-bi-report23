SELECT 
    dim_date.month_name, SUM(orders.product_quantity * dim_product.sale_price ) AS total_rev
FROM
    orders 
    INNER JOIN dim_product ON dim_product.product_code = orders.product_code
    INNER JOIN dim_date ON dim_date.date = orders.order_date
WHERE
    dim_date.year = '2022'
GROUP BY
    dim_date.month_name
ORDER BY
    total_rev DESC
LIMIT 1;