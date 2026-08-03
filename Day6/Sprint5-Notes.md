# Sprint 5 – SOQL & DML Notes

## Overview

Sprint 5 introduced Salesforce data operations using **SOQL** and **DML**. The focus was on understanding how enterprise applications retrieve information, validate business rules, and perform database operations.

---

## Theory Covered

### SOQL (Salesforce Object Query Language)

- Retrieve records from Salesforce objects.
- Fetch only the required fields.
- Use queries to answer specific business questions.
- Retrieve data before making business decisions.

### DML (Data Manipulation Language)

- Create new records using `INSERT`.
- Modify existing records using `UPDATE`.
- Perform DML only after all business validations are complete.

---

## Business Concepts

- Data represents real business information.
- Business validation should always occur before database changes.
- Duplicate applications should be prevented.
- Enterprise software follows a Retrieve → Validate → Save workflow.

---

## Practical Implementation

The following tasks were completed in Salesforce:

- Retrieved Student records using SOQL.
- Retrieved Job records using SOQL.
- Checked for duplicate applications.
- Validated student eligibility.
- Created Application records using DML INSERT.
- Updated Application status using DML UPDATE.

---

## Key Learnings

- Retrieve only the fields required.
- Keep SOQL queries efficient.
- Perform DML only after validation.
- Build complete business transactions using Apex, SOQL, and DML.
