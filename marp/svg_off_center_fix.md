---
marp: true
style: |
  section > p:has(> img:only-child) {
    text-align: center;
  }
  section > p > img {
    float: none;
    display: inline-block;
    margin: 0 auto;
  }
---

<!--
Fix for the "SVG is shifted left" problem shown in svg_off_center_problem.md.

Marp's default theme applies

    img { display: block; float: left }

to images inside <p> elements. Because the <p> is inside the slide's
<section> which has left/right padding, the floated image hugs the
content area's left edge, leaving more space on the right than the
left. The result: the image is shifted left.

The override in the front matter's `style:` block:

  section > p:has(> img:only-child) { text-align: center; }
  section > p > img { float: none; display: inline-block; margin: 0 auto; }

Turns off the float and centers the image via `margin: 0 auto` on an
inline-block element. The result: image sits at the exact horizontal
center of the slide's content area.

Compare the rendered PDF of this file against svg_off_center_problem.md.
The red dashed lines (SVG's content edges) should be equidistant from
the rendered slide's left and right edges here, but not in the problem
version.
-->

# Fix: SVG image is centered

![](/home/mark/git/veltzer/demos-lang-marp/images/centering_test.svg)
