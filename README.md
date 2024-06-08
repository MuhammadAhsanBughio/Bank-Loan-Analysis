# Bank Loan Analysis Report
<img width="1168" alt="Screenshot 2024-06-05 at 8 55 05 pm" src="https://github.com/MuhammadAhsanBughio/Bank-Loan-Analysis/assets/139073097/be13fea5-6fce-46a3-96cd-a4c929057c87">

## Project Overview
The **Bank Loan Analysis Report** project is a comprehensive analysis designed to provide critical insights into a bank's lending activities, loan performance, and borrower behavior. By integrating robust SQL data analysis with advanced Tableau visualizations, this project supports data-driven decision-making within the bank’s lending operations.

### Tools Used 🧰
- SQL - [info](https://en.wikipedia.org/wiki/SQL)
- Tableau Public - [Info](https://www.tableau.com/en-gb)
- Azure Data Studio - To run SQL Server on Mac using Docker - [Azure Data Studio](https://azure.microsoft.com/en-gb/products/data-studio)
- Docker Hub - To create SQL server - [Docker Hub](https://hub.docker.com/)

## Objectives
- Monitor and assess key loan-related metrics over time.
- Distinguish between 'Good Loans' and 'Bad Loans' for performance evaluation.
- Provide regional, term-based, employment, and purpose-specific insights.
- Offer a comprehensive view of loan data for detailed analysis.

## SQL Work
Utilizing advanced SQL techniques, this project involved extensive data extraction, transformation, and loading (ETL) processes from the bank's loan database. Key SQL tasks included:

### Data Extraction and Aggregation
- **Total Loan Applications**: Query to count total loan applications received, including Month-to-Date (MTD) and Previous Month-to-Date (PMTD) applications.
- **Funded Amount Analysis**: Summing the total funded amount, with MTD and PMTD comparisons.
- **Total Amount Received**: Calculating total repayments received, including MTD and PMTD figures.
- **Interest Rate and Debt-to-Income Ratio (DTI)**: Calculating average interest rates and DTIs for overall, MTD, and PMTD periods.

### Good Loans vs. Bad Loans
- **Good Loan Metrics**: Percentage, count, funded amount, and total amount received for 'Fully Paid' and 'Current' loans.
- **Bad Loan Metrics**: Percentage, count, funded amount, and total amount received for 'Charged Off' loans.

### Loan Status Grid View
- **Loan Status Overview**: Aggregating metrics by loan status (e.g., Fully Paid, Current, Charged Off) and calculating key metrics.
- **Monthly Breakdown by Loan Status**: MTD total amount funded and received for each loan status.

### Additional Analysis for Overview Dashboard
- **Monthly Trends**: Tracking loan applications, funded amounts, and amounts received over time.
- **Regional Analysis**: Aggregating loan metrics by state.
- **Loan Term Distribution**: Analyzing loan metrics by term lengths (e.g., 36 months, 60 months).
- **Employee Length Analysis**: Aggregating loan metrics based on borrowers' employment length.
- **Loan Purpose Breakdown**: Analyzing loan metrics by loan purpose (e.g., debt consolidation, education).
- **Home Ownership Analysis**: Aggregating loan metrics by home ownership status.

### Advanced SQL Techniques
- Window Functions for running totals and averages.
- Subqueries for nested data retrieval.
- Common Table Expressions (CTEs) for breaking down complex queries.
- Join Operations to combine data from multiple tables.
- Conditional Aggregation to calculate metrics based on specific conditions.

## Tableau Dashboards
### Summary Dashboard
- Provides an overview of key KPIs such as total loan applications, funded amounts, amount received, average interest rate, and average DTI.
- Includes good loan vs. bad loan metrics to assess portfolio quality.

### Overview Dashboard
- Visualizes monthly trends, regional analysis, loan term distribution, employee length analysis, loan purpose breakdown, and home ownership analysis.
- Utilizes line charts, filled maps, donut charts, bar charts, and tree maps for clear and insightful visualizations.

### Details Dashboard
- Offers a detailed view of individual loans and borrower profiles.
- Allows users to drill down into specific metrics for granular insights.

### Interactivity
- All three dashboards are linked with buttons for easy navigation, enabling seamless exploration of data and ensuring a user-friendly experience.
  
#### LINK TO [DASHBOARD](https://public.tableau.com/shared/B8M26TT5S?:display_count=n&:origin=viz_share_link)

## Conclusion
This project demonstrates the power of combining SQL and Tableau to deliver actionable insights and enhance decision-making in banking operations. Through meticulous data extraction, transformation, and visualization, the Bank Loan Report project provides a comprehensive view of the bank's lending activities, helping to identify trends, manage risks, and optimize loan strategies.


