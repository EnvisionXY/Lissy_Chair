# Bugfix-Report: Flutter-App stürzt mit Impeller im Emulator ab

📅 **Datum:** 12.07.2025

---

## 🧨 Problemstellung

Beim Ausführen der Flutter-App über den Befehl `flutter run` stürzt die Anwendung im Android Emulator ab. Die Debug-Konsole zeigt folgende Hinweise:

- `[ERROR:flutter/impeller/entity/contents/content_context.cc(297)] Failed to create empty texture.`
- `called unimplemented OpenGL ES API`
- `Fatal signal 11 (SIGSEGV)`

Dies führt dazu, dass die App sofort beendet wird, bevor sie sichtbar wird.

---

## 🔍 Ursache

Seit Flutter 3.10+ wird standardmäßig die neue Grafik-Engine **Impeller** verwendet (OpenGL ES / Vulkan). Auf manchen Systemen – insbesondere Emulatorumgebungen mit problematischen OpenGL-Implementierungen oder inkompatiblen Treibern – verursacht Impeller Render-Abstürze.

---

## 🛠️ Lösung: Deaktivierung von Impeller

**Temporärer Workaround:**

```bash
flutter run --no-enable-impeller
```

→ Damit wird wieder der klassische **Skia-Renderer** verwendet. Die App startet stabil, ohne Grafikfehler.

---

## 🔄 Alternativer Workaround (funktioniert nicht immer)

- App über „Run and Debug“ in VS Code oder Android Studio starten  
  → In manchen Fällen verwendet der Debugger andere Startparameter, wodurch die App trotz aktiviertem Impeller nicht crasht.

---

## 🧭 Langfristige Empfehlung

- Überprüfen, ob der Emulator **Hardwarebeschleunigung (GLES 2/3)** unterstützt
- In den AVD-Einstellungen sicherstellen:  
  → **Graphics = Software** (falls Hardware Probleme verursacht)
- Auf Fix für das Impeller/OpenGL-Problem warten:  
  → [Flutter Issue #163269](https://github.com/flutter/flutter/issues/163269)

---

## ⚠️ Zusatzproblem: Emulator erscheint als „offline“

Ein weiterer Fehler bestand darin, dass der Emulator `emulator-5562` dauerhaft als "offline" angezeigt wurde. Ursache war vermutlich ein veralteter Snapshot oder ein Konflikt im ADB-Cache.

**Lösungsweg:**

1. Cold Boot im Android Studio
2. ADB-Server neu starten:
   ```bash
   adb kill-server
   adb start-server
   flutter devices
   ```

---

## ✅ Fazit

Das Problem lag in einem Bug der neuen Impeller-Engine, der durch deren Deaktivierung umgangen werden kann. Der Emulator war grundsätzlich funktionsfähig, musste jedoch teilweise per **Cold Boot** initialisiert werden. Die App läuft stabil, solange Impeller deaktiviert ist.
