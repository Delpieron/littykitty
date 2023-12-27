import 'package:flutter/material.dart';

import 'light_theme.dart';
import 'main_page/main_page_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Litty Kitty',
      theme: getThemeBySize(context),
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }

  ThemeData getThemeBySize(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    if (width <= 300 || height <= 600) {
      return mobileMicroLightTheme;
    }
    if (width <= 400 || height < 750) {
      return mobileSmallLightTheme;
    }
    if ((width > 400 && width < 1400) || height < 1000) {
      return mobileLightTheme;
    }
    return lightTheme;
  }
}
