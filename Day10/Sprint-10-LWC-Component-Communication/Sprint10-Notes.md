# Sprint 10 Notes – LWC Component Communication

## 1. Component Communication

Lightning Web Components can communicate using:

- Parent-to-Child communication
- Child-to-Parent communication

---

## 2. Parent-to-Child Communication

The parent can pass data to a child component using `@api`.

Example:

```javascript
@api job;
