SELECT dim_product.category, SUM((dim_product.sale_price - dim_product.cost_price) * orders.product_quantity) AS "Profit"
FROM
    orders
    INNER JOIN dim_product ON dim_product.product_code = orders.product_code
    INNER JOIN dim_date ON dim_date.date = orders.order_date
    INNER JOIN dim_store ON dim_store.store_code = orders.store_code
WHERE 
    dim_date.year = '2021'
    AND dim_store.country_region = 'Wiltshire'
GROUP BY
    dim_product.category
ORDER BY
    "Profit" DESC
LIMIT 1;
