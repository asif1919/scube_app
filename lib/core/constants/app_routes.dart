import 'package:flutter/material.dart';

/// Centralized route names for the app
@immutable
class AppRoutes {
  const AppRoutes._();

  /// Splash route – entry point of the app
  static const String splash = '/';

  /// Login screen route
  static const String login = '/login';

  /// Dashboard (1st Page) route
  static const String dashboard = '/dashboard';

  /// Second Page route
  static const String secondPage = '/second-page';
}

