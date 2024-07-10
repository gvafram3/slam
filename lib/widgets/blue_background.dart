import 'package:flutter/material.dart';

Widget blueBackgroundImage({required Widget mainWidget}) {
  return Container(
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
      image: DecorationImage(
        image: AssetImage('assets/images/map-image.png'),
        fit: BoxFit.cover,
      ),
    ),
    child: Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Center(child: mainWidget),
        ],
      ),
    ),
  );
}
