import 'package:async_builder/async_builder.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:littykitty2/about_us/about_us.dart';
import 'package:littykitty2/bentonite/lavend/bentonite_lavend.dart';
import 'package:littykitty2/bentonite/lavend/bentonite_lavend_bloc.dart';
import 'package:littykitty2/bentonite/natural/bentonite_natural.dart';
import 'package:littykitty2/bentonite/natural/bentonite_natural_bloc.dart';
import 'package:littykitty2/litty_kitty/litty_kitty_end.dart';
import 'package:littykitty2/litty_kitty/litty_kitty_start.dart';
import 'package:littykitty2/main_page/main_page_bloc.dart';
import 'package:littykitty2/silicate/silicate_view.dart';
import 'package:littykitty2/widgets/app_bar.dart';
import 'package:littykitty2/widgets/radio_buttons.dart';
import 'package:responsive_framework/breakpoint.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final itemPositionsListener = ItemPositionsListener.create();

  @override
  Widget build(BuildContext context) {
    if (!GetIt.I.isRegistered<BentoniteNaturalBloc>()) {
      GetIt.I.registerSingleton<BentoniteNaturalBloc>(BentoniteNaturalBloc());
    }
    if (!GetIt.I.isRegistered<BentoniteLavendBloc>()) {
      GetIt.I.registerSingleton<BentoniteLavendBloc>(BentoniteLavendBloc());
    }
    if (!GetIt.I.isRegistered<MainPageBloc>()) {
      GetIt.I.registerSingleton<MainPageBloc>(MainPageBloc());
    }
    final mainPageBloc = GetIt.I.get<MainPageBloc>();
    final itemScrollController = ItemScrollController();
    itemPositionsListener.itemPositions.addListener(() {
      if (mainPageBloc.selectedPage.value != itemPositionsListener.itemPositions.value.first.index) {
        mainPageBloc.selectedPage.add(itemPositionsListener.itemPositions.value.first.index);
      }
    });
    final size = MediaQuery.sizeOf(context);
    return ResponsiveBreakpoints.builder(
      child: Scaffold(
        appBar: PredefinedAppbar(
          itemScrollController: itemScrollController,
          mainPageBloc: mainPageBloc,
        ),
        drawerEdgeDragWidth: 80,
        endDrawer: Builder(
          builder: (context) {
            return ResponsiveBreakpoints.of(context).largerThan(MOBILE)
                ? const SizedBox.shrink()
                : Drawer(
                    width: size.width / 3,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    child: ListView(
                      padding: const EdgeInsets.only(top: 32),
                      children: getActions(),
                    ),
                  );
          },
        ),
        extendBodyBehindAppBar: true,
        body: AsyncBuilder<AboutPages?>(
          stream: mainPageBloc.aboutUsMode,
          builder: (context, aboutPage) {
            final isLargerThanMobile = ResponsiveBreakpoints.of(context).largerThan(MOBILE);
            return Stack(
              children: [
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 800),
                  opacity: aboutPage != null ? 1 : 0,
                  curve: Curves.easeInCirc,
                  child: AboutUs(aboutPage),
                ),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 800),
                  opacity: aboutPage == null ? 1 : 0,
                  curve: Curves.easeInCirc,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: isLargerThanMobile ? 16 : 0),
                    child: Stack(
                      children: [
                        ScrollablePositionedList.builder(
                          itemCount: PageName.values.length,
                          shrinkWrap: true,
                          itemScrollController: itemScrollController,
                          itemPositionsListener: itemPositionsListener,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              height: MediaQuery.sizeOf(context).height,
                              child: switch (index) {
                                0 => const LittyKittyStartView(),
                                1 => const SilicateView(),
                                2 => const BentoniteNatural(),
                                3 => const BentoniteLavend(),
                                4 => const LittyKittyEndView(),
                                _ => const LittyKittyEndView(),
                              },
                            );
                          },
                        ),
                        if (ResponsiveBreakpoints.of(context).largerThan(TABLET))
                          Padding(
                            padding: const EdgeInsets.only(right: 36, left: 16),
                            child: RadioButtons(itemScrollController: itemScrollController),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      breakpoints: [
        const Breakpoint(start: 0, end: 850, name: MOBILE),
        const Breakpoint(start: 851, end: 1400, name: TABLET),
        const Breakpoint(start: 1201, end: 1920, name: DESKTOP),
      ],
    );
  }

  List<Widget> getActions() {
    final mainPageBloc = GetIt.I.get<MainPageBloc>();
    return List.unmodifiable([
      AsyncBuilder<AboutPages?>(
        stream: mainPageBloc.aboutUsMode,
        builder: (context, aboutPage) {
          return ListTile(
            title: Text(AboutPages.about.name, style: Theme.of(context).textTheme.headlineMedium),
            selected: aboutPage == AboutPages.about,
            onTap: () {
              mainPageBloc.aboutUsMode.add(AboutPages.about);
              Navigator.pop(context);
            },
          );
        },
      ),
      AsyncBuilder<AboutPages?>(
        stream: mainPageBloc.aboutUsMode,
        builder: (context, aboutPage) {
          return ListTile(
            title: Text(AboutPages.contact.name, style: Theme.of(context).textTheme.headlineMedium),
            selected: aboutPage == AboutPages.contact,
            onTap: () {
              mainPageBloc.aboutUsMode.add(AboutPages.contact);
              Navigator.pop(context);
            },
          );
        },
      ),
    ]);
  }
}
