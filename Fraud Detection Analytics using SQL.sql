-- Create database Deloitte_Fraud_Detection_Analytics;
-- use Deloitte_Fraud_Detection_Analytics;
-- RENAME TABLE `fraud detection analytics`TO fraud_transactions;
-- alter table fraud_transactions
-- rename column ï»¿Transaction_ID to Transaction_ID;

-- ANALYSIS PART 

select * from fraud_transactions;

-- 1. Total Transactions IN Deloitte
SELECT COUNT(*) AS Total_Transactions
FROM fraud_transactions; 

-- 2. Total Fraudulent Transactions IN Deloitte
SELECT COUNT(*) AS Fraudulent_Transactions
FROM fraud_transactions
WHERE Fraud_Flag = 1;

-- 3. Fraud Rate IN Deloitte
SELECT
    ROUND(
        SUM(Fraud_Flag) * 100.0 / COUNT(*),
        2
    ) AS Fraud_Rate
FROM fraud_transactions;

-- 4. Total Transaction Amount IN Deloitte 
SELECT
    ROUND(SUM(Amount),2) AS Total_Transaction_Value
FROM fraud_transactions;

-- 5. Fraud Amount IN Deloitte 
SELECT
    ROUND(SUM(Amount),2) AS Fraudulent_Amount
FROM fraud_transactions
WHERE Fraud_Flag = 1;

-- 6. Fraud by Payment Method IN Deloitte 
SELECT
    Payment_Method,
    COUNT(*) AS Transactions,
    SUM(Fraud_Flag) AS Fraud_Count,
    ROUND(SUM(Fraud_Flag)*100.0/COUNT(*),2) AS Fraud_Rate
FROM fraud_transactions
GROUP BY Payment_Method
ORDER BY Fraud_Rate DESC;

-- 7. Fraud by Channel IN Deloitte
SELECT
    Channel,
    COUNT(*) AS Transactions,
    SUM(Fraud_Flag) AS Fraud_Count,
    ROUND(SUM(Fraud_Flag)*100.0/COUNT(*),2) AS Fraud_Rate
FROM fraud_transactions
GROUP BY Channel
ORDER BY Fraud_Rate DESC;

-- 8. Fraud by Merchant Category IN Deloitte
SELECT
    Merchant_Category,
    COUNT(*) AS Transactions,
    SUM(Fraud_Flag) AS Fraud_Count
FROM fraud_transactions
GROUP BY Merchant_Category
ORDER BY Fraud_Count DESC;

-- 9. Fraud Type Analysis IN Deloitte 
SELECT
    Fraud_Type,
    COUNT(*) AS Fraud_Count,
    SUM(Amount) AS Fraud_Amount
FROM fraud_transactions
WHERE Fraud_Flag = 1
GROUP BY Fraud_Type
ORDER BY Fraud_Count DESC;

