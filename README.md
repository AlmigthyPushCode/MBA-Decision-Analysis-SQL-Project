# MBA Decision Analysis SQL Project

## Project Overview

**Project Title**: MBA Decision & Salary Analysis  
**Database**: `mba_decision_db`  

This project analyzes **MBA decisions and salary trends** before and after pursuing an MBA. It focuses on **salary distribution, gender-based comparisons, decision-making trends, and post-MBA preferences** using SQL.

---

## Objectives

1. **Categorize salary ranges** before pursuing an MBA.  
2. **Analyze salary distribution** to understand earnings trends.  
3. **Compare salaries and MBA decisions by gender and undergraduate major.**  
4. **Evaluate MBA funding sources, job titles, and post-MBA preferences.**  

---

## Project Structure

### **1. Data Preprocessing**

#### **Add Salary Category Based on Salary Range**
```sql
ALTER TABLE mba_decision_dataset
ADD COLUMN SALARY_CATEGORY VARCHAR(100);

UPDATE mba_decision_dataset
SET SALARY_CATEGORY = CASE
    WHEN `Annual Salary (Before MBA)` BETWEEN 30000 AND 50000 THEN '30K-50K'
    WHEN `Annual Salary (Before MBA)` BETWEEN 50000 AND 100000 THEN '50K-1L'
    ELSE 'ABOVE 1 LAKH'
END;
```

---

### **2. Salary Distribution Analysis**

#### **Overall Salary Distribution**
```sql
SELECT SALARY_CATEGORY, COUNT(*) AS total_count, 
       SUM(`Annual Salary (Before MBA)`) * 100 / 
       (SELECT SUM(`Annual Salary (Before MBA)`) FROM mba_decision_dataset) AS salary_percentage
FROM mba_decision_dataset
GROUP BY SALARY_CATEGORY
ORDER BY salary_percentage DESC;
```

#### **Salary Distribution by Gender**
```sql
SELECT GENDER, AVG(`Annual Salary (Before MBA)`) AS avg_salary
FROM mba_decision_dataset
GROUP BY GENDER
ORDER BY avg_salary DESC;
```

---

### **3. MBA Decision Analysis**

#### **MBA Decision Trends by Gender**
```sql
SELECT GENDER, COUNT(`Decided to Pursue MBA?`) AS decided_to_pursue_mba
FROM mba_decision_dataset
WHERE `Decided to Pursue MBA?` = 'YES'
GROUP BY GENDER
ORDER BY decided_to_pursue_mba DESC;
```

#### **MBA Decision Trends by Undergraduate Major**
```sql
SELECT `Undergraduate Major`, COUNT(`Decided to Pursue MBA?`) AS decided_to_pursue_mba
FROM mba_decision_dataset
WHERE `Decided to Pursue MBA?` = 'YES'
GROUP BY `Undergraduate Major`
ORDER BY decided_to_pursue_mba DESC;
```

#### **MBA Decision Trends by Job Title**
```sql
SELECT `Current Job Title`, COUNT(`Decided to Pursue MBA?`) AS decided_to_pursue_mba
FROM mba_decision_dataset
WHERE `Decided to Pursue MBA?` = 'YES'
GROUP BY `Current Job Title`
ORDER BY decided_to_pursue_mba DESC;
```

---

### **4. MBA Funding & Post-MBA Preferences**

#### **MBA Funding Source Analysis**
```sql
SELECT `MBA Funding Source`, COUNT(*) AS total_count
FROM mba_decision_dataset
GROUP BY `MBA Funding Source`
ORDER BY total_count DESC;
```

#### **Location Preference After MBA**
```sql
SELECT `Location Preference (Post-MBA)`, COUNT(*) AS total_count
FROM mba_decision_dataset
GROUP BY `Location Preference (Post-MBA)`
ORDER BY total_count DESC;
```

#### **Reasons for Pursuing an MBA**
```sql
SELECT `Reason for MBA`, COUNT(*) AS total_count
FROM mba_decision_dataset
GROUP BY `Reason for MBA`
ORDER BY total_count DESC;
```

#### **Online vs. On-Campus MBA Preference**
```sql
SELECT `Online vs. On-Campus MBA`, COUNT(*) AS total_count
FROM mba_decision_dataset
GROUP BY `Online vs. On-Campus MBA`
ORDER BY total_count DESC;
```

---

## **Findings & Insights**

- **Most MBA aspirants** come from specific salary ranges.  
- **Gender-based salary gaps** exist before pursuing an MBA.  
- **MBA decisions** vary significantly across different salary groups and job titles.  
- **Salaries after an MBA** tend to show an overall increase.  
- **Post-MBA preferences** reveal trends in location and study mode.  

---

## **How to Use This Project**

1. **Clone the Repository**: If this is on GitHub, clone or download the SQL file.  
2. **Set Up the Database**: Run the queries in your SQL environment.  
3. **Import Data**: Load the MBA decision dataset into `mba_decision_dataset`.  
4. **Run Analysis Queries**: Execute the provided SQL scripts to gain insights.  

---

## **Author & Portfolio**

This project is part of my portfolio to demonstrate SQL skills in data analysis. If you have questions or feedback, feel free to connect with me!

### 📌 Stay Connected:
- **LinkedIn**: [www.linkedin.com/in/joshua-n-a28005216](#)    
- **Email**: [joshuajos999@gmail.com](#)  

🚀 **Thank you for exploring my SQL project!** 🚀

