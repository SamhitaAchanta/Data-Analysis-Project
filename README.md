# Data Analysis Project With SQL - Sales Management

## Table of contents
* [General Info](#business-demand)
* [Data Cleansing and Transformation](#data-cleansing-and-transformation)
* [Load Data into PowerBI](#load-data-into-powerbi)
* [Final Dashboard](#sales-management-dashboard)

### Business Demand 

Goal: The business wants to improve their internet sales and they want to move from static reports to visual dashboards.

Focus: They want to know how much they have sold of what products to what customers over a given time period. They want an overview of internet sales per customer and per products. They also want to know which product is their best seller and their target audience and want the ability to filter them. 

Info: Budget is given for 2021 and their analysis goes back up to 2 years.

Tools: Power BI dashboard, CRM System


### Data Cleansing and Transformation

Before building the models, I extracted the relevant information using SQL. I made 2 different types of tables: Fact and Dimension.  A Fact table contains numbers and calculations and a Dimension table describe the rows in the fact table.

| Fact  |  Dimension |
| ------ | ------- | 
| FACT_InternetSales | DIM_Calender |
| FACT_Budget | DIM_Customer |
|             | DIM_Products |

*The SQL scripts are attached above.

### Load Data into PowerBI

Important Steps Before Creating a Dashboard: The Table Connections
![image](https://user-images.githubusercontent.com/51171467/126539419-a1370c4a-0280-4091-8551-9b68abb81ba6.png)

### Sales Management Dashboard
This is the first page of the sales management dashboard with two more pages to show sales over a given time period, per customers, and per products.

**The full dashboard file is attached above.**

![image](https://user-images.githubusercontent.com/51171467/126539958-0c528dbd-c4f8-4d1b-8cfa-ca8048b848ca.png)


