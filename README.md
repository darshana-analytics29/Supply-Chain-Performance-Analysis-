# Supply Chain Performance & Inventory Analysis

**A Data Analytics Portfolio Project by Darshana Narjari**

## 1. Project Overview

This project analyses supply chain performance using PostgreSQL and Microsoft Power BI. It focuses on inventory management, product demand, supplier performance, manufacturing, transportation and product quality.

The objective is to identify important patterns in the data, highlight potential operational issues and provide recommendations to support better business decisions.

## 2. Business Problem

Businesses need to maintain sufficient inventory, manage suppliers, control product quality and ensure timely deliveries. Without analysing these areas, it can be difficult to identify products that may need replenishment, supplier performance issues, transportation costs and quality concerns.

This project uses data analysis to understand these areas and identify opportunities for improvement.

## 3. Project Objectives

- Analyse inventory levels and product sales.
- Identify products with high demand and low stock.
- Identify products with high stock and low sales.
- Compare product performance across categories.
- Analyse shipping time and cost across transportation modes.
- Evaluate supplier performance and product quality.
- Compare manufacturing lead time and manufacturing costs.
- Build interactive Power BI dashboards to present findings.

## 4. Dataset Overview

- **Dataset:** Supply Chain Analysis
- **Dataset Creator:** Harsh Singh
- **Source:** [Kaggle – Supply Chain Analysis](https://www.kaggle.com/datasets/harshsingh2209/supply-chain-analysis)
- **File Format:** CSV
- **Total Records:** 100
- **Total Columns:** 24
- **Unique SKUs:** 100

The dataset contains information about products, sales, inventory, suppliers, manufacturing, shipping and quality inspections.

The original raw dataset is included in the `Dataset` folder. Data validation and analysis were performed using SQL.

## 5. Tools & Technologies

| Tool | Purpose |
|---|---|
| PostgreSQL | Data validation, SQL queries and analysis |
| Microsoft Power BI | Dashboard development and data visualization |
| CSV | Source dataset format |

## 6. SQL Analysis

The SQL analysis covers:

- Data quality checks and validation.
- Missing values and duplicate SKU checks.
- Negative value checks.
- Inventory and stock-to-sales analysis.
- High-demand/low-stock identification.
- High-stock/low-sales identification.
- Product-type performance.
- Supplier performance analysis.
- Manufacturing performance.
- Shipping and transportation analysis.
- Product quality and defect analysis.

## 7. Key Findings

### Inventory & Demand

- Total units sold: **46,099**
- Total stock on hand: **4,777**
- 21 SKUs were identified as high-demand/low-stock candidates.
- 25 SKUs were identified as high-stock/low-sales candidates.

### Product Performance

- Skincare recorded the highest units sold and revenue.
- Haircare had the highest aggregate stock.
- Cosmetics recorded the lowest units sold and revenue.

### Logistics & Transportation

- Road had the shortest average shipping time (4.72).
- Sea had the longest average shipping time (7.12).
- Sea had the lowest average shipping cost (4.97).
- Air had the highest average shipping cost (6.02).

### Product Quality

- Pass: 23 records.
- Fail: 36 records.
- Pending: 41 records.
- Haircare had the highest average defect rate (2.48).

### Supplier Performance

- Supplier 1 had the lowest average lead time (14.78) and defect rate (1.80).
- Supplier 3 had the highest average lead time (20.13).
- Supplier 5 had the highest average defect rate (2.67).

*Note: These findings describe the supplied dataset. The dataset does not specify the currency of revenue, or the units for several time, cost and defect-rate fields.*

## 8. Power BI Dashboards

Three interactive dashboard pages were developed to present the analysis.

### Dashboard 1: Inventory Optimization Overview

This dashboard presents total SKUs, units sold, stock and revenue. It also compares product categories and helps identify products that may need inventory review.

![Inventory Optimization Overview](Power%20Bi/Inventory%20Optimization%20Overview.png)

### Dashboard 2: Logistics & Quality Performance

This dashboard compares transportation modes based on shipping time and cost. It also analyses average defect rates across product categories.

![Logistics & Quality Performance](Power%20Bi/Logistics%20%26%20Quality%20Performance.png)

### Dashboard 3: Supplier & Manufacturing Performance

This dashboard compares supplier lead times and quality performance, along with manufacturing lead time and cost across product categories.

![Supplier & Manufacturing Performance](Power%20Bi/Supplier%20%26%20Manufacturing%20Performance.png)

**Power BI file:** [View the Power BI Dashboard (.pbix)](Power%20Bi/Supply%20chain%20dashboard.pbix)

## 9. Recommendations

- Review the 21 high-demand/low-stock products to check whether additional stock is needed.
- Review the 25 high-stock/low-sales products before placing new orders.
- Compare suppliers based on delivery time and product quality.
- Investigate products that failed or are still awaiting quality inspection.
- Compare transportation methods based on delivery time and overall cost.
- Maintain additional stock for products with regular customer demand.

## 10. Limitations

- The dataset contains only 100 records.
- Historical sales data and transaction dates are not available.
- Previous stock shortages and purchase-order information are not provided.
- Supplier agreements and detailed quality records are unavailable.
- Some measurement units and cost definitions require confirmation.
- The analysis identifies patterns but does not predict future demand or establish causes.

## 11. Conclusion

This project demonstrates how PostgreSQL and Power BI can be used together to analyse supply chain operations. The analysis helped identify potential inventory issues, compare transportation methods, understand product quality and evaluate supplier performance.

Overall, the project strengthened my practical understanding of SQL analysis, data validation, data visualization and business decision-making.

## 12. Project Folder Structure

```text
Supply-Chain-Performance-Analysis/
│
├── Dataset/
│   └── Original raw dataset (CSV)
│
├── SQL_Analysis/
│   └── SQL analysis script (.sql)
│
├── Power Bi/
│   ├── Supply chain dashboard.pbix
│   ├── Inventory Optimization Overview.png
│   ├── Logistics & Quality Performance.png
│   └── Supplier & Manufacturing Performance.png
│
├── Report/
│   └── Professional project report (PDF)
│
└── README.md
```

---

**Author:** Darshana Narjari  
**Project:** Supply Chain Performance & Inventory Analysis  
**Tools:** PostgreSQL | Microsoft Power BI
