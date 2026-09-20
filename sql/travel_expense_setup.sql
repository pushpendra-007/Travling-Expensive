CREATE DATABASE travel_expense_analysis;

USE travel_expense_analysis;


CREATE TABLE travel_expenses_raw (
    Expense_ID VARCHAR(20),
    Payee_Name VARCHAR(100),
    Competent_Person_Engineer VARCHAR(100),
    Purpose VARCHAR(255),
    Work_Done VARCHAR(100),
    Site_Name VARCHAR(150),
    Client VARCHAR(100),
    Site_City VARCHAR(100),
    Travel_Start_Date VARCHAR(20),
    Travel_End_Date VARCHAR(20),
    Travel_Days INT,
    Food_Expense DECIMAL(10,2),
    Lodging_Boarding_Expense DECIMAL(10,2),
    Local_Conveyance_Expense DECIMAL(10,2),
    Petrol_Diesel_Expense DECIMAL(10,2),
    NDT_Charges DECIMAL(10,2),
    Other_Expense DECIMAL(10,2),
    Advance_Payment DECIMAL(10,2),
    Balance_Amount DECIMAL(10,2),
    Total_Amount DECIMAL(10,2),
    Month VARCHAR(20),
    Year INT
);


SELECT COUNT(*) AS Total_Records
FROM travel_expenses_raw;


CREATE TABLE travel_expenses (
    Expense_ID VARCHAR(20) PRIMARY KEY,
    Payee_Name VARCHAR(100),
    Competent_Person_Engineer VARCHAR(100),
    Purpose VARCHAR(255),
    Work_Done VARCHAR(100),
    Site_Name VARCHAR(150),
    Client VARCHAR(100),
    Site_City VARCHAR(100),
    Travel_Start_Date DATE,
    Travel_End_Date DATE,
    Travel_Days INT,
    Food_Expense DECIMAL(10,2),
    Lodging_Boarding_Expense DECIMAL(10,2),
    Local_Conveyance_Expense DECIMAL(10,2),
    Petrol_Diesel_Expense DECIMAL(10,2),
    NDT_Charges DECIMAL(10,2),
    Other_Expense DECIMAL(10,2),
    Advance_Payment DECIMAL(10,2),
    Balance_Amount DECIMAL(10,2),
    Total_Amount DECIMAL(10,2),
    Month VARCHAR(20),
    Year INT
);


INSERT INTO travel_expenses (
    Expense_ID,
    Payee_Name,
    Competent_Person_Engineer,
    Purpose,
    Work_Done,
    Site_Name,
    Client,
    Site_City,
    Travel_Start_Date,
    Travel_End_Date,
    Travel_Days,
    Food_Expense,
    Lodging_Boarding_Expense,
    Local_Conveyance_Expense,
    Petrol_Diesel_Expense,
    NDT_Charges,
    Other_Expense,
    Advance_Payment,
    Balance_Amount,
    Total_Amount,
    Month,
    Year
)
SELECT
    Expense_ID,
    Payee_Name,
    Competent_Person_Engineer,
    Purpose,
    Work_Done,
    Site_Name,
    Client,
    Site_City,
    STR_TO_DATE(Travel_Start_Date, '%d/%m/%Y'),
    STR_TO_DATE(Travel_End_Date, '%d/%m/%Y'),
    Travel_Days,
    Food_Expense,
    Lodging_Boarding_Expense,
    Local_Conveyance_Expense,
    Petrol_Diesel_Expense,
    NDT_Charges,
    Other_Expense,
    Advance_Payment,
    Balance_Amount,
    Total_Amount,
    Month,
    Year
FROM travel_expenses_raw;


SELECT *
FROM travel_expenses
LIMIT 5;


SELECT
    COUNT(*) AS Total_Trips,
    SUM(Total_Amount) AS Total_Expense,
    SUM(Advance_Payment) AS Total_Advance,
    SUM(Balance_Amount) AS Total_Balance,
    ROUND(AVG(Total_Amount), 2) AS Average_Expense_Per_Trip
FROM travel_expenses;


SELECT
    Payee_Name,
    COUNT(*) AS Number_of_Trips,
    SUM(Total_Amount) AS Total_Expense,
    ROUND(AVG(Total_Amount), 2) AS Average_Expense_Per_Trip
FROM travel_expenses
GROUP BY Payee_Name
ORDER BY Total_Expense DESC;


SELECT
    Client,
    COUNT(*) AS Number_of_Trips,
    SUM(Total_Amount) AS Total_Expense,
    ROUND(AVG(Total_Amount), 2) AS Average_Expense_Per_Trip
FROM travel_expenses
GROUP BY Client
ORDER BY Total_Expense DESC;


SELECT
    Month,
    COUNT(*) AS Number_of_Trips,
    SUM(Total_Amount) AS Total_Expense,
    ROUND(AVG(Total_Amount), 2) AS Average_Expense_Per_Trip
FROM travel_expenses
GROUP BY Month
ORDER BY MIN(Travel_Start_Date);


SELECT 'Food' AS Expense_Category, SUM(Food_Expense) AS Total_Expense
FROM travel_expenses

UNION ALL

SELECT 'Lodging/Boarding', SUM(Lodging_Boarding_Expense)
FROM travel_expenses

UNION ALL

SELECT 'Local Conveyance', SUM(Local_Conveyance_Expense)
FROM travel_expenses

UNION ALL

SELECT 'Petrol/Diesel', SUM(Petrol_Diesel_Expense)
FROM travel_expenses

UNION ALL

SELECT 'NDT Charges', SUM(NDT_Charges)
FROM travel_expenses

UNION ALL

SELECT 'Other Expense', SUM(Other_Expense)
FROM travel_expenses

ORDER BY Total_Expense DESC;


SELECT
    Site_Name,
    COUNT(*) AS Number_of_Trips,
    SUM(Total_Amount) AS Total_Expense,
    ROUND(AVG(Total_Amount), 2) AS Average_Expense_Per_Trip
FROM travel_expenses
GROUP BY Site_Name
ORDER BY Total_Expense DESC;


SELECT
    Payee_Name,
    COUNT(*) AS Number_of_Trips,
    SUM(Total_Amount) AS Total_Expense,
    ROUND(AVG(Total_Amount), 2) AS Average_Expense_Per_Trip
FROM travel_expenses
GROUP BY Payee_Name
ORDER BY Total_Expense DESC;


SELECT
    Month,
    COUNT(*) AS Number_of_Trips,
    SUM(Total_Amount) AS Total_Expense,
    ROUND(AVG(Total_Amount), 2) AS Average_Expense_Per_Trip
FROM travel_expenses
GROUP BY Month
ORDER BY MIN(Travel_Start_Date);


SELECT
    SUM(Advance_Payment) AS Total_Advance,
    SUM(Total_Amount) AS Total_Expense,
    SUM(Balance_Amount) AS Total_Balance,
    ROUND(
        SUM(Total_Amount) / SUM(Advance_Payment) * 100,
        2
    ) AS Expense_vs_Advance_Percentage
FROM travel_expenses;


SELECT
    Payee_Name,
    SUM(Advance_Payment) AS Total_Advance,
    SUM(Total_Amount) AS Total_Expense,
    SUM(Balance_Amount) AS Total_Balance,
    ROUND(
        SUM(Total_Amount) / SUM(Advance_Payment) * 100,
        2
    ) AS Expense_vs_Advance_Percentage
FROM travel_expenses
GROUP BY Payee_Name
ORDER BY Expense_vs_Advance_Percentage DESC;


SELECT
    Travel_Days,
    COUNT(*) AS Number_of_Trips,
    SUM(Total_Amount) AS Total_Expense,
    ROUND(AVG(Total_Amount), 2) AS Average_Expense_Per_Trip,
    ROUND(
        SUM(Total_Amount) / SUM(Travel_Days),
        2
    ) AS Expense_Per_Travel_Day
FROM travel_expenses
GROUP BY Travel_Days
ORDER BY Travel_Days;


SELECT
    Payee_Name,
    COUNT(*) AS Number_of_Trips,
    SUM(Travel_Days) AS Total_Travel_Days,
    SUM(Total_Amount) AS Total_Expense,
    ROUND(
        SUM(Total_Amount) / SUM(Travel_Days),
        2
    ) AS Expense_Per_Travel_Day
FROM travel_expenses
GROUP BY Payee_Name
ORDER BY Expense_Per_Travel_Day DESC;


SELECT
    Site_Name,
    COUNT(*) AS Number_of_Trips,
    SUM(Travel_Days) AS Total_Travel_Days,
    SUM(Total_Amount) AS Total_Expense,
    ROUND(
        SUM(Total_Amount) / SUM(Travel_Days),
        2
    ) AS Expense_Per_Travel_Day
FROM travel_expenses
GROUP BY Site_Name
ORDER BY Expense_Per_Travel_Day DESC;


SELECT
    Expense_ID,
    Payee_Name,
    Site_City,
    Client,
    Travel_Days,
    Total_Amount,
    ROUND(Total_Amount / Travel_Days, 2) AS Expense_Per_Day
FROM travel_expenses
ORDER BY Total_Amount DESC
LIMIT 10;


SELECT
    Expense_ID,
    Payee_Name,
    Site_City,
    Travel_Days,
    Food_Expense,
    Lodging_Boarding_Expense,
    Local_Conveyance_Expense,
    Petrol_Diesel_Expense,
    NDT_Charges,
    Other_Expense,
    Total_Amount
FROM travel_expenses
ORDER BY Total_Amount DESC
LIMIT 10;


SELECT
    CASE
        WHEN Balance_Amount > 0 THEN 'Positive Balance'
        WHEN Balance_Amount < 0 THEN 'Negative Balance'
        ELSE 'Zero Balance'
    END AS Balance_Status,
    COUNT(*) AS Number_of_Trips,
    SUM(ABS(Balance_Amount)) AS Total_Balance_Amount
FROM travel_expenses
GROUP BY
    CASE
        WHEN Balance_Amount > 0 THEN 'Positive Balance'
        WHEN Balance_Amount < 0 THEN 'Negative Balance'
        ELSE 'Zero Balance'
    END
ORDER BY Number_of_Trips DESC;


SELECT
    Month,
    SUM(Advance_Payment) AS Total_Advance,
    SUM(Total_Amount) AS Total_Expense,
    SUM(Balance_Amount) AS Total_Balance
FROM travel_expenses
GROUP BY Month
ORDER BY MIN(Travel_Start_Date);


SELECT
    Payee_Name,
    Site_Name,
    COUNT(*) AS Number_of_Trips,
    SUM(Total_Amount) AS Total_Expense,
    ROUND(AVG(Total_Amount), 2) AS Average_Expense_Per_Trip
FROM travel_expenses
GROUP BY Payee_Name, Site_Name
ORDER BY Total_Expense DESC;


SELECT
    Site_Name,
    SUM(Food_Expense) AS Food,
    SUM(Lodging_Boarding_Expense) AS Lodging,
    SUM(Local_Conveyance_Expense) AS Local_Conveyance,
    SUM(Petrol_Diesel_Expense) AS Petrol_Diesel,
    SUM(NDT_Charges) AS NDT,
    SUM(Other_Expense) AS Other
FROM travel_expenses
GROUP BY Site_Name
ORDER BY Site_Name;
