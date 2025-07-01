# 📉 Customer Churn Analysis – End-to-End Project

> **Business Goal:** Understand *why customers leave telecom services* and provide *data-backed strategies* to reduce churn using SQL, Python, ML, and Tableau – all packaged into a deployable web dashboard.

![Churn Dashboard Screenshot](static/img/churn_dashboard.png)

---

## 🚀 Project Overview

Customer churn, or customer attrition, is one of the biggest challenges telecom companies face — leading to lost revenue and high acquisition costs.

In this project, we:
- Investigate the key drivers behind churn.
- Build churn prediction models.
- Design visual dashboards to enable **actionable business decisions**.
- Deploy everything to a clean, interactive website with **Business View** and **Tech View** toggles.

---

## 🧠 Key Insights

- Month-to-month contracts, fiber optic internet, and electronic check payments are strong churn predictors.
- Customers with shorter tenure or lacking support services are more likely to leave.
- Targeted actions (like offering yearly plans, improving support, and addressing high charges) can significantly improve retention.

---

## 🛠️ Tech Stack

| Area                  | Tools Used                                       |
|-----------------------|--------------------------------------------------|
| Data Wrangling        | SQL, Pandas                                      |
| Visualization         | Seaborn, Tableau                                 |
| Machine Learning      | Scikit-learn, CatBoost                           |
| Deployment            | HTML, CSS, JavaScript, GitHub Pages              |

---

## 🔍 Project Structure

### 📁 Data Preparation with SQL
- Cleaned nulls and incorrect values.
- Engineered columns like `ChurnLabel` and `AvgMonthlySpend`.
- Built summary tables to analyze churn patterns by tenure, internet type, and payment method.

### 📊 Exploratory Data Analysis (EDA)
- Visualized churn rate by tenure, monthly charges, and contract type.
- Bucketed tenure and charges for clearer pattern recognition.
- Identified high-risk segments.

### 🤖 Machine Learning Models
Trained 3 models:
- **Logistic Regression** – baseline.
- **Random Forest** – selected for balance of performance and interpretability.
- **CatBoost** – handled categorical variables effectively.

**Evaluated using:** ROC AUC, F1 Score, Precision, Recall

### 📈 Interactive Tableau Dashboards
- Two views: **Churn Analysis** and **Model Analysis**
- Filters for contract type, tenure, internet service, and more.
- Business metrics like churn rate, revenue loss, and model performance.

### 🌐 Deployed to the Web
- Built a responsive website using HTML, CSS, and JavaScript.
- **Toggle Views:** 
  - *Business View* – summary insights for non-technical stakeholders.
  - *Tech View* – behind-the-scenes with SQL, Python, ML, and visuals.
- Hosted on **GitHub Pages**

---

## 💡 Features

- 🔍 Cleaned and analyzed raw telecom data from CSV using SQL  
- 📊 Performed EDA and built ML models with Python (Scikit-learn, CatBoost)  
- 📈 Created interactive dashboards using Tableau Public  
- 🌍 Fully deployed web project with separate business & technical views  

---

## 📎 Live Demo

**🌐 Website:** [https://lalit-kumar-2097.github.io/dashboards/apps/telco_churn/](https://lalit-kumar-2097.github.io/dashboards/apps/telco_churn/)

---

## 📁 Dataset

- Source: [Kaggle - Telco Customer Churn Dataset](https://www.kaggle.com/blastchar/telco-customer-churn)
- Columns: `CustomerID`, `Gender`, `SeniorCitizen`, `Partner`, `Tenure`, `InternetService`, `MonthlyCharges`, `Churn`, etc.

---

## 🎯 How to Use

```bash
# Clone the repo
git clone https://github.com/lalit-kumar-2097/telco-churn-analysis.git
cd telco-churn-analysis

# Open the homepage in browser
open index.html
