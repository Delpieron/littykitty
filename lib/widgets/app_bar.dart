import 'package:async_builder/async_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../main_page/main_page_bloc.dart';
import 'app_bar_action_widget.dart';

const double _maxAppbarHeight = 120;

class PredefinedAppbar extends StatelessWidget implements PreferredSizeWidget {
  const PredefinedAppbar({
    required this.itemScrollController,
    required this.mainPageBloc,
    required this.shrinkLogo,
    super.key,
  });

  final ItemScrollController itemScrollController;
  final MainPageBloc mainPageBloc;
  final bool shrinkLogo;

  @override
  Size get preferredSize => const Size.fromHeight(_maxAppbarHeight);

  double _logoHeight(double width) {
    if (width > 850) {
      return 100;
    }
    if (width < 550) {
      return 50;
    }
    return 80;
  }

  double _logoWidth(double width) {
    if (width > 850) {
      return 160;
    }
    if (width < 550) {
      return 70;
    }
    return 110;
  }

  @override
  Widget build(BuildContext context) {
    final isLargerThanMobile = ResponsiveBreakpoints.of(context).largerThan(MOBILE);
    final width = MediaQuery.sizeOf(context).width;
    final multiplier = ResponsiveBreakpoints.of(context).largerThan(TABLET) ? .7 : .65;
    final logoHeight = _logoHeight(width);
    final logoWidth = _logoWidth(width);
    return AppBar(
      forceMaterialTransparency: true,
      leadingWidth: logoWidth * (shrinkLogo && isLargerThanMobile ? multiplier : 1),
      // width > 850
      //     ? 160
      //     : width < 550
      //     ? 70
      //     : 110,
      toolbarHeight: logoHeight * (shrinkLogo && isLargerThanMobile ? multiplier : 1),
      // width > 850
      //     ? 100
      //     : width < 550
      //     ? 50
      //     : 80,
      primary: false,
      foregroundColor: Colors.white,
      backgroundColor: Colors.transparent,
      leading: InkWell(
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () {
          mainPageBloc.aboutUsMode.add(null);
          itemScrollController.scrollTo(
            opacityAnimationWeights: [20, 20, 60],
            index: 0,
            duration: const Duration(milliseconds: 200),
          );
        },
        child: Padding(
          padding: EdgeInsets.only(left: isLargerThanMobile ? 20 : 16, top: 8),
          child: Image(
            image: const AssetImage('assets/kitty_logo.png'),
            filterQuality: FilterQuality.high,
            width: width > 850
                ? 160
                : width < 550
                    ? 70
                    : 110,
            height: width > 850
                ? 130
                : width < 550
                    ? 50
                    : 80,
            fit: BoxFit.fill,
          ),
        ),
      ),
      actions: [
        if (isLargerThanMobile) ...getActions(),
      ],
    );
  }

  List<Widget> getActions() => List.unmodifiable([
        AsyncBuilder<AboutPages?>(
          stream: mainPageBloc.aboutUsMode,
          builder: (context, aboutPage) {
            if (aboutPage == AboutPages.about) {
              return const SizedBox.shrink();
            }
            return AppBarActionWidget(
              text: AboutPages.about.name,
              onPressed: () {
                mainPageBloc.aboutUsMode.add(AboutPages.about);
              },
            );
          },
        ),
        AsyncBuilder<AboutPages?>(
          stream: mainPageBloc.aboutUsMode,
          builder: (context, aboutPage) {
            if (aboutPage == AboutPages.contact) {
              return const SizedBox.shrink();
            }
            return AppBarActionWidget(
              text: AboutPages.contact.name,
              onPressed: () {
                mainPageBloc.aboutUsMode.add(AboutPages.contact);
              },
            );
          },
        ),
      ]);
}
