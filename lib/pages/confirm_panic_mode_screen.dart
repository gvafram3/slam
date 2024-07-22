import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:slam/pages/panic_mode_screen.dart';
import 'package:slam/pages/welcome_page.dart';
import '../swipe_to_confirm.dart';

class ConfirmPanicModeScreen extends StatefulWidget {
  const ConfirmPanicModeScreen({super.key});

  @override
  State<ConfirmPanicModeScreen> createState() => _ConfirmPanicModeScreenState();
}

class _ConfirmPanicModeScreenState extends State<ConfirmPanicModeScreen> {
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
              child: Column(
                children: [
                  const Spacer(),
                  SwipeToConfirm(onConfirm: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PanicModeScreen(),
                      ),
                    );
                  }),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}




//import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:slam/pages/panic_mode_screen.dart';
// import 'package:slam/pages/welcome_page.dart';

// import '../swipe_to_confirm.dart';

// // import '../widgets/report_dialog.dart';

// // import '../widgets/report_dialog.dart';

// class ConfirmPanicModeScreen extends StatefulWidget {
//   const ConfirmPanicModeScreen({super.key});

//   @override
//   State<ConfirmPanicModeScreen> createState() => _ConfirmPanicModeScreenState();
// }

// class _ConfirmPanicModeScreenState extends State<ConfirmPanicModeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         const WelcomePage(),
//         Positioned.fill(
//             child: Container(
//           color: Colors.black.withOpacity(0.8),
//           child: BackdropFilter(
//             filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
//             child: Column(
//               children: [
//                 const Spacer(),
//                 SwipeToConfirm(onConfirm: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) =>
//                             const PanicModeScreen()), // Updated navigation
//                   );
//                 }),
//                 const SizedBox(height: 20),
//               ],
//             ),
//           ),
//         ))
//       ],
//     );
//   }
// }
