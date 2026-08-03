# Day 5 – SOQL, DML & Business Transactions

## 📌 Sprint 5 Overview

Day 5 focused on understanding how Salesforce applications retrieve, validate, and manage data using **SOQL**, **DML**, and **Apex**. The sprint emphasized thinking like a Salesforce Developer by designing complete business transactions instead of writing isolated code.

The goal was to understand how enterprise applications retrieve information before making decisions and modify data only after all business rules are validated.

---

# 🎯 Learning Objectives

- Understand why business applications need data retrieval.
- Learn the purpose of SOQL in Salesforce.
- Learn how DML is used to create and update records.
- Understand business validation before database operations.
- Build complete business transactions using Apex.

---

# 📚 Theory Covered

## SOQL (Salesforce Object Query Language)

SOQL is used to retrieve records from Salesforce.

Example business questions:

- Retrieve Student details.
- Retrieve Job eligibility criteria.
- Check existing applications.
- Retrieve Application records.
- Fetch only the required fields for better performance.

---

## DML (Data Manipulation Language)

DML is used to modify Salesforce records.

Operations learned:

- Insert
- Update
- Delete (Concept)
- Undelete (Concept)

Business Rule:

> Retrieve → Validate → Perform DML

Never perform DML before validating business requirements.

---

# 🏢 Business Scenario

A Placement Management System was used throughout Sprint 5.

Business flow:

Student applies for a Job

↓

Retrieve Student Details

↓

Retrieve Job Details

↓

Validate Eligibility

↓

Check Duplicate Application

↓

Create Application Record

↓

Save Record

↓

Return Confirmation

---

# 🧠 Engineering Concepts Learned

- Think before writing queries.
- Retrieve only necessary fields.
- Every SOQL query should answer one business question.
- Never change data before validation.
- Separate business logic from database operations.
- Respect business data integrity.

---

# 💻 Apex Practice

The following scenarios were implemented using Apex Execute Anonymous.

### ✔ Retrieve Student Record

Retrieved Student details using SOQL.

Fields retrieved:

- Name
- CGPA
- Department
- Backlogs

---

### ✔ Retrieve Job Record

Retrieved Job details.

Fields retrieved:

- Company Name
- Minimum CGPA
- Closing Date

---

### ✔ Duplicate Application Check

Checked whether a Student had already applied for the same Job before allowing a new application.

---

### ✔ Create Application

Created a new Application record using DML Insert after all validations passed.

---

### ✔ Update Application Status

Updated the Application Status using DML Update.

Status values used:

- Not Applied
- Applied
- Shortlisted
- Interview Scheduled
- Selected
- Rejected

---

# 📂 Salesforce Objects Used

- Student
- Job
- Application

---

# 🧪 Manual Testing Performed

Successfully tested:

- Student retrieval
- Job retrieval
- Duplicate application validation
- Application creation
- Status update
- Picklist validation
- SOQL queries
- DML Insert
- DML Update

---

# 📸 Screenshots

The following screenshots are included:

- Student Record
- Job Record
- Application Record
- SOQL Query Results
- Application Created
- Application Status Updated
- Execute Anonymous Window

---

# 📖 Key Takeaways

- SOQL retrieves information.
- DML modifies information.
- Business validation should always happen before DML.
- Efficient queries improve application performance.
- Enterprise software follows a structured business transaction workflow.

---

# 🚀 Skills Practiced

- Salesforce Apex
- SOQL
- DML
- Execute Anonymous
- Business Logic
- Record Validation
- Salesforce Data Model
- Enterprise Software Design

---

## ✅ Outcome

Completed Sprint 5 by understanding how Salesforce applications retrieve data, validate business rules, create new records, update existing records, and complete real-world business transactions using Apex, SOQL, and DML.
