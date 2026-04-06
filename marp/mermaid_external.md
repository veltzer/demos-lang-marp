---
marp: true
---

# External Mermaid Diagram

This presentation demonstrates including a Mermaid diagram from an external `.mmd` file.

Since Marp cannot directly include `.mmd` files, the workflow is:
1. Write your diagram in a `.mmd` file (`mermaid/one.mmd`)
2. Pre-render it to SVG using `mmdc` (mermaid CLI)
3. Include the resulting SVG in your slide

```bash
mmdc -i mermaid/one.mmd -o images/mermaid_one.svg
```

---

# The Rendered Diagram

![Mermaid Diagram](../images/mermaid_one.svg)
