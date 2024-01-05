import 'package:async_builder/async_builder.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:littykitty2/base_view_with_text.dart';
import 'package:littykitty2/bentonite/lavend/bentonite_lavend_bloc.dart';
import 'package:littykitty2/main_page/main_page_bloc.dart';
import 'package:littykitty2/strings.dart';
import 'package:littykitty2/widgets/bag_size_selector_item.dart';
import 'package:littykitty2/widgets/change_liter_dot_row.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

class BentoniteLavend extends StatelessWidget {
  const BentoniteLavend({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   final bloc = GetIt.I.get<BentoniteLavendBloc>();
  //   final mainBloc = GetIt.I.get<MainPageBloc>();
  //   final isLargerThanMobile = ResponsiveBreakpoints.of(context).largerThan(MOBILE);
  //   return AsyncBuilder<int>(
  //     stream: mainBloc.selectedPage.stream.distinct((previous, next) => previous == next),
  //     initial: 0,
  //     builder: (context, i) {
  //       return AnimatedOpacity(
  //         duration: const Duration(milliseconds: 400),
  //         opacity: i! <= 3 ? 1 : 0,
  //         child: AsyncBuilder<int>(
  //           stream: bloc.selectedSize,
  //           initial: 0,
  //           builder: (context, sizeIndex) {
  //             return BaseViewWithText(
  //               imageName: isLargerThanMobile ? 'lavend$sizeIndex' : null,
  //               imgNames: isLargerThanMobile ? null : _imgNames,
  //               description: Strings.bentoniteLavend,
  //               title: 'BENTONITE\nLAWENDA',
  //               underTextWidget: ChangeLiterDotRow(sizeIndex: sizeIndex!, bloc: bloc),
  //             );
  //           },
  //         ),
  //       );
  //     },
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    final bloc = GetIt.I.get<BentoniteLavendBloc>();
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
              imageName: isLargerThanMobile ? 'lavend$sizeIndex' : null,
              imgNames: isLargerThanMobile ? null : _imgNames,
              description: Strings.bentoniteLavend,
              title: 'BENTONITE',
              title2: 'LAWENDA',
              underTextWidget: ChangeLiterDotRow(sizeIndex: sizeIndex!, bloc: bloc),
            );
          },
        );
      },
    );
  }
}

final Map<String, int> _imgNames = {
  'lavend0': 5,
  'lavend1': 10,
  'lavend2': 25,
};
