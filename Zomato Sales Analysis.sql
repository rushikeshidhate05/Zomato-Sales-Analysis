CREATE DATABASE IF NOT EXISTS zomato;
USE zomato;

-- Create Customers table
CREATE TABLE customers (
    Customer_ID VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    Gender CHAR(1),
    City VARCHAR(50),
    Member_Since DATE
);

-- Create Restaurants table
CREATE TABLE restaurants (
    Restaurant_ID VARCHAR(10) PRIMARY KEY,
    Restaurant_Name VARCHAR(100),
    Cuisine VARCHAR(50),
    Avg_Price DECIMAL(10,2),
    City VARCHAR(50),
    Partner_Since DATE
);

-- Create Orders table
CREATE TABLE orders (
    Order_ID VARCHAR(10) PRIMARY KEY,
    Customer_ID VARCHAR(10),
    Restaurant_ID VARCHAR(10),
    Order_Date DATE,
    City VARCHAR(50),
    Order_Value DECIMAL(10,2),
    Payment_Method VARCHAR(50),
    Rating INT,
    Delivery_Time_min INT,
    FOREIGN KEY (Customer_ID) REFERENCES customers(Customer_ID),
    FOREIGN KEY (Restaurant_ID) REFERENCES restaurants(Restaurant_ID)
);

USE zomato;
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS restaurants;
DROP TABLE IF EXISTS customers;

SET FOREIGN_KEY_CHECKS = 1;


-- --------------------------------------------
-- 💾 DATA LOADING STEP
-- --------------------------------------------
-- Example for loading CSV files into MySQL Workbench:
-- LOAD DATA INFILE 'path/customers.csv' 
-- INTO TABLE customers 
-- FIELDS TERMINATED BY ',' 
-- IGNORE 1 LINES;

-- --------------------------------------------
-- 📊 INSIGHTS QUERIES
-- --------------------------------------------

-- 1️.Top 10 Restaurants by Total Revenue
SELECT r.Restaurant_Name, r.City, r.Cuisine, SUM(o.Order_Value) AS Total_Revenue
FROM orders o
JOIN restaurants r ON o.Restaurant_ID = r.Restaurant_ID
GROUP BY r.Restaurant_Name, r.City, r.Cuisine
ORDER BY Total_Revenue DESC
LIMIT 10;

-- 2️.City-wise Total Sales and Average Order Value
SELECT City, COUNT(Order_ID) AS Total_Orders, 
       ROUND(SUM(Order_Value), 2) AS Total_Sales,
       ROUND(AVG(Order_Value), 2) AS Avg_Order_Value
FROM orders
GROUP BY City
ORDER BY Total_Sales DESC;

-- 3️.Most Popular Cuisines by Number of Orders
SELECT r.Cuisine, COUNT(o.Order_ID) AS Total_Orders
FROM orders o
JOIN restaurants r ON o.Restaurant_ID = r.Restaurant_ID
GROUP BY r.Cuisine
ORDER BY Total_Orders DESC;

-- 4️.Average Rating per Restaurant
SELECT r.Restaurant_Name, ROUND(AVG(o.Rating), 2) AS Avg_Rating
FROM orders o
JOIN restaurants r ON o.Restaurant_ID = r.Restaurant_ID
GROUP BY r.Restaurant_Name
ORDER BY Avg_Rating DESC
LIMIT 10;

-- 5️.Average Delivery Time by City
SELECT City, ROUND(AVG(Delivery_Time_min), 2) AS Avg_Delivery_Time
FROM orders
GROUP BY City
ORDER BY Avg_Delivery_Time;

-- 6️.Most Used Payment Methods
SELECT Payment_Method, COUNT(Order_ID) AS Usage_Count
FROM orders
GROUP BY Payment_Method
ORDER BY Usage_Count DESC;

-- 7️.Monthly Order Trends
SELECT DATE_FORMAT(Order_Date, '%Y-%m') AS Month, COUNT(Order_ID) AS Total_Orders,
       ROUND(SUM(Order_Value), 2) AS Total_Revenue
FROM orders
GROUP BY Month
ORDER BY Month;

-- 8️.Top 10 Customers by Total Spend
SELECT c.Name, c.City, ROUND(SUM(o.Order_Value), 2) AS Total_Spend
FROM orders o
JOIN customers c ON o.Customer_ID = c.Customer_ID
GROUP BY c.Name, c.City
ORDER BY Total_Spend DESC
LIMIT 10;

-- 9️.Highest-Rated Cuisines
SELECT r.Cuisine, ROUND(AVG(o.Rating), 2) AS Avg_Rating
FROM orders o
JOIN restaurants r ON o.Restaurant_ID = r.Restaurant_ID
GROUP BY r.Cuisine
ORDER BY Avg_Rating DESC;

-- 10.Correlation Between Avg Price and Avg Rating
SELECT r.Cuisine, ROUND(AVG(r.Avg_Price), 2) AS Avg_Price,
       ROUND(AVG(o.Rating), 2) AS Avg_Rating
FROM orders o
JOIN restaurants r ON o.Restaurant_ID = r.Restaurant_ID
GROUP BY r.Cuisine
ORDER BY Avg_Rating DESC;
