# SCUBE - Control & Monitoring System

A Flutter mobile application built with Clean Architecture principles for SCUBE Control & Monitoring System.

## Features

- ✨ **Splash Screen** - Beautiful animated splash screen with app branding
- 🔐 **Login Screen** - Modern login interface with slide-up animation
- 📊 **Dashboard Screen** - Comprehensive monitoring dashboard with metrics, weather, and inverter data
- 📈 **Second Page Screen** - Detailed electricity monitoring with tabbed views (Summary, SLD, Data)
- 🎨 **Clean Architecture** - Well-structured codebase following Clean Architecture principles
- 📱 **Responsive Design** - Optimized for various screen sizes
- 🎭 **Smooth Animations** - Elegant slide-up animations for better UX
- ♻️ **Reusable Widgets** - Modular and reusable UI components
- 📑 **Tab Navigation** - Tab-based navigation for organized content views
- 📜 **Custom Scrollbars** - Custom draggable scrollbars for better UX

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

### Splash Screen
- Blue background (#0096FC)
- App logo and branding
- Smooth transition to login

### Login Screen
- Blue header section with logo
- White form section with slide-up animation
- Username and password fields
- Forgot password and registration links

### Dashboard Screen
- Comprehensive metrics display (Total Energy, Plant Generation, Live AC Power, etc.)
- Weather section with temperature, wind, and irradiation data
- Inverter list with detailed cards showing energy metrics
- Navigation to second page

### Second Page Screen
- Tab-based navigation (Summary, SLD, Data)
- Electricity monitoring with donut chart
- Source/Load toggle functionality
- Scrollable data view cards with custom scrollbar
- Bottom action grid for quick actions

## Widgets

### Reusable Components

#### Core Widgets
- `LogoHeader` - App logo and branding section
- `CustomTextField` - Styled text input field
- `PasswordField` - Password input with visibility toggle
- `CustomButton` - Primary action button
- `UnderlinedTextButton` - Link-style button
- `SectionTitle` - Section heading widget
- `CustomAppBar` - Reusable AppBar with back button and notifications
- `NavigateButton` - Reusable navigation button component

#### Dashboard Widgets
- `MetricCard` - Display metric values with icons/images
- `InverterCard` - Inverter information card
- `ComparisonRow` - Comparison data row widget
- `SummaryTile` - Summary information tile

#### Second Page Widgets
- `ElectricityTabBar` - Tab bar for Summary/SLD/Data tabs
- `ElectricityDonutChart` - Circular progress chart for power display
- `SourceLoadToggle` - Toggle between Source and Load views
- `ScrollableDataViewList` - Scrollable list of data view cards
- `SummaryTabView` - Summary tab content view
- `EmptyTabView` - Placeholder for empty tabs
- `CustomScrollbar` - Custom draggable scrollbar widget
- `DataViewCard` - Card displaying data metrics
- `BottomActionGrid` - Grid of action buttons

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
