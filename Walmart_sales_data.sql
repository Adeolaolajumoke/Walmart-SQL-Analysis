select * from walmart_sales_data;

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

-- Generic Question
-- 1.	How many unique cities does the data have?
select count(distinctrow(city)) as unique_cities from walmart_sales_data;

-- 2.	In which city is each branch?
select distinct city, branch from walmart_sales_data;

-- Product
-- 1.	How many unique product lines does the data have?
select count(distinct(product_line)) as unique_product from walmart_sales_data;

-- 2.	What is the most common payment method?
select payment, count(payment) as count_com_payment from walmart_sales_data
group by payment order by count_com_payment desc limit 1;

-- 3.	What is the most selling product line?
select Product_line, sum(quantity) as most_selling_product from walmart_sales_data
group by Product_line order by most_selling_product desc limit 1;


-- 4.	What is the total revenue by month?
select monthname(date) as month, month(date) as month_no, round(sum(Total),2)as revenue from walmart_sales_data
group by month, month_no order by month_no, revenue;

-- 5.	What month had the largest COGS?
select monthname(date) as month, sum(cogs) as largest_cogs from walmart_sales_data 
group by month order by largest_cogs desc limit 1;

-- 6.	What product line had the largest revenue?
select product_line, round(sum(total),2) as largest_revenue from walmart_sales_data
group by product_line order by largest_revenue limit 1;

-- 7.	What is the city with the largest revenue?
select city, round(sum(total)) as max_revenue from walmart_sales_data
group by city 
order by max_revenue desc
limit 1;

-- 8.	What product line had the largest VAT?
select product_line, sum(Tax_5) as largest_vat from walmart_sales_data
group by product_line order by largest_vat desc limit 1;

-- 9.	Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales
select product_line, 
         case when avg(cogs)>307.587380 then "Good" 
         else "Bad"
         end as Remark
         from walmart_sales_data
         group by Product_line;

-- 10.	Which branch sold more products than average product sold?
select branch, avg(cogs) as avg_quantity from walmart_sales_data
group by branch  having avg_quantity> 5.5100;

-- 11.	What is the most common product line by gender?
select product_line, gender, count(product_line) as most_product from walmart_sales_data
group by product_line, gender order by most_product desc limit 1;

-- 12.	What is the average rating of each product line?
select product_line, round(avg(rating),2) as avg_rating from walmart_sales_data 
group by product_line;

-- Sales
Alter table walmart_sales_data 
add column day_name text;
update walmart_sales_data
set day_name =left(dayname(date),3);
Alter table walmart_sales_data
add column Week_Type text;
set SQL_SAFE_UPDATES= 0;
Update Walmart_sales_data
set Week_type = case when Day_name in ("sat","sun") then "Weekend" else "Weekday" end;
-- 1.	Number of sales made in each time of the day per weekday

alter table walmart_sales_data 
add column Time_of_day text;

update walmart_sales_data 
set time_of_day= case 
                when time between "00:00:00" and "12:00:00" then "Morning"
                when time between "12:00:01" and "16:00:00" then "Afternoon"
                else "Evening" end;
			
set SQL_SAFE_UPDATES =0;		

Select Time, case 
                when time between "00:00:00" and "12:00:00" then "Morning"
                when time between "12:00:01" and "16:00:00" then "Afternoon"
                else "Evening"
                end as Time_of_day FROM Walmart_sales_data;
Select Time_of_day, count(quantity) as sales_made
                from walmart_sales_data where week_type = "weekday" 
                group by time_of_day order by sales_made desc;
                
-- 2.	Which of the customer types brings the most revenue?
select customer_type, sum(total) as total_revenue from walmart_sales_data
group by customer_type order by total_revenue desc limit 1;

-- 3.	Which city has the largest tax percent/ VAT (Value Added Tax)?
select city, round(sum(tax_5),2) as largest_tax from walmart_sales_data
group by city
order by largest_tax limit 1;

-- 4.	Which customer type pays the most in VAT?
select customer_type, round(sum(tax_5),2) as largest_vat from walmart_sales_data
group by customer_type order by largest_vat limit 1;

-- Customer
-- 1.	How many unique customer types does the data have?
select count(distinct(customer_type)) as unique_cus from walmart_sales_data;

-- 2.	How many unique payment methods does the data have?
select count(distinct(payment)) as unique_payment from walmart_sales_data;

-- 3.	What is the most common customer type?
select customer_type, count(customer_type) as count_cus from walmart_sales_data
group by customer_type order by count_cus desc limit 1;

-- 4.	Which customer type buys the most?
select customer_type, round(sum(quantity),2) as total_sales from walmart_sales_data
group by customer_type order by total_sales desc limit 1;

-- 5.	What is the gender of most of the customers?
select gender, count(CUSTOMER_TYPE) as count_customer from walmart_sales_data
group by gender order  by count_customer desc limit 1; 

-- 6.	What is the gender distribution per branch?
select branch, gender, count(gender) as count_gender from walmart_sales_data
group by branch, gender;

-- 7.	Which time of the day do customers give most ratings?
select time_of_day,round(avg(rating),2) as avg_rating from walmart_sales_data
group by time_of_day order by avg_rating desc limit 1; 

-- 8.	Which time of the day do customers give most ratings per branch?
select time_of_day, branch, round(avg(rating),2)as avg_rating from walmart_sales_data
group by time_of_day, branch order by avg_rating desc limit 1;

-- 9.	Which day of the week has the best avg ratings?
select day_name, round(avg(rating),2) as best_avg_rating from walmart_sales_data
group by day_name order by best_avg_rating desc limit 1;

-- 10.	Which day of the week has the best average ratings per branch?
select branch, day_name, round(avg(rating),2) as best_avg from walmart_sales_data
group by branch, day_name order by best_avg desc limit 1;

select * from walmart_sales_data;