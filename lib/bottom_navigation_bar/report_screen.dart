import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:slam/bottom_navigation_bar/welcome_page.dart';

import '../widgets/report_dialog.dart';

// import '../widgets/report_dialog.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const WelcomePage(),
        Positioned.fill(
            child: Container(
          color: Colors.black.withOpacity(0.8),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
            child: ReportDialog(),
          ),
        ))
      ],
    );
  }
}
