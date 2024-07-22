import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  useMaterial3: true,

  brightness: Brightness.light,
  primaryColor: const Color(0xff1565c0),
  primaryColorLight: const Color(0xff5e92f3),
  primaryColorDark: const Color(0xff003c8f),
  canvasColor: const Color(0xfff5f5f5),

  secondaryHeaderColor: const Color(0xFFEF6C00), // Orange color for secondary
  scaffoldBackgroundColor: const Color(0xFFF5F5F5), // Red error color

  // Define default text theme.
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
    displayMedium: TextStyle(fontSize: 24.0, fontStyle: FontStyle.italic),
    displaySmall: TextStyle(fontSize: 14.0),
  ),

  // Define the default button theme.
  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xFF1565C0), // Blue primary button color
    textTheme: ButtonTextTheme.primary,
  ),

  // Define the elevated button theme.
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(const Color(0xFF1565C0)),
      foregroundColor: MaterialStateProperty.all(Colors.white),
    ),
  ),

  // Define the default input decoration theme.
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
    filled: true,
    fillColor:
        const Color(0xFFF5F5F5), // Light grey fill color for input fields
  ),

  // Define the default icon theme.
  iconTheme: const IconThemeData(
    color: Color(0xFF1565C0), // Blue icon color
  ),

  // Define the default app bar theme.
  appBarTheme: const AppBarTheme(
    color: Color(0xFF1565C0),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),

  // Define the default floating action button theme.
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFFEF6C00), // Orange FAB color
  ),

  // Define the default card theme.
  cardTheme: CardTheme(
    color: Colors.white,
    margin: const EdgeInsets.all(8.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  ),
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
      .copyWith(background: const Color(0xFFF5F5F5))
      .copyWith(error: const Color(0xFFD32F2F)),
);
