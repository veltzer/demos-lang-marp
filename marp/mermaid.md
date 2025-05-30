# My Presentation

## With Mermaid Diagrams

```mermaid
graph TD
    A[Client] -->|TCP Connection| B[Load Balancer]
    B -->|TCP Connection| C[Server1]
    B -->|TCP Connection| D[Server2]
```

<div class="mermaid">
graph TB
    A[Web Browser] -->|HTTP| B[Load Balancer]
    B --> C[Web Server 1]
    B --> D[Web Server 2]
    C --> E[Database]
    D --> E
</div>
