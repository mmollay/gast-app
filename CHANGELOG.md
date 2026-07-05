# Changelog

## v0.12.84 — 2026-07-05

- **Browser-Cache-Bug behoben (Ursache für "Fix kommt nicht an" nach Deploys):** `styles.css` wurde mit einem fest einprogrammierten Cache-Bust-Parameter (`?v=1774640082`) geladen, der nie hochgezählt wurde. Cloudflare Pages cached CSS/JS standardmäßig 4h (`max-age=14400`) — Browser haben in diesem Fenster nie nachgefragt, ein CF-Cache-Purge half nichts gegen den lokalen Browser-Cache. Neue `_headers`-Datei setzt `Cache-Control: no-cache` für alle `*.css`/`*.js` → Browser revalidieren ab sofort bei jedem Laden per ETag (schnell, aber immer aktuell). `?v=` in `index.html` zusätzlich einmalig hochgezählt, damit der Fix sofort greift statt erst beim nächsten Cache-Ablauf.

## v0.12.83 — 2026-07-05

- **Gast-Header-Buttonleiste tatsächlich fixiert (Root-Cause-Fix):** Die Leiste (Dashboard/Bearbeiten/DE-EN/Profil) lag im HTML innerhalb von `<header>`, welches ein `transform`/`will-change: transform` hat — das erzeugt laut CSS-Spec einen eigenen "containing block" für `position: fixed`-Kinder, wodurch die Leiste trotz `position: fixed !important` nur relativ zum Header (nicht zum Viewport) fixiert war und beim Scrollen mitwanderte. Leiste liegt jetzt als Sibling außerhalb von `<header>` im DOM und ist auf allen Bildschirmgrößen (nicht mehr nur <640px) wirklich fixiert.
- **Zu viel Leerraum unter der Buttonleiste reduziert:** Header-Top-Padding auf Mobile von App-Bar-Höhe + 24px auf + 12px Luft verkleinert, doppelte/widersprüchliche `.header`-Padding-Regeln zusammengeführt.

## v0.12.82 — 2026-07-05

- **Gast-Header (Mobile) neu ausgerichtet** — gleicher App-Bar-Fix wie im Admin-Bereich: Button-Leiste (Dashboard/Bearbeiten/DE-EN/Profil) ist jetzt fixiert (bleibt beim Scrollen bedienbar), hat definierte App-Bar-Höhe (safe-area + 56px) und dunklen Hintergrund für Lesbarkeit über hellem Content
- Header-Top-Padding auf App-Bar-Höhe + 24px Luft abgestimmt, damit der Header nicht mehr am Logo klebt

## v0.12.81 — 2026-07-05

- **Admin-Header (Mobile) neu ausgerichtet:** Zurück-/Abmelden-Leiste hat jetzt eine definierte App-Bar-Höhe (safe-area + 56px) mit vertikal zentrierten Buttons — behebt zu großen Abstand oben, zu knappen Abstand zum Logo und Asymmetrie zwischen Zurück- und Abmelden-Button
- Header-Top-Padding auf die neue App-Bar-Höhe + 24px Luft abgestimmt, damit das Logo nicht mehr an der Button-Leiste klebt

## v0.12.80 — 2026-07-05

- **Admin-Bereich (Mobile) – seitliches Scrollen behoben:** `overflow-x: hidden` auf html/body + tote, kollidierende `.logout-btn`-Positionsregel entfernt
- **Admin-Header fixiert:** Zurück-/Abmelden-Buttons bleiben jetzt beim Scrollen sichtbar und bedienbar (vorher nur oben in der Hero-Grafik erreichbar); Buttons haben jetzt eigenen dunklen Kontrast-Hintergrund, damit sie über hellem und dunklem Content lesbar bleiben
- **Admin Bottom-Nav kompakter:** weniger Padding/Höhe, spart Platz nach unten (analog zur Hauptseite)

## v0.12.79 — 2026-07-05

- **Header-Abstand (Mobile):** Mehr Luft zwischen Logo und Titelzeile — der Titel klebte zu nah am Logo. Logo-Abstand nach unten von 16px auf 24px erhöht.

## v0.12.78 — 2026-07-05

- **Header aufgeräumt (Mobile):** Admin-/Bearbeiten-Buttons sind jetzt runde Icon-Buttons statt Text-Pills — keine überfüllte, schwer tippbare Button-Reihe mehr neben Sprachumschalter und Profil-Menü
- **Hintergrund verschönert:** Hero-Header hat jetzt einen weicheren, hochwertigeren Verlauf (Radial-Glow + mehrstufiger Farbverlauf) statt des flachen zweifarbigen Overlays
- **Bottom-Nav kompakter:** Untere Navigationsleiste ist schlanker (weniger Padding/Höhe), spart vertikalen Platz für den Content

## v0.12.76 — 2026-06-03

- **Fix Airbnb-Import:** „Import starten"-Button war deaktiviert ohne Rückmeldung — wirkte wie „nichts passiert"
- Button ist jetzt immer klickbar und gibt in jedem Fall eine klare Meldung:
  - keine Datei gewählt → Hinweis zum CSV-Auswählen
  - keine auswertbaren Buchungen → Hinweis
  - alle Buchungen bereits importiert → Hinweis statt stillem Nichts
- Live im Browser verifiziert (Playwright)

## v0.12.75 — 2026-06-03

- **Airbnb CSV-Import** im Admin-Panel (Gäste-Tab): Reservierungs-Export von Airbnb direkt hochladen
- Vorschau vor dem Import zeigt je Buchung `neu`/`vorhanden`, Anreise/Abreise, Personen, Code, Apartment
- Nur bestätigte Buchungen werden übernommen, Duplikate (Code oder Name+Zeitraum) werden übersprungen
- RFC4180-CSV-Parser (Zeilenumbrüche in Feldern), deutsches Datumsformat `D.M.YYYY → YYYY-MM-DD`, Betrag `€ x,xx`
- Spalten-Erkennung per Name (DE+EN), robust gegen Format-Änderungen
- Automatisches Apartment-Matching aus dem Inserat-Feld
- Läuft über bestehenden `/bot-guest`-Endpoint (Admin-Token, kein Import-Secret im Frontend)

## v0.12.73 — 2026-04-12

- version bump

## v0.12.72 — 2026-04-12

- Seitenumbruch vor "Gut zu wissen" Section im Willkommens-Handout
- Abstand (margin-top/padding-top) über "Gut zu wissen" erhöht für saubere 2-seitige Ausgabe

## v0.12.72 — 2026-04-12
- fix: Seitenumbruch vor 'Gut zu wissen' Section — saubere 2-seitige Ausgabe
- fix: Abstand oben in 'Gut zu wissen' Section erhöht (margin-top: 40px)

## v0.12.71 — 2026-04-12
- feat: version bump

## v0.12.70 — 2026-04-12
- fix: Kurtaxe-Zeile aus Leistungen-Tabelle im Abschlussprotokoll entfernt (steht bereits in Gut zu wissen)

## v0.12.68 — 2026-04-12

- feat: "Aufenthaltsbeleg" als neue Bezeichnung für das Abschluss-Dokument

## v0.12.67 — 2026-04-12

- fix: force CF Pages file hash change (cache-bust c) to ensure fresh deploy

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.12.66] - 2026-04-12

### Fixed
- **Deploy**: Cloudflare Pages Cache-Bust erzwungen — Build-Tag in config.js aktualisiert um CDN-Caching zu umgehen

## [0.12.65] - 2026-04-12

### Changed
- **Kurtaxe**: Kurtaxe-Karte auf screen-home verschoben — für Gäste sofort beim ersten Tab sichtbar
- **Transparenz-Text**: Energiekosten-Referenz aus i18n-Schlüssel `transparency.info` entfernt (DE + EN)
- **Admin**: Strom-Paper aus Protokoll entfernt

## [0.12.64] - 2026-04-06

### Added
- **Admin Gäste-Tab**: API-Info-Box mit Endpoint-Dokumentation
- **Gästeliste**: POST /bot-guest Endpoint + apartmentId-Fix in /airbnb-import

### Changed
- **Gästeliste**: Abgelaufene Gäste standardmäßig ausgeblendet, Toggle-Button "Vergangene"

## [0.12.63] - 2026-04-02

### Changed
- **Gäste-Portal**: Heizkostenzuschuss-Karte und Info-Bar erst ab €5,00 Gesamtkosten sichtbar — darunter ausgeblendet

## [0.12.62] - 2026-04-02

### Changed
- **Handout PDF**: Beide Seiten Hochformat (kein Querformat mehr) — sauberes Wenden, Newsletter über volle Breite mit E-Mail-Zeile inline

## [0.12.61] - 2026-04-02

### Changed
- **Aufenthaltsbeleg**: Hinweiszeile "Stromverbrauch inkludiert" ersetzt durch "Zusatzheizkosten werden gegebenenfalls im Nachhinein verrechnet" (dezent kursiv, grau)

## [0.12.60] - 2026-04-02

### Fixed
- **Kontaktseite**: Google Maps Embed — Adress-Query ohne Sonderzeichen für zuverlässigen Marker-Pin

## [0.12.59] - 2026-04-02

### Fixed
- **Handout PDF**: "Gut zu wissen" von Seite 1 auf Landscape-Rückseite verschoben — PDF ist jetzt exakt 2 Seiten (Hochformat + Querformat zum Wenden)

## [0.12.58] - 2026-04-02

### Fixed
- **Kontaktseite**: Google Maps Marker nun sichtbar — Koordinaten (47.598, 16.272) statt Adresssuche, damit der Pin korrekt angezeigt wird

## [0.12.57] - 2026-04-02

### Fixed
- **Kontaktseite**: Google Maps Embed auf korrekte Adresse Ausstraße 33, 2812 Hollenthon korrigiert (statt falscher Placeholder-Koordinaten)

## [0.12.56] - 2026-04-02

### Changed
- **Protokoll-Logik**: Dokument passt sich automatisch an — Stromkosten unter €5,00 → "Aufenthaltsbeleg" ohne Stromzeile (für Check-in); ab €5,00 → "Abschlussprotokoll" mit Stromkosten (für Checkout)
## [0.12.55] - 2026-03-29

### Changed
- **Hintergrundbild**: Echtes Foto (Pexels, free) — rollende grüne Hügel mit warmem Abendgoldlicht, ersetzt SVG-generiertes Bild; Gradient-Overlay angepasst

## [0.12.54] - 2026-03-29

### Changed
- **Hintergrundbild**: Neues SVG-Hintergrundbild — sanfte grüne Hügellandschaft mit Baumsilhouetten, warmem Lichtschein und dezenten Naturdetails (ersetzt header-bg.jpg durch header-bg.svg)
- **Gradient-Overlay**: Leichter (0.35 statt 0.7 Opacity) damit die Landschaft mehr durchscheint

## [0.12.53] - 2026-03-29

### Changed
- **Handout PDF**: Kompakteres Layout für 2 Seiten — kleinere Schrift, engere Abstände, weniger Padding überall
- **Handout PDF**: Quick-Info (Check-in/out, Personen, Nächte) jetzt 4-spaltig in einer Zeile statt 2×2
- **Handout PDF**: Newsletter-Box am Ende — gestrichelter Rahmen, Mail-Icon, Eintragzeile für E-Mail (DE+EN)

## [0.12.52] - 2026-03-29

### Fixed
- **Handout PDF**: Seitenumbrüche — alle Sektionen haben `page-break-inside: avoid`, kein Abschnitt wird mehr mittendrin getrennt
- **Handout PDF**: Expliziter Seitenumbruch vor der Abreise-Sektion für saubere 2–3-seitige Aufteilung

## [0.12.51] - 2026-03-29

### Added
- **Handout PDF**: Müllentsorgung (Straße: Restmüll, Garage: Plastik/Papier/Glas) und Waschmaschine (Garage, braune Türe) in "Gut zu wissen"
- **Handout PDF**: Neue Abreise-Sektion mit Schlüssel, Fenster schließen und Handtücher
- **Handout PDF**: Gruppen-bewusste Begrüßung — bei mehreren Personen "Liebe Gäste / schön dass ihr da seid" statt einzelner Name
- **Handout PDF**: App-Hinweis erwähnt jetzt lokale Ausflugsziele (DE+EN)

## [0.12.50] - 2026-03-29

### Fixed
- **Handout PDF**: Ränder deutlich reduziert — A4-Fläche wird besser genutzt (padding, @page margin, max-width auf 720px erhöht)

## [0.12.49] - 2026-03-29

### Fixed
- **Handout PDF**: Alle Emojis durch Lucide Icons ersetzt (wifi, lock, key-round, car, cigarette-off, receipt, smartphone, paw-print, etc.)
- **Gästeliste**: Passwort nun sichtbar unter dem Username in der Login-Spalte (Admin-Bereich)

## [0.12.48] - 2026-03-29

### Added
- **Willkommens-Handout**: Personalisiertes PDF pro Gast mit WLAN, App-Login, Check-in/out, Hausregeln, Kontakt und Haustier-Hinweis (DE/EN, direkt druckbar)
- **Auto-Username**: Beim Anlegen eines Gastes wird Vorname als Username vorgeschlagen (Duplikate erhalten Zahl)
- **Auto-Passwort**: Einfaches Passwort wird automatisch generiert (z.B. "Wald42")
- **Haustier-Anzeige**: 🐕 und 🐾 in der Gästeliste wenn Haustiere dabei sind

## [0.12.47] - 2026-03-29

### Fixed
- **User-Dropdown**: dropdown-divider aus Admin-Section entfernt — CSS border-bottom übernimmt die Trennung, keine doppelte Linie mehr

## [0.12.46] - 2026-03-29

### Fixed
- **User-Dropdown**: Doppelte Trennlinie zwischen "Bearbeiten" und "Abmelden" entfernt
- **config.js**: Versionsbump auf v0.12.45 nachgeholt (war fälschlicherweise noch v0.12.44)

## [0.12.45] - 2026-03-29

### Added
- **CSV Import**: Alle Airbnb-Buchungen aus CSV importiert (9 Gäste, vollständige Daten)
- **Haustiere**: Neues Feld `hasDog` + `numberOfPets` pro Gast — direkt aus Airbnb-PDF ausgelesen (7 von 9 Gästen mit Haustieren)
- **Erweitertes Gast-Model**: Kontakt, Erwachsene/Kinder/Kleinkinder separat, Buchungsdatum, Einkünfte
- **Worker**: Import-Endpunkt, createGuest und updateGuest unterstützen alle neuen Felder

## [0.12.44] - 2026-03-29

### Added
- **Airbnb Import**: Worker-Endpunkt `/airbnb-import` — Airbnb-Buchungen automatisch aus Gmail-Bestätigungsemails importieren
- **Airbnb Import**: Duplikat-Erkennung per Bestätigungs-Code oder Name+Datum
- **Airbnb Import**: Auto-Generierung von Benutzername (vorname.nachname + 3-stellige Nummer) und Passwort

## [0.12.43] - 2026-03-29

### Fixed
- Button 'Neuen Gast anlegen': Icon und Text in eine Zeile (inline-flex, gap, white-space: nowrap)

## [0.12.42] - 2026-03-29

### Fixed
- Protokoll: Logo auf logo-neu.png vereinheitlicht, about:blank durch Blob-URL ersetzt, Footer mit www.gastauferden.at Branding

## [0.12.41] - 2026-03-29

### Fixed
- updateUI Guard gegen undefined status — verhindert Crash beim Admin-Login (TypeError: Cannot read properties of undefined)

## [0.12.40] - 2026-03-29

### Fixed
- Abschlussprotokoll: Unterschriften entfernt, Schriftart auf Inter (sauber, modern), Druck ohne Browser-Header/Footer via @page margin

## [0.12.39] - 2026-03-29

### Changed
- Versionsbump nach Production-Deploy

## [0.12.38] - 2026-03-29

### Fixed
- Originales Logo (logo-neu.png) wiederhergestellt — fälschlicherweise durch neues SVG ersetzt

## [0.12.37] - 2026-03-29

### Changed
- Versionsbump nach Production-Deploy

## [0.12.36] - 2026-03-29

### Fixed
- **Admin Login**: `SyntaxError: Unexpected end of input` — `</script>` im printProtocol-Template-Literal hat den JS-Parser abgebrochen; als `<\/script>` escaped

## [0.12.35] - 2026-03-29

### Changed
- Versionsbump nach Production-Deploy

## [0.12.34] - 2026-03-29

### Added
- **Logo neu**: SVG-Logo mit Haus-Illustration, Bäumen, "Gast auf Erden" Serif-Schriftzug und "HOLLENTHON" — ersetzt generisches Icon
- Logo wird auf Startseite und im Abschlussprotokoll verwendet

## [0.12.33] - 2026-03-29

### Changed
- Versionsbump nach Production-Deploy

## [0.12.32] - 2026-03-29

### Changed
- **Abschlussprotokoll**: Komplett neu gestaltet — Logo, Gast auf Erden Design, Dankestext, Unterschriftszeilen
- **Abschlussprotokoll**: DE/EN-Umschalter zum Ausdrucken in Deutsch oder Englisch
- **Abschlussprotokoll**: Stromkosten werden jetzt korrekt angezeigt (Energie-Query bis heute für aktive Gäste)

## [0.12.31] - 2026-03-29

### Changed
- Versionsbump nach Production-Deploy

## [0.12.30] - 2026-03-29

### Changed
- **Admin Gästeliste**: Kompakte Tabellenansicht (eine Zeile pro Gast) statt Einzelkarten
- **Energiedaten**: Feldname-Bug behoben (`totalEnergy` statt `total_kwh`) — Strom wird jetzt korrekt angezeigt
- **Aktive Gäste**: Energieabfrage bis heute statt bis zukünftigem Checkout
- **Suche**: filterGuests() auf neue Tabellenstruktur angepasst

## [0.12.29] - 2026-03-29

### Changed
- **Admin Gästeliste**: Tabellarisches Layout statt Inline-Spans — Zeitraum, Personen, Kurtaxe, Strom klar strukturiert
- **Stromverbrauch**: Live-Abfrage per Gast aus API (`/energy/range`) mit kWh + €-Kosten
- **Status-Badge**: Aktiv/Abgeschlossen direkt beim Gastnamen sichtbar

## [0.12.28] - 2026-03-29

### Added
- **Abschlussprotokoll**: Drucker-Button pro Gast — öffnet druckfähiges Protokoll mit Kurtaxe, Stromkosten und Zahlungsinfos

### Fixed
- **"Wird erfasst..."**: Irreführenden Text in Gästeliste entfernt

## [0.12.27] - 2026-03-29

### Changed
- **Sprachauswahl**: Zurück in den Header als schlanke DE/EN Pill (für Gäste sofort sichtbar)
- **Dropdown**: Sprachsektion entfernt — Sprachwahl nur noch im Header

## [0.12.26] - 2026-03-29

### Changed
- **Sprachauswahl**: Header-Pill entfernt, Sprache nur noch im Dropdown-Menü
- **Dropdown-Menü**: Flaggen und DE/EN-Badges entfernt — schlichte "Deutsch"/"English" Buttons
- **CSS-Cleanup**: ~120 Zeilen ungenutzter Language-Switcher-Styles entfernt

## [0.12.25] - 2026-03-29

### Added
- **Airbnb-Buchungslink**: Button in Welcome-Card für nicht eingeloggte Besucher (DE/EN)

## [0.12.24] - 2026-03-29

### Fixed
- **Welcome-Card**: Grüner Akzentstreifen entfernt (war optisch störend)

## [0.12.23] - 2026-03-29

### Changed
- **Umkreissuche**: Standard von 40 km auf 20 km reduziert
- **Welcome-Card**: Dezenter Gradient-Akzentstreifen oben (forest → sage)
- **Cards**: Sanfter Hover-Shadow-Effekt auf allen Cards
- **Info-Icons**: Icons in kreisförmigen Containern (konsistent mit Card-Icons)
- **Kosten-Übersicht**: Fehlenden Padding-Top ergänzt

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
