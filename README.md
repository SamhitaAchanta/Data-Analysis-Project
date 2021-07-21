# Data Analysis Project With SQL - Sales Management

1. Business Demand 

Goal: The business wants to improve their internet sales and they want to move from static reports to visual dashboards.

Focus: They want to know how much they have sold of what products to what customers over a given time period. They want an overview of internet sales per customer and per products. They also want to know which product is their best seller and their target audience and want the ability to filter them. 

Info: Budget is given for 2021 and their analysis goes back up to 2 years.

Tools: Power BI dashboard, CRM System


2. Data Cleansing and Transformation

Before building the models, I extracted the relevant information using SQL. I made 2 different types of tables: Fact and Dimension.  A Fact table contains numbers and calculations and a Dimension table describe the rows in the fact table.

| Fact  |  Dimension |
| ------ | ------- | 
| FACT_InternetSales | DIM_Calender |
| FACT_Budget | DIM_Customer |
|             | DIM_Products |

*The SQL scripts are attached above.

3. Load Data into PowerBI

Important Steps Before Creating a Dashboard:

*Establish the data model aka the correct relationships between the files

*Make sure the data types are correct for each column before creating the dashboard

Calculations:

Sales = SUM(FACT_InternetSales[SalesAmount])

Total Budget = SUM(FACT_Budget[Budget])

Sales / Total Budget = DIVIDE( [Sales] , [Total Budget])

Make [Customer City] as data category called city. It will be easier to make a map. 



