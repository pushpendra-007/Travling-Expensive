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

