import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

class BasePage extends StatelessWidget {
  const BasePage({required this.child, required this.onTap, this.showScrollButton = true, super.key});

  final Widget child;
  final VoidCallback onTap;
  final bool showScrollButton;

  @override
  Widget build(BuildContext context) {
    final isLargerThanMobile = ResponsiveBreakpoints.of(context).largerThan(MOBILE);
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Padding(
            padding: EdgeInsets.only(left: isLargerThanMobile ? 64 : 0),
            child: child,
          ),
          if (showScrollButton)
            Positioned(
              top: MediaQuery.sizeOf(context).height * (isLargerThanMobile ? .85 : .95),
              child: InkWell(
                onTap: onTap,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                focusColor: Colors.transparent,
                splashColor: Colors.transparent,
                child: Column(
                  children: [
                    if (ResponsiveBreakpoints.of(context).largerThan(MOBILE))
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * .04,
                        child: const VerticalDivider(color: Colors.white, thickness: 2),
                      ),
                    Text(
                      'SCROLL',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
