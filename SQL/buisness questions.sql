create database retail_store

--adding primary keys
ALTER TABLE customers ADD CONSTRAINT PK_customers PRIMARY KEY (customer_id);
ALTER TABLE products ADD CONSTRAINT PK_products PRIMARY KEY (product_id);
ALTER TABLE stores ADD CONSTRAINT PK_stores PRIMARY KEY (store_id);
ALTER TABLE sales ADD CONSTRAINT PK_sales PRIMARY KEY (order_id);
ALTER TABLE returns ADD CONSTRAINT PK_returns PRIMARY KEY (return_id);

--adding foreing keys
ALTER TABLE sales
ADD CONSTRAINT FK_sales_customers
FOREIGN KEY (customer_id) REFERENCES customers(customer_id);

ALTER TABLE sales
ADD CONSTRAINT FK_sales_products
FOREIGN KEY (product_id) REFERENCES products(product_id);

ALTER TABLE sales
ADD CONSTRAINT FK_sales_stores
FOREIGN KEY (store_id) REFERENCES stores(store_id);

ALTER TABLE returns
ADD CONSTRAINT FK_returns_orders
FOREIGN KEY (order_id) REFERENCES sales(order_id);

--creating indexes
CREATE INDEX IX_sales_order_date ON sales(order_date);
CREATE INDEX IX_sales_customer ON sales(customer_id);
CREATE INDEX IX_sales_product ON sales(product_id);
CREATE INDEX IX_sales_store ON sales(store_id);
CREATE INDEX IX_customers_region ON customers(region);
CREATE INDEX IX_products_category ON products(category);
CREATE INDEX IX_returns_date ON returns(return_date);
CREATE INDEX IX_stores_region ON stores(region);

--creating derived column profit
select * from sales
ALTER TABLE sales ADD profit DECIMAL(15, 2);

UPDATE s
SET s.profit = s.total_amount - (s.quantity * p.cost_price)
FROM sales s
INNER JOIN products p ON s.product_id = p.product_id;

-- buisness questions
--1. What is the total revenue generated in the last 12 months?
SELECT SUM(total_amount) AS total_revenue_last_12_months
FROM sales
WHERE order_date >= DATEADD(MONTH, -12, GETDATE());

--2. Which are the top 5 best-selling products by quantity?
SELECT TOP 5
    p.product_name,
    SUM(s.quantity) AS total_quantity_sold
FROM sales s
INNER JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name
ORDER BY SUM(s.quantity) DESC;

--3. How many customers are from each region? 
SELECT 
    region,
    COUNT(customer_id) AS total_customers
FROM customers
GROUP BY region
ORDER BY COUNT(customer_id) DESC;

--4.  Which store has the highest profit in the past year? 
SELECT TOP 1
    st.store_name,
    SUM(s.total_amount - (s.quantity * p.cost_price)) AS total_profit
FROM sales s
INNER JOIN products p ON s.product_id = p.product_id
INNER JOIN stores st ON s.store_id = st.store_id
WHERE s.order_date >= DATEADD(YEAR, -1, GETDATE())
GROUP BY st.store_name
ORDER BY total_profit DESC;

--5. What is the return rate by product category? 
SELECT 
    p.category,
    COUNT(DISTINCT s.order_id) AS total_orders,
    COUNT(DISTINCT r.return_id) AS total_returns,
    CAST(COUNT(DISTINCT r.return_id) * 100.0 / COUNT(DISTINCT s.order_id) AS DECIMAL(5,2)) AS return_rate_pct
FROM sales s
INNER JOIN products p ON s.product_id = p.product_id
LEFT JOIN returns r ON s.order_id = r.order_id
GROUP BY p.category
ORDER BY return_rate_pct DESC;

--6. What is the average revenue per customer by age group? 
SELECT 
    c.age_group,
    SUM(s.total_amount) / COUNT(DISTINCT c.customer_id) AS  avg_revenue_per_customer
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.age_group
ORDER BY avg_revenue_per_customer DESC;

--7. Which sales channel (Online vs In-Store) is more profitable on average? 
SELECT 
    s.sales_channel,
    COUNT(s.order_id) AS total_orders,
    AVG(s.total_amount - (s.quantity * p.cost_price)) AS avg_profit_per_order
FROM sales s
INNER JOIN products p ON s.product_id = p.product_id
GROUP BY s.sales_channel
ORDER BY avg_profit_per_order DESC;

--8. How has monthly profit changed over the last 2 years by region? 
SELECT 
    st.region,
    FORMAT(s.order_date, 'yyyy-MM') AS year_month,
    SUM(s.total_amount - (s.quantity * p.cost_price)) AS monthly_profit
FROM sales s
INNER JOIN products p ON s.product_id = p.product_id
INNER JOIN stores st ON s.store_id = st.store_id
WHERE s.order_date >= DATEADD(YEAR, -2, GETDATE())
GROUP BY st.region, FORMAT(s.order_date, 'yyyy-MM')
ORDER BY st.region, year_month;

--9. Identify the top 3 products with the highest return rate in each category
WITH ProductReturns AS (
    SELECT 
        p.category,
        p.product_name,
        CAST(COUNT(DISTINCT r.return_id) * 100.0 / NULLIF(COUNT(DISTINCT s.order_id), 0) AS DECIMAL(5,2)) AS return_rate_pct,
        ROW_NUMBER() OVER (PARTITION BY p.category ORDER BY CAST(COUNT(DISTINCT r.return_id) * 100.0 / NULLIF(COUNT(DISTINCT s.order_id), 0) AS DECIMAL(5,2)) DESC) AS rank
    FROM sales s
    INNER JOIN products p ON s.product_id = p.product_id
    LEFT JOIN returns r ON s.order_id = r.order_id
    GROUP BY p.category, p.product_name
)
SELECT category, product_name, return_rate_pct
FROM ProductReturns
WHERE rank <= 3
ORDER BY category, rank;

--10. Which 5 customers have contributed the most to total profit, and what is their tenure with the company? 
SELECT TOP 5
    c.first_name + ' ' + c.last_name AS customer_name,
    SUM(s.total_amount - (s.quantity * p.cost_price)) AS total_profit,
    DATEDIFF(YEAR, c.signup_date, GETDATE()) AS years_with_company
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
INNER JOIN products p ON s.product_id = p.product_id
GROUP BY c.first_name, c.last_name, c.signup_date
ORDER BY total_profit DESC;


Select total_amount from sales where order_date between 1-01-2024 and 31-12-2024;