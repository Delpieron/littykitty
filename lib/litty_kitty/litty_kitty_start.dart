import 'package:flutter/material.dart';

class LittyKittyStartView extends StatelessWidget {
  const LittyKittyStartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      child: Image(
        image: const AssetImage('assets/bags/worki_start.webp'),
        fit: MediaQuery.sizeOf(context).width < 990 ? BoxFit.fitWidth : BoxFit.fitHeight,
      ),
    );
  }
}
