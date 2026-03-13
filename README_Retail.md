# 🛒 Retail Sales Analysis & Business Intelligence
### Comprehensive Retail Sales Analysis with Python, SQL Server & Power BI

![Python](https://img.shields.io/badge/Python-3.x-blue) ![Pandas](https://img.shields.io/badge/Pandas-Data%20Analysis-green) ![SQL](https://img.shields.io/badge/SQL-Server-red) ![PowerBI](https://img.shields.io/badge/Power%20BI-Dashboard-yellow)

---

## 📌 Project Overview

This end-to-end capstone project analyzes **24 months of retail sales data (April 2023 – April 2025)** across 20 stores, combining data engineering, exploratory data analysis, SQL-based business intelligence, and interactive Power BI dashboards to deliver actionable business insights.

- **Author:** Mohammed Niyaz Ali
- **Contact:** hashir21102@gmail.com
- **Analysis Period:** April 2023 – April 2025
- **Data Sources:** 5 CSV datasets

---

## 📊 Key Performance Indicators

| Metric | Value |
|---|---|
| Total Revenue | $818.18K |
| Total Profit | $243.77K |
| Total Customers | 760 |
| Total Stores | 20 |
| Average Customer Age | 44.16 years |
| Total Returns | 200 units |

---

## 🔑 Critical Findings

- **In-Store dominates** at 70.7% of revenue ($578,621) vs Online 29.3%
- **Peak Revenue:** August 2024 (~$45,000)
- **Best Performing Store:** Blankenship-Brown Store
- **Best Product Category:** Personal Care ($65K profit, 998 units sold)
- **Return Rate improved** from 0.70 to 0.37 over the analysis period
- **58% of returns are controllable** (defective products + wrong items shipped)
- **Top Customer Segment:** Age 56–65 generates highest revenue

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|---|---|
| Python 3.x (Pandas, NumPy) | Data cleaning & EDA |
| Jupyter Notebook | Analysis environment |
| SQL Server (SSMS) | Business intelligence queries |
| Power BI | Interactive dashboards & DAX |

---

## 📁 Project Structure

```
Retail_Sales_Capstone/
├── Data/
│   ├── Raw_data/
│   │   ├── sales_data.csv
│   │   ├── customers.csv
│   │   ├── products.csv
│   │   ├── returns.csv
│   │   └── stores.csv
│   └── Cleaned_data/
│       ├── sales_cleaned.csv
│       ├── customers_cleaned.csv
│       ├── products_cleaned.csv
│       ├── returns_cleaned.csv
│       └── stores_cleaned.csv
├── Notebook/
│   └── Data_cleaning_eda.ipynb
├── SQL/
│   ├── business_questions.sql
│   └── ER_diagram.png
├── Dashboard/
│   └── Retail_Sales_Report.pbix
├── Docs/
│   ├── Final_Report.pdf
│   └── Data_Cleaning_Report.pdf
└── README.md
```

---

## ⚙️ Project Steps

1. **Data Collection** — Integrated 5 CSV data sources (orders, customers, products, stores, returns)
2. **Data Cleaning** — Handled missing values, duplicates, data type conversions, text normalization
3. **Exploratory Data Analysis** — Identified trends, seasonality, and customer behavior patterns
4. **SQL Business Intelligence** — Imported to SQL Server, built star schema, executed BI queries
5. **Power BI Dashboards** — Developed 5 interactive dashboards with DAX measures
6. **Strategic Recommendations** — Delivered actionable insights across short, medium & long-term

---

## 📈 Power BI Dashboards

| Dashboard | Description |
|---|---|
| Sales Overview | Monthly revenue trends, top products, channel breakdown |
| Store Analysis | Store performance rankings, profitability vs operating costs |
| Product Performance | Revenue by category, profit distribution, return rates |
| Customer Insights | Demographics, revenue by age group, top customers |
| Return Analysis | Return reasons, category & regional distribution, trends |

---

## 💡 Key Insights

### Sales Channel
- In-Store: $578,621 (70.7%)
- Online: $239,559 (29.3%)

### Product Category Performance
| Category | Revenue | Profit | Units Sold |
|---|---|---|---|
| Personal Care | ~$210K | $65K | 998 |
| Home & Kitchen | ~$205K | $59K | 894 |
| Electronics | ~$205K | $59K | 935 |
| Apparel | ~$198K | $61K | 871 |

### Store Performance
- Flagship stores generate ~30% more revenue than franchise locations
- Top store: Robinson Plc ($24,000 revenue, 78 orders)
- Total operating costs: $809.12K (efficiency improvements needed)

### Customer Segments
- Highest spending: Age 56–65
- Highest growth potential: Age 26–35
- Geographic distribution: Balanced across all 4 regions (~192 customers each)

---

## 🔄 Data Pipeline

```
Raw CSV Files → Python/Jupyter Cleaning → Cleaned CSVs → SQL Server Import → Power BI Dashboards
```

---

## 📋 Strategic Recommendations

**Short-Term (0–3 months)**
- Investigate April 2025 revenue decline (82% drop)
- Launch defect reduction program (31.5% of returns)
- Review West region operations (highest return concentration)

**Medium-Term (3–9 months)**
- Grow online channel from 29.3% to 40%+
- Implement loyalty programs for high-value customers
- Optimize flagship vs franchise store strategy

**Long-Term (9–24 months)**
- Omnichannel integration for seamless customer experience
- Geographic expansion into new markets
- Target market leadership through customer acquisition

---

## 📬 Contact

**Mohammed Niyaz Ali**  
📧 hashir21102@gmail.com
