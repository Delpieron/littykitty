import 'package:async_builder/async_builder.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:littykitty2/main_page/main_page_bloc.dart';
import 'package:littykitty2/widgets/radio_buttons.dart';

// ignore_for_file: avoid_positional_boolean_parameters

class CustomRadioButton extends StatelessWidget {
  const CustomRadioButton({
    required this.onTap,
    required this.onHover,
    required this.itemIndex,
    required this.name,
    super.key,
  });

  final VoidCallback onTap;
  final void Function(bool) onHover;
  final int itemIndex;
  final PageName name;

  @override
  Widget build(BuildContext context) {
    final bloc = GetIt.I.get<MainPageBloc>();
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onHover: onHover,
            highlightColor: Colors.white70,
            hoverColor: Colors.transparent,
            focusColor: Colors.transparent,
            splashColor: Colors.transparent,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            onTap: onTap,
            child: AsyncBuilder<int>(
              stream: bloc.selectedPage.stream.distinct((previous, next) => previous == next),
              builder: (context, i) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white70,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                    color: i == itemIndex ? Colors.white : Colors.transparent,
                  ),
                );
              },
            ),
          ),
          AsyncBuilder<int?>(
            stream: bloc.isHovered.stream.distinct((previous, next) => previous == next),
            builder: (context, hoverIndex) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 400),
                  opacity: itemIndex == hoverIndex ? 1 : 0,
                  child: Text(onHoverNames[name]!, style: Theme.of(context).textTheme.headlineMedium),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

const Map<PageName, String> onHoverNames = {
  PageName.littyKittyStart: 'LITTY\nKITTY',
  PageName.silicate: 'SILICATE',
  PageName.bentoniteNatural: 'BENTONITE\nNATURALNY',
  PageName.bentoniteLavend: 'BENTONITE\nLAWENDA',
  PageName.littyKittyEnd: 'LITTY\nKITTY',
};
