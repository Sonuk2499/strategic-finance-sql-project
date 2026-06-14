# Strategic Finance & Business Analytics SQL Project

## 📌 Project Overview
This project focuses on executing advanced data analytics on an e-commerce transactional dataset containing over 1,000 relational database rows across orders, products, reviews, and customer events. The objective was to diagnose a leaking sales funnel and track key financial performance metrics to drive data-backed strategic decisions.

## 📊 Key Business Insights & Financial KPIs
Through targeted SQL analysis, the following core metrics were uncovered:
* **Average Order Value (AOV):** Formulated an explicit baseline of **Rs. 623 AOV**.
* **Order Health:** Identified a critical vulnerability with a **20.2% order cancellation rate** and a **20.5% return rate**.
* **Funnel Conversion:** Discovered massive drop-offs across user sessions, tracking **700 views down to 148 carts, resulting in only 48 final purchases**.

## 🛠️ Tech Stack & SQL Concepts Used
* **Database Engine:** PostgreSQL / MySQL
* **Advanced SQL Techniques:** Common Table Expressions (CTEs), Multi-table Inner/Left JOINS, Aggregate Functions (`SUM`, `COUNT`, `AVG`), and Conditional Logic (`CASE WHEN`).

## 📁 Repository Directory
* `/scripts/financial_kpis.sql`: Contains queries measuring top-line corporate health metrics.
* `/scripts/funnel_analysis.sql`: Implements multi-stage CTEs to calculate conversion bottlenecks.
