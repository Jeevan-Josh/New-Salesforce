# Sprint 11 Notes – External API Integration

## 1. External API

An API allows Salesforce to communicate with an external application.

In this sprint, Salesforce sends candidate information to an external recruitment API.

---

## 2. REST API

REST APIs commonly use HTTP methods such as:

- GET
- POST
- PUT
- PATCH
- DELETE

For candidate synchronization, a `POST` request is used because Salesforce sends candidate information to the external system.

---

## 3. HttpRequest

`HttpRequest` is used to construct an HTTP request.

Important methods:

```apex
HttpRequest request = new HttpRequest();

request.setEndpoint(...);
request.setMethod('POST');
request.setHeader('Content-Type', 'application/json');
request.setBody(...);
