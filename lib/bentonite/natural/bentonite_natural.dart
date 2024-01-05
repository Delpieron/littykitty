import 'package:async_builder/async_builder.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:littykitty2/base_view_with_text.dart';
import 'package:littykitty2/bentonite/natural/bentonite_natural_bloc.dart';
import 'package:littykitty2/main_page/main_page_bloc.dart';
import 'package:littykitty2/strings.dart';
import 'package:littykitty2/widgets/bag_size_selector_item.dart';
import 'package:littykitty2/widgets/change_liter_dot_row.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

class BentoniteNatural extends StatelessWidget {
  const BentoniteNatural({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = GetIt.I.get<BentoniteNaturalBloc>();
    final mainBloc = GetIt.I.get<MainPageBloc>();
    final isLargerThanMobile = ResponsiveBreakpoints.of(context).largerThan(MOBILE);
    return AsyncBuilder<int>(
      stream: mainBloc.selectedPage.stream.distinct((previous, next) => previous == next),
      initial: 0,
      builder: (context, i) {
        return AsyncBuilder<int>(
          stream: bloc.selectedSize,
          initial: 0,
          builder: (context, sizeIndex) {
            return BaseViewWithText(
              showImageAboveTitle: false,
              imageName: isLargerThanMobile ? 'natural$sizeIndex' : null,
              imgNames: isLargerThanMobile ? null : _imgNames,
              description: Strings.bentoniteNatural,
              title: 'BENTONITE',
              title2: 'NATURALNY',
              underTextWidget: ChangeLiterDotRow(sizeIndex: sizeIndex!, bloc: bloc),
            );
          },
        );
      },
    );
  }
}

final Map<String, int> _imgNames = {
  'natural0': 5,
  'natural1': 10,
  'natural2': 25,
};
