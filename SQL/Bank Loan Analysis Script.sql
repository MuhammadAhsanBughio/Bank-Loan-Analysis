select * from bank_loan_data;

--Total Loan Applications
select COUNT(id) AS Total_Loan_Applications from bank_loan_data;

--MTD Total Loan Applications
select COUNT(id) AS MTD_Total_Loan_Applications from bank_loan_data
WHERE MONTH(issue_date) = 12
  AND YEAR(issue_date) = (
      SELECT MAX(YEAR(issue_date))
      FROM bank_loan_data
  ) ;


--PMTD Total Loan Applications
select COUNT(id) AS PMTD_Total_Loan_Applications from bank_loan_data
WHERE MONTH(issue_date) = 11
  AND YEAR(issue_date) = (
      SELECT MAX(YEAR(issue_date))
      FROM bank_loan_data
  ) ;


--MTD Total Funded Amount
Select SUM(loan_amount) AS MTD_Total_Funded_Amount FROM bank_loan_data
WHERE MONTH(issue_date) = 12
  AND YEAR(issue_date) = (
      SELECT MAX(YEAR(issue_date))
      FROM bank_loan_data
  ) ;


--PMTD Total Funded Amount
Select SUM(loan_amount) AS PMTD_Total_Funded_Amount FROM bank_loan_data
WHERE MONTH(issue_date) = 11
  AND YEAR(issue_date) = (
      SELECT MAX(YEAR(issue_date))
      FROM bank_loan_data
  ) ;


--MTD Total Amount Recieved
Select SUM(total_payment) AS MTD_Total_Amount_Recieved FROM bank_loan_data
WHERE MONTH(issue_date) = 12
  AND YEAR(issue_date) = (
      SELECT MAX(YEAR(issue_date))
      FROM bank_loan_data
  ) ;

--PMTD Total Amount Recieved
Select SUM(total_payment) AS PMTD_Total_Amount_Recieved FROM bank_loan_data
WHERE MONTH(issue_date) = 11
  AND YEAR(issue_date) = (
      SELECT MAX(YEAR(issue_date))
      FROM bank_loan_data
  ) ;

--Avg Interest Rate
Select ROUND(AVG(int_rate),4)*100 AS Avg_Interest_Rate FROM bank_loan_data;

--MTD Avg Interest Rate
Select ROUND(AVG(int_rate),4)*100 AS MTD_Avg_Interest_Rate FROM bank_loan_data
WHERE MONTH(issue_date) = 12
  AND YEAR(issue_date) = (
      SELECT MAX(YEAR(issue_date))
      FROM bank_loan_data
  ) ;


--PMTD Avg Interest Rate
Select ROUND(AVG(int_rate),4)*100 AS PMTD_Avg_Interest_Rate FROM bank_loan_data
WHERE MONTH(issue_date) = 11
  AND YEAR(issue_date) = (
      SELECT MAX(YEAR(issue_date))
      FROM bank_loan_data
  ) ;

--Avg DTI
SELECT Round(AVG(dti),4) * 100 Avg_DTI FROM bank_loan_data;

--MTD Avg DTI
SELECT Round(AVG(dti),4) * 100 MTD_Avg_DTI FROM bank_loan_data
WHERE MONTH(issue_date) = 12
  AND YEAR(issue_date) = (
      SELECT MAX(YEAR(issue_date))
      FROM bank_loan_data
  ) ;

--PMTD Avg DTI
SELECT Round(AVG(dti),4) * 100 PMTD_Avg_DTI FROM bank_loan_data
WHERE MONTH(issue_date) = 11
  AND YEAR(issue_date) = (
      SELECT MAX(YEAR(issue_date))
      FROM bank_loan_data
  ) ;

--Good Loan Percentage
Select
    (COUNT(CASE WHEN Loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END)*100)
    /
    COUNT(id) AS Good_loan_percentage  
FROM bank_loan_data;

--Good Loan Applications
Select COUNT(id) AS Good_Loan_Applications FROM bank_loan_data
where loan_status = 'Fully Paid' OR loan_status = 'Current';

--Good Loan Funded Amount
Select SUM(loan_amount) AS Good_Loan_Funded_Amount FROM bank_loan_data
where loan_status = 'Fully Paid' OR loan_status = 'Current';

--Good Loan Revieved Amount
Select SUM(total_payment) AS Good_Loan_Revieved_Amount FROM bank_loan_data
where loan_status = 'Fully Paid' OR loan_status = 'Current';


--Bad Loan Percentage
SELECT
    (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) / 
	COUNT(id) AS Bad_Loan_Percentage
FROM bank_loan_data;
 
--Bad Loan Applications
SELECT COUNT(id) AS Bad_Loan_Applications FROM bank_loan_data
WHERE loan_status = 'Charged Off';
 
--Bad Loan Funded Amount
SELECT SUM(loan_amount) AS Bad_Loan_Funded_amount FROM bank_loan_data
WHERE loan_status = 'Charged Off';
 
--Bad Loan Amount Received
SELECT SUM(total_payment) AS Bad_Loan_amount_received FROM bank_loan_data
WHERE loan_status = 'Charged Off';
 
--Loan Status
 Select 
        loan_status,
        COUNT(id) As Total_Loan_Applications,
        SUM(total_payment) AS Total_Amount_Recieved,
        SUM(loan_amount) AS Total_Funded_Amount,
        AVG(int_rate * 100) AS Interest_Rate,
        AVG(dti*100) AS DII
    FROM
        bank_loan_data
    Group BY
        loan_status;



 
--Loan Status MTD
SELECT 
	loan_status, 
	SUM(total_payment) AS MTD_Total_Amount_Received, 
	SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM bank_loan_data
WHERE MONTH(issue_date) = 12 
GROUP BY loan_status;
 


--BANK LOAN REPORT | OVERVIEW
--MONTH
SELECT 
	MONTH(issue_date) AS Month_Number, 
	DATENAME(MONTH, issue_date) AS Month_name, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date);
 

--STATE
SELECT 
	address_state AS State, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY address_state
ORDER BY address_state;
 

--TERM
SELECT 
	term AS Term, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY term
ORDER BY term;
 

--EMPLOYEE LENGTH
SELECT 
	emp_length AS Employee_Length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY emp_length
ORDER BY emp_length;
 
--PURPOSE
SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY purpose
ORDER BY purpose;
 

--HOME OWNERSHIP
SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data
GROUP BY home_ownership
ORDER BY home_ownership;
 
