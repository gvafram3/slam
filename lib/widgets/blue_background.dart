import 'package:flutter/material.dart';

Widget blueBackgroundImage({required Widget mainWidget}) {
  return Scaffold(
    body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF00509d), // Full opacity
                Color(0xFF003f88), // Full opacity
                Color(0xFF00296b), // Full opacity
              ],
            ),
            //   colors: [Color(0x0000509d), Color(0x00003f88), Color(0x0000296b)],
            // ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/map-image.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Center(child: mainWidget),
      ],
    ),
  );
}
