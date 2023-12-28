import 'package:async_builder/async_builder.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:littykitty2/main_page/main_page_bloc.dart';
import 'package:littykitty2/strings.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:responsive_framework/responsive_row_column.dart';

class SilicateView extends StatelessWidget {
  const SilicateView({super.key});

  @override
  Widget build(BuildContext context) {
    final isLargerThanMobile = ResponsiveBreakpoints.of(context).largerThan(MOBILE);
    final textAlign = isLargerThanMobile ? TextAlign.start : TextAlign.center;
    final size = MediaQuery.sizeOf(context);
    return ResponsiveRowColumn(
      layout: ResponsiveBreakpoints.of(context).largerThan(MOBILE)
          ? ResponsiveRowColumnType.ROW
          : ResponsiveRowColumnType.COLUMN,
      rowMainAxisAlignment: MainAxisAlignment.center,
      rowMainAxisSize: MainAxisSize.min,
      children: [
        ResponsiveRowColumnItem(
          columnOrder: 0,
          columnFlex: 1,
          child: SizedBox(
            width: size.width * 0.1,
            height: size.height * 0.1,
          ),
        ),
        ResponsiveRowColumnItem(
          columnOrder: 2,
          child: Expanded(
            flex: 3,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: isLargerThanMobile ? CrossAxisAlignment.start : CrossAxisAlignment.center,
              mainAxisAlignment: !isLargerThanMobile ? MainAxisAlignment.start : MainAxisAlignment.center,
              crossAxisAlignment: isLargerThanMobile ? CrossAxisAlignment.start : CrossAxisAlignment.center,
              children: [
                Text(
                  'SILICATE',
                  textAlign: textAlign,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(
                  width: size.width * (isLargerThanMobile ? .3 : .9),
                  child: Text(
                    Strings.silicate,
                    textAlign: textAlign,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
        ),
        ResponsiveRowColumnItem(
          columnOrder: 1,
          child: Expanded(
            flex: size.width > 620 && size.width < 1500 ? 6 : 4,
            child: Image.asset(
              // gaplessPlayback: true,
              'assets/bags/produktdohubuna.webp',
              width: size.width * .5,
              height: size.height * .8,
            ),
          ),
        ),
      ],
    );
  }
}
