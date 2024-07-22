import 'package:flutter/material.dart';

// import 'pages/admin/admin_dashboard.dart';
import 'app_theme.dart';
import 'pages/splash_screen.dart';
import 'pages/welcome_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      title: 'Final year project',
      home: const SplashScreen(),
      // MapScreen(),
      // WelcomePage(),
      // AdminDashboard(),
    );
  }
}
