# 🍽️ Zomato Sales Analysis Dashboard


## 📘 Project Overview

The **Zomato Sales Analysis Dashboard** provides actionable insights into **restaurant sales performance, customer behavior, and business growth**.  
This project was built to analyze Zomato’s transactional data using **SQL** for backend processing and **Power BI** for visualization.

The goal is to identify patterns in orders, revenue trends, and customer engagement to support **data-driven decision-making** for restaurant management and marketing.

---

## 🎯 Objectives

- Analyze **sales and order trends** across time and regions  
- Measure **year-over-year (YoY)** growth in key metrics  
- Identify **top-performing cities and categories**  
- Understand **customer preferences** and peak order timings  
- Design an **interactive Power BI dashboard** for business reporting  

---

## 🧩 Dataset Details

| Field | Description |
|-------|--------------|
| Order_ID | Unique ID for each order |
| Customer_ID | Unique customer reference |
| City | Location of the order |
| Order_Date | Date and time of order |
| Category | Type of food ordered |
| Order_Value | Total revenue generated per order |
| Payment_Method | Mode of payment used |
| Delivery_Time | Duration between order and delivery |

> 🗂️ *Data Source:* Simulated dataset created for analysis (inspired by real Zomato sales data)

---

## 🛠️ Tech Stack

- **SQL (MySQL / PostgreSQL)** – Data cleaning, transformation, and queries  
- **Power BI** – Data modeling, visualization, and dashboard creation  
- **Excel / CSV** – Raw data source  
- **DAX** – Calculated measures and KPIs  

---

## 📊 Dashboard Features

- 📈 **Total Orders, Total Revenue, and Average Order Value (AOV)**  
- 🔁 **Year-over-Year (YoY) Growth**  
- 🏙️ **City-wise Performance Analysis**  
- ⏰ **Order Trend by Time of Day & Day of Week**  
- 🍱 **Category-wise Revenue Contribution**  
- 📅 **Monthly and Quarterly Comparison Charts**

---

## 💡 Key Insights

- 🔹 **Revenue increased by 12% YoY**, led by Tier-1 cities  
- 🔹 **Evening time slots (6–9 PM)** contribute to over **45% of total orders**  
- 🔹 **Top 3 cities** account for **65% of overall sales**  
- 🔹 **Fast Food and Beverages** are the most ordered categories  
- 🔹 Customers prefer **online payment (UPI/Card)** over COD  

---

## 🧮 DAX Measures Example

```DAX
YOY Orders % =
VAR CY = [Total Orders]
VAR PY = [Last Year Orders]
RETURN
DIVIDE(CY - PY, PY)

zomato-sales-analysis/
│
├── data/
│   ├── zomato_sales.csv
│   └── cleaned_data.csv
│
├── sql/
│   └── data_cleaning_queries.sql
│
├── powerbi/
│   └── zomato_dashboard.pbix
│
├── images/
│   └── zomato_dashboard_preview.png
│
└── README.md

🚀 How to Use

Download or clone the repository:

git clone https://github.com/yourusername/zomato-sales-analysis.git

1.Open the .pbix file in Power BI Desktop
2.Load the cleaned_data.csv dataset
3.Explore the interactive visuals and filters

🧠 Learnings

1.Enhanced data cleaning and transformation with SQL
2.Mastered DAX functions for KPIs
3.Improved dashboard storytelling using Power BI
4.Understood business insights from sales data

📢 Conclusion

The Zomato Sales Analysis project demonstrates how data analytics can reveal patterns in customer behavior, improve decision-making, and help businesses identify new growth opportunities.
This dashboard serves as a real-world case study for data-driven restaurant performance optimization.

👨‍💻 Author

Rushikesh Ishwar Idhate
💼 Data Analyst | Power BI | SQL | Python
📧 rushikeshidhate@gmail.com

🔗 Portfolio Website

🌐 LinkedIn
