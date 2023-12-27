import 'package:flutter/material.dart';

class AppBarActionWidget extends StatelessWidget {
  const AppBarActionWidget({required this.onPressed, required this.text, super.key});

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 32),
      child: IconButton(
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onPressed: onPressed,
        icon: Text(text, style: Theme.of(context).textTheme.headlineMedium),
      ),
    );
  }
}
