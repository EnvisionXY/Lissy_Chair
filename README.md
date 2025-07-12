# Lissy Chair App

## Projektbeschreibung

Die **Lissy Chair App** ist eine moderne und benutzerfreundliche eCommerce-Anwendung, die speziell für den Verkauf von Designermöbeln, insbesondere Stühle, entwickelt wurde. Die App kombiniert ansprechendes Design mit einer klaren Benutzerführung und einem effizienten Login-/Registrierungsprozess.

---

## Features

### Allgemeine Funktionen:

- **Benutzerregistrierung**: Nutzer können sich registrieren, um ein Konto zu erstellen.
- **Login**: Authentifizierter Zugriff über das ReqRes-API.
- **Passwort zurücksetzen**: Funktion zum Zurücksetzen des Passworts bei Bedarf.
- **Produktübersicht**: Anzeigen von Designermöbeln in einer scrollbaren Liste.
- **Responsive Design**: Optimiert für verschiedene Bildschirmgrößen.

### Design und UX:

- **Custom Widgets**: Wiederverwendbare Widgets wie `CustomButton`, `CustomTextField`, `CustomStatusBar`.
- **Slide-In-Menü**: Ein seitliches Navigationsmenü für die wichtigsten Seiten der App.
- **Farbthemen und Typografie**: Konsistentes Design mit definierten Farbpaletten und Schriftstilen.

---

## Technische Umsetzung

### Architektur: Model-View-Controller (MVC)

1. **Model**:
   - **`AuthModel`**: Definiert die Benutzerdaten (z. B. `email`, `token`).
2. **Controller**:
   - **`AuthController`**: Vermittelt zwischen View und Service. Verwaltet die Logik für Login und Registrierung.
3. **Service**:
   - **`AuthService`**: Kommuniziert mit dem ReqRes-API, um Benutzerdaten abzurufen oder zu senden.

### Wichtige Komponenten

- **LoginPage**: Verarbeitung der Benutzereingaben und Kommunikation mit dem AuthController.
- **SignUpPage**: Registrierung neuer Benutzer mit Validierung und Feedback.
- **ResetPasswordPage**: Ermöglicht das Zurücksetzen des Passworts.
- **HomePage**: Zeigt Produkte und wichtige Informationen an.
- **Custom Widgets**: Wiederverwendbare UI-Komponenten wie Buttons, Eingabefelder und Menüs.

---

## Verwendete Technologien

- **Framework**: Flutter (Dart)
- **API**: ReqRes (https://reqres.in)
- **Abhängigkeiten**:
  - `flutter`: Basiskomponenten für UI und State-Management.
  - `one_clock`: Anzeige der Uhrzeit in der Statusleiste.
  - `google_fonts`: Für die Schriftarten Bebas Neue und Old Standard TT.
  - `mesh_gradient`: Für dynamische, animierte Hintergrundverläufe.

---

## Installation

1. **Voraussetzungen**:
   - Flutter SDK
   - Android Studio oder ein anderer Flutter-kompatibler Editor
2. **Schritte**:
   - Projekt klonen:
     ```bash
     git clone <repository-url>
     ```
   - Abhängigkeiten installieren:
     ```bash
     flutter pub get
     ```
   - App starten:
     ```bash
     flutter run
     ```

---

## Projektstruktur

```
lib/
├── controllers/
│   └── auth_controller.dart
├── models/
│   └── auth_model.dart
├── services/
│   └── auth_service.dart
├── utils/
│   ├── app_colors.dart
│   ├── typography.dart
├── views/
│   ├── login_page.dart
│   ├── sign_up_page.dart
│   ├── reset_password_page.dart
│   ├── home_page.dart
├── widgets/
│   ├── custom_button.dart
│   ├── custom_status_bar.dart
│   ├── custom_text_field.dart
│   ├── custom_slide_in_menu.dart
```

---

## API-Integration

- **Endpoint für Login**: `/login`
  - Anforderung: `{ email, password }`
  - Antwort: `{ token }`
- **Endpoint für Registrierung**: `/register`
  - Anforderung: `{ email, password }`
  - Antwort: `{ id, token }`
- **Hinweis**: Nur vordefinierte Benutzer werden vom ReqRes-API akzeptiert.

---

## Screenshots

### Login-Seite:

Zeigt die Eingabefelder für E-Mail und Passwort sowie die Möglichkeit, ein Passwort zurückzusetzen oder ein neues Konto zu erstellen.

### Startseite:

Zeigt den animierten Hintergrund, das Logo und die wichtigsten Aktionen (z. B. „Kaufen“ oder „Mehr erfahren“).

---

## Ausblick

- **Backend-Integration**: Eigene Datenbank und Benutzerverwaltung.
- **Echte Passwortzurücksetzung**: Integration eines SMTP-Dienstes.
- **Erweiterte Produktfilter**: Bessere Kategorisierung und Filtermöglichkeiten für Produkte.

---

## Autor

Erstellt von **[Dein Name]** während einer Weiterbildung mit Fokus auf Flutter-Entwicklung.

---

## Lizenz

Dieses Projekt ist unter der **MIT-Lizenz** veröffentlicht.
