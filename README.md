# D2C Product Analytics Case Study

## Project Overview
This project simulates a real-world product analytics case study for a Direct-to-Consumer (D2C) health and wellness brand .  
The objective is to analyze customer behavior, acquisition channels, retention, and revenue to identify growth opportunities.

This project demonstrates practical product analytics skills using SQL, Excel.

---

## Business Problem
The brand is experiencing:
- High first-time purchases
- Low repeat purchase rates
- Low subscription adoption

The goal of this analysis is to:
- Improve customer retention
- Increase repeat purchases
- Boost customer lifetime value (LTV)

---

## Dataset
The project uses three datasets:

### 1. customers.csv
| Column | Description |
|--------|-------------|
| customer_id | Unique customer identifier |
| signup_date | Date of signup |
| city | Customer city |
| acquisition_channel | Marketing channel source |

### 2. orders.csv
| Column | Description |
|--------|-------------|
| order_id | Unique order identifier |
| customer_id | Customer who placed the order |
| order_date | Date of order |
| product | Product name |
| price | Order value |
| is_subscription | Whether order is subscription (1) or not (0) |

### 3. events.csv
| Column | Description |
|--------|-------------|
| event_id | Unique event identifier |
| customer_id | Customer performing the event |
| event_date | Event date |
| event_type | Funnel stage event |

Event types:
- view_product
- add_to_cart
- checkout
- purchase

---

## Objectives
The analysis answers the following product questions:

### Acquisition
- Which channels bring the most customers?
- Which channels generate the most revenue?

### Funnel
- Conversion rates across funnel stages
- Biggest drop-off points

### Retention
- Repeat purchase rate
- Customer order frequency

### Cohort Analysis
- Monthly retention by customer cohort

### Subscription Analysis
- Subscription conversion rate
- LTV comparison: subscribers vs non-subscribers

---

## Key Metrics
- Total Revenue
- Average Order Value (AOV)
- Repeat Purchase Rate
- Funnel Conversion Rates
- Customer Lifetime Value (LTV)
- Cohort Retention

---

## Tools Used
- SQL (MySQL)
- Excel (data exploration & pivot tables)6

---

## Project Structure
```
Health-Product-Analytics/
│
├── data/
│   ├── customers.csv
│   ├── orders.csv
│   └── events.csv
│
├── excel-analysis/
│   └── .xlsx
│   └── .xlsx
│   └── .xlsx
│
├── sql/
│   └── analysis_queries.sql
│
└── case-study/
    └── product_case_study.pdf
```


---

## Analysis Steps
1. Data familiarization using Excel
2. SQL-based analysis:
   - Revenue and AOV
   - Acquisition performance
   - Funnel conversion
   - Retention and repeat rate
   - Cohort analysis
   - Subscription LTV
3. Product insights and recommendations

---

## How to Run the Project
1. Import CSV files into MySQL.
2. Run SQL queries from the `sql` folder.

---

## Author
Ananya K P
