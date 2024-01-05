import 'package:littykitty2/bentonite/bentonite_bloc.dart';
import 'package:rxdart/rxdart.dart';

class BentoniteNaturalBloc implements BentoniteBloc {
  @override
  final BehaviorSubject<int> selectedSize = BehaviorSubject<int>.seeded(0);

  @override
  void dispose() {
    selectedSize.close();
  }
}
