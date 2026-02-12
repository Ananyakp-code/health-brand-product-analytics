# D2C Product Analytics Case Study

## Project Overview
This project simulates a real-world product analytics case study for a Direct-to-Consumer (D2C) health and wellness brand .  
The objective is to analyze customer behavior, acquisition channels, retention, and revenue to identify growth opportunities.

This project demonstrates practical product analytics skills using SQL, Excel, and dashboarding tools.

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
- Excel (data exploration & pivot tables)
- Power BI / Excel dashboard

---

## Project Structure
product-analytics-case-study/
│
├── data/
│ ├── customers.csv
│ ├── orders.csv
│ └── events.csv
│
├── sql/
│ └── analysis_queries.sql
│
├── dashboard/
│ └── Kapiva_Dashboard_Template.xlsx
│
└── README.md

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
3. Dashboard creation
4. Product insights and recommendations

---

## Key Insights (Example)
- Instagram is the top acquisition channel by customer volume.
- Apple Cider Vinegar generates the highest revenue.
- Most customers are one-time buyers, indicating low retention.
- Major funnel drop-off occurs between product view and add-to-cart.
- Subscribers have significantly higher LTV than non-subscribers.

---

## Product Recommendations
- Introduce subscription discounts after first purchase.
- Send reminders around Day 25–30 to drive repeat orders.
- Optimize product pages to improve add-to-cart conversion.

---

## How to Run the Project
1. Import CSV files into MySQL.
2. Run SQL queries from the `sql` folder.
3. Export results.
4. Build dashboard in Excel or Power BI.

---

## Resume Bullet (Example)
Conducted end-to-end product analytics for a D2C health brand using SQL and Excel, identifying major funnel drop-offs and proposing subscription-based retention strategies to improve customer lifetime value.

---

## Author
Your Name  
Aspiring Product Analyst
