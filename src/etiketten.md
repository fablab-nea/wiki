# Etiketten

Zum Drucken von Etiketten kann man einen brother P-Touch PT-P700 verwenden.
Zum Ansteuern gibt es `ptouch-print` (`nix-shell -p ptouch-print`).

## Wichtige Optionen

 * `--writepng /tmp/foo.png` schreibt ein PNG von dem, was es drucken würde
 * `--text "foo"` schreibt `foo`
 * `--text "foo" "bar"` schreibt `foo` und `bar` darunter
 * `--cutmark` macht eine vertikale gestrichelte Linie,
   um mehrere Etiketten in einem zu drucken
   und Band zu sparen
 * `--text "foo" "bar" --text "baz"` schreibt `foo`, `baz` darunter
   und `bar` hinter beides

## Beispiel

```shell
ptouch-print --font "Iosevka Nerd Font" --text "X" --cutmark --text "Y" --cutmark --text "X" --text "CAN" "121" --cutmark --text "Y" --text "CAN" "122" --cutmark --text "Z"
```
