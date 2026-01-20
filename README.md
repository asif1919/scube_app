# SCUBE - Control & Monitoring System

A Flutter mobile application built with Clean Architecture principles for SCUBE Control & Monitoring System.

## Features

- ✨ **Splash Screen** - Beautiful animated splash screen with app branding
- 🔐 **Login Screen** - Modern login interface with slide-up animation
- 🎨 **Clean Architecture** - Well-structured codebase following Clean Architecture principles
- 📱 **Responsive Design** - Optimized for various screen sizes
- 🎭 **Smooth Animations** - Elegant slide-up animations for better UX
- ♻️ **Reusable Widgets** - Modular and reusable UI components

## Project Structure

```
lib/
├── core/
│   └── constants/          # App constants and colors
├── presentation/
│   ├── splash/             # Splash screen
│   ├── login/              # Login screen
│   └── widgets/            # Reusable UI widgets
└── main.dart               # App entry point
```

## Getting Started

### Prerequisites

- Flutter SDK (3.11.0 or higher)
- Dart SDK
- Android Studio / VS Code with Flutter extensions

### Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/scube_app.git
cd scube_app
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## Dependencies

- `google_fonts: ^6.1.0` - For Inter font family
- `path_provider: ^2.1.5` - For file system paths

## Architecture

This project follows **Clean Architecture** principles:

- **Presentation Layer**: UI components, screens, and widgets
- **Core Layer**: Constants, utilities, and shared resources
- **Domain Layer**: Business logic (to be implemented)
- **Data Layer**: Data sources and repositories (to be implemented)

## Screenshots

### Splash Screen
- Blue background (#0096FC)
- App logo and branding
- Smooth transition to login

### Login Screen
- Blue header section with logo
- White form section with slide-up animation
- Username and password fields
- Forgot password and registration links

## Widgets

### Reusable Components

- `LogoHeader` - App logo and branding section
- `CustomTextField` - Styled text input field
- `PasswordField` - Password input with visibility toggle
- `CustomButton` - Primary action button
- `UnderlinedTextButton` - Link-style button
- `SectionTitle` - Section heading widget

## Development

### Code Style

- Follows Flutter/Dart style guidelines
- Uses `flutter_lints` for code quality
- Clean Architecture principles

### Building

```bash
# Build APK
flutter build apk

# Build iOS
flutter build ios

# Build Web
flutter build web
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is open source and available under the MIT License.

## Author

SCUBE Development Team

---

Made with ❤️ using Flutter
