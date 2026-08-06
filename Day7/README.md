# Day 7 – Apex Triggers & Event-Driven Automation

## Objective

Learn how Salesforce automatically responds to business events using Apex Triggers while following a clean Trigger-Service architecture.

---

## Topics Covered

- Apex Triggers
- Before Insert Trigger
- After Insert Trigger
- After Update Trigger
- Event-Driven Programming
- Trigger Events
- Business Automation
- Separation of Concerns
- Trigger Best Practices

---

## Business Scenario

The Placement Management System should automatically respond whenever an Application record is created or updated.

Instead of asking users to manually validate applications or send notifications, Salesforce performs these actions automatically through Apex Triggers.

---

## Project Architecture

Application__c
↓
ApplicationTrigger
├── ApplicationService
├── StatisticsService
└── NotificationService

The Trigger only observes events and delegates business logic to service classes, following Salesforce best practices.

---

## Components Created

### Apex Trigger

- ApplicationTrigger

### Apex Classes

- ApplicationService
- StatisticsService
- NotificationService

---

## Features Implemented

### Before Insert

- Validate Student Eligibility
- Prevent Duplicate Applications

### After Insert

- Placeholder for future automation

### After Update

- Detect Status Changes
- Update Placement Statistics
- Send Notification

---

## Test Scenarios

| Scenario | Result |
|----------|--------|
| Duplicate Application | ✅ Prevented |
| Student below required CGPA | ✅ Validation Error |
| Eligible Student Application | ✅ Record Created |
| Update Status to Selected | ✅ Statistics Updated |
| Notification Triggered | ✅ Debug Message Generated |

---

## Screenshots

- Trigger Code
- ApplicationService
- NotificationService
- StatisticsService
- Duplicate Validation
- CGPA Validation
- Successful Application
- Debug Log

---

## Key Learning

- Triggers respond automatically to business events.
- Business logic should remain inside Service Classes.
- Triggers should coordinate, not calculate.
- Before Triggers are used for validation.
- After Triggers are used for automation and notifications.
- Clean architecture improves maintainability and scalability.

---

## Sprint Outcome

Successfully implemented an event-driven Placement Management System using Apex Triggers and Service Classes following Salesforce development best practices.
