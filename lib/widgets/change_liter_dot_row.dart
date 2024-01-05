import 'package:flutter/material.dart';
import 'package:littykitty2/bentonite/bentonite_bloc.dart';
import 'package:littykitty2/widgets/bag_size_selector_item.dart';

class ChangeLiterDotRow extends StatelessWidget {
  const ChangeLiterDotRow({required this.sizeIndex, required this.bloc, super.key});

  final int sizeIndex;
  final BentoniteBloc bloc;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * .2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          BagSizeSelectorItem(
            onTap: () {
              bloc.selectedSize.add(0);
            },
            isSelected: sizeIndex == 0,
            child: Text('5 L', style: Theme.of(context).textTheme.bodyMedium),
          ),
          BagSizeSelectorItem(
            onTap: () {
              bloc.selectedSize.add(1);
            },
            isSelected: sizeIndex == 1,
            child: Text('10 L', style: Theme.of(context).textTheme.bodyMedium),
          ),
          BagSizeSelectorItem(
            onTap: () {
              bloc.selectedSize.add(2);
            },
            isSelected: sizeIndex == 2,
            child: Text('25 L', style: Theme.of(context).textTheme.bodyMedium),
          ),
        ],
      ),
    );
  }
}
