# Marp Features Reference

A comprehensive list of Marp features, including ones not yet demonstrated in this repo.

## Slide Layout & Structure

### Per-slide class directives

Apply built-in CSS classes to individual slides to change their layout or appearance.

```markdown
<!-- _class: lead -->
# Centered Title Slide

<!-- _class: invert -->
# Dark Mode Slide
```

### Scoped vs global directives

Prefixing a directive with `_` makes it apply only to the current slide.
Without `_`, it applies to all subsequent slides.

```markdown
---
marp: true
backgroundColor: #fff
---

# Slide 1 (white background)

---
<!-- _backgroundColor: #000 -->
<!-- _color: #fff -->

# Slide 2 (black background, only this slide)

---

# Slide 3 (back to white)
```

### Auto-fit text

Use the `<!-- fit -->` comment inside a heading to auto-scale text to fill the slide width.

```markdown
# <!-- fit --> This Title Will Fill The Entire Slide Width
```

### Multi-column layouts

Use raw HTML with inline CSS (requires `--html` flag).

```markdown
<div style="display: flex; gap: 2em;">
<div>

## Left Column
- Item A
- Item B

</div>
<div>

## Right Column
- Item C
- Item D

</div>
</div>
```

## Styling & Theming

### Built-in theme: uncover

Marp ships with three built-in themes: `default`, `gaia`, and `uncover`.

```markdown
---
marp: true
theme: uncover
---
```

### Custom themes via CSS

Define a custom theme in a CSS file and register it in your Marp config.

```css
/* @theme my-custom-theme */

section {
  background-color: #1a1a2e;
  color: #e0e0e0;
  font-family: 'Fira Sans', sans-serif;
}

h1 {
  color: #e94560;
}
```

Register in `.marprc.yml`:

```yaml
theme: ./themes/my-custom-theme.css
```

### Color and background directives

Control colors and backgrounds per-slide or globally via directives.

```markdown
---
marp: true
color: #333
backgroundColor: #f5f5f5
---

# Global styling

---
<!-- _color: white -->
<!-- _backgroundColor: #2d2d2d -->

# Dark slide
```

### Background images

Use the `bg` keyword in image alt text to set slide backgrounds.

```markdown
![bg](landscape.jpg)

# Basic background

---

![bg left](photo.jpg)

# Split layout: image left, text right

---

![bg right:40%](photo.jpg)

# Split layout with custom ratio

---

![bg contain](diagram.png)

# Contained background (no cropping)

---

![bg cover](photo.jpg)

# Cover background (fills slide, may crop)
```

### Multiple backgrounds

Stack multiple `![bg]` images on one slide for layered or side-by-side backgrounds.

```markdown
![bg](image1.jpg)
![bg](image2.jpg)
![bg](image3.jpg)

# Three backgrounds shown side by side
```

### Background color gradients

Use CSS gradients as background images.

```markdown
---
marp: true
backgroundImage: "linear-gradient(to right, #667eea, #764ba2)"
color: white
---

# Gradient Background
```

## Images & Media

### Image sizing

Control image width and height with special alt-text syntax.

```markdown
![w:200](photo.jpg)
![h:100](photo.jpg)
![w:200 h:100](photo.jpg)
```

### Image filters

Apply CSS filters to images via alt-text keywords.

```markdown
![blur:5px](photo.jpg)
![brightness:1.5](photo.jpg)
![sepia](photo.jpg)
![grayscale](photo.jpg)
![drop-shadow:5px,5px,10px,black](photo.jpg)
```

### Video embedding

Embed videos using raw HTML (requires `--html` flag).

```markdown
<video src="demo.mp4" controls width="80%"></video>
```

## Advanced Features

### Speaker notes

Add presenter notes that are visible in presenter view but hidden in the slides.

```markdown
# My Slide

Content here.

<!--
These are speaker notes.
They appear in presenter view only.
-->
```

### Slide transition animations

Add transitions between slides (Marp CLI v3+).

```markdown
---
marp: true
transition: fade
---

# Slide 1

---
<!-- transition: slide -->

# Slide 2 (slides in)

---
<!-- transition: cover -->

# Slide 3 (covers previous)
```

Available transitions: `fade`, `slide`, `cover`, `reveal`, `wipe`, `flip`, `morph`, and more.

### Enabling raw HTML

By default, raw HTML is stripped. Enable it with the `--html` flag.

```bash
marp --html presentation.md
```

Or in `.marprc.yml`:

```yaml
html: true
```

### Auto-scaling for code and math

Auto-scale overflowing code blocks and math expressions to fit the slide.

```markdown
---
marp: true
---

<!-- _autoScaling: true -->

```python
# This long code block will be scaled down to fit the slide
def very_long_function_name_that_might_overflow(parameter_one, parameter_two, parameter_three):
    return parameter_one + parameter_two + parameter_three
```​
```

## Output & Tooling

### Live-reload dev server

Start a local server that watches for file changes and auto-reloads.

```bash
marp --server ./slides/
```

### Auto-open preview

Open the presentation in the browser automatically.

```bash
marp --preview presentation.md
```

### PDF metadata

Set metadata that gets embedded in the output PDF.

```markdown
---
marp: true
title: My Presentation
description: A talk about Marp features
author: Your Name
keywords: marp,slides,markdown
url: https://example.com/talk
---
```

### Multiple output formats

Marp CLI can export to several formats.

```bash
# HTML (default)
marp presentation.md

# PDF
marp --pdf presentation.md

# PowerPoint
marp --pptx presentation.md

# PNG images (one per slide)
marp --images png presentation.md

# JPEG images (one per slide)
marp --images jpeg presentation.md
```

### Custom Markdown engine

Swap the Markdown-it parser or add plugins.

```bash
marp --engine ./custom-engine.js presentation.md
```

### Project-level configuration

Create a `.marprc.yml` file in your project root to set default CLI options.

```yaml
html: true
theme: gaia
pdf: true
allowLocalFiles: true
themeSet:
  - ./themes/
```

## Feature Coverage in This Repo

Demos that already exist:

| Feature | File |
|---------|------|
| Background images | `marp/background.md` |
| Charts | `marp/chart.md` |
| Code highlighting | `marp/code_highlighting.md` |
| Comments | `marp/comments.md` |
| Footer | `marp/footer.md` |
| Header | `marp/header.md` |
| JPG inside PDF | `marp/jpg_inside_pdf.md` |
| JPG scaled | `marp/jpg_scaled_correct.md` |
| LaTeX | `marp/latex.md` |
| Marp directive | `marp/marp_equals_true.md` |
| Math | `marp/math.md` |
| MathJax | `marp/mathjax.md` |
| Mermaid diagrams | `marp/mermaid.md` |
| Numbered lists | `marp/numbered_list.md` |
| Pagination | `marp/paginate.md` |
| SVG | `marp/svg.md` |
| Tables | `marp/tables.md` |
| Theme: Gaia | `marp/theme_gaia.md` |

Features not yet demonstrated:

- Per-slide class directives (`lead`, `invert`)
- Scoped vs global directives
- Auto-fit text (`<!-- fit -->`)
- Multi-column layouts
- Theme: uncover
- Custom CSS themes
- Color/background directives
- Background image split layouts (`bg left`, `bg right:40%`)
- Multiple backgrounds
- Background gradients
- Image sizing (`w:`, `h:`)
- Image filters (`blur`, `sepia`, `grayscale`, etc.)
- Video embedding
- Speaker notes
- Slide transitions
- Auto-scaling
- PDF metadata directives
- PowerPoint export
- `.marprc.yml` configuration
