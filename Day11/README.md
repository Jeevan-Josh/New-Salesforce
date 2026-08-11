# Sprint 11 – External API Integration

## Overview

In Sprint 11, I learned how to integrate Salesforce with an external REST API.

The integration was designed for the Student Placement Management System.

When a student's application status changes from `Applied` to `Selected`, Salesforce asynchronously sends the candidate information to an external recruitment API using Queueable Apex and a Named Credential.

---

## Architecture

Application Status Change
        ↓
ApplicationTrigger
        ↓
ApplicationService
        ↓
CandidateSyncQueueable
        ↓
Named Credential
        ↓
External Credential
        ↓
External Recruitment API

---

## Objectives

- Understand REST API integration in Salesforce
- Understand HTTP callouts
- Use Queueable Apex for asynchronous callouts
- Configure External Credentials
- Configure Named Credentials
- Avoid hard-coding authentication details
- Serialize Salesforce data into JSON
- Process HTTP response status codes
- Connect Trigger → Service → Queueable
- Verify asynchronous Apex execution

---

## Components Created

### 1. External Credential

Created:

`External_Recruitment_API_Credential`

Principal:

`Recruitment_API`

The External Credential is used to manage authentication securely instead of storing credentials directly inside Apex code.

---

### 2. Named Credential

Created a Named Credential for the external recruitment API.

The Named Credential stores the endpoint configuration and references the External Credential.

This allows Apex to use a callout endpoint such as:

`callout:External_Recruitment_API/candidates`

instead of hard-coding authentication information.

---

### 3. CandidateSyncQueueable

Created:

`CandidateSyncQueueable.cls`

The class implements:

`Queueable`

and

`Database.AllowsCallouts`

The Queueable:

1. Receives the Application Id
2. Queries Application details
3. Queries Student details
4. Queries Job details
5. Builds candidate data
6. Serializes the data into JSON
7. Creates an HTTP request
8. Sends the request to the external API
9. Processes the HTTP response

---

## Trigger Integration

The existing `ApplicationTrigger` was extended to support:

- `before insert`
- `before update`
- `after update`

The `before` context continues to perform application validation.

The `after update` context checks whether the application status changed to:

`Selected`

When the status changes to `Selected`, the service layer queues the candidate synchronization job.

---

## Service Layer

Added:

`handleApplicationSelection()`

This method checks whether the application status changed to `Selected`.

If the condition is satisfied, it executes:

`System.enqueueJob(new CandidateSyncQueueable(app.Id));`

This keeps the HTTP callout outside the Trigger.

---

## HTTP Response Handling

The Queueable handles common HTTP response codes:

| Status Code | Meaning |
|-------------|---------|
| 200 | Successful request |
| 201 | Resource created |
| 204 | Successful request with no response body |
| 400 | Bad request |
| 401 | Unauthorized |
| 403 | Forbidden |
| 404 | Resource not found |
| 500 | External server error |

Unexpected status codes are also logged.

---

## Security

Authentication information is not hard-coded in Apex.

Salesforce External Credentials and Named Credentials are used to manage the external API connection.

Permission Set access was configured for the External Credential Principal.

---

## Testing

The integration was tested using an Application record.

Test scenario:

`Application Status: Applied`

changed to:

`Application Status: Selected`

The status update successfully triggered the asynchronous process.

The resulting:

`CandidateSyncQueueable`

Apex Job completed successfully.

---

## Final Result

The complete integration flow was successfully tested:

Application  
→ Trigger  
→ ApplicationService  
→ Queueable Apex  
→ Named Credential  
→ External Credential  
→ External API

The Queueable Apex job completed successfully in Salesforce Apex Jobs.

---

## Key Learning

The main learning from this sprint was how to design a Salesforce integration using asynchronous Apex instead of performing HTTP callouts directly from a Trigger.

This provides a cleaner separation of responsibilities:

- Trigger handles the event
- Service handles business logic
- Queueable handles asynchronous processing
- Named Credential handles endpoint configuration
- External Credential handles authentication

---

## Screenshots

The screenshots folder contains evidence of:

- External Credential configuration
- External Credential Principal Access
- Permission Set assignment
- Named Credential
- CandidateSyncQueueable
- Application Trigger
- Application Service
- Selected Application
- Successful Apex Job execution
