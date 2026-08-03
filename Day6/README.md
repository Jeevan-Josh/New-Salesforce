# Sprint 5 – SOQL & DML Business Transactions

## Overview

This sprint focuses on building complete business transactions using Apex, SOQL, and DML in Salesforce.

The project is part of the Placement Management System developed during the Salesforce Developer Program.

---

## Objectives

- Retrieve Student information using SOQL
- Retrieve Job information
- Validate eligibility criteria
- Prevent duplicate applications
- Create Application records using DML
- Update Application Status
- Understand enterprise transaction flow

---

## Business Workflow

```text
Student Applies
        │
        ▼
Retrieve Student
        │
        ▼
Retrieve Job
        │
        ▼
Validate Eligibility
        │
        ▼
Check Duplicate
        │
        ▼
Create Application
        │
        ▼
Save Record
        │
        ▼
Recruiter Updates Status
```

---

## Salesforce Objects

- Student
- Job
- Application

---

## Apex Features Used

- Apex Classes
- Static Methods
- SOQL
- DML INSERT
- DML UPDATE
- Business Validation
- Conditional Statements

---

## Files Included

```
Sprint-5-SOQL-DML
│
├── Apex-Classes
├── Anonymous-Execution
├── Screenshots
├── Documentation
└── README.md
```

---

## Screenshots

### Student Record

(Add screenshot here)

---

### Job Record

(Add screenshot here)

---

### Application Created

(Add screenshot here)

---

### Application Status Updated

(Add screenshot here)

---

## Key Learnings

- Retrieve only the required fields using SOQL.
- Validate business rules before performing DML operations.
- Use INSERT to create records.
- Use UPDATE to modify existing records.
- Design software that follows real-world business transactions.

---

## Technologies Used

- Salesforce Apex
- SOQL
- DML
- Salesforce Developer Console
- Salesforce Objects

---

## Author

**Jeevan Josh Merakanapalli**

Salesforce Developer Program – Sprint 5
