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
1. Das Portal nach hinten fahren, dazu am besten Makro `Be- und Entladen` über die [Weboberfläche](http://laserkutter.lab.fablab-nea.de/) oder am Gerät über das Display ausführen.
2. Die Klappe öffnen
3. Am einfachsten ist es, das Material links unten (Koordinate `X0 Y0`) auszurichten. Bei Gravuren ist eventuell ein Abstand zu den X-Achsen-Grenzen notwendig, damit ausreichend Beschleunigungsweg vorhanden ist. Dafür kann der 100x100mm Abstandshalter benutzt werden.

## Fokussieren

### Automatisches Fokussieren
1. sicherstellen, dass sich das Material unter dem BL-Touch (TODO: Erklären was das ist) befindet.
2. Das Makro `Z-Probe` über die [Weboberfläche](http://laserkutter.lab.fablab-nea.de/) oder am Gerät über das Display aufrufen
3. sicherstellen, dass sich der Laserkopf etwa 3mm über dem Material befindet

### Manuelles Fokussieren
Die Z-Achse muss so verfahren werden, dass zwischen Werkstück und Laserkopf etwa **3mm** Abstand sind. Dazu am besten millimeterweise den Laserkopf nach unten fahren.
- **größere** Z-Achsen-Werte lassen den Laserkopf nach **oben** fahren
- **kleinere** Z-Achsen-Werte lassen den Laserkopf nach **unten** fahren

Der Abstand kann mittels der Kalibrierhilfe kontrolliert werden. Die Kalibrierhilfe darf sich aber niemals unter dem Laserkopf befinden, wenn dieser verfahren wird, da sonst die Achsenkalibrierung nicht mehr stimmt und das Gerät oder Material beschädigt werden könnte.

## Erzeugen von Maschinencode
1. LightBurn öffnen (`Anwendungen`→ `Grafik`→ `LightBurn`)
2. `File`→ `Import` oder `Ctrl`+`I`, dann die gewünschte Datei auswählen
3. Power und Speed der Layer einstellen
4. Im Dropdown `Start From` eine Option auswählen
  - `Absolute Coords`: Der Lasercutter verfährt exakt wie auf dem Bildschirm abgebildet
  - `Current Position`: Die aktuelle Position des Lasercutters entspricht dem grünen Punkt auf dem Bildschirm

## Übertragung des Maschinencodes an das Gerät
1. [Weboberfläche des LaserKutters](http://laserkutter.lab.fablab-nea.de/) öffnen.
2. Button `UPLOAD & START` rechts oben klicken
3. die in LightBurn erzeugte GCode Datei auswählen

## Technische Details
Der *LaserKutter* ist ein *Bodor 1309XM* Laser-Cutter.
Aufgrund von gravierenden Problemen mit dem Original-Board (Ruida RDC6332M),
betreiben wir ihn mit einem Duet3D Mini5+ und einem PanelDue.

### Firmware-Upgrade
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
