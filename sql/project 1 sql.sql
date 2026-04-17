--1. PATIENT RISK & READMISSION DRIVERS
--READMISSION BY COMORBIDITY COUNT
SELECT p.comorbidity_count, ROUND(AVG(a.readmitted_7d),5) AS readmission_rate
FROM patients_1 AS p
JOIN admissions_1 AS a
ON p.patient_id=a.patient_id
GROUP BY p.comorbidity_count
ORDER BY readmission_rate DESC;

--READMISSION BY PREVIOUS ADMISSIONS
SELECT p.prev_admissions, ROUND(AVG(a.readmitted_7d),5) AS readmission_rate
FROM patients_1 AS p
JOIN admissions_1 AS a
ON p.patient_id=a.patient_id
GROUP BY p.prev_admissions
ORDER BY readmission_rate DESC;

--READMISSION BY CHARLSON INDEX
SELECT charlson_index, ROUND(AVG(readmitted_7d),5) AS readmission_rate
FROM admissions_1
GROUP BY charlson_index
ORDER BY readmission_rate DESC;

--READMISSION BY AGE AND GENDER
SELECT p.age, p.gender, ROUND(AVG(a.readmitted_7d),5) AS readmission_rate
FROM patients_1 AS p
JOIN admissions_1 AS a
ON p.patient_id=a.patient_id
GROUP BY p.age, p.gender
ORDER BY readmission_rate DESC;

--2. LENGTH OF STAY ANALYSIS

--AVG LOS BY WARD_TYPE
SELECT ward_type, ROUND(AVG(los_days),2) AS avg_los
FROM admissions_1 a
GROUP BY ward_type
ORDER BY avg_los DESC;

--LOS BY HOSPITAL TIER ANALYSIS
SELECT h.tier, ROUND(AVG(a.los_days),4) as avg_los
FROM admissions_1 a
JOIN hospitals_1 h
ON a.hospital_id=h.hospital_id
GROUP BY tier
ORDER BY avg_los DESC;

--3. COST ANALYSIS AND HOSPITAL PERFORMANCE COMPARISON

--REVENUE PER CATEGORY (what yields higher revenue)
SELECT cost_category, ROUND(SUM(total_cost_inr),0) AS sum_cost
FROM billing_1
GROUP BY cost_category
ORDER BY sum_cost DESC;

--READMISSION RATE PER HOSPITAL
SELECT h.name, ROUND(AVG(a.readmitted_7d),4) AS readmission_rate
FROM hospitals_1 h
JOIN admissions_1 a 
ON h.hospital_id = a.hospital_id
GROUP BY h.name
ORDER BY readmission_rate DESC;

--AVG TREATMENT CHARGE PER ADMISSION PER HOSPITAL
SELECT h.name, ROUND(AVG(b.total_cost_inr),2) AS avg_total_cost, ROUND(AVG(b.out_of_pocket_inr),2) AS avg_out_of_pocket
FROM hospitals_1 h
JOIN admissions_1 a 
ON h.hospital_id = a.hospital_id
JOIN billing_1 b 
ON a.admission_id = b.admission_id
GROUP BY h.name
ORDER BY avg_total_cost DESC;


--4. DIAGNOSIS

--DIAGNOSES BY VOLUME
SELECT diag_category, COUNT(*) AS count_of
FROM diagnoses_1
GROUP BY diag_category
ORDER BY count_of DESC;

--DIAGNOSIS COMPLEXITY AND CHARGE OF TREATMENT
WITH diag_count AS(
SELECT a.admission_id, COUNT(d.diag_category) AS count_of
FROM admissions_1 a
JOIN diagnoses_1 d
ON a.admission_id=d.admission_id
GROUP BY a.admission_id)
SELECT dc.count_of, ROUND(AVG(b.total_cost_inr),2) as avg_cost
FROM diag_count dc
JOIN billing_1 b
ON b.admission_id=dc.admission_id
GROUP BY dc.count_of
ORDER BY dc.count_of DESC;

SELECT COUNT(*) FROM admissions_1;