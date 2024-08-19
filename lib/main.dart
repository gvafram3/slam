import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:slam/pages/admin/admin_dashboard.dart';
import 'package:slam/pages/splash_screen.dart';

// import 'pages/admin/admin_dashboard.dart';
import 'app_theme.dart';

void main() => runApp(const ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      title: 'Final year project',
      home: const AdminDashboard(),

      // MapScreen(),
      // WelcomePage(),
      // AdminDashboard(),
    );
  }
}
