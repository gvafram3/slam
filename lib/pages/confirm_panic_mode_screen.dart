import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:slam/pages/panic_mode_screen.dart';
import 'package:slam/bottom_navigation_bar/welcome_page.dart';
import 'swipe_to_confirm.dart';

class ConfirmPanicModeScreen extends StatefulWidget {
  const ConfirmPanicModeScreen({super.key});

  @override
  State<ConfirmPanicModeScreen> createState() => _ConfirmPanicModeScreenState();
}

class _ConfirmPanicModeScreenState extends State<ConfirmPanicModeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        const WelcomePage(),
        Positioned.fill(
          child: Container(
            color: Colors.black.withOpacity(0.8),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
              child: Column(
                children: [
                  SizedBox(height: size * 0.45),
                  Image.asset('assets/images/down.gif', height: 95, width: 95),
                  const Spacer(),
                  SwipeToConfirm(onConfirm: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PanicModeScreen(),
                      ),
                    );
                  }),
                  SizedBox(height: size * 0.05),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
