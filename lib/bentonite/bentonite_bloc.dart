import 'package:rxdart/rxdart.dart';

abstract interface class BentoniteBloc {
  BehaviorSubject<int> get selectedSize;

  void dispose();
}
