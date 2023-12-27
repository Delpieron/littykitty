import 'package:async_builder/async_builder.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

import '../main_page/main_page_bloc.dart';

class LittyKittyEndView extends StatelessWidget {
  const LittyKittyEndView({super.key});

  @override
  Widget build(BuildContext context) {
    final mainBloc = GetIt.I.get<MainPageBloc>();
    final size = MediaQuery.sizeOf(context);
    final isLargerThanMobile = ResponsiveBreakpoints.of(context).largerThan(MOBILE);
    return AsyncBuilder<int>(
      stream: mainBloc.selectedPage.stream.distinct((previous, next) => previous == next),
      initial: 0,
      builder: (context, i) {
        return AnimatedOpacity(
          duration: const Duration(milliseconds: 400),
          opacity: i! == 4 ? 1 : 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image(
                image: const AssetImage('assets/bags/worki_end.webp'),
                height: size.height * getBagsHeight(context),
                width: size.width * (ResponsiveBreakpoints.of(context).largerThan(MOBILE) ? (ResponsiveBreakpoints.of(context).largerThan(TABLET) ? .6: .9) : 1.4),
                fit: BoxFit.fill,
              ),
              if (!isLargerThanMobile) SizedBox(height: size.height * .2),
              Image(
                image: const AssetImage('assets/cats/koty-15.webp'),
                height: size.height * getImageHeight(context),
                width: isLargerThanMobile ? null : MediaQuery.sizeOf(context).width * 0.7,
                fit: BoxFit.fill,
              ),
            ],
          ),
        );
      },
    );
  }

  double getImageHeight(BuildContext context) {
    final sizes = ResponsiveBreakpoints.of(context);
    if (sizes.largerThan(TABLET)) {
      return .3;
    }
    if (sizes.largerThan(MOBILE)) {
      return .3;
    }
    return .3;
  }

  double getBagsHeight(BuildContext context) {
    final sizes = ResponsiveBreakpoints.of(context);
    final size = MediaQuery.sizeOf(context);
    if (size.width < 600) {
      return .4;
    }
    if (size.width < 500) {
      return .3;
    }
    if (sizes.largerThan(TABLET)) {
      return .65;
    }
    if (sizes.largerThan(MOBILE)) {
      return .55;
    }
    return .5;
  }
}
