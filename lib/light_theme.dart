import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData.light(useMaterial3: true).copyWith(
  scaffoldBackgroundColor: const Color.fromRGBO(231, 167, 180, 1),
  unselectedWidgetColor: Colors.transparent,
  splashColor: const Color.fromRGBO(231, 167, 180, 1),
  highlightColor: Colors.white,
  colorScheme: const ColorScheme.light(),
  appBarTheme: const AppBarTheme(
    toolbarHeight: 120,
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: Colors.white70, fontFamily: 'Poppins'),
    bodyMedium: TextStyle(fontSize: 32, color: Colors.white70, fontFamily: 'Poppins'),
    headlineMedium: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'Poppins'),
  ),
);
final ThemeData mobileLightTheme = ThemeData.light(useMaterial3: true).copyWith(
  scaffoldBackgroundColor: const Color.fromRGBO(231, 167, 180, 1),
  unselectedWidgetColor: Colors.transparent,
  highlightColor: Colors.white,
  colorScheme: const ColorScheme.light(),
  appBarTheme: const AppBarTheme(
    toolbarHeight: 60,
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white70, fontFamily: 'Poppins'),
    titleMedium: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white70, fontFamily: 'Poppins'),
    bodyMedium: TextStyle(fontSize: 16, color: Colors.white70, fontFamily: 'Poppins'),
    headlineMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white70, fontFamily: 'Poppins'),
  ),
);
final ThemeData mobileSmallLightTheme = mobileLightTheme.copyWith(
  textTheme: const TextTheme(
    titleLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white70, fontFamily: 'Poppins'),
    titleMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white70, fontFamily: 'Poppins'),
    bodyMedium: TextStyle(fontSize: 12, color: Colors.white70, fontFamily: 'Poppins'),
    headlineMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white70, fontFamily: 'Poppins'),
  ),
);
final ThemeData mobileMicroLightTheme = mobileLightTheme.copyWith(
  textTheme: const TextTheme(
    titleLarge: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white70, fontFamily: 'Poppins'),
    titleMedium: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white70, fontFamily: 'Poppins'),
    bodyMedium: TextStyle(fontSize: 10, color: Colors.white70, fontFamily: 'Poppins'),
  ),
);
