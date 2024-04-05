SELECT *
FROM [WalmartSalesData.csv]

--FEATURE ENGINEERING
SELECT Time,
    CASE 
	       WHEN Time BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
	       WHEN Time BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
	    ELSE 'Evening'
	END Time_Of_Date
FROM [WalmartSalesData.csv]
 
 --time_of_the_day

ALTER TABLE [WalmartSalesData.csv] ADD Time_Of_Date varchar(50);

UPDATE [WalmartSalesData.csv]
SET Time_Of_Date = CASE 
	       WHEN Time BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
	       WHEN Time BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
	    ELSE 'Evening'
	END 

SELECT *
FROM [WalmartSalesData.csv]

--day_name
SELECT date, DATENAME(DW,date) DAY_NAME
FROM [WalmartSalesData.csv]

ALTER TABLE [WalmartSalesData.csv] ADD DAY_NAME varchar(50);
UPDATE [WalmartSalesData.csv]
SET DAY_NAME = DATENAME(DW,date) 

--Month_Name
SELECT date,Month(date) Month_Number
FROM [WalmartSalesData.csv]

ALTER TABLE [WalmartSalesData.csv] ADD Month_Number varchar(50);
UPDATE [WalmartSalesData.csv]
SET Month_Number = Month(date) 

--How many unique cities does the data have?
SELECT DISTINCT(City)
FROM [WalmartSalesData.csv]

--In which  city is each branch?
SELECT DISTINCT(City), Branch
FROM [WalmartSalesData.csv]

--Unique Product lines?
SELECT DISTINCT product_line
FROM [WalmartSalesData.csv]

--Payment Method
SELECT payment,COUNT(payment) NO_Payment_Methods
FROM [WalmartSalesData.csv]
GROUP BY payment 
ORDER BY payment desc

--Product_Line
SELECT Product_line,COUNT(Product_line) Number_Product_Line
FROM [WalmartSalesData.csv]
GROUP BY Product_line
ORDER BY Number_Product_Line desc

--Revenue Per Month
SELECT Month_Number, CAST(SUM(Total) AS DECIMAL(10,3)) Total_Revenue
FROM [WalmartSalesData.csv]
GROUP BY Month_Number
ORDER BY Total_Revenue desc

--What month had the largest COGS
SELECT Month_Number,CAST(SUM(cogs) AS DECIMAL (10,3)) Total_COGS
FROM [WalmartSalesData.csv]
GROUP BY Month_Number
Order By Total_COGS DESC

--Product Line with the highest Revenue
SELECT Product_line,CAST(SUM(Total) AS DECIMAL (10,3)) Total_Revenue
FROM [WalmartSalesData.csv]
GROUP BY Product_line
Order By Total_Revenue DESC

--City With the largest Revenue
SELECT City,CAST(SUM(Total) AS DECIMAL (10,3)) Total_Revenue
FROM [WalmartSalesData.csv]
GROUP BY City
Order By Total_Revenue DESC

--Product Line with the largest TAX
SELECT Product_line,CAST(AVG(Tax_5) AS DECIMAL (10,3)) Average_Tax
FROM [WalmartSalesData.csv]
GROUP BY Product_line
Order By Average_Tax DESC

--Branch sold more products than average product sold
SELECT BRANCH, SUM(Quantity) Total_Quantity
FROM [WalmartSalesData.csv]
GROUP BY Branch
HAVING SUM(Quantity) > (SELECT AVG(Quantity) FROM [WalmartSalesData.csv])

--Most Common Product line by Gender?
SELECT Gender,Product_line, COUNT(Gender) as Total_Count
FROM [WalmartSalesData.csv]
GROUP BY Gender, Product_line
ORDER BY Total_Count DESC

--Average Rating of Each Product Line
SELECT Product_line,CAST(AVG(rating) AS DECIMAL (10,3)) Average_Rating
FROM [WalmartSalesData.csv]
GROUP BY Product_line
ORDER BY Average_Rating DESC

SELECT *
FROM [WalmartSalesData.csv]