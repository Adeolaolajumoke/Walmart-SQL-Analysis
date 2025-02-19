# Walmart Analysis SQL 

![download](https://github.com/user-attachments/assets/f7c1d902-5ccc-4ef6-b753-ff8ac1cc21c4)

## Table of Content 
- [Introduction](#Introduction)
- [Project Overview](#Project-Overview)
- [Project Objectives](#Project-Objectives)
- [Data Cleaning and Transformation](#Data-Cleaning-and-Transformation)
- [Data Exploration and Insight](#Data-Exploration-and-Insights)
- [Files Detail](#Files-Details)
- [Conclusion](#Conclusion)

## Introduction
The Walmart Sales dataset typically consists of transactional data from Walmart stores, 
providing detailed insights into sales performance across various locations and time periods. 
It is a crucial for analysts and decision-makers within retail organizations to improve operational efficiency, optimize inventory, and forecast future sales.

## Project-Overview
The columns are: Invoice_id, Branch, City, Customer, Gender, Product_line, Unit price, Quantity, Tax 5%, Total, Date, Time, Cogs, Gross margin, Gross income, Rating 

## Project-Objectives
## Generic Question
1.	How many unique cities does the data have?
2.	In which city is each branch?
## Product
1.	How many unique product lines does the data have?
2.	What is the most common payment method?
3.	What is the most selling product line?
4.	What is the total revenue by month?
5.	What month had the largest COGS?
6.	What product line had the largest revenue?
7.	What is the city with the largest revenue?
8.	What product line had the largest VAT?
9.	Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales
10.	Which branch sold more products than average product sold?
11.	What is the most common product line by gender?
12.	What is the average rating of each product line?
## Sales
1.	Number of sales made in each time of the day per weekday
2.	Which of the customer types brings the most revenue?
3.	Which city has the largest tax percent/ VAT (Value Added Tax)?
4.	Which customer type pays the most in VAT?
-- Customer
1.	How many unique customer types does the data have?
2.	How many unique payment methods does the data have?
3.	What is the most common customer type?
4.	Which customer type buys the most?
5.	What is the gender of most of the customers?
6.	What is the gender distribution per branch?
7.	Which time of the day do customers give most ratings?
8.	Which time of the day do customers give most ratings per branch?
9.	Which day of the week has the best avg ratings?
10.	Which day of the week has the best average ratings per branch?


## Data-Cleaning-and-Transformation
-- Rename columns
```sql
alter table walmart_sales_data 
rename column `Invoice ID` TO Invoice_Id;
alter table walmart_sales_data 
rename column `Customer Type` TO Customer_Type;
alter table walmart_sales_data 
rename column `Product line` TO Product_line;
alter table walmart_sales_data 
rename column `Unit Price` TO Unit_Price;
alter table walmart_sales_data 
rename column `Tax 5%` TO Tax_5;
alter table walmart_sales_data 
rename column `Gross margin percentage` TO Gross_margin_percentage;
alter table walmart_sales_data 
rename column `Gross Income` TO Gross_Income;
```
-- Add column
```sql
Alter table walmart_sales_data 
add column day_name text;
update walmart_sales_data
set day_name =left(dayname(date),3);
Alter table walmart_sales_data
add column Week_Type text;
set SQL_SAFE_UPDATES= 0;
Update Walmart_sales_data
```

## Data-Exploration-and-Insights
## Generic Question
1.	How many unique cities does the data have?
Insight: 3
2.	In which city is each branch?
Insight: Yangon A
Naypyitaw C
Mandalay B
## Product
1.	How many unique product lines does the data have?
Insight: 6
2.	What is the most common payment method?
Insight: E-wallet 
3.	What is the most selling product line?
Insight: Electronic Accessories 
4.	What is the total revenue by month?
Insight: January 116291.87
February 97219.37
March 109455.51
5.	What month had the largest COGS?
Insight: January
6.	What product line had the largest revenue?
Insight: Health and Beauty
7.	What is the city with the largest revenue?
Insight: Naypyitaw
8.	What product line had the largest VAT?
Insight: Food and Beverages 
9.	Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales
Insight: Health and Beauty “Good”
Electronic Accessories “Bad”
Home and Lifestyle “Good”
Sports and Travels “Good”
Food and Beverages “Bad”
Fashion Accessories “Bad”
10.	Which branch sold more products than average product sold?
Insight: Branch A,C,B
11.	What is the most common product line by gender?
Insight: Fashion Accessories “Female”
12.	What is the average rating of each product line?
Insight: Health and Beauty 7
Electronic accessories 6.92
Home and Lifestyle 6.84
Sport and travel 6.92
Food and Beverages 7.11]
Fashion accessories 7.03
## Sales
1.	Number of sales made in each time of the day per weekday
Insight: Evening 293
Afternoon 269
Morning 141
2.	Which of the customer types brings the most revenue?
Insight: Member 
3.	Which city has the largest tax percent/ VAT (Value Added Tax)?
Insight: Mandalay 
4.	Which customer type pays the most in VAT?
Insight: Normal 
## Customer
1.	How many unique customer types does the data have?
Insight: 2
2.	How many unique payment methods does the data have?
Insight: 3
3.	What is the most common customer type?
Insight: Member 
4.	Which customer type buys the most?
Insight: Member 
5.	What is the gender of most of the customers?
Insight: Female 
6.	What is the gender distribution per branch?
Insight: Female Branch A 161
Branch B 162
Branch C 178
Male Branch A 179
Branch B 170
Branch C 150
7.	Which time of the day do customers give most ratings?
Insight: Afternoon 7.03
8.	Which time of the day do customers give most ratings per branch?
Insight: Afternoon Branch A 7.19
9.	Which day of the week has the best avg ratings?
Insight: Monday 7.19
10.	Which day of the week has the best average ratings per branch?
Insight: Monday Branch B 7.34


## Files-Details
- Walmar_sales Dataset.csv: The raw data used for analysis
- Problem Statement- Walmart_sales Analysis.pdf: Project overview and objectives
- Query.sql: SQL queries used to extract and analyze the data
- README.md: Documentation for the project

## Conclusion
Walmart's data reveals key opportunities for growth, particularly in the optimization of product offerings, customer engagement, and branch-specific strategies. 
The company is seeing strong revenue in Health and Beauty, Home and Lifestyle, and Sports and Travel, while Food and Beverages and Fashion Accessories are underperforming. 
Walmart can focus on revitalizing these underperforming lines and enhancing its loyalty programs, especially targeting Member customers who contribute the most revenue.
In terms of customer behavior, focusing on the evening and afternoon sales periods and tailoring marketing efforts to females while engaging male customers more effectively 
will likely boost sales. Additionally, leveraging insights about high VAT rates in Mandalay and optimizing pricing strategies can help improve the customer experience.
Ultimately, Walmart's ability to capitalize on its strong-performing product lines, optimize branch performance, and improve customer engagement, 
especially through enhanced loyalty programs, will be critical in driving future growth and ensuring customer satisfaction across different regions.





