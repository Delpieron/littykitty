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
    if (width <= 420 || height < 700) {
      return mobileSmallLightTheme;
    }
    if ((width > 420 && width < 1500) && height < 900) {
      return mobileLightTheme;
    }
    if ((width > 420 && width < 1500) || height < 800) {
      return mobileLightTheme;
    }
    return lightTheme;
  }
}
