import 'package:flutter/material.dart';

class BagSizeSelectorItem extends StatelessWidget {
  const BagSizeSelectorItem({
    required this.onTap,
    required this.child,
    required this.isSelected,
    super.key,
  });

  final VoidCallback onTap;
  final bool isSelected;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(40)),
      onTap: onTap,
      child: Container(
        width: 70,
        height: 70,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(40)),
          color: isSelected ? const Color.fromRGBO(	228, 15, 149, 1) : Colors.transparent,
        ),
        child: Center(child: child),
      ),
    );
  }
}
