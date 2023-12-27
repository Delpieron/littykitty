import 'package:rxdart/rxdart.dart';

class BentoniteLavendBloc {
  // final BehaviorSubject<bool> shouldAnimate = BehaviorSubject<bool>.seeded(false);
  final BehaviorSubject<int> selectedSize = BehaviorSubject<int>.seeded(0);

  void dispose() {
    selectedSize.close();
    // shouldAnimate.close();
  }
}
