import 'package:flutter/material.dart';
import 'core/constants/app_routes.dart';
import 'presentation/login/login_screen.dart';
import 'presentation/splash/splash_screen.dart';
import 'presentation/dashboard/dashboard.dart';
import 'presentation/second_page/second_page_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SCUBE Control & Monitoring System',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.splash,
      routes: {
        AppRoutes.splash: (context) => const SplashScreen(),
        AppRoutes.login: (context) => const LoginScreen(),
        AppRoutes.dashboard: (context) => const DashboardScreen(),
        AppRoutes.secondPage: (context) => const SecondPageScreen(),
      },
    );
  }
}
