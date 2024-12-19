---
marp: true
theme: default
---
<!-- If you want the image to be embedded into the pdf document you need to:
- have a local url below when you point to the image.
- you have to have the --allow-local-files if you want to embed local images into this presentation,
    if you don't you will get a warning (I don't know how to turn warnings into erros when using marp).
    Note that local images ARE NOT embedded into HTML output, only pdf output.
- if you have a remote image with a wrong link you will not get any warning or error because marp will
    just embed the link into the presentation, so remote images are not REALLY embedded into your pdf.
- you DO NOT HAVE to have the --engine @marp-team/marp-core flag
- you DO NOT HAVE to have the --html flag
-->

# Slide with local image

This slide contains a JPG image.
The problem is that we don't see the entire image or the text under the image

![image](../images/example.jpg)
> This is the description of the image

---

# Slide with currect remote image

This slide contains a JPG image.

![he](https://veltzer.github.io/assets/raw/cyber/sql-injection.png)
> This is the description of the image

---

# Slide with wrong remote image

This slide contains a JPG image.

![image](https://veltzer.github.io/assets/raw/cyber/sql-injection.pn)
