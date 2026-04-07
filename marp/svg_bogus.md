---
marp: true
---

<!-- NOTE: This demo documents Marp's behavior with broken SVG references.

Marp error handling for images:
- Missing file:    warns on stderr, exits 0, renders nothing
- Invalid SVG:     no warning, exits 0, renders nothing
- Tiny/icon SVG:   no warning, exits 0, renders the icon

Marp has no strict mode and no way to fail on broken images.
To catch these issues at build time, use external linters:
- svglint: catches invalid XML in SVG files
- check_svg_quality.py: catches placeholder/icon SVGs (too small or too few elements)
- A wrapper script can grep marp's stderr for "missing" warnings to fail the build.
-->

# Bogus SVG Reference (missing file)

Marp warns on stderr but still exits 0.

![missing](images/this_does_not_exist.svg)

---

# Bogus SVG Reference (present but invalid content)

Marp gives no warning at all. Silently renders nothing.

![bogus](images/bogus.svg)

---

# Bogus SVG Reference (present but tiny icon)

Marp gives no warning. Renders the tiny icon without complaint.

![tiny](images/tiny_icon.svg)
