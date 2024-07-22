import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';

class SwipeToConfirm extends StatelessWidget {
  final VoidCallback onConfirm;

  const SwipeToConfirm({super.key, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: SlideAction(
          text: 'Slide to confirm panic mode',
          textStyle: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          outerColor: Colors.grey[800]!,
          innerColor: Colors.white,
          sliderButtonIcon: const Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.black,
          ),
          onSubmit: () async {
            onConfirm();
          },
        ),
      ),
    );
  }
}







//import 'package:flutter/material.dart';
// import 'package:slam/bottom_navigation_bar/bottom_nav_bar.dart';
// import 'package:slam/pages/panic_mode_screen.dart';
// // import 'package:slam/pages/welcome_page.dart';
// import 'package:slide_to_act/slide_to_act.dart';

// class SwipeToConfirm extends StatelessWidget {
//   final VoidCallback onConfirm;

//   const SwipeToConfirm({super.key, required this.onConfirm});

//   @override
//   Widget build(BuildContext context) {
//     return Positioned(
//       bottom: 20,
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
//         // color: Colors.black,
//         child: SlideAction(
//           text: 'Slide to confirm panic mode',
//           textStyle: const TextStyle(
//             color: Colors.white,
//             fontSize: 16,
//           ),
//           outerColor: Colors.grey[800]!,
//           innerColor: Colors.white,
//           sliderButtonIcon: const Icon(
//             Icons.arrow_forward_ios_rounded,
//             color: Colors.black,
//           ),
//           onSubmit: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => const MyBottomNavBar(),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.black,
//         body: Center(
//           child: SwipeToConfirm(
//             onConfirm: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const PanicModeScreen()));
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
