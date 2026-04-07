---
marp: true
---

<!-- NOTE: This demo does NOT render correctly in Marp.
     Marp does not support ```mermaid fenced code blocks.
     Use <div class="mermaid"> with a <script> tag instead.
     See mermaid_internal.md for a working example. -->

# Mermaid Code Block Demo

## Using ` ```mermaid ` Syntax

This demonstrates Mermaid diagrams using fenced code blocks.

```mermaid
graph TD
    A[Client] -->|TCP Connection| B[Load Balancer]
    B -->|TCP Connection| C[Server1]
    B -->|TCP Connection| D[Server2]
```

---

## Sequence Diagram

```mermaid
sequenceDiagram
    participant User
    participant Browser
    participant Server
    participant Database
    User->>Browser: Click login
    Browser->>Server: POST /login
    Server->>Database: Query user
    Database-->>Server: User data
    Server-->>Browser: JWT token
    Browser-->>User: Show dashboard
```

---

## Flowchart

```mermaid
graph LR
    A[Start] --> B{Is it working?}
    B -->|Yes| C[Great!]
    B -->|No| D[Debug]
    D --> A
```
