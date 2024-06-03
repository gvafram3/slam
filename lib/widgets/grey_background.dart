import 'package:flutter/material.dart';

Widget greyBackgroundImage({required Widget mainWidget}) {
  return Scaffold(
    resizeToAvoidBottomInset: false,
    body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.grey.shade100, Colors.grey.shade200],
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/pattern.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Center(child: mainWidget),
      ],
    ),
  );
}
