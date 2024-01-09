import 'package:flutter/material.dart';
import 'package:littykitty2/strings.dart';

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
        description: page == AboutPages.contact ? Strings.contact : Strings.aboutUs,
        imageName: page!.image,
        title: page!.name,
        showImageFromBottom: page! == AboutPages.about,
      ),
    );
  }
}
