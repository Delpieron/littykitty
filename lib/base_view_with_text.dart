import 'package:flutter/material.dart';
import 'package:littykitty2/widgets/images_carousel.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:responsive_framework/responsive_row_column.dart';

class BaseViewWithText extends StatelessWidget {
  const BaseViewWithText({
    required this.description,
    required this.title,
    this.imageName,
    super.key,
    this.underTextWidget,
    this.imgNames,
    this.showImageAboveTitle = false,
  });

  final Widget? underTextWidget;
  final String? imageName;
  final Map<String, int>? imgNames;
  final String description;
  final String title;
  final bool showImageAboveTitle;

  @override
  Widget build(BuildContext context) {
    final isLargerThanMobile = ResponsiveBreakpoints.of(context).largerThan(MOBILE);
    final textAlign = isLargerThanMobile ? TextAlign.start : TextAlign.center;
    final titleAlignment = !isLargerThanMobile
        ? Alignment.topCenter
        : showImageAboveTitle
            ? Alignment.bottomLeft
            : Alignment.bottomLeft;
    return ResponsiveRowColumn(
      layout: isLargerThanMobile ? ResponsiveRowColumnType.ROW : ResponsiveRowColumnType.COLUMN,
      rowMainAxisAlignment: MainAxisAlignment.spaceEvenly,
      rowMainAxisSize: MainAxisSize.min,
      children: [
        ResponsiveRowColumnItem(
          columnOrder: 0,
          columnFlex: 1,
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.1,
            height: MediaQuery.sizeOf(context).height * 0.1,
          ),
        ),
        ResponsiveRowColumnItem(
          columnOrder: 2,
          child: Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: !isLargerThanMobile ? MainAxisAlignment.start : MainAxisAlignment.center,
              crossAxisAlignment: isLargerThanMobile ? CrossAxisAlignment.start : CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * (isLargerThanMobile ? .3 : .8),
                  height: !isLargerThanMobile
                      ? null
                      : showImageAboveTitle
                          ? 300
                          : 150,
                  child: Stack(
                    children: [
                      if (showImageAboveTitle && isLargerThanMobile)
                        const Align(
                          alignment: Alignment.topCenter,
                          child: Image(
                            image: AssetImage('assets/cats/koty-02.webp'),
                            height: 190,
                            fit: BoxFit.fill,
                          ),
                        ),
                      Align(
                        alignment: titleAlignment,
                        child: Text(
                          title,
                          overflow: TextOverflow.fade,
                          textAlign: textAlign,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * (isLargerThanMobile ? .3 : .9),
                  child: Text(
                    description,
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: textAlign,
                  ),
                ),
                if (underTextWidget != null && isLargerThanMobile)
                  Padding(
                    padding: EdgeInsets.only(top: 32, right: MediaQuery.sizeOf(context).width * .06),
                    child: underTextWidget,
                  ),
              ],
            ),
          ),
        ),
        ResponsiveRowColumnItem(
          columnOrder: 1,
          child: Expanded(
            flex: !ResponsiveBreakpoints.of(context).largerThan(MOBILE)
                ? 5
                : MediaQuery.sizeOf(context).width > 620 && MediaQuery.sizeOf(context).width < 1500
                    ? 6
                    : 4,
            child: ImagesCarousel(imageName: imageName, imgNames: imgNames),
          ),
        ),
      ],
    );
  }
}
