import 'package:flutter/material.dart';

import '../base_view_with_text.dart';
import '../main_page/main_page_bloc.dart';

class AboutUs extends StatelessWidget {
  const AboutUs(this.page, {super.key});

  final AboutPages? page;

  @override
  Widget build(BuildContext context) {
    if (page == null) {
      return const SizedBox.shrink();
    }
    return Center(
      child: BaseViewWithText(
        description:
            'Lorem Ipsum jest tekstem stosowanym jako przykładowy wypełniacz w przemyśle poligraficznym. Został po raz pierwszy użyty w XV w. przez nieznanego drukarza do wypełnienia tekstem próbnej książki. Pięć wieków później zaczął być używany przemyśle elektronicznym, pozostając praktycznie niezmienionym. Spopularyzował się w latach 60. XX w. wraz z publikacją arkuszy Letrasetu, zawierających fragmenty Lorem Ipsum, a ostatnio z zawierającym różne wersje Lorem Ipsum oprogramowaniem przeznaczonym do realizacji druków na komputerach osobistych, jak Aldus PageMaker',
        imageName: page!.image,
        title: page!.name,
      ),
    );
  }
}
