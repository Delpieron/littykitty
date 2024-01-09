import 'package:flutter/material.dart';
import 'package:littykitty2/base_view_with_text.dart';
import 'package:littykitty2/strings.dart';
import 'package:littykitty2/widgets/bag_size_selector_item.dart';
import 'package:responsive_framework/responsive_framework.dart';

class SilicateView extends StatelessWidget {
  const SilicateView({super.key});

  @override
  Widget build(BuildContext context) {
    final isLargerThanMobile = ResponsiveBreakpoints.of(context).largerThan(MOBILE);
    return BaseViewWithText(
      title: 'SILICATE',
      description: Strings.silicate,
      imageName: isLargerThanMobile ? 'produktdohubuna' : null,
      imgNames: isLargerThanMobile ? null : _imgNames,
      underTextWidget: BagSizeSelectorItem(
        onTap: () {},
        isSelected: true,
        child: Text('3.8 L', style: Theme.of(context).textTheme.bodyMedium),
      ),
    );
  }
}
final Map<String, double> _imgNames = {
  'produktdohubuna': 3.8,
};