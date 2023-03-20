-- 1) Create a table to store the customer data.
CREATE TABLE Public."customer"
(
	customer_id VARCHAR(100),
	gender VARCHAR(100),
	age INT,
	married VARCHAR(100),
	num_of_dependents INT,
	city VARCHAR(100),
	zip_code INT,
	latitude FLOAT,
	longitude FLOAT,
	num_of_referrals INT,
	tenure_in_months INT,
	offer VARCHAR(100),
	phone_service VARCHAR(100),
	avg_monthly_long_distance_charges FLOAT,
	multiple_lines VARCHAR(100),
	internet_service VARCHAR(100),
	internet_type VARCHAR(100),
	avg_monthly_gb_download INT,
	online_security VARCHAR(100),
	online_backup VARCHAR(100),
	device_protection_plan VARCHAR(100),
	premium_tech_support VARCHAR(100),
	streaming_tv VARCHAR(100),
	streaming_movies VARCHAR(100),
	streaming_music VARCHAR(100),
	unlimited_data VARCHAR(100),
	contract VARCHAR(100),
	paperless_billing VARCHAR(100),
	payment_method VARCHAR(100),
	monthly_charge FLOAT,
	total_charges FLOAT,
	total_refunds FLOAT,
	total_extra_data_charges INT,
	total_long_distance_charges FLOAT,
	total_revenue FLOAT,
	customer_status VARCHAR(100),
	churn_category VARCHAR(100),
	churn_reason VARCHAR(100)
);

-- 2) Import the customer data from the CSV file into the table.
COPY Public."customer"
FROM 'C:\Users\David\Documents\Telecom+Customer+Churn\telecom_customer_churn.csv' 
DELIMITER ',' CSV HEADER;