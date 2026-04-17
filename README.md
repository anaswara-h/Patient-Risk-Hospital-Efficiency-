# Patient-Risk-Hospital-Efficiency-
(India Public Healthcare)

Dataset Source-
https://www.kaggle.com/datasets/digutlaranjithkumar/india-hospital-readmission-dataset-20152024

Project Background

This project analyzes operational efficiency, patient risk, readmission behavior, and treatment costs across hospitals in the Indian public healthcare ecosystem. Public hospitals often face pressure to improve patient outcomes while managing limited budgets, bed capacity, and increasing demand.

This project was designed to help hospital administrators, finance teams, and healthcare operations leaders answer critical business questions such as:

* Which hospitals have higher readmission risk?
* What factors increase patient readmission probability?
* Which wards drive longer patient stays?
* Where are treatment costs concentrated?
* How can hospitals improve efficiency without compromising care quality?

Insights and recommendations are provided on the following key areas:

* Patient Risk & Readmission Drivers
* Length of Stay (LOS) Analysis
* Cost Analysis & Hospital Performance
* Diagnosis Complexity & Treatment Burden

The SQL queries used to explore and analyze the data for this project can be found in the `/sql/analysis_queries.sql` file.

An interactive Power BI dashboard used to explore hospital performance trends can be found in the `/dashboard/` folder.






Data Structure & Initial Checks

The healthcare database structure consists of five core tables with patient, hospital, admissions, diagnosis, and billing information.

Main Tables:

1. patients_1

* patient_id
* age
* gender
* state
* bpl_card
* insurance_type
* comorbidity_count
* prev_admissions

2. admissions_1

* admission_id
* patient_id
* hospital_id
* admit_date
* discharge_date
* los_days
* admit_type
* ward_type
* hospital_id
* discharge
* num_procedures
* hba1c
* creatinine
* haemoglobin
* systolic_bp
* readmitted_30d
* readmitted_7d
* charlson_index

3. hospitals_1

Fields include:

* hospital_id
* name
* state
* tier
* beds
* teaching

4. billing_1

Fields include:

* admission_id
* bill_id
* cost_category
* total_cost_inr
* govt_subsidy_inr
* out_of_pocket_inr

5. diagnoses_1

Fields include:

* admission_id
* diag_id
* icd10_code
* diag_desc
* diag_rank
* diag_category


Executive Summary

Overview of Findings

This analysis found that patient readmission risk rises significantly with comorbidity burden, previous admissions, and higher Charlson Index scores. ICU and NICU wards show the longest average length of stay, indicating higher treatment intensity and resource utilization. Financially, pharmacy and procedures account for the largest share of treatment costs, while some high-cost hospitals also exhibit elevated readmission rates, indicating opportunities to improve both quality and efficiency.


Insights Deep Dive

1. Patient Risk & Readmission Drivers

Main Insight 1:

Patients with higher comorbidity counts show substantially higher readmission rates, suggesting that medically complex patients require stronger discharge planning and follow-up support.

Main Insight 2:

Patients with multiple previous admissions are more likely to return within 7 days, indicating unresolved conditions or inadequate continuity of care.

Main Insight 3:

Higher Charlson Index scores correlate strongly with increased readmission probability.

Main Insight 4:

Older patient groups show higher readmission risk compared to younger patients.

Dashboard Page: Patient Risk & Readmission


2. Length of Stay (LOS) Analysis

Main Insight 1:

NICU wards recorded the highest average LOS, reflecting neonatal intensive care complexity.

Main Insight 2:

ICU wards also showed long average stays due to critical care demand.

Main Insight 3:

General wards had the shortest stays, indicating faster patient turnover.

Main Insight 4:

LOS increases steadily with Charlson Index, linking higher disease burden with longer hospitalization.

Dashboard Page: LOS Comparison


3. Cost Analysis & Hospital Performance

Main Insight 1:

Pharmacy costs contributed the highest total treatment spending across hospitals.

Main Insight 2:

Procedures represented the second largest cost category.

Main Insight 3:

Some hospitals with the highest average treatment charges also showed above-average readmission rates.

Main Insight 4:

Patient out-of-pocket spending varied significantly by hospital, highlighting difference in affordability of treatment.

Dashboard Page: Cost Comparison & Hospital Performance


4. Diagnosis Complexity & Treatment Burden

Main Insight 1:

High-volume diagnosis categories create operational pressure on hospital systems.

Main Insight 2:

Admissions involving multiple diagnoses had significantly higher average treatment costs.

Main Insight 3:

Clinical complexity directly impacts financial burden.

Main Insight 4:

Patients with multiple conditions are likely to require longer stays and higher post-discharge risk management.



Recommendations

Based on the findings above, hospital management teams should consider the following:

1. Implement targeted discharge planning programs for patients with high comorbidity counts and prior admissions.

2. Prioritize post-discharge monitoring for older patients and patients with elevated Charlson Index scores.

3. Increase ICU/NICU bed planning and staffing efficiency to manage longer LOS cases.

4. Review pharmacy procurement and procedure costing strategies to control major expense categories.

5. Benchmark high-cost hospitals with high readmission rates to identify operational inefficiency.

6. Develop patient affordability programs for hospitals with high out-of-pocket burden.


Assumptions and Caveats

This dataset represents modeled healthcare operations and should be interpreted as analytical simulation rather than official government statistics.


Tools Used
* PostgreSQL
* Power BI
* Excel
* SQL
* DAX


Author

Anaswara H
