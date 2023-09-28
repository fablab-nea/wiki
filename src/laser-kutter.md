# LaserKutter

## Benutzung eines Lasercutters

### Schneiden
Zum Schneiden wird eine [Vektorgrafik](https://de.wikipedia.org/wiki/Vektorgrafik) benötigt. Es werden u.A. folgende Formate unterstützt:
- SVG (`*.svg`)
- DXF (`*.dxf`)
- PDF (`*.pdf`)
- Adobe Illustrator (`*.ai`)
- HPGL (`*.hpgl`, `*.plt`)

Zum erstellen einer neuen Datei oder zum bearbeiten einer bestehenden kann [Inkscape](https://inkscape.org/) verwedet werden (zu finden unter `Anwendungen`→ `Grafik`→ `Inkscape`)

### Gravieren
Zum Gravieren reicht eine Bitmap-Grafik, eine Vektorgrafik kann natürlich auch verwendet werden.

## Lasercutter einschalten
1. Klappe öffnen
2. Hauptschalter einschalten
3. Schlüsselschalter drehen, die grüne Kontrolleuchte sollte nun leuchten
4. sich vergewissern, dass sich nichts im Bewegungsbereich befindet und ggf. den Tisch mit Hilfe des Drucktasters absenken
5. Alle Achsen homen (über die [Weboberfläche](http://laserkutter.lab.fablab-nea.de/) oder am Gerät über das Display)


## Einlegen des Materials
1. Das Portal nach hinten fahren, dazu am besten Makro `Move-Y-and-Z-to-max` über die [Weboberfläche](http://laserkutter.lab.fablab-nea.de/) oder am Gerät über das Display ausführen.
2. Die Klappe öffnen
3. Bei sehr hohen Werkstücken ggf. den Wabentisch (U-Achse) nach unten verfahren. Der Tisch lässt sich zwischen 0 (oben) und -280 (unten) verfahren.
4. Am einfachsten ist es, das Material links unten (Koordinate `X0 Y0`) auszurichten. Bei Gravuren ist eventuell ein Abstand zu den X-Achsen-Grenzen notwendig, damit ausreichend Beschleunigungsweg vorhanden ist. Dafür kann der 100x100mm Abstandshalter benutzt werden.

## Erzeugen von Maschinencode
1. LightBurn öffnen (`Anwendungen`→ `Grafik`→ `LightBurn`)
2. `Datei`→ `Importieren` oder `Ctrl`+`I`, dann die gewünschte Datei auswählen
3. Leistung (Power), Geschwindigkeit(Speed) und Materialstärke der Layer einstellen
4. Im Dropdown `Starten von` eine Option auswählen
  - Empfehlung: `Absolute Koordinaten`: Der Lasercutter verfährt exakt wie auf dem Bildschirm abgebildet
  - `Aktuelle Position`: Die aktuelle Position des Lasercutters entspricht dem grünen Punkt auf dem Bildschirm. **Vorsicht! Bug in LightBurn:** Wenn Materialstärke > 0mm eingestellt ist, verfährt auch die Z-Achse relativ. Diese Konstellation sollte also vermieden werden.

## Übertragung des Maschinencodes an das Gerät
1. [Weboberfläche des LaserKutters](http://laserkutter.lab.fablab-nea.de/) öffnen.
2. Button `UPLOAD & START` rechts oben klicken
3. die in LightBurn erzeugte GCode Datei auswählen

## Technische Details
Der *LaserKutter* ist ein *Bodor 1309XM* Laser-Cutter.
Aufgrund von gravierenden Problemen mit dem Original-Board (Ruida RDC6332M),
betreiben wir ihn mit einem Duet3D Mini5+ und einem PanelDue.

### Firmware-Upgrade

#### Mainboard
1. Herunterladen der neuesten Firmware von <https://github.com/Duet3D/RepRapFirmware/releases>
   + Nur für das erste Update: `Duet3_SDiap32_Mini5plus.bin`
   + Für das Haupt-Board: `Duet3Firmware_Mini5plus.uf2`
   + Für die Expansion-Boards: `Duet3Firmware_EXP1XD.bin`
2. Hochladen der neuen Firmware in der oben genannten Reihenfolge
   (Web-Interface: Files → System → Upload System Files)
3. Das Web-Interface sollte nach dem Upload der Dateien fragen,
   ob ein Update durchgeführt werden soll
4. Wenn das Update nicht automatisch funktioniert,
   kann es mit der G-Code-Instruktion [`M997`](https://duet3d.dozuki.com/Wiki/M997) für das Haupt-Board
   und `M997 Bn` für das Expansion-Board, wobei `n` für die CAN-Bus-Adresse steht,
   aktualisiert werden
5. Mit [`M115`](https://duet3d.dozuki.com/Wiki/M115) kann die Firmware-Version des Haupt-Boards abgefragt werden,
   mit `M115 Bn` kann die Firmware-Version des Expansion-Boards mit CAN-Bus-Adresse `n` abgefragt werden

#### Weboberfläche
1. Herunterladen des letzten Releases von https://github.com/Duet3D/DuetWebControl/releases
2. Entpacken der `.zip` Datei und kopieren des Inhalts auf die SD-Karte in das `www`-Verzeichnis.

#### PanelDue
1. Herunterladen der `*-7.0i.bin` Datei des letzten Releases von <https://github.com/Duet3D/PanelDueFirmware/releases>
2. Hochladen der Datei (Web-Interface: Files → System → Upload System Files)
3. Dateiname anpassen und G-Code ausführen `M997 S4 P"PanelDueFirmware-3.4.0-pre3-v3-7.0.bin"`
