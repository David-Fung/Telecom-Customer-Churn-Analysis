-- 1) Retrieve the number of customers per customer status (stayed, joined, churned).
SELECT 
	customer_status, 
	COUNT(*) AS num_customers, 
	ROUND(COUNT(*)/(SELECT COUNT(*) FROM customer)::DECIMAL, 2) AS percent_customers
FROM customer
GROUP BY customer_status
ORDER BY num_customers DESC;

-- 2) Retrieve the top 10 cities and the number of customers that stayed, joined, and churned per city.
SELECT
	city,
	COUNT(*) AS total_customers,
	SUM(CASE WHEN customer_status = 'Stayed' THEN 1 ELSE 0 END) AS num_stayed,
	SUM(CASE WHEN customer_status = 'Churned' THEN 1 ELSE 0 END) AS num_churned,
	SUM(CASE WHEN customer_status = 'Joined' THEN 1 ELSE 0 END) AS num_joined,
	ROUND(SUM(CASE WHEN customer_status = 'Stayed' THEN 1 ELSE 0 END)/COUNT(*)::DECIMAL, 2) AS percent_stayed,
	ROUND(SUM(CASE WHEN customer_status = 'Churned' THEN 1 ELSE 0 END)/COUNT(*)::DECIMAL, 2) AS percent_churned,
	ROUND(SUM(CASE WHEN customer_status = 'Joined' THEN 1 ELSE 0 END)/COUNT(*)::DECIMAL, 2) AS percent_joined
FROM customer
GROUP BY city
ORDER BY total_customers DESC
LIMIT 10;

-- 3) Retrieve the number of customers per churn reason.
SELECT 
	churn_category,
	churn_reason, 
	COUNT(*) AS num_customers, 
	ROUND(COUNT(*)/(SELECT COUNT(*) FROM customer WHERE churn_reason IS NOT null)::DECIMAL, 2) AS percent_customers
FROM customer
WHERE churn_reason IS NOT null
GROUP BY churn_category, churn_reason
ORDER BY num_customers DESC, churn_category;

-- 4) Retrieve the number of customers that stayed, joined, and churned per contract type.
SELECT
	contract,
	COUNT(*) AS total_customers,
	SUM(CASE WHEN customer_status = 'Stayed' THEN 1 ELSE 0 END) AS num_stayed,
	SUM(CASE WHEN customer_status = 'Churned' THEN 1 ELSE 0 END) AS num_churned,
	SUM(CASE WHEN customer_status = 'Joined' THEN 1 ELSE 0 END) AS num_joined,
	ROUND(SUM(CASE WHEN customer_status = 'Stayed' THEN 1 ELSE 0 END)/COUNT(*)::DECIMAL, 2) AS percent_stayed,
	ROUND(SUM(CASE WHEN customer_status = 'Churned' THEN 1 ELSE 0 END)/COUNT(*)::DECIMAL, 2) AS percent_churned,
	ROUND(SUM(CASE WHEN customer_status = 'Joined' THEN 1 ELSE 0 END)/COUNT(*)::DECIMAL, 2) AS percent_joined
FROM customer
GROUP BY contract
ORDER BY contract;

-- 5) Retrieve the number of customers that stayed, joined, and churned per internet type. 
SELECT
	internet_type,
	COUNT(*) AS total_customers,
	SUM(CASE WHEN customer_status = 'Stayed' THEN 1 ELSE 0 END) AS num_stayed,
	SUM(CASE WHEN customer_status = 'Churned' THEN 1 ELSE 0 END) AS num_churned,
	SUM(CASE WHEN customer_status = 'Joined' THEN 1 ELSE 0 END) AS num_joined,
	ROUND(SUM(CASE WHEN customer_status = 'Stayed' THEN 1 ELSE 0 END)/COUNT(*)::DECIMAL, 2) AS percent_stayed,
	ROUND(SUM(CASE WHEN customer_status = 'Churned' THEN 1 ELSE 0 END)/COUNT(*)::DECIMAL, 2) AS percent_churned,
	ROUND(SUM(CASE WHEN customer_status = 'Joined' THEN 1 ELSE 0 END)/COUNT(*)::DECIMAL, 2) AS percent_joined
FROM customer
WHERE internet_type IS NOT null
GROUP BY internet_type
ORDER BY internet_type DESC;

-- 6) Retrieve the number of customers that received marketing offers.
SELECT
	SUM(CASE WHEN offer = 'None' THEN 1 ELSE 0 END) AS no_offers,
	SUM(CASE WHEN offer != 'None' THEN 1 ELSE 0 END) AS received_offers,
	ROUND(SUM(CASE WHEN offer = 'None' THEN 1 ELSE 0 END)/COUNT(*)::DECIMAL, 2) AS percent_no_offers,
	ROUND(SUM(CASE WHEN offer != 'None' THEN 1 ELSE 0 END)/COUNT(*)::DECIMAL, 2) AS percent_received_offers
FROM customer;

-- 7) Retrieve the number of customers that stayed, joined, and churned per marketing offer.
SELECT
	offer,
	COUNT(*) AS total_customers,
	SUM(CASE WHEN customer_status = 'Stayed' THEN 1 ELSE 0 END) AS num_stayed,
	SUM(CASE WHEN customer_status = 'Churned' THEN 1 ELSE 0 END) AS num_churned,
	SUM(CASE WHEN customer_status = 'Joined' THEN 1 ELSE 0 END) AS num_joined,
	ROUND(SUM(CASE WHEN customer_status = 'Stayed' THEN 1 ELSE 0 END)/COUNT(*)::DECIMAL, 2) AS percent_stayed,
	ROUND(SUM(CASE WHEN customer_status = 'Churned' THEN 1 ELSE 0 END)/COUNT(*)::DECIMAL, 2) AS percent_churned,
	ROUND(SUM(CASE WHEN customer_status = 'Joined' THEN 1 ELSE 0 END)/COUNT(*)::DECIMAL, 2) AS percent_joined
FROM customer
GROUP BY offer 
ORDER BY offer;