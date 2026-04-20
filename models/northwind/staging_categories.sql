WITH source_data AS (
    SELECT * FROM {{ source('northwind', 'customers') }}
)

SELECT
    categoryid AS category_id,
    categoryname AS category_name
FROM source_data