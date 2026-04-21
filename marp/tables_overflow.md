---
marp: true

# Marp silently clips tables that are too wide for a slide.
# No build error — you only notice when viewing the rendered PDF.
# This file shows three ways tables overflow.
---

# Table Overflow: Too Many Columns

| Col1 | Col2 | Col3 | Col4 | Col5 | Col6 | Col7 | Col8 | Col9 | Col10 | Col11 | Col12 | Col13 | Col14 | Col15 |
|------|------|------|------|------|------|------|------|------|-------|-------|-------|-------|-------|-------|
| v    | v    | v    | v    | v    | v    | v    | v    | v    | v     | v     | v     | v     | v     | v     |
| w    | w    | w    | w    | w    | w    | w    | w    | w    | w     | w     | w     | w     | w     | w     |

Rightmost columns disappear off the slide edge.

---

# No Overflow: Wide Cell Content

| Name | Description |
|------|-------------|
| A    | This is a very long description that contains so many words it forces the cell to grow beyond the available slide width and the text runs off the right edge of the rendered slide, silently, with no build-time warning from Marp. |
| B    | short                                                                                                                                                                                                                                |

Long prose wraps within the cell — no overflow.

---

# Table Overflow: Long Unbreakable Tokens

| Identifier                                                                     | Value |
|--------------------------------------------------------------------------------|-------|
| `some_very_long_snake_case_identifier_that_cannot_wrap_because_it_is_one_word` | 42    |
| `another_looooooooooooooooooooooooooooooooooooooooooong_backtick_token_here`   | 99    |

Inline-code tokens do not wrap and push the table off the slide.

---

# Why Marp Does Not Catch This

- Marp renders to PDF via headless Chromium + CSS
- Overflow is a CSS layout outcome, not a markdown-syntax error
- The build succeeds; the slide PDF is produced
- Clipping is only visible to a human previewing the output

Lesson: a custom linter is needed if clipping must be prevented.
