Select * from Amazon_Sales

--1. Profit Percentage based on Region - Bar chart
Select  region, 
cast(sum(total_profit)* 100 / (select sum(total_profit) from Amazon_sales) AS Decimal(10,2))  
as total_profit 
from Amazon_sales
Group by Region
Order By total_profit desc

--1. Total Revenue based on Region - Bar chart
Select  region, 
cast(sum(total_revenue) AS Decimal(10,2))  
as total_revenue
from Amazon_sales
Group by Region
Order By total_revenue desc

--1.Profit Percentage based on country - Bar chart
Select   Country,
cast(sum(total_profit)* 100 / (select sum(total_profit) from Amazon_sales) AS Decimal(10,2))  
as total_profit 
from Amazon_sales
Group by Country
Order By total_profit desc

--1.Revenue based on country - Bar chart
Select   Country,
cast(sum(total_revenue) AS Decimal(10,2))  
as total_revenue 
from Amazon_sales
Group by Country
Order By total_revenue desc

--2. Total Revenue, Total Profit, Total Cost, Total Units Sold
Select Sum(Units_Sold) AS Total_Units_sold, Sum(total_cost) as Total_Cost, Sum(Total_Revenue) as Total_Revenue, Sum(Total_Profit) as Total_Profit  from Amazon_sales

--3. Total Revenue, Total Profit, Total Cost, Total Units Sold with Filters
Select Region, Sum(Units_Sold) AS Total_Units_sold, Sum(total_cost) as Total_Cost, Sum(Total_Revenue) as Total_Revenue, Sum(Total_Profit) as Total_Profit  
from Amazon_sales
where region like '%Australia%'
Group By Region

--4. Year of Shipping vs Total Revenue - Line chart 2nd row
Select Datename(YEAR, order_date) as order_year, Sum(Total_Revenue) as Total_Revenue
From Amazon_sales
Group By Datename(YEAR, order_date)

--5. Year of Shipping vs  Total Profit - Line chart 2nd row
Select Datename(YEAR, order_date) as order_year, cast(Sum(Total_profit)  AS Decimal(10,2))  as Total_Profit
From Amazon_sales
Group By Datename(YEAR, order_date)

--6. Top Performing Products - 
Select TOP 5 Item_Type, sum(units_sold) as units, sum(total_profit) as profit
from Amazon_sales
Group by Item_Type
Order by units desc 

--7. Item Type vs Unit sold with sales channel as legend - Bar chart
Select Item_Type, sum(units_sold) as units
from Amazon_sales
Group by Item_Type
Order by units desc 

--8. Top 10 Item Type vs Total Profit - Column chart 3rd row
Select TOP 10 Item_Type, sum(total_profit) as profit
from Amazon_sales
Group by Item_Type
Order by profit desc 

--9. Bottom 10 items vs Total profit - Column chart 3rd row
Select TOP 10 Item_Type, sum(total_profit) as profit
from Amazon_sales
Group by Item_Type
Order by profit  

--10. Tree Map for Office and Offline Revenue - Filter
Select Sales_channel, sum(Total_Revenue) as Revenue
from Amazon_sales
group by sales_channel


Select region country, sales_channel as filter in top line
In first line, 4 bar charts for revenue, profit for both region and country //Profit for region not required
In second line yearlyy line charts and year timeline