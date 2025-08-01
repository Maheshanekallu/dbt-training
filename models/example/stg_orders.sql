SELECT
    o.Order_ID,
    c.Customer_ID,
    c.Customer_Name,
    p.Product_ID,
    p.Product_Name,
    o.Quantity,
    o.Order_Date
FROM
    `dbt-data`.orders o
JOIN
    {{ ref("stg_customer") }} c ON o.Customer_ID = c.Customer_ID
JOIN
    `dbt-data`.products p ON o.Product_ID = p.Product_ID