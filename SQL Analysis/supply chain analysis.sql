
--create table supply chain raw 
CREATE TABLE supply_chain_raw (
    product_type TEXT,
    sku TEXT,
    price NUMERIC(10,2),
    availability INTEGER,
    number_of_products_sold INTEGER,
    revenue_generated NUMERIC(12,2),
    customer_demographics TEXT,
    stock_levels INTEGER,
    lead_times INTEGER,
    order_quantities INTEGER,
    shipping_times INTEGER,
    shipping_carriers TEXT,
    shipping_costs NUMERIC(10,2),
    supplier_name TEXT,
    location TEXT,
    lead_time INTEGER,
    production_volumes INTEGER,
    manufacturing_lead_time INTEGER,
    manufacturing_costs NUMERIC(10,2),
    inspection_results TEXT,
    defect_rates NUMERIC(10,2),
    transportation_modes TEXT,
    routes TEXT,
    costs NUMERIC(10,2)
);

--Check missing values 
SELECT
    COUNT(*) - COUNT(sku) AS missing_sku,
    COUNT(*) - COUNT(product_type) AS missing_product_type,
    COUNT(*) - COUNT(price) AS missing_price,
    COUNT(*) - COUNT(stock_levels) AS missing_stock,
    COUNT(*) - COUNT(supplier_name) AS missing_supplier
FROM supply_chain_raw;

--Check for duplicate SKUs
SELECT
    sku,
    COUNT(*) AS record_count
FROM supply_chain_raw
GROUP BY sku
HAVING COUNT(*) > 1;

--Check invalid inventory/sales values
SELECT *
FROM supply_chain_raw
WHERE stock_levels < 0
   OR number_of_products_sold < 0
   OR price < 0
   OR revenue_generated < 0
   OR order_quantities < 0
   OR production_volumes < 0;

--Check categorical values
SELECT DISTINCT
    product_type,
    inspection_results,
    transportation_modes
FROM supply_chain_raw;

--Check operational time and quantity fields
SELECT *
FROM supply_chain_raw
WHERE lead_times < 0
   OR lead_time < 0
   OR order_quantities < 0
   OR shipping_times < 0
   OR production_volumes < 0
   OR manufacturing_lead_time < 0;

--Check cost fields for invalid negative values
SELECT *
FROM supply_chain_raw
WHERE shipping_costs < 0
   OR manufacturing_costs < 0
   OR costs < 0;

--check defect rates
SELECT
    MIN(defect_rates) AS min_defect_rate, -- 0.02 min, 4.94 max
    MAX(defect_rates) AS max_defect_rate
FROM supply_chain_raw;

--Check stock and availability values
SELECT *
FROM supply_chain_raw
WHERE stock_levels < 0
   OR availability < 0;

--Inventory vs sales
SELECT
    sku,
    product_type,
    stock_levels,
    number_of_products_sold,
    ROUND(
        stock_levels::NUMERIC / NULLIF(number_of_products_sold, 0),
        2
    ) AS stock_to_sales_ratio
FROM supply_chain_raw
ORDER BY stock_to_sales_ratio DESC;

--High Sales but Low Stock
SELECT
    sku,
    product_type,
    stock_levels,
    number_of_products_sold,
	revenue_generated
FROM supply_chain_raw
where number_of_products_sold >(
select avg(number_of_products_sold) 
from supply_chain_raw
)
and stock_levels <(
select avg(stock_levels)
from supply_chain_raw
)
ORDER BY number_of_products_sold DESC;

--High Stock but Low Sales
SELECT
    sku,
    product_type,
    stock_levels,
    number_of_products_sold,
    revenue_generated
FROM supply_chain_raw
WHERE stock_levels > (
    SELECT AVG(stock_levels)
    FROM supply_chain_raw
)
AND number_of_products_sold < (
    SELECT AVG(number_of_products_sold)
    FROM supply_chain_raw
)
ORDER BY stock_levels DESC;

--Supplier Performance
SELECT
    supplier_name,
    COUNT(*) AS products,
    ROUND(AVG(lead_time), 2) AS avg_supplier_lead_time,
    ROUND(AVG(defect_rates), 2) AS avg_defect_rate,
    ROUND(AVG(shipping_costs), 2) AS avg_shipping_cost
FROM supply_chain_raw
GROUP BY supplier_name
ORDER BY avg_supplier_lead_time;

--supplier performance by product type
SELECT
    supplier_name,
    product_type,
    COUNT(*) AS products,
    ROUND(AVG(lead_time), 2) AS avg_lead_time,
    ROUND(AVG(defect_rates), 2) AS avg_defect_rate
FROM supply_chain_raw
GROUP BY supplier_name, product_type
ORDER BY supplier_name, product_type;

--Manufacturing by Product Type
SELECT
    product_type,
    ROUND(AVG(production_volumes), 2) AS avg_production_volume,
    ROUND(AVG(manufacturing_lead_time), 2) AS avg_manufacturing_lead_time,
    ROUND(AVG(manufacturing_costs), 2) AS avg_manufacturing_cost
FROM supply_chain_raw
GROUP BY product_type
ORDER BY avg_manufacturing_cost DESC;

--Production vs Sales
SELECT
    product_type,
    SUM(production_volumes) AS total_production,
    SUM(number_of_products_sold) AS total_sold,
    ROUND(
        SUM(production_volumes) ::NUMERIC
        / NULLIF(SUM(number_of_products_sold), 0),
        2
    ) AS production_to_sales_ratio
FROM supply_chain_raw
GROUP BY product_type
ORDER BY production_to_sales_ratio DESC;

--Shipping & Transportation Efficiency
SELECT
    transportation_modes,
    COUNT(*) AS records,
    ROUND(AVG(shipping_times), 2) AS avg_shipping_time,
    ROUND(AVG(shipping_costs), 2) AS avg_shipping_cost
FROM supply_chain_raw
GROUP BY transportation_modes
ORDER BY avg_shipping_cost DESC;

--Quality & Defects
SELECT
    product_type,
    ROUND(AVG(defect_rates), 2) AS avg_defect_rate,
    COUNT(*) FILTER (
        WHERE inspection_results = 'Fail'
    ) AS failed_inspections,
    COUNT(*) AS total_records
FROM supply_chain_raw
GROUP BY product_type
ORDER BY avg_defect_rate DESC;
