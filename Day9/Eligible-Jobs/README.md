# Sprint 9 – Eligible Jobs

## Overview

In Sprint 9, I developed the Eligible Jobs functionality for the Student Placement Management System.

The feature allows a student to view jobs for which they are eligible based on their CGPA and the job's minimum CGPA requirement.

Students can also view job details and apply for an eligible job directly from the Lightning Web Component.

---

## Objectives

- Display eligible jobs for a student
- Retrieve eligible jobs using Apex
- Connect Lightning Web Components with Apex
- Display job information dynamically
- View complete job details
- Allow students to apply for jobs
- Prevent duplicate applications
- Validate student eligibility
- Display success and error messages
- Handle loading states
- Understand Apex Controller → Service Layer → LWC architecture

---

## Features

### 1. Eligible Jobs

The system retrieves jobs that:

- Have not passed their closing date
- Have a minimum CGPA requirement
- Match the student's CGPA eligibility

The student sees only jobs for which they meet the minimum CGPA requirement.

---

### 2. Job Information

Each eligible job displays:

- Job Title
- Company Name
- Minimum CGPA
- Closing Date

---

### 3. View Details

The **View Details** button allows the student to view additional information about the selected job.

The details section displays:

- Job Title
- Company
- Minimum CGPA
- Closing Date

---

### 4. Apply for a Job

The student can click the **Apply** button to submit an application.

The application contains:

- Student
- Job
- Application Status
- Application Date

The initial application status is:

`Applied`

---

### 5. Duplicate Application Prevention

The system prevents a student from applying to the same job more than once.

If a duplicate application is detected, the user receives:

`This student has already applied for this job.`

---

### 6. CGPA Validation

Before an application is accepted, the student's CGPA is compared with the job's minimum CGPA.

If the student does not meet the requirement, the application is rejected with:

`Student does not meet the minimum CGPA requirement.`

---

## Architecture

The Eligible Jobs feature follows a layered architecture:

```text
Lightning Web Component
        ↓
ApplicationController
        ↓
ApplicationService
        ↓
Student__c / Job__c / Application__c
