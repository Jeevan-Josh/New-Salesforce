# Sprint 8 – Asynchronous Apex

## 📌 Overview

Sprint 8 focused on **Asynchronous Apex** in Salesforce.

The objective was to understand how Salesforce can execute processing in the background instead of performing every operation synchronously.

Asynchronous Apex is useful when processing requires additional time, handling large amounts of data, or when the user should not have to wait for the entire operation to finish.

During this sprint, I implemented:

- Future Apex
- Queueable Apex
- Batch Apex
- Scheduled Apex
- Apex Jobs
- Background processing
- Batch processing of Application records

---

# 🎯 Sprint Objectives

The main objectives of Sprint 8 were:

- Understand synchronous vs asynchronous processing.
- Understand why asynchronous Apex is required.
- Implement Future Methods.
- Implement Queueable Apex.
- Implement Batch Apex.
- Implement Scheduled Apex.
- Execute asynchronous jobs using Salesforce.
- Monitor asynchronous jobs using Apex Jobs.
- Understand how different asynchronous Apex mechanisms are used.

---

# 🚀 Topics Covered

## 1. Future Apex

Future Apex allows a method to execute asynchronously in the background.

### Class Created

```text
ApplicationFutureService
