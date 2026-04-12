---
marp: true
---

<!--
Demonstrates the "SVG-is-shifted-left" problem in Marp.

The SVG at images/centering_test.svg has content spanning x=40..1240
inside a 1280x720 viewBox — perfectly symmetric. Yet when Marp renders
it with a ## heading above, Marp's default theme applies:

    img { display: block; float: left }

to images inside <p> elements. The image floats to the left edge of
the slide's content area (inside the section's padding), not to the
center. The left margin of the rendered SVG is smaller than the right.

Look at the red dashed lines on the SVG: they mark x=40 (left edge of
content) and x=1240 (right edge of content) inside the SVG. After
rendering, measure the pixel distance from the slide edges to those
red lines: they are not equal. The content is shifted left by ~30px.

See svg_off_center_fix.md for the fix.
-->

# Problem: SVG image is shifted left

![](/home/mark/git/veltzer/demos-lang-marp/images/centering_test.svg)
