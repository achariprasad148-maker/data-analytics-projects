
USE RetailSalesProject;

EXEC sp_rename '[dbo].[cleaned_retail_data (2)]', 'cleaned_retail_data';


SELECT COLUMN_NAME 
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME = 'cleaned_retail_data'
ORDER BY ORDINAL_POSITION;



-- 1. Total Sales and Average Revenue per Order
SELECT 
    SUM(Sales) AS Total_Sales,
    AVG(Sales) AS Avg_Revenue_Per_Order,
    COUNT(DISTINCT Order_ID) AS Total_Orders
FROM dbo.cleaned_retail_data;

-- 2. Monthly Sales Trend
SELECT 
    Year,
    Month,
    SUM(Sales) AS Total_Sales
FROM dbo.cleaned_retail_data
GROUP BY Year, Month
ORDER BY Year, Month;
GO

-- 3. Revenue by Product Category
SELECT 
    Category,
    SUM(Sales) AS Total_Revenue
FROM dbo.cleaned_retail_data
GROUP BY Category
ORDER BY Total_Revenue DESC;
GO

-- 4. Order Volume by City (Top 10)
SELECT TOP 10
    City,
    COUNT(DISTINCT Order_ID) AS Order_Volume,
    SUM(Sales) AS Total_Sales
FROM dbo.cleaned_retail_data
GROUP BY City
ORDER BY Order_Volume DESC;
GO

-- 5. Weekday vs Weekend Sales
SELECT 
    Day_of_Week,
    COUNT(DISTINCT Order_ID) AS Orders_Count,
    SUM(Sales) AS Total_Sales
FROM dbo.cleaned_retail_data
GROUP BY Day_of_Week
ORDER BY Orders_Count DESC;
GO

-- 6. Sales by Region
SELECT 
    Region,
    SUM(Sales) AS Total_Sales
FROM dbo.cleaned_retail_data
GROUP BY Region
ORDER BY Total_Sales DESC;
GO

-- 7. Sales by Region
SELECT 
    Region,
    SUM(Sales) AS Total_Sales
FROM dbo.cleaned_retail_data
GROUP BY Region
ORDER BY Total_Sales DESC;
GO

-- 8. Q4 vs Other Quarters
SELECT 
    Quarter,
    SUM(Sales) AS Total_Sales
FROM dbo.cleaned_retail_data
GROUP BY Quarter
ORDER BY Quarter;
GO

-- 9. Sales by Customer Segment
SELECT 
    Segment,
    SUM(Sales) AS Total_Sales,
    COUNT(DISTINCT Customer_ID) AS Unique_Customers
FROM dbo.cleaned_retail_data
GROUP BY Segment
ORDER BY Total_Sales DESC;
GO

-- 10. Top 10 Customers by Sales
SELECT TOP 10
    Customer_Name,
    SUM(Sales) AS Total_Sales,
    COUNT(DISTINCT Order_ID) AS Orders_Count
FROM dbo.cleaned_retail_data
GROUP BY Customer_Name
ORDER BY Total_Sales DESC;
GO

-- 11. Sales by Ship Mode
SELECT 
    Ship_Mode,
    SUM(Sales) AS Total_Sales,
    COUNT(DISTINCT Order_ID) AS Orders_Count
FROM dbo.cleaned_retail_data
GROUP BY Ship_Mode
ORDER BY Total_Sales DESC;
GO

-- 12. Daily Sales Trend (Last 30 days)
SELECT TOP 30
    Order_Date,
    SUM(Sales) AS Daily_Sales
FROM dbo.cleaned_retail_data
GROUP BY Order_Date
ORDER BY Order_Date DESC;
GO

-- 13. Sales by State (Top 10)
SELECT TOP 10
    State,
    SUM(Sales) AS Total_Sales
FROM dbo.cleaned_retail_data
GROUP BY State
ORDER BY Total_Sales DESC;
GO

-- 14. Sales by Year (YoY Growth simple)
SELECT 
    Year,
    SUM(Sales) AS Total_Sales
FROM dbo.cleaned_retail_data
GROUP BY Year
ORDER BY Year;
GO

-- 15. Product Performance by Sub-Category
SELECT 
    Category,
    Sub_Category,
    SUM(Sales) AS Total_Sales
FROM dbo.cleaned_retail_data
GROUP BY Category, Sub_Category
ORDER BY Total_Sales DESC;
GO