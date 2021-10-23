# LaserKutter

Der *LaserKutter* ist ein *Bodor 1309XM* Laser-Cutter.
Aufgrund von gravierenden Problemen mit dem Original-Board (Ruida RDC6332M),
betreiben wir ihn mit einem Duet3D Mini5+ und einem PanelDue.

## Firmware-Upgrade

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
