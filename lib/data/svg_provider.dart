// SVG scene illustrations for the Bio Mission game zones.
// Each entry corresponds to a GameZone.svgId value.
class SvgProvider {
  static String getSvg(String id) => _svgMap[id] ?? '';

  static const Map<String, String> _svgMap = {
    'blood_svg': '''<svg viewBox="0 0 200 120" xmlns="http://www.w3.org/2000/svg">
<rect width="200" height="120" fill="#1a0010"/>
<rect x="0" y="0"  width="200" height="18" fill="#2a0818" rx="4"/>
<rect x="0" y="102" width="200" height="18" fill="#2a0818" rx="4"/>
<ellipse cx="30"  cy="60" rx="18" ry="13" fill="#3a0a0a" stroke="#E24B4A" stroke-width="1.5"/>
<ellipse cx="30"  cy="60" rx="10" ry="7"  fill="#5a1010" stroke="#E24B4A" stroke-width="1"/>
<ellipse cx="30"  cy="60" rx="5"  ry="3"  fill="#3a0a0a"/>
<ellipse cx="80"  cy="55" rx="18" ry="13" fill="#3a0a0a" stroke="#E24B4A" stroke-width="1.5"/>
<ellipse cx="80"  cy="55" rx="10" ry="7"  fill="#5a1010" stroke="#E24B4A" stroke-width="1"/>
<ellipse cx="80"  cy="55" rx="5"  ry="3"  fill="#3a0a0a"/>
<ellipse cx="135" cy="65" rx="18" ry="13" fill="#3a0a0a" stroke="#E24B4A" stroke-width="1.5"/>
<ellipse cx="135" cy="65" rx="10" ry="7"  fill="#5a1010" stroke="#E24B4A" stroke-width="1"/>
<ellipse cx="135" cy="65" rx="5"  ry="3"  fill="#3a0a0a"/>
<ellipse cx="180" cy="58" rx="14" ry="10" fill="#3a0a0a" stroke="#E24B4A" stroke-width="1.5"/>
<ellipse cx="180" cy="58" rx="7"  ry="5"  fill="#5a1010" stroke="#E24B4A" stroke-width="1"/>
<text x="100" y="112" text-anchor="middle" font-family="monospace" font-size="9" fill="#F09595">BLOODSTREAM</text>
</svg>''',

    'immune_svg': '''<svg viewBox="0 0 200 120" xmlns="http://www.w3.org/2000/svg">
<rect width="200" height="120" fill="#060e18"/>
<path d="M80 60 Q90 35 110 40 Q135 30 145 55 Q158 75 140 90 Q120 105 95 95 Q68 88 68 72 Q65 62 80 60Z" fill="#112240" stroke="#378ADD" stroke-width="2"/>
<ellipse cx="110" cy="65" rx="18" ry="14" fill="#1a3a6a" stroke="#378ADD" stroke-width="1.5"/>
<ellipse cx="110" cy="65" rx="10" ry="8"  fill="#264d8a" stroke="#85B7EB" stroke-width="1"/>
<circle cx="60" cy="55" r="10" fill="#3a0808" stroke="#E24B4A" stroke-width="1.5"/>
<line x1="56" y1="48" x2="52" y2="42" stroke="#E24B4A" stroke-width="1.5" stroke-linecap="round"/>
<circle cx="52" cy="40" r="3" fill="#E24B4A"/>
<line x1="64" y1="48" x2="68" y2="42" stroke="#E24B4A" stroke-width="1.5" stroke-linecap="round"/>
<circle cx="70" cy="40" r="3" fill="#E24B4A"/>
<path d="M72 56 Q68 56 68 58" fill="none" stroke="#378ADD" stroke-width="1.5" stroke-dasharray="3,2"/>
<text x="100" y="114" text-anchor="middle" font-family="monospace" font-size="9" fill="#85B7EB">IMMUNE DEFENSE</text>
</svg>''',

    'cell_svg': '''<svg viewBox="0 0 200 120" xmlns="http://www.w3.org/2000/svg">
<rect width="200" height="120" fill="#060e18"/>
<ellipse cx="100" cy="60" rx="90" ry="52" fill="#0d1e35" stroke="#85B7EB" stroke-width="1.5" stroke-dasharray="5,3"/>
<ellipse cx="80" cy="58" rx="22" ry="18" fill="#112240" stroke="#85B7EB" stroke-width="1.5" stroke-dasharray="4,3"/>
<ellipse cx="80" cy="58" rx="12" ry="10" fill="#1a3a6a" stroke="#85B7EB" stroke-width="1"/>
<text x="80" y="62" text-anchor="middle" font-family="monospace" font-size="7" fill="#B5D4F4">DNA</text>
<ellipse cx="145" cy="48" rx="20" ry="12" fill="#1a1200" stroke="#EF9F27" stroke-width="1.5"/>
<path d="M128 48 Q136 40 144 48 Q152 56 160 48" fill="none" stroke="#EF9F27" stroke-width="1.5" stroke-linecap="round"/>
<text x="145" y="70" text-anchor="middle" font-family="monospace" font-size="8" fill="#FAC775">ATP</text>
<text x="100" y="114" text-anchor="middle" font-family="monospace" font-size="9" fill="#85B7EB">CELL INTERIOR</text>
</svg>''',

    'plant_svg': '''<svg viewBox="0 0 200 120" xmlns="http://www.w3.org/2000/svg">
<rect width="200" height="120" fill="#060e18"/>
<rect x="4" y="10" width="90" height="90" rx="4" fill="#0d2b07" stroke="#639922" stroke-width="2"/>
<ellipse cx="49" cy="55" rx="28" ry="26" fill="#071a04" stroke="#3B6D11" stroke-width="1.2" stroke-dasharray="3,2"/>
<ellipse cx="22" cy="28" rx="9" ry="5" fill="#1a3a07" stroke="#97C459" stroke-width="1"/>
<ellipse cx="75" cy="24" rx="9" ry="5" fill="#1a3a07" stroke="#97C459" stroke-width="1"/>
<ellipse cx="15" cy="78" rx="8" ry="5" fill="#1a3a07" stroke="#97C459" stroke-width="1"/>
<ellipse cx="78" cy="82" rx="8" ry="5" fill="#1a3a07" stroke="#97C459" stroke-width="1"/>
<ellipse cx="49" cy="55" rx="8" ry="7" fill="#112240" stroke="#85B7EB" stroke-width="1"/>
<text x="49" y="106" text-anchor="middle" font-family="monospace" font-size="7" fill="#97C459">PLANT CELL</text>
<line x1="100" y1="8" x2="100" y2="112" stroke="#5DCAA5" stroke-width="1" stroke-dasharray="4,3"/>
<ellipse cx="151" cy="55" rx="42" ry="40" fill="#0d1e35" stroke="#85B7EB" stroke-width="1.5" stroke-dasharray="4,3"/>
<ellipse cx="151" cy="55" rx="17" ry="14" fill="#112240" stroke="#85B7EB" stroke-width="1.5"/>
<ellipse cx="151" cy="55" rx="9" ry="7"  fill="#1a3a6a" stroke="#85B7EB" stroke-width="1"/>
<ellipse cx="122" cy="38" rx="12" ry="6" fill="#1a1200" stroke="#EF9F27" stroke-width="1"/>
<ellipse cx="176" cy="70" rx="12" ry="6" fill="#1a1200" stroke="#EF9F27" stroke-width="1"/>
<text x="151" y="106" text-anchor="middle" font-family="monospace" font-size="7" fill="#85B7EB">ANIMAL CELL</text>
</svg>''',

    'organisation_svg': '''<svg viewBox="0 0 200 120" xmlns="http://www.w3.org/2000/svg">
<rect width="200" height="120" fill="#060e18"/>
<rect x="72" y="8"  width="56" height="18" rx="4" fill="#1a1200" stroke="#5DCAA5" stroke-width="1.5"/>
<text x="100" y="21" text-anchor="middle" font-family="monospace" font-size="8" fill="#9FE1CB">CELL</text>
<line x1="100" y1="26" x2="100" y2="32" stroke="#5DCAA5" stroke-width="1.5"/>
<rect x="52" y="32" width="96" height="16" rx="4" fill="#1a1200" stroke="#EF9F27" stroke-width="1.5"/>
<text x="100" y="44" text-anchor="middle" font-family="monospace" font-size="8" fill="#FAC775">TISSUE</text>
<line x1="100" y1="48" x2="100" y2="54" stroke="#5DCAA5" stroke-width="1.5"/>
<rect x="30" y="54" width="140" height="16" rx="4" fill="#2a1a00" stroke="#EF9F27" stroke-width="1.5"/>
<text x="100" y="66" text-anchor="middle" font-family="monospace" font-size="8" fill="#FAC775">ORGAN (lungs)</text>
<line x1="100" y1="70" x2="100" y2="76" stroke="#5DCAA5" stroke-width="1.5"/>
<rect x="8"  y="76" width="184" height="18" rx="4" fill="#3a2000" stroke="#BA7517" stroke-width="1.5"/>
<text x="100" y="89" text-anchor="middle" font-family="monospace" font-size="8" fill="#FAC775">ORGANISM</text>
<text x="100" y="114" text-anchor="middle" font-family="monospace" font-size="8" fill="#EF9F27">BODY HIERARCHY</text>
</svg>''',

    'lung_svg': '''<svg viewBox="0 0 200 120" xmlns="http://www.w3.org/2000/svg">
<rect width="200" height="120" fill="#060e18"/>
<path d="M30 80 Q20 50 35 30 Q50 15 65 30 Q75 45 70 80Z" fill="#1a1a3a" stroke="#AFA9EC" stroke-width="1.5"/>
<path d="M170 80 Q180 50 165 30 Q150 15 135 30 Q125 45 130 80Z" fill="#1a1a3a" stroke="#AFA9EC" stroke-width="1.5"/>
<rect x="92" y="5" width="16" height="30" rx="8" fill="#112240" stroke="#85B7EB" stroke-width="1.5"/>
<circle cx="55" cy="55" r="10" fill="#2a0a0a" stroke="#F0997B" stroke-width="1.5"/>
<circle cx="55" cy="55" r="6"  fill="#4a1810"/>
<line x1="55" y1="43" x2="55" y2="38" stroke="#F0997B" stroke-width="1.5" stroke-linecap="round"/>
<circle cx="55" cy="36" r="2.5" fill="#F0997B"/>
<line x1="65" y1="52" x2="70" y2="49" stroke="#F0997B" stroke-width="1.5" stroke-linecap="round"/>
<circle cx="72" cy="47" r="2.5" fill="#F0997B"/>
<circle cx="145" cy="52" r="9" fill="#2a0a0a" stroke="#F0997B" stroke-width="1.5"/>
<circle cx="145" cy="52" r="5" fill="#4a1810"/>
<line x1="145" y1="41" x2="145" y2="36" stroke="#F0997B" stroke-width="1.5" stroke-linecap="round"/>
<circle cx="145" cy="34" r="2.5" fill="#F0997B"/>
<text x="100" y="114" text-anchor="middle" font-family="monospace" font-size="9" fill="#AFA9EC">LUNG TISSUE</text>
</svg>''',

    'mrsgren_svg': '''<svg viewBox="0 0 200 120" xmlns="http://www.w3.org/2000/svg">
<rect width="200" height="120" fill="#060e18"/>
<rect x="8" y="6" width="184" height="96" rx="8" fill="#0d2b1a" stroke="#5DCAA5" stroke-width="1.5"/>
<text x="100" y="26" text-anchor="middle" font-family="monospace" font-size="14" font-weight="bold" fill="#5DCAA5">MRS GREN</text>
<text x="18" y="44" font-family="monospace" font-size="8" fill="#9FE1CB">M - Movement</text>
<text x="18" y="57" font-family="monospace" font-size="8" fill="#9FE1CB">R - Respiration</text>
<text x="18" y="70" font-family="monospace" font-size="8" fill="#9FE1CB">S - Sensitivity</text>
<text x="18" y="83" font-family="monospace" font-size="8" fill="#9FE1CB">G - Growth</text>
<text x="108" y="44" font-family="monospace" font-size="8" fill="#9FE1CB">R - Reproduction</text>
<text x="108" y="57" font-family="monospace" font-size="8" fill="#9FE1CB">E - Excretion</text>
<text x="108" y="70" font-family="monospace" font-size="8" fill="#9FE1CB">N - Nutrition</text>
<circle cx="170" cy="84" r="10" fill="#2a0a0a" stroke="#F0997B" stroke-width="1.5"/>
<line x1="170" y1="72" x2="170" y2="68" stroke="#F0997B" stroke-width="1.5"/>
<circle cx="170" cy="66" r="2.5" fill="#F0997B"/>
<text x="100" y="114" text-anchor="middle" font-family="monospace" font-size="8" fill="#5DCAA5">MRS GREN LAB</text>
</svg>''',

    'foodweb_svg': '''<svg viewBox="0 0 200 120" xmlns="http://www.w3.org/2000/svg">
<rect width="200" height="120" fill="#060e18"/>
<rect x="0" y="94" width="200" height="26" fill="#0d1a07"/>
<rect x="10" y="64" width="5" height="30" fill="#3a6010" rx="2"/>
<ellipse cx="12" cy="57" rx="11" ry="10" fill="#1a4005" stroke="#639922" stroke-width="1.5"/>
<text x="12" y="110" text-anchor="middle" font-family="monospace" font-size="6" fill="#97C459">Producer</text>
<line x1="24" y1="82" x2="42" y2="82" stroke="#5DCAA5" stroke-width="1.5" marker-end="url(#fw)"/>
<circle cx="52" cy="80" r="10" fill="#1a3010" stroke="#97C459" stroke-width="1.5"/>
<circle cx="64" cy="80" r="8"  fill="#1a3010" stroke="#97C459" stroke-width="1"/>
<circle cx="74" cy="80" r="6"  fill="#1a3010" stroke="#97C459" stroke-width="1"/>
<text x="60" y="110" text-anchor="middle" font-family="monospace" font-size="6" fill="#97C459">1 Consumer</text>
<line x1="81" y1="80" x2="98" y2="74" stroke="#5DCAA5" stroke-width="1.5" marker-end="url(#fw)"/>
<ellipse cx="113" cy="66" rx="14" ry="9" fill="#2a1a00" stroke="#EF9F27" stroke-width="1.5"/>
<circle cx="126" cy="63" r="6" fill="#3a2a05" stroke="#EF9F27" stroke-width="1.5"/>
<path d="M130 63 L138 60 L133 66Z" fill="#EF9F27"/>
<text x="113" y="88" text-anchor="middle" font-family="monospace" font-size="6" fill="#FAC775">2 Consumer</text>
<line x1="140" y1="60" x2="156" y2="50" stroke="#5DCAA5" stroke-width="1.5" marker-end="url(#fw)"/>
<ellipse cx="172" cy="40" rx="18" ry="12" fill="#1a0808" stroke="#E24B4A" stroke-width="1.5"/>
<circle cx="188" cy="35" r="8" fill="#2a0a0a" stroke="#E24B4A" stroke-width="1.5"/>
<path d="M193 35 L200 31 L196 39Z" fill="#E24B4A"/>
<text x="172" y="62" text-anchor="middle" font-family="monospace" font-size="6" fill="#F09595">3 Consumer</text>
<defs><marker id="fw" viewBox="0 0 10 10" refX="8" refY="5" markerWidth="5" markerHeight="5" orient="auto"><path d="M2 1L8 5L2 9" fill="none" stroke="#5DCAA5" stroke-width="1.5"/></marker></defs>
<text x="100" y="118" text-anchor="middle" font-family="monospace" font-size="8" fill="#5DCAA5">FOOD WEB JUNCTION</text>
</svg>''',

    'eco_svg': '''<svg viewBox="0 0 200 120" xmlns="http://www.w3.org/2000/svg">
<rect width="200" height="120" fill="#060e18"/>
<rect x="0" y="88" width="200" height="32" fill="#0d1a07"/>
<rect x="18" y="58" width="6" height="30" fill="#3a6010" rx="2"/>
<ellipse cx="21" cy="52" rx="14" ry="12" fill="#1a4005" stroke="#639922" stroke-width="1.5"/>
<ellipse cx="21" cy="48" rx="9"  ry="7"  fill="#2a5a08"/>
<circle cx="75" cy="82" r="8"  fill="#1a3010" stroke="#97C459" stroke-width="1.5"/>
<circle cx="89" cy="82" r="7"  fill="#1a3010" stroke="#97C459" stroke-width="1"/>
<circle cx="102" cy="82" r="6"  fill="#1a3010" stroke="#97C459" stroke-width="1"/>
<circle cx="113" cy="79" r="7"  fill="#2a4018" stroke="#97C459" stroke-width="1.5"/>
<ellipse cx="165" cy="62" rx="14" ry="10" fill="#2a1a00" stroke="#EF9F27" stroke-width="1.5"/>
<circle  cx="178" cy="60" r="7" fill="#3a2a05" stroke="#EF9F27" stroke-width="1.5"/>
<path d="M182 60 L190 57 L185 62Z" fill="#EF9F27"/>
<line x1="36" y1="82" x2="64" y2="82" stroke="#5DCAA5" stroke-width="1.5" marker-end="url(#arr)"/>
<line x1="122" y1="75" x2="148" y2="68" stroke="#5DCAA5" stroke-width="1.5" marker-end="url(#arr)"/>
<defs><marker id="arr" viewBox="0 0 10 10" refX="8" refY="5" markerWidth="5" markerHeight="5" orient="auto"><path d="M2 1L8 5L2 9" fill="none" stroke="#5DCAA5" stroke-width="1.5"/></marker></defs>
<text x="100" y="114" text-anchor="middle" font-family="monospace" font-size="9" fill="#9FE1CB">ECOSYSTEM EXIT</text>
</svg>''',
  };
}

