---
marp: true
---

<!-- Add Mermaid.js support -->
<script src="https://cdn.jsdelivr.net/npm/mermaid@10/dist/mermaid.min.js"></script>
<script>
  mermaid.initialize({ startOnLoad: true });
</script>

# My Presentation

## With Mermaid Diagrams

This demonstrates working Mermaid diagrams in Marp.

<div class="mermaid">
graph TD
    A[Client] -->|TCP Connection| B[Load Balancer]
    B -->|TCP Connection| C[Server1]
    B -->|TCP Connection| D[Server2]
</div>

---

## Another Mermaid Diagram

<div class="mermaid">
graph TB
    A[Web Browser] -->|HTTP| B[Load Balancer]
    B --> C[Web Server 1]
    B --> D[Web Server 2]
    C --> E[Database]
    D --> E
</div>

---

## Sequence Diagram

<div class="mermaid">
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
</div>
