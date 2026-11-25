# ShopEase E-commerce Sales Analytics

## Project Overview
ShopEase is a fictional e-commerce business. This project analyzes sales data, customer information, product categories, and order statuses to generate business insights using SQL, Python, Pandas, Jupyter Notebook, and Power BI.

The objective is to build an end-to-end Data Analytics project covering data extraction, data cleaning, exploratory data analysis, KPI calculation, visualization and business recommendations.

## Dashboard Preview

![ShopEase Dashboard](images/dashboard_preview.png)

## Project Objectives
- Analyze overall sales performance.
- Identify top-performing products and categories.
- Analyze revenue across cities.
- Understand customer purchasing patterns.
- Track delivered, pending and cancelled orders.
- Build an interactive Power BI dashboard.

## Tools & Technologies
- **MySQL:** Database creation, SQL queries, joins, aggregations and business analysis.
- **Python:** Data manipulation and analysis.
- **Pandas:** Data cleaning, transformation and exploratory analysis.
- **Jupyter Notebook:** Interactive data analysis.
- **Power BI:** Interactive dashboards and business reporting.
- **Excel/CSV:** Data storage and transfer.

## Project Workflow
1. Created a MySQL database and tables for customers, products and orders.
2. Loaded sample data into the database.
3. Connected MySQL with Python using SQLAlchemy.
4. Extracted data using SQL queries.
5. Cleaned and transformed data using Pandas.
6. Calculated sales KPIs and performed exploratory analysis.
7. Created visualizations in Python.
8. Exported the cleaned dataset.
9. Built an interactive Power BI dashboard.

## Database Structure
The project uses three tables:

- **Customers:** Customer ID, customer name, city and segment.
- **Products:** Product ID, product name, category and price.
- **Orders:** Order ID, customer ID, product ID, order date, quantity and order status.

## Key Performance Indicators
- Total Revenue
- Total Orders
- Delivered Orders
- Average Order Value (AOV)
- Units Sold
- Order Delivery Rate

## Key Findings
- Total orders: 10
- Delivered orders: 7
- Pending orders: 2
- Cancelled orders: 1
- Delivered revenue: ₹170,000
- Delivered units sold: 15
- Average Order Value: ₹24,285.71
- Delivery rate: 70%

### Revenue by City
- Mumbai: ₹100,000
- Pune: ₹60,000
- Delhi: ₹10,000

### Revenue by Category
- Electronics: ₹154,000
- Fashion: ₹10,000
- Grocery: ₹0 from delivered orders

## Business Recommendations
- Focus marketing efforts on high-revenue cities.
- Investigate pending orders to improve order fulfilment.
- Monitor cancellations and improve customer experience.
- Evaluate product category performance to improve sales strategy.
- Explore cross-selling opportunities in underperforming categories.

## Repository Structure
- SQL/ — Database setup and SQL queries
- Python/ — Jupyter Notebook analysis
- Data/ — Cleaned dataset
- PowerBI/ — Interactive dashboard
- Report/ — Project report

## Disclaimer
This project uses fictional sample data created for learning, portfolio and demonstration purposes. The findings do not represent a real company.

## Author
Data Analytics Portfolio Project
