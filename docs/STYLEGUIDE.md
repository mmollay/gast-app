# Gast auf Erden — Styleguide

Design-System und Komponenten-Referenz für das Guest Portal.
Alle Styles liegen in **`dashboard/styles.css`** (Single Source of Truth).

---

## 1. Design Tokens

### Farben

| Token | Wert | Verwendung |
|-------|------|------------|
| `--cream` | `#FAF8F5` | Seiten-Hintergrund |
| `--warm-white` | `#FFFEFB` | Card-Hintergrund |
| `--sand` | `#E8E2D9` | Borders, dezente Trennlinien |
| `--sage` | `#9CAF88` | Primärfarbe (Buttons, Badges, Akzente) |
| `--sage-light` | `#B8C9A9` | Hover-States, helle Akzente |
| `--sage-dark` | `#7A9168` | Active-States, stärkere Akzente |
| `--forest` | `#2D4A3E` | Header-Hintergrund, starke Kontraste |
| `--earth` | `#8B7355` | Sekundärfarbe (Erde/Natur-Thema) |
| `--earth-light` | `#A69076` | Helle Earth-Variante |
| `--rose` | `#D4A5A5` | Akzentfarbe (warm) |
| `--rose-light` | `#E8C4C4` | Helle Rose-Variante |
| `--sky` | `#A7C5D4` | Akzentfarbe (kühl) |
| `--text` | `#3D3D3D` | Standard-Textfarbe |
| `--text-light` | `#6B6B6B` | Sekundärer Text |
| `--text-muted` | `#9A9A9A` | Muted/Placeholder-Text |

### Spacing (4px-Basis)

| Token | Wert | Verwendung |
|-------|------|------------|
| `--space-1` | `4px` | Minimaler Abstand |
| `--space-2` | `8px` | Icon-Gaps, kleine Paddings |
| `--space-3` | `12px` | Label-Abstände |
| `--space-4` | `16px` | Standard-Padding |
| `--space-5` | `20px` | Card-Padding (innen) |
| `--space-6` | `24px` | Section-Padding |
| `--space-7` | `28px` | Größere Abstände |
| `--space-8` | `32px` | Section-Gaps |
| `--space-10` | `40px` | Große Abstände |
| `--space-12` | `48px` | Maximaler Abstand |

### Border Radius

| Token | Wert | Verwendung |
|-------|------|------------|
| `--radius-sm` | `8px` | Icons, kleine Elemente |
| `--radius-md` | `12px` | Buttons, Inputs |
| `--radius-lg` | `16px` | Cards |
| `--radius-xl` | `24px` | Pills, Badges |

### Schatten

| Token | Wert | Verwendung |
|-------|------|------------|
| `--shadow-sm` | `0 2px 8px rgba(0,0,0,0.04)` | Subtile Tiefe (Info-Items) |
| `--shadow-md` | `0 4px 20px rgba(0,0,0,0.04)` | Standard-Cards |
| `--shadow-lg` | `0 8px 32px rgba(0,0,0,0.12)` | Modals, Dropdowns |
| `--shadow-hover` | `0 8px 24px rgba(0,0,0,0.06)` | Hover-Effekte |

---

## 2. Typografie

- **Font:** DM Sans (Google Fonts)
- **Body:** 400 weight, 1.7 line-height, 0.02em letter-spacing
- **Headings (Card-Titel):** 600 weight, 1rem
- **Subtitles:** 400 weight, 0.85rem, `--text-light`
- **Labels:** 500 weight, 0.7rem, uppercase, 1px letter-spacing

---

## 3. Komponenten

### 3.1 Card (Basis-Komponente)

Die wichtigste wiederverwendbare Komponente. Alle Sektionen nutzen `.card`.

```html
<div class="card">
    <div class="card-header">
        <div class="card-icon">
            <i data-lucide="icon-name"></i>
        </div>
        <div>
            <h2 class="card-title" data-i18n="key">Titel</h2>
            <p class="card-subtitle" data-i18n="key">Untertitel</p>
        </div>
    </div>
    <!-- Card-Inhalt -->
</div>
```

**Varianten:**

| Klasse | Effekt |
|--------|--------|
| `.card--gradient` | Leichter Sage-Gradient-Hintergrund |
| `.card--nature` | Forest-Gradient-Hintergrund mit weißem Text |
| `.card-icon--forest` | Forest-farbenes Icon-Badge |

### 3.2 Info Grid

Kompakte Darstellung von Key-Value-Paaren (Check-in/out, Gästeanzahl etc.).

```html
<div class="info-grid">
    <div class="info-item">
        <div class="icon"><i data-lucide="calendar"></i></div>
        <div class="label" data-i18n="key">Label</div>
        <div class="value" id="some-id">Wert</div>
    </div>
    <!-- Weitere Items -->
</div>
```

- Grid: `repeat(auto-fit, minmax(140px, 1fr))`
- Hover: translateY(-2px) + shadow-hover

### 3.3 Costs Overview

Strukturierte Kostenaufstellung mit Sektionen.

```html
<div class="costs-content">
    <div class="costs-section">
        <div class="costs-section-header">
            <i data-lucide="icon"></i> <span>Titel</span>
        </div>
        <div class="costs-grid">
            <div class="cost-item">
                <i data-lucide="icon"></i>
                <span>Bezeichnung</span>
                <strong id="value-id">Wert</strong>
            </div>
        </div>
    </div>
    <div class="costs-note">
        <i data-lucide="info"></i>
        <p>Hinweistext</p>
    </div>
</div>
```

### 3.4 Amenities Grid

Icon-basierte Feature-Darstellung.

```html
<div class="amenities-grid">
    <div class="amenity">
        <div class="amenity-icon">
            <i data-lucide="wifi"></i>
        </div>
        <div class="amenity-text">
            <h4>Feature</h4>
            <p>Beschreibung</p>
        </div>
    </div>
</div>
```

- Grid: `repeat(auto-fill, minmax(280px, 1fr))`
- Icon: 48×48px, sage-light Background, radius-md

### 3.5 Coming Soon

Projekt-/Feature-Vorschau mit Status-Badges.

```html
<div class="coming-soon-grid">
    <div class="coming-soon-item">
        <div class="coming-soon-header">
            <div class="coming-soon-icon coming-soon-icon--earth">
                <i data-lucide="icon"></i>
            </div>
            <div>
                <h4>Titel</h4>
                <p>Beschreibung</p>
            </div>
        </div>
        <span class="coming-soon-badge coming-soon-badge--building">Status</span>
    </div>
</div>
```

**Icon-Farben:** `--earth`, `--rose`, `--sky`, `--sage`
**Badge-Varianten:** `--building` (earth), `--soon` (sage), `--available` (forest)

### 3.6 WiFi Card

Netzwerk-Darstellung mit QR-Code.

```html
<div class="wifi-network wifi-network--primary">
    <div class="wifi-network-inner">
        <div class="wifi-network-icon wifi-network-icon--primary">
            <i data-lucide="wifi"></i>
        </div>
        <div class="wifi-network-info">
            <span class="wifi-badge">Primär</span>
            <div class="wifi-network-name wifi-network-name--primary">SSID</div>
            <div class="wifi-password">
                <span id="pw-id">••••••</span>
                <button>Toggle</button>
            </div>
        </div>
    </div>
</div>
<div class="wifi-qr-panel">
    <canvas id="qr-code"></canvas>
</div>
```

**Varianten:** `--primary` (sage-Akzent), `--secondary` (earth-Akzent)

### 3.7 Kurtaxe Card

Preis-Darstellung mit Berechnung.

```html
<div class="kurtaxe-card">
    <div class="kurtaxe-content">
        <div class="kurtaxe-header">
            <i data-lucide="landmark"></i>
            <h3>Kurtaxe</h3>
        </div>
        <p class="kurtaxe-description">Beschreibung</p>
        <div class="kurtaxe-price">
            <span class="kurtaxe-amount">€2,50</span>
            <span class="kurtaxe-unit">/ Person / Nacht</span>
        </div>
        <div class="kurtaxe-calculation">
            <div class="cost-item">...</div>
        </div>
    </div>
</div>
```

### 3.8 Payment / Transparenz

Bankverbindung mit Copy-Buttons.

```html
<div class="payment-content">
    <p class="payment-intro">Einleitungstext</p>
    <div class="bank-details">
        <div class="bank-detail-row">
            <span class="bank-label">IBAN</span>
            <div class="bank-value-group">
                <span class="bank-value" id="iban">AT12 3456 ...</span>
                <button class="copy-btn-inline">
                    <i data-lucide="copy"></i>
                </button>
            </div>
        </div>
    </div>
    <div class="info-notice">
        <i data-lucide="info"></i>
        <p>Hinweis</p>
    </div>
</div>
```

### 3.9 Buttons

```html
<button class="btn btn-primary">Primär</button>
<button class="btn btn-secondary">Sekundär</button>
<button class="btn btn-danger">Gefahr</button>
```

| Klasse | Hintergrund | Verwendung |
|--------|-------------|------------|
| `.btn-primary` | `--sage` | Hauptaktionen |
| `.btn-secondary` | `--sand` | Sekundäre Aktionen |
| `.btn-danger` | `#D32F2F` | Löschen, Logout |

### 3.10 Modals

```html
<div class="modal-overlay" id="modal-id">
    <div class="modal">
        <h2>Titel</h2>
        <!-- Inhalt -->
    </div>
</div>
```

- Aktivierung: `.modal-overlay.active`
- Backdrop: `rgba(0,0,0,0.5)` + blur(4px)

### 3.11 Forms

```html
<div class="form-group">
    <label>Label</label>
    <input type="text" placeholder="...">
    <span class="input-hint">Hinweis</span>
</div>
```

---

## 4. Layout-Patterns

### Header
- Forest-Gradient mit Background-Image
- Sticky behavior via JS (scroll-Klassen)
- User-Dropdown oben rechts (`.header-actions`)
- Quick-Navigation darunter (`.quick-nav`)

### Main Content
- Max-width: 800px, zentriert
- Padding: `var(--space-5)` horizontal, `var(--space-8)` vertikal
- Cards mit `gap: var(--space-6)` (24px)

### Footer
- Zentriert, `--text-muted`
- Links-Reihe mit Separatoren
- Admin-Link + Meta-Zeile

### Mobile Bottom Navigation
- Fixed am unteren Bildschirmrand
- 5 Tab-Items mit Icons + Labels
- `padding-bottom: env(safe-area-inset-bottom)` für iPhone

---

## 5. Responsive Breakpoints

| Breakpoint | Ziel | Wichtigste Änderungen |
|------------|------|----------------------|
| `≥ 1024px` | Desktop | — (Basis-Layout) |
| `768px – 1023px` | Tablet | Kleinere Fonts, kompaktere Paddings |
| `≤ 640px` | Mobile | 1-Column-Grids, kleinere Cards, Bottom-Nav sichtbar |
| `≥ 641px` | Desktop+ | Bottom-Nav ausgeblendet |

---

## 6. Icons

- **Library:** Lucide Icons (CDN)
- **Einbindung:** `<i data-lucide="icon-name"></i>`, initialisiert via `lucide.createIcons()`
- **Standard-Größe:** 18–20px in Cards, 24px in Headers
- **Farbe:** Erbt von Parent oder explizit via CSS

---

## 7. Animationen

- **Transitions:** `0.3s ease` als Standard
- **Hover-Effekte:** `translateY(-2px)` + Shadow-Erhöhung
- **Skeleton Loading:** Pulse-Animation (`@keyframes pulse`)
- **Spinner:** Rotate-Animation (`@keyframes spin`)
- **Modal:** Fade-in via opacity + backdrop-filter

---

## 8. Konventionen

### Namensgebung
- **BEM-inspiriert:** `.card`, `.card-header`, `.card-icon`, `.card--variant`
- **Modifier mit Doppel-Dash:** `.card--nature`, `.wifi-network--primary`
- **Icon-Farb-Modifier:** `.coming-soon-icon--earth`, `--rose`, `--sky`, `--sage`
- **Status-Modifier:** `.coming-soon-badge--building`, `--soon`, `--available`

### Regeln
1. **Keine inline Styles** — Ausnahme: `display: none` für JS-gesteuerte Sichtbarkeit
2. **Design Tokens verwenden** — Keine hardcodierten Farben/Abstände
3. **Semantische Klassen** — Beschreiben *was*, nicht *wie* (`.costs-grid` statt `.grid-3-cols`)
4. **Mobile-first** — Basis-Styles für Mobile, Breakpoints erweitern nach oben
5. **Konsistente Abstände** — Immer `--space-*` Tokens verwenden
6. **Card als Container** — Jede Sektion ist eine `.card` mit `.card-header`

### Neue Sektion hinzufügen
1. `.card` als Container verwenden
2. `.card-header` mit Icon + Titel + Subtitle
3. Eigene Content-Klasse erstellen (z.B. `.new-section-content`)
4. Grid-Pattern von `.info-grid` oder `.costs-grid` wiederverwenden
5. Styles in `styles.css` unter neuer Section-Kommentar einfügen
6. i18n-Keys in `i18n/de.json` und `i18n/en.json` ergänzen

---

## 9. Dateistruktur

```
dashboard/
├── styles.css           ← Alle visuellen Styles (Design System)
├── admin-ui.css         ← Admin-Panel Styles (separiert)
├── inline-editor.css    ← WYSIWYG-Editor Styles (separiert)
├── ssi-builders.css     ← Tailwind CSS v4 (verfügbar, kaum genutzt)
├── index.html           ← Haupt-HTML (keine inline Styles)
├── app.js               ← Hauptlogik
├── admin-ui.js          ← Admin-Interface
├── inline-editor.js     ← Content-Editor
├── i18n.js              ← Internationalisierung
├── config.js            ← Konfiguration
└── i18n/
    ├── de.json          ← Deutsche Übersetzungen
    └── en.json          ← Englische Übersetzungen
```
