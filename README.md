# SCUBE - Control & Monitoring System

A Flutter mobile application built with Clean Architecture principles for SCUBE Control & Monitoring System.

 
## Project Structure

```
lib/
├── core/
│   └── constants/          # App constants, colors, and routes
├── presentation/
│   ├── splash/             # Splash screen
│   ├── login/              # Login screen
│   ├── dashboard/          # Dashboard screen
│   │   └── widgets/        # Dashboard-specific widgets
│   ├── second_page/        # Second page screen
│   │   └── widgets/        # Second page-specific widgets
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

<table>
<tr>
<td width="25%">
<img src="https://raw.githubusercontent.com/asif1919/scube_app/master/assets/app_screenshorts/1-%20Splash_screen.jpg" width="100%">
<p align="center"><b>Splash Screen</b></p>
</td>
<td width="25%">
<img src="https://raw.githubusercontent.com/asif1919/scube_app/master/assets/app_screenshorts/2-%20Login_screen.jpg" width="100%">
<p align="center"><b>Login Screen</b></p>
</td>
<td width="25%">
<img src="https://raw.githubusercontent.com/asif1919/scube_app/master/assets/app_screenshorts/3-%20Dashboard.jpg" width="100%">
<p align="center"><b>Dashboard Screen</b></p>
</td>
<td width="25%">
<img src="https://raw.githubusercontent.com/asif1919/scube_app/master/assets/app_screenshorts/4-%202nd_page.png" width="100%">
<p align="center"><b>Second Page Screen</b></p>
</td>
</tr>
</table>


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

Made with ❤️ using Flutter
