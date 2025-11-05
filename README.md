# AI-IMPACT-ON-GLOBAL-JOB-MARKET
🧠 Exploring How Artificial Intelligence is Reshaping the Job Market (2024–2030)

📌 Project Overview

The AIfluence Dashboard provides an in-depth analysis of how Artificial Intelligence (AI) is influencing global employment trends.
Using Power BI, SQL, and Python, this project uncovers the impact of automation, emerging job roles, salary shifts, and education trends from 2024 to 2030.

The goal is to help policymakers, organizations, and job seekers understand:

Which industries are growing or declining due to AI.

Which roles face the highest automation risk.

How education level impacts salary and career security.

The evolution of job openings and remote work diversity in AI-driven careers.

🎯 Project Goals

Identify industries and roles most affected by AI.

Analyze fastest-growing industries from 2024 to 2030.

Assess automation risk levels across job categories.

Examine salary correlations with automation vulnerability.

Evaluate education level vs. salary trends in AI-driven jobs.

Explore gender diversity and remote work distribution in AI-related careers.

Predict job openings evolution by 2030.

⚙️ Tools & Technologies
Tool	Purpose
Power BI	Dashboard development, data modeling, DAX calculations
SQL	Data extraction, transformation, and cleaning
Python (Pandas, Matplotlib, Seaborn)	Data preprocessing, visualization, and trend analysis
Excel / CSV	Initial data handling and import

🧠 Key Insights

Tech and Data Science industries are growing fastest, while manufacturing faces automation threats.

Highly skilled roles (AI Engineers, Data Scientists) show low automation risk and high salaries.

Bachelor’s & Master’s degrees yield significantly higher pay in AI-related sectors.

Gender diversity remains moderate, but remote work is increasing across industries.

Job openings projected to rise by 25–35% by 2030 in AI-augmented fields.

🪄 Python Components

Data Cleaning: Missing values, duplicates, and datatype fixes using pandas.

Visualization: Used matplotlib and seaborn for correlation plots and trend graphs.

EDA: Analyzed salary distributions, automation patterns, and education trends.

🧹 1. Data Cleaning and Preparation

Steps Performed:

Imported dataset using pandas.read_csv().

Checked for missing/null values with df.isnull().sum().

Handled missing salaries and automation risks using median imputation.

Converted columns to proper datatypes (float, int, category).

Renamed columns for better readability (e.g., Projected_Openings_2030).

import pandas as pd

df = pd.read_csv("ai_job_trends_dataset.csv")

# Check info
df.info()

# Handle missing values
df['Salary'] = df['Salary'].fillna(df['Salary'].median())
df['Automation_Risk'] = df['Automation_Risk'].fillna(df['Automation_Risk'].median())

# Clean column names
df.columns = df.columns.str.strip().str.replace(' ', '_')

📊 2. Feature Engineering

We created a Job Growth column to measure how much each industry is expected to expand by 2030.

df['Job_Growth'] = df['Projected_Openings_2030'] - df['Job_Openings_2024']


This helps in comparing industry performance over time.

📈 3. Exploratory Data Analysis (EDA)
🔹 Fastest Growing Industries (2024–2030)
import matplotlib.pyplot as plt
import seaborn as sns

growth = df.groupby('Industry')['Job_Growth'].sum().reset_index().sort_values(by='Job_Growth', ascending=False)

plt.figure(figsize=(10,6))
sns.barplot(data=growth.head(10), x='Job_Growth', y='Industry', palette='Blues_r')
plt.title("Top 10 Fastest Growing Industries (2024–2030)")
plt.xlabel("Total Job Growth")
plt.ylabel("Industry")
plt.show()


📍Insight: Tech, AI, and Data Science industries lead in growth, while traditional manufacturing lags.

🔹 Automation Risk by Job Role
risk = df.groupby('Job_Role')['Automation_Risk'].mean().reset_index().sort_values(by='Automation_Risk', ascending=False)

plt.figure(figsize=(12,6))
sns.barplot(data=risk.head(10), x='Automation_Risk', y='Job_Role', palette='Reds_r')
plt.title("Top 10 Jobs with Highest Automation Risk")
plt.xlabel("Automation Risk (%)")
plt.ylabel("Job Role")
plt.show()


📍Insight: Routine-based jobs show the highest automation risk.

🔹 Salary vs Automation Risk Correlation
plt.figure(figsize=(8,6))
sns.scatterplot(data=df, x='Automation_Risk', y='Salary', hue='Industry', alpha=0.7)
plt.title("Salary vs Automation Risk by Industry")
plt.xlabel("Automation Risk (%)")
plt.ylabel("Average Salary (₹)")
plt.show()


📍Insight: Higher salaries are generally associated with lower automation risk roles (e.g., AI Research, Data Science).

🔹 Education Level vs Average Salary
edu_salary = df.groupby('Education_Level')['Salary'].mean().reset_index()

plt.figure(figsize=(8,6))
sns.barplot(data=edu_salary, x='Education_Level', y='Salary', palette='Greens')
plt.title("Education Level vs Average Salary")
plt.xlabel("Education Level")
plt.ylabel("Average Salary (₹)")
plt.show()


📍Insight: Master's and PhD holders earn significantly higher salaries in AI-related jobs.

🔹 Gender Diversity Across Industries
gender = df.groupby(['Industry', 'Gender']).size().reset_index(name='Count')

plt.figure(figsize=(10,6))
sns.barplot(data=gender, x='Industry', y='Count', hue='Gender', palette='Set2')
plt.title("Gender Diversity by Industry")
plt.xlabel("Industry")
plt.ylabel("Employee Count")
plt.xticks(rotation=90)
plt.show()


📍Insight: Tech industries are more male-dominated, while creative and HR sectors show higher female representation.

🔹 Remote Work Adoption
remote = df['Remote_Work'].value_counts().reset_index()
remote.columns = ['Remote_Work', 'Count']

plt.figure(figsize=(6,6))
plt.pie(remote['Count'], labels=remote['Remote_Work'], autopct='%1.1f%%', startangle=140)
plt.title("Remote vs Onsite Roles Distribution")
plt.show()


📍Insight: Remote work is increasing, especially in digital and analytical sectors.

🔹 Projected Job Openings by Year (2024 → 2030)
yearly = df[['Industry', 'Job_Openings_2024', 'Projected_Openings_2030']]
yearly = yearly.melt(id_vars=['Industry'], var_name='Year', value_name='Openings')

plt.figure(figsize=(10,6))
sns.lineplot(data=yearly, x='Year', y='Openings', hue='Industry')
plt.title("Projected Job Openings by Industry (2024–2030)")
plt.xlabel("Year")
plt.ylabel("Total Openings")
plt.show()


📍Insight: Continuous upward trends in AI-related industries show a strong employment future.

📘 Conclusion

The AIfluence Dashboard delivers actionable insights into how AI is transforming global employment.
By integrating Power BI (visual analysis), SQL (data management), and Python (deep analysis), this project demonstrates the end-to-end process of data-driven storytelling.
