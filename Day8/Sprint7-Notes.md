# Sprint 7 Notes

## Topic

Building Software That Survives Scale

---

## What is Bulk Processing?

Bulk Processing is the technique of processing multiple records together instead of one record at a time.

Salesforce Triggers can receive up to 200 records in a single transaction.

---

## What are Governor Limits?

Governor Limits are platform limits that prevent a single transaction from consuming excessive Salesforce resources.

Examples include:

- Maximum SOQL Queries
- Maximum DML Statements
- CPU Time
- Heap Size

These limits ensure efficient resource sharing in Salesforce's multi-tenant architecture.

---

## Bulkification

Bulkification means writing Apex code that works efficiently for one record as well as many records.

Apex should be designed to process collections instead of individual records.

---

## Collections Used

### List

Stores multiple records.

Example:

List<Application__c>

---

### Set

Stores unique values.

Example:

Set<Id>

---

### Map

Stores key-value pairs.

Example:

Map<Id, Student__c>

---

## Bulk Processing Pattern

```
Receive Records
        ↓
Collect IDs
        ↓
One SOQL Query
        ↓
Store in Maps
        ↓
Process Records
        ↓
Perform DML Once
```

---

## Implementation

Created:

- ApplicationBulkService
- ApplicationTrigger

Bulk validation includes:

- Student CGPA
- Student Backlogs
- Job Minimum CGPA
- Job Closing Date

---

## Best Practices

✔ Avoid SOQL inside loops

✔ Avoid DML inside loops

✔ Use Sets for unique IDs

✔ Use Maps for quick lookups

✔ Query related records once

✔ Process records in memory

✔ Write reusable service classes

---

## Interview Questions

### What is Bulkification?

Writing Apex code that efficiently processes multiple records using collections while avoiding unnecessary SOQL and DML operations.

---

### Why should SOQL not be written inside loops?

Because it can exceed Governor Limits when processing many records.

---

### Why should DML not be written inside loops?

It increases the number of DML operations and can exceed platform limits.

---

### Why use Set?

To store unique values and avoid duplicate IDs.

---

### Why use Map?

To retrieve records quickly without executing additional SOQL queries.

---

### Why are Governor Limits important?

They ensure efficient use of Salesforce resources in a multi-tenant environment.

---

## Key Takeaway

Sprint 7 focused on designing scalable and bulk-safe Apex code. I learned to use Lists, Sets, and Maps to process multiple records efficiently while following Governor Limits and Salesforce best practices.
