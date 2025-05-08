# SVG Presentation

This presentation is intended to test svg inclusion in marp.

---

# Slide with SVG Diagram

<svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
  <!-- Main circle -->
  <circle cx="100" cy="100" r="80" fill="#f0f0f0" stroke="#333" stroke-width="2"/>
  
  <!-- Inner elements -->
  <rect x="60" y="60" width="80" height="80" rx="5" fill="#4287f5" opacity="0.8"/>
  
  <!-- Arrow -->
  <path d="M50,140 L150,60" stroke="#e74c3c" stroke-width="3" fill="none" marker-end="url(#arrowhead)"/>
  
  <!-- Define arrow marker -->
  <defs>
    <marker id="arrowhead" markerWidth="10" markerHeight="7" 
            refX="9" refY="3.5" orient="auto">
      <polygon points="0 0, 10 3.5, 0 7" fill="#e74c3c"/>
    </marker>
  </defs>
  
  <!-- Text label -->
  <text x="100" y="170" text-anchor="middle" font-family="Arial" font-size="14">
    SVG in Marp
  </text>
</svg>
