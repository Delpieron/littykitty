import 'package:flutter/material.dart';
import 'package:littykitty2/widgets/images_carousel.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:responsive_framework/responsive_row_column.dart';

class BaseViewWithText extends StatelessWidget {
  const BaseViewWithText({
    required this.description,
    required this.title,
    this.title2,
    this.imageName,
    super.key,
    this.underTextWidget,
    this.imgNames,
    this.showImageAboveTitle = false,
    this.showImageFromBottom = false,
  });

  final Widget? underTextWidget;
  final String? imageName;
  final Map<String, double>? imgNames;
  final String description;
  final String title;
  final String? title2;
  final bool showImageAboveTitle;
  final bool showImageFromBottom;

  @override
  Widget build(BuildContext context) {
    final isLargerThanMobile = ResponsiveBreakpoints.of(context).largerThan(MOBILE);
    final textAlign = isLargerThanMobile ? TextAlign.start : TextAlign.center;
    final titleAlignment = isLargerThanMobile ? Alignment.centerLeft : Alignment.center;
    final size = MediaQuery.sizeOf(context);
    return ResponsiveRowColumn(
      layout: isLargerThanMobile ? ResponsiveRowColumnType.ROW : ResponsiveRowColumnType.COLUMN,
      rowMainAxisAlignment: MainAxisAlignment.spaceEvenly,
      rowMainAxisSize: MainAxisSize.min,
      children: [
        ResponsiveRowColumnItem(
          columnOrder: 0,
          columnFlex: 1,
          rowFlex: 1,
          child: SizedBox(
            width: size.width * (isLargerThanMobile ? 0.1 : 0.05),
            height: size.height * (isLargerThanMobile ? 0.2 : 0.05),
          ),
        ),
        ResponsiveRowColumnItem(
          columnOrder: 2,
          child: Expanded(
            flex: ResponsiveBreakpoints.of(context).largerThan(TABLET) ? 4 : 3,
            child: Column(
              mainAxisAlignment: !isLargerThanMobile ? MainAxisAlignment.start : MainAxisAlignment.center,
              crossAxisAlignment: isLargerThanMobile ? CrossAxisAlignment.start : CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: size.width <= 420 ? const EdgeInsets.only(top: 8) : EdgeInsets.zero,
                  child: Stack(
                    children: [
                      Align(
                        alignment: titleAlignment,
                        child: Text(
                          title,
                          overflow: TextOverflow.fade,
                          textAlign: textAlign,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      if (title2 != null)
                        Align(
                          alignment: titleAlignment,
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: (ResponsiveBreakpoints.of(context).largerThan(TABLET)
                                  ? size.height > 800
                                      ? 88
                                      : 50 : size.width < 701 && size.width >420 ? 40
                                  : size.width <= 420 || size.height < 800
                                      ? 36
                                      : 50),
                            ),
                            child: Text(
                              title2!,
                              overflow: TextOverflow.fade,
                              textAlign: textAlign,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: SizedBox(
                    width: size.width * .9, //(isLargerThanMobile ? .3 : .9),
                    child: Text(
                      description,
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: textAlign,
                    ),
                  ),
                ),
                if (underTextWidget != null && isLargerThanMobile)
                  Padding(
                    padding: EdgeInsets.only(top: 32, right: size.width * .06),
                    child: underTextWidget,
                  ),
              ],
            ),
          ),
        ),
        ResponsiveRowColumnItem(
          columnOrder: 1,
          child: _ImageCarousel(
            size,
            ImagesCarousel(imageName: imageName, imgNames: imgNames),
            isLargerThanMobile: isLargerThanMobile,
            showImageFromBottom: showImageFromBottom,
            title: title,
          ),
          // ),
        ),
      ],
    );
  }
}

class _ImageCarousel extends StatelessWidget {
  const _ImageCarousel(
    this.size,
    this.child, {
    required this.isLargerThanMobile,
    required this.showImageFromBottom,
    required this.title,
  });

  final Size size;
  final bool isLargerThanMobile;
  final bool showImageFromBottom;
  final Widget child;
  final String title;

  @override
  Widget build(BuildContext context) {
    if (size.width < 550 && title != 'SILICATE') {
      return Align(
        alignment: showImageFromBottom ? Alignment.bottomCenter : Alignment.center,
        child: child,
      );
    }
    return Expanded(
      flex: size.width < 1500 ? 6 : 4,
      child: Align(
        alignment: showImageFromBottom ? Alignment.bottomCenter : Alignment.center,
        child: child,
      ),
    );
  }
}
