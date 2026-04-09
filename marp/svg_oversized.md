---
marp: true
---

<!-- CONCLUSIONS from testing oversized SVGs in Marp:

Since SVGs are vector and scale freely, pixel dimensions are irrelevant.
What matters is the aspect ratio of the viewBox.

- Wide aspect ratios (e.g. 10:1) are handled well: Marp scales to fit the
  slide width, and the result is a thin horizontal strip with all content
  visible. Any ratio wider than 16:9 works fine.

- Tall aspect ratios (e.g. 1:10) are handled poorly: Marp scales to fit the
  width, so the height far exceeds the slide. Content is clipped at the bottom
  with no scrolling or auto-fit. Any ratio taller than 16:9 will lose content.

- Adding explicit width/height attributes makes things worse by preventing
  Marp's default viewBox-based scaling. Wide SVGs overflow the right edge;
  tall SVGs render at native width (narrow column) and overflow downward.

- Workarounds for tall SVGs: redesign to fit a landscape ratio, or constrain
  with CSS (e.g., img { max-height: 80%; object-fit: contain; }).
-->

# Oversized SVG

This presentation tests how Marp handles SVGs whose aspect ratio
does not match a slide (16:9). What happens when an SVG is extremely
wide or extremely tall?

---

# Too-Wide SVG (external file, 10:1 aspect ratio)

![too wide](images/too_wide.svg)

---

# Too-Tall SVG (external file, 1:10 aspect ratio)

![too tall](images/too_tall.svg)

---

# Too-Wide SVG (inline, 10:1 aspect ratio)

<svg viewBox="0 0 2000 200" xmlns="http://www.w3.org/2000/svg">
  <rect width="2000" height="200" fill="#e8f4fd" stroke="#2196F3" stroke-width="2"/>
  <line x1="0" y1="100" x2="2000" y2="100" stroke="#90CAF9" stroke-width="1" stroke-dasharray="10,5"/>
  <circle cx="100" cy="100" r="40" fill="#F44336"/>
  <circle cx="500" cy="100" r="40" fill="#FF9800"/>
  <circle cx="1000" cy="100" r="40" fill="#4CAF50"/>
  <circle cx="1500" cy="100" r="40" fill="#2196F3"/>
  <circle cx="1900" cy="100" r="40" fill="#9C27B0"/>
  <text x="100" y="170" text-anchor="middle" font-family="Arial" font-size="14">Start</text>
  <text x="1000" y="170" text-anchor="middle" font-family="Arial" font-size="14">Middle</text>
  <text x="1900" y="170" text-anchor="middle" font-family="Arial" font-size="14">End</text>
</svg>

---

# Too-Tall SVG (inline, 1:10 aspect ratio)

<svg viewBox="0 0 200 2000" xmlns="http://www.w3.org/2000/svg">
  <rect width="200" height="2000" fill="#fce4ec" stroke="#E91E63" stroke-width="2"/>
  <line x1="100" y1="0" x2="100" y2="2000" stroke="#F48FB1" stroke-width="1" stroke-dasharray="10,5"/>
  <circle cx="100" cy="100" r="40" fill="#F44336"/>
  <circle cx="100" cy="500" r="40" fill="#FF9800"/>
  <circle cx="100" cy="1000" r="40" fill="#4CAF50"/>
  <circle cx="100" cy="1500" r="40" fill="#2196F3"/>
  <circle cx="100" cy="1900" r="40" fill="#9C27B0"/>
  <text x="100" y="50" text-anchor="middle" font-family="Arial" font-size="14">Top</text>
  <text x="100" y="1010" text-anchor="middle" font-family="Arial" font-size="14">Middle</text>
  <text x="100" y="1960" text-anchor="middle" font-family="Arial" font-size="14">Bottom</text>
</svg>

---

# Too-Wide SVG with explicit width/height attributes

<svg viewBox="0 0 2000 200" xmlns="http://www.w3.org/2000/svg" width="2000" height="200">
  <rect width="2000" height="200" fill="#e8f4fd" stroke="#2196F3" stroke-width="2"/>
  <circle cx="100" cy="100" r="40" fill="#F44336"/>
  <circle cx="1000" cy="100" r="40" fill="#4CAF50"/>
  <circle cx="1900" cy="100" r="40" fill="#9C27B0"/>
</svg>

---

# Too-Tall SVG with explicit width/height attributes

<svg viewBox="0 0 200 2000" xmlns="http://www.w3.org/2000/svg" width="200" height="2000">
  <rect width="200" height="2000" fill="#fce4ec" stroke="#E91E63" stroke-width="2"/>
  <circle cx="100" cy="100" r="40" fill="#F44336"/>
  <circle cx="100" cy="1000" r="40" fill="#4CAF50"/>
  <circle cx="100" cy="1900" r="40" fill="#9C27B0"/>
</svg>
