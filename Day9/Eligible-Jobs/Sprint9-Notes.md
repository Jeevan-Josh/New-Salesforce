# Sprint 9 Notes – Eligible Jobs

## 1. Sprint Objective

The objective of this sprint was to build an Eligible Jobs feature for the Student Placement Management System using Lightning Web Components and Apex.

The student can:

- View eligible jobs
- View job details
- Apply for a job
- Receive a success message
- Receive an error message when an application fails

---

# 2. Architecture

The feature follows a layered architecture:

```text
Lightning Web Component
        ↓
ApplicationController
        ↓
ApplicationService
        ↓
Salesforce Objects
