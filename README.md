Welcome to your new dbt project!

# 🧭 Northwind Sales Insights with dbt

## 📌 Business Problem

In this project, we worked with the Northwind dataset. The data is stored in raw tables, but it is not ready for analysis. The data has inconsistent column names, requires a lot of joins, and important metrics like revenue are not defined consistently.

The goal was to clean the data and create a structured data model that can be used for reporting and analysis.

---

## 🏗️ Models Built

### 1. Staging Layer

In the staging layer, I cleaned the raw data:

* Renamed columns to snake_case
* Selected only relevant columns
* Casted data types (dates and numbers)

Models:

* `staging_orders`
* `staging_order_details`
* `staging_products`
* `staging_categories`

---

### 2. Prep Layer

In the prep layer, I joined the staging tables and added business logic:

* Joined orders, order details, products, and categories

* Calculated revenue:

  revenue = unit_price * quantity * (1 - discount)

* Extracted:

  * order_year
  * order_month

Model:

* `prep_sales`

---

### 3. Mart Layer

In the mart layer, I created a final table for analysis:

* Aggregated data by year, month, and category
* Created KPIs:

  * Total revenue → SUM(revenue)
  * Total number of orders → COUNT(DISTINCT order_id)
  * Average revenue per order → AVG(revenue)

Model:

* `mart_sales_performance`

---

## 📊 Insights

The final table shows sales performance over time and by category.

From this, we can:

* Compare which categories perform best
* Analyze monthly sales trends
* Support dashboards with ready-to-use data

---

## 🧪 Testing

I added basic tests in `schema.yml` to make sure:

* Important columns are not null
* The data is reliable for analysis

Tests were run using:

```bash
dbt test
```

---

## 💡 Learning

From this project, I learned:

* How to structure a dbt project (staging → prep → mart)
* How to use `source()` and `ref()` for building models
* How to separate cleaning, logic, and aggregation steps
* How to create reusable and clean data pipelines


### Using the starter project

Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [dbt community](https://getdbt.com/community) to learn from other analytics engineers
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
