import 'package:rxdart/rxdart.dart';

class MainPageBloc {
  final BehaviorSubject<bool> shouldAnimate = BehaviorSubject<bool>.seeded(false);
  final BehaviorSubject<AboutPages?> aboutUsMode = BehaviorSubject<AboutPages?>.seeded(null);
  final BehaviorSubject<int> selectedPage = BehaviorSubject<int>.seeded(0);
  final BehaviorSubject<int?> isHovered = BehaviorSubject<int?>.seeded(null);

  // final BehaviorSubject<PageName> _selectedPage = BehaviorSubject<PageName>.seeded(PageName.values.first);

  // String get getCurrentHoverValue => onHoverNames[_selectedPage.value]!;

  void dispose() {
    shouldAnimate.close();
    selectedPage.close();
    isHovered.close();
    aboutUsMode.close();
    // _selectedPage.close();
  }
}

enum AboutPages {
  about('O NAS'),
  contact('KONTAKT');

  const AboutPages(this.name);

  final String name;

  String get image => name == about.name ? 'about_us' : 'kontakt';
}
