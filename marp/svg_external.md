---
marp: true
---

# External SVG File

This presentation demonstrates including an SVG from a separate file
using standard Markdown image syntax.

---

# SVG from External File (relative path)

![SVG Diagram](../images/diagram.svg)

---

# SVG from External File (project-root-relative path)

<!-- This works because .marprc.mjs sets baseUrl to the project root -->

![SVG Diagram](images/diagram.svg)

---

# SVG from External File (absolute path with slash) - DOES NOT WORK

<!-- Leading / resolves to filesystem root, not project root -->

![SVG Diagram](/images/diagram.svg)
