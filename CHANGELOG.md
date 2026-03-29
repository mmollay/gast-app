# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.12.22] - 2026-03-29

### Changed
- **WLAN-Karte**: Icons (Blitz, Signal) vor den Netzwerk-Einträgen entfernt

## [0.12.21] - 2026-03-29

### Changed
- **Deploy**: Production-Deploy auf main — v0.12.20 live auf gastauferden.at
- **Git-Tags**: Tags mit App-Version synchronisiert (war seit v0.8.8 nicht aktuell)

## [0.12.20] - 2026-03-28

### Changed
- **Release**: Versionsbump auf 0.12.20

## [0.12.19] - 2026-03-28

### Fixed
- **Admin-Buttons**: Einheitlicher glasmorphen Pill-Style für alle Admin-Buttons
- **Welcome-Card**: Abstand zum Header reduziert (war zu weit unten)
- **Icon-Ausrichtung**: Icons in Info-Boxen korrekt neben Text ausgerichtet (nicht darüber)

## [0.12.18] - 2026-03-28

### Fixed
- **Kurtaxe Worker-API**: €2,70 wird jetzt korrekt aus der Worker-API geladen und angezeigt

## [0.12.17] - 2026-03-28

### Fixed
- **Kurtaxe-Default**: Standardwert auf €2,70 korrigiert (war €1,50)
- **Welcome-Card**: Abstand zum Header hinzugefügt (Desktop + Mobile)
- **config.js Version**: Versionsnummer wird jetzt korrekt beim Release aktualisiert

## [0.12.9] - 2026-03-27

### Changed
- **WiFi-Button zurück in Quick-Nav**: Wieder sichtbar für eingeloggte Gäste/Admin, versteckt wenn ausgeloggt

## [0.12.8] - 2026-03-27

### Fixed
- **i18n**: Fehlende Übersetzungen ergänzt — `energy.avgCostPerDay`, `transparency.partialPaymentTitle`, `transparency.partialPaymentText` in DE + EN

## [0.12.7] - 2026-03-27

### Changed
- **Admin sieht alle Features**: QuickNav, Wetter, Empfehlungen, Energie, WiFi-Cards jetzt auch für Admin sichtbar (nicht nur für eingeloggte Gäste)
- **WiFi-Button entfernt**: Aus der Quick-Navigation entfernt (unnötig laut Feedback)
- **Admin-Login → updateUI()**: showAdminUI() ruft jetzt updateUI() auf, damit Cards sofort nach Admin-Login erscheinen

## [0.12.6] - 2026-03-27

### Fixed
- **Quick-Nav Buttons**: Jeder Button navigiert jetzt zur richtigen Section — Wetter/Empfehlungen/WiFi → screen-explore + Scroll, Kosten → screen-info (war fälschlicherweise screen-contact)
- **navigateTo()**: Neue Hilfsfunktion kombiniert Tab-Wechsel + smooth-scroll zur Ziel-Section

## [0.12.5] - 2026-03-27

### Changed
- **Admin-Button**: Kompakter und dezenter gestaltet — kleiner, transparent, ohne grünen Hintergrund (nur für internen Gebrauch)

## [0.12.4] - 2026-03-27

### Fixed
- **config.js**: VERSION-String war nach v0.12.3-Commit versehentlich auf v0.12.2 geblieben — jetzt korrekt auf v0.12.3 gesetzt (und direkt auf v0.12.4 gehoben)

## [0.12.3] - 2026-03-27

### Fixed
- **Language-Switcher**: `I18N.setLanguage()` → `I18N.switchLanguage()` — Sprache wechselte nie (falsche Methode aufgerufen)
- **Quick-Nav Buttons**: `scrollToSection()` → `switchTab()` — Wetter/Empfehlungen/WiFi navigieren jetzt zu screen-explore, Kosten zu screen-contact
- **Sprach-Flags**: 🇩🇪 / 🇬🇧 Emojis zu den Dropdown-Buttons hinzugefügt (fehlten trotz vorherigem Commit)

## [0.12.2] - 2026-03-27

### Changed
- **Language-Pill**: Flaggen-Emojis + Text-Labels (🇩🇪 DE / 🇬🇧 EN) statt nur Emojis
- **Language-Pill Active-State**: Deutlicher hervorgehoben (45% white bg, font-weight 600, shadow)
- **Language-Pill Layout**: Flexbox mit Gap für sauberes Flag+Text Alignment
- **Header Spacing**: Abstand zwischen Language-Pill und Login-Button auf 10px erhöht
- Mobile responsive für Language-Pill angepasst

## [0.12.1] - 2026-03-26

### Changed
- **CSS-Extraktion**: ~2450 Zeilen inline `<style>` aus index.html in eigenständige `styles.css` ausgelagert
- **HTML-Cleanup**: 174 inline `style="..."` Attribute durch semantische CSS-Klassen ersetzt
- **Design System**: Konsistente Design Tokens (Farben, Spacing, Radii, Shadows) als CSS Custom Properties
- **Komponenten-Architektur**: Einheitliches Card-System, Info-Grid, Costs-Grid, Coming-Soon-Grid, WiFi-Networks
- **index.html von 3541 auf ~1046 Zeilen reduziert** (−70%)

### Added
- `dashboard/styles.css` — Single Source of Truth für alle visuellen Styles (3094 Zeilen)
- `docs/STYLEGUIDE.md` — Design-System-Dokumentation mit Tokens, Komponenten und Konventionen
- Neue semantische CSS-Klassen: `.costs-content`, `.coming-soon-grid`, `.wifi-network--*`, `.kurtaxe-card`, `.payment-content`, `.footer-content` u.v.m.

### Fixed
- Fehlende CSS-Klassen ergänzt (`.login-instruction`, `.checkbox-group`, `.guest-menu-actions`, `.spinner`)
- Saubere Trennung von HTML (Struktur), CSS (Design) und JS (Logik)

## [0.12.0] - 2025-02-01

### Added
- **Admin-Panel Mobile Bottom Navigation**: Neue Tab-Bar für Mobile mit 5 Tabs (Dashboard, Gäste, Apartments, Features, Settings)
- Gleiche Navigation wie Hauptseite, nur für Admin-Bereich angepasst

### Changed
- **Admin Header Mobile optimiert**: Kompakterer Header mit Icon-Buttons statt Text-Buttons auf Mobile
- **Durchschnittswert-Anzeige rechtsbündig**: Energy-Info-Bar ist jetzt rechtsbündig für dezentere Darstellung
- Desktop Tab-Navigation wird auf Mobile durch Bottom-Nav ersetzt

### Fixed
- Buttons im Admin-Header haben nun konsistenten Abstand
- Mobile Admin-Bereich hat nun gleiche UX wie die Hauptseite

## [0.8.0] - 2026-01-27

### Added
- Mobile Footer Navigation fixiert am unteren Rand
- "Angemeldet bleiben" Checkbox für Gast-Login
- Basic Auth Middleware für develop.gastauferden.at

### Changed
- Mobile Header Optimierung: Kompakter App-Style
- Footer-Navigation bleibt fixiert beim Scrollen
- Performance-Verbesserungen

## [0.7.0] - 2026-01-26

### Added
- Mobile UI Improvements
- Kompaktere Darstellung auf Smartphones
- Deploy Scripts verbessert

### Fixed
- Dashboard Pfad korrigiert (dashboard/ statt dist/)

## [0.6.0] - 2026-01-26

### Changed
- Admin UI komplett überarbeitet
- Performance-Optimierungen: Bilder, API-Calls, Caching
- Skeleton Loading für bessere UX
- Empfehlungen: Kategorie-Persistenz, Heurige-Kategorie

## [0.5.5] - 2026-01-25

### Added
- Vollständige Mehrsprachigkeit (i18n) für alle Komponenten

## [0.5.4] - 2026-01-25

### Fixed
- Geocoding Warnungen unterdrückt

## [0.5.3] - 2026-01-25

### Fixed
- Z-index für klickbare Quick-Nav Buttons

## [0.5.2] - 2026-01-25

### Fixed
- Header scrollt jetzt normal mit (kein Flimmern mehr)
- Quick-Nav Buttons immer sichtbar
- Welcome-Card z-index korrigiert
- Energy API: FOREIGN KEY Constraint korrigiert
- Worker: Tabellen-Referenz korrigiert

### Changed
- Collapsed Header-Funktion entfernt

## [0.4.0] - 2026-01-24

### Added
- **Internationalization (i18n)**: Full bilingual support (German/English)
  - German default at `/`
  - English version at `/en/`
  - Language switcher with flag buttons (🇩🇪/🇬🇧) in header
  - JSON translation files
  - Locale-aware date/time formatting
