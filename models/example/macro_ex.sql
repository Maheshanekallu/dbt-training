SELECT
    o.Order_ID,
    c.Customer_ID,
    c.Customer_Name,
    p.Product_ID,
    p.Product_Name,
    o.Quantity,
    {{get_date_parts('Order_Date')}} AS date_extract
FROM
    `dbt-data`.orders o
JOIN
    {{ ref("stg_customer") }} c ON o.Customer_ID = c.Customer_ID
JOIN
    `dbt-data`.products p ON o.Product_ID = p.Product_ID