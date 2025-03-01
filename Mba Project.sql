-- 1️⃣ Add Salary Category Based on Salary Range (Preprocessing)
ALTER TABLE mba_decision_dataset
ADD COLUMN SALARY_CATEGORY VARCHAR(100);

UPDATE mba_decision_dataset
SET SALARY_CATEGORY = CASE
    WHEN `Annual Salary (Before MBA)` BETWEEN 30000 AND 50000 THEN '30K-50K'
    WHEN `Annual Salary (Before MBA)` BETWEEN 50000 AND 100000 THEN '50K-1L'
    ELSE 'ABOVE 1 LAKH'
END;

-- 2️⃣ Salary Distribution Analysis
SELECT SALARY_CATEGORY, COUNT(*) AS total_count, 
       SUM(`Annual Salary (Before MBA)`) * 100 / 
       (SELECT SUM(`Annual Salary (Before MBA)`) FROM mba_decision_dataset) AS salary_percentage
FROM mba_decision_dataset
GROUP BY SALARY_CATEGORY
ORDER BY salary_percentage DESC;

-- 3️⃣ Salary Distribution by Gender
SELECT GENDER, AVG(`Annual Salary (Before MBA)`) AS avg_salary
FROM mba_decision_dataset
GROUP BY GENDER
ORDER BY avg_salary DESC;

-- 4️⃣ MBA Decision Analysis by Gender
SELECT GENDER, COUNT(`Decided to Pursue MBA?`) AS decided_to_pursue_mba
FROM mba_decision_dataset
WHERE `Decided to Pursue MBA?` = 'YES'
GROUP BY GENDER
ORDER BY decided_to_pursue_mba DESC;

-- 5️⃣ MBA Decision Analysis by Undergraduate Major
SELECT `Undergraduate Major`, COUNT(`Decided to Pursue MBA?`) AS decided_to_pursue_mba
FROM mba_decision_dataset
WHERE `Decided to Pursue MBA?` = 'YES'
GROUP BY `Undergraduate Major`
ORDER BY decided_to_pursue_mba DESC;

-- 6️⃣ MBA Decision Analysis by Job Title
SELECT `Current Job Title`, COUNT(`Decided to Pursue MBA?`) AS decided_to_pursue_mba
FROM mba_decision_dataset
WHERE `Decided to Pursue MBA?` = 'YES'
GROUP BY `Current Job Title`
ORDER BY decided_to_pursue_mba DESC;

-- 7️⃣ MBA Funding Source Analysis
SELECT `MBA Funding Source`, COUNT(*) AS total_count
FROM mba_decision_dataset
GROUP BY `MBA Funding Source`
ORDER BY total_count DESC;

-- 8️⃣ Location Preference After MBA
SELECT `Location Preference (Post-MBA)`, COUNT(*) AS total_count
FROM mba_decision_dataset
GROUP BY `Location Preference (Post-MBA)`
ORDER BY total_count DESC;

-- 9️⃣ Reasons for Pursuing an MBA
SELECT `Reason for MBA`, COUNT(*) AS total_count
FROM mba_decision_dataset
GROUP BY `Reason for MBA`
ORDER BY total_count DESC;

-- 🔟 Online vs. On-Campus MBA Preference
SELECT `Online vs. On-Campus MBA`, COUNT(*) AS total_count
FROM mba_decision_dataset
GROUP BY `Online vs. On-Campus MBA`
ORDER BY total_count DESC;
;

