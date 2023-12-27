import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../main_page/main_page_bloc.dart';
import 'custom_radio_button.dart';

class RadioButtons extends StatelessWidget {
  const RadioButtons({
    required this.itemScrollController,
    super.key,
  });

  final ItemScrollController itemScrollController;

  @override
  Widget build(BuildContext context) {
    final bloc = GetIt.I.get<MainPageBloc>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(PageName.values.length, (index) {
        return CustomRadioButton(
          onTap: () async {
            await itemScrollController.scrollTo(index: index, duration: const Duration(milliseconds: 200));
            if (bloc.selectedPage.value != index) {
              bloc.selectedPage.add(index);
            }
          },
          onHover: (isHovered) {
            bloc.isHovered.add(isHovered ? index : null);
          },
          itemIndex: index,
          name: PageName.values[index],
        );
      }),
    );
  }
}

enum PageName {
  littyKittyStart,
  silicate,
  bentoniteNatural,
  bentoniteLavend,
  littyKittyEnd,
}
