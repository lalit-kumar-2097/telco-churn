-- All SQL Queries

/* ----------------------------------------------------------
   SECTION 1: Data Cleanup
----------------------------------------------------------- */

-- Remove empty TotalCharges
DELETE FROM customers WHERE TRIM(TotalCharges) = '';

-- Add TotalCharges_clean as numeric
ALTER TABLE customers ADD COLUMN TotalCharges_clean REAL;
UPDATE customers SET TotalCharges_clean = CAST(TotalCharges AS REAL);


/* ----------------------------------------------------------
   SECTION 2: Calculated Columns
----------------------------------------------------------- */

-- Add binary flag for churn
ALTER TABLE customers ADD COLUMN ChurnFlag INT;
UPDATE customers SET ChurnFlag = CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END;

-- Add average monthly spend
ALTER TABLE customers ADD COLUMN AvgMonthlySpend REAL;
UPDATE customers SET AvgMonthlySpend = TotalCharges_clean / NULLIF(tenure, 0);


/* ----------------------------------------------------------
   SECTION 3: Churn Summary Analysis
----------------------------------------------------------- */

--  Churn rate by PaymentMethod
SELECT 
    PaymentMethod,
    round(COUNT(CASE WHEN Churn = 'Yes' THEN 1 END) *100.00  / Count(PaymentMethod), 2) AS Yes,
    round(COUNT(CASE WHEN Churn = 'No' THEN 1 END) *100.00  / Count(PaymentMethod), 2) AS No
FROM 
    customers
GROUP BY 
    PaymentMethod;

-- Churn Rate by InternetService
SELECT
	InternetService,
	ROUND(COUNT(CASE WHEN  Churn = 'Yes' THEN 1 END) * 100.00 / COUNT (InternetService), 2) AS Yes,
	ROUND(COUNT(CASE WHEN  Churn = 'No' THEN 1 END) * 100.00 / COUNT (InternetService), 2) AS No
FROM
	customers
GROUP BY
	InternetService;


-- Chur Rate by ContractType
SELECT Contract,
       COUNT(*) AS Total_Customers,
       SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
       ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS ChurnRate
FROM customers
GROUP BY Contract
ORDER BY ChurnRate DESC;


-- High-risk group: MonthlyCharges > 80 and tenure < 12
SELECT customerID, MonthlyCharges, tenure, Churn
FROM customers
WHERE MonthlyCharges > 80 AND tenure < 12;


-- Churn Rate by MonthlyCharges
SELECT 
    CASE 
        WHEN MonthlyCharges < 45 THEN 'Low'
        WHEN MonthlyCharges < 80 THEN 'Medium'
        ELSE 'High'
    END AS ChargeGroup,
    COUNT(*) AS Total,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned,
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*), 2) AS ChurnRate
FROM customers
GROUP BY ChargeGroup;

-- Churn Rate by tenure
SELECT
    CASE 
        WHEN tenure < 12 THEN 'New'
        WHEN tenure < 36 THEN 'Mid-term'
        ELSE 'Loyal'
    END AS TenureGroup,
    COUNT(*) AS Total,
    ROUND(AVG(MonthlyCharges), 2) AS AvgCharge,
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*), 2) AS ChurnRate
FROM customers
GROUP BY TenureGroup;


/* ----------------------------------------------------------
   END OF SQL FILE
----------------------------------------------------------- */