import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData.light(useMaterial3: true).copyWith(
  scaffoldBackgroundColor: const Color.fromRGBO(43, 184, 201,1),
  unselectedWidgetColor: Colors.transparent,
  splashColor: const Color.fromRGBO(231, 167, 180, 1),
  highlightColor: Colors.white,
  colorScheme: const ColorScheme.light(),
  appBarTheme: const AppBarTheme(
    toolbarHeight: 120,
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(fontSize: 96, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'Poppins'),
    titleMedium: TextStyle(fontSize: 64, color: Colors.white, fontFamily: 'Poppins'),
    bodyMedium: TextStyle(fontSize: 22, color: Colors.white, fontFamily: 'Poppins'),
    headlineMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'Poppins'),
  ),
);
final ThemeData mobileLightTheme = lightTheme.copyWith(
  scaffoldBackgroundColor: const Color.fromRGBO(43, 184, 201,1),
  unselectedWidgetColor: Colors.transparent,
  highlightColor: Colors.white,
  colorScheme: const ColorScheme.light(),
  appBarTheme: const AppBarTheme(
    toolbarHeight: 60,
  ),
  textTheme: TextTheme(
    titleLarge: lightTheme.textTheme.titleLarge?.copyWith(fontSize: 48),//TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white70, fontFamily: 'Poppins'),
    titleMedium: lightTheme.textTheme.titleMedium?.copyWith(fontSize: 32),//TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white70, fontFamily: 'Poppins'),
    bodyMedium: lightTheme.textTheme.bodyMedium?.copyWith(fontSize: 20),//TextStyle(fontSize: 16, color: Colors.white70, fontFamily: 'Poppins'),
    headlineMedium: lightTheme.textTheme.headlineMedium?.copyWith(fontSize: 20),//TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white70, fontFamily: 'Poppins'),
  ),
);
final ThemeData mobileSmallLightTheme = mobileLightTheme.copyWith(
  textTheme: TextTheme(
    titleLarge: lightTheme.textTheme.titleLarge?.copyWith(fontSize: 38),//TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white70, fontFamily: 'Poppins'),
    titleMedium: lightTheme.textTheme.titleMedium?.copyWith(fontSize: 24),//TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white70, fontFamily: 'Poppins'),
    bodyMedium:lightTheme.textTheme.bodyMedium?.copyWith(fontSize: 12),// TextStyle(fontSize: 12, color: Colors.white70, fontFamily: 'Poppins'),
    headlineMedium: lightTheme.textTheme.headlineMedium?.copyWith(fontSize: 14),//TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white70, fontFamily: 'Poppins'),
  ),
);
final ThemeData mobileMicroLightTheme = mobileLightTheme.copyWith(
  textTheme: TextTheme(
    titleLarge: lightTheme.textTheme.titleLarge?.copyWith(fontSize: 26),//TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white70, fontFamily: 'Poppins'),
    titleMedium:lightTheme.textTheme.titleMedium?.copyWith(fontSize: 22),// TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white70, fontFamily: 'Poppins'),
    bodyMedium: lightTheme.textTheme.bodyMedium?.copyWith(fontSize: 10),//TextStyle(fontSize: 10, color: Colors.white70, fontFamily: 'Poppins'),
    headlineMedium:lightTheme.textTheme.headlineMedium?.copyWith(fontSize: 26),// TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: 'Poppins'),
  ),
);
