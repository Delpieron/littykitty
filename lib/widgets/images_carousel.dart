import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImagesCarousel extends StatelessWidget {
  const ImagesCarousel({
    this.imageName,
    this.imgNames,
    this.showImageFromBottom = false,
    super.key,
  });

  final String? imageName;
  final Map<String, double>? imgNames;
  final bool showImageFromBottom;

  @override
  Widget build(BuildContext context) {
    assert(imageName != null || imgNames != null, 'Either imageName or imgNames must not be null.');
    if (imgNames != null) {
      return _CarouselWithIndicatorDemo(imgNames!);
    }
    return _SimpleImage(imageName: imageName!,showImageFromBottom: showImageFromBottom);
  }
}

class _CarouselWithIndicatorDemo extends StatefulWidget {
  const _CarouselWithIndicatorDemo(this.imgNames);

  final Map<String, double> imgNames;

  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<_CarouselWithIndicatorDemo> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: imageSliders(context),
      carouselController: _controller,
      options: CarouselOptions(
        enlargeCenterPage: true,
        enlargeFactor: .4,
        aspectRatio: 16 / 18,
        onPageChanged: (index, reason) {
          setState(() {
            _current = index;
          });
        },
      ),
    );
  }

  List<Widget> imageSliders(BuildContext context) => widget.imgNames.keys
      .map(
        (item) => LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: item == 'natural0' ? const EdgeInsets.only(left: 48) : EdgeInsets.zero,
                  child: Image.asset(
                    gaplessPlayback: true,
                    'assets/bags/$item.webp',
                    height: constraints.maxHeight * .85,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Padding(
                  padding: MediaQuery.sizeOf(context).width > 701 ? EdgeInsets.zero : const EdgeInsets.only(top: 8),
                  child: Text(
                    '${widget.imgNames[item]} L',
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    widget.imgNames.length,
                    (index) => GestureDetector(
                      onTap: () => _controller.animateToPage(index),
                      child: Container(
                        width: 12,
                        height: 12,
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(_current == index ? 1 : 0.3),
                        ),
                      ),
                    ),
                    growable: false,
                  ),
                ),
              ],
            );
          },
        ),
      )
      .toList();
}

class _SimpleImage extends StatelessWidget {
  const _SimpleImage({required this.imageName,required this.showImageFromBottom});

  final String imageName;
  final bool showImageFromBottom;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final image = Image.asset(
      gaplessPlayback: true,
      'assets/bags/$imageName.webp',
      width: size.width * .75,
      height: size.height * .80,
    );
    if(showImageFromBottom){
      return Image.asset(
        gaplessPlayback: true,
        'assets/bags/$imageName.webp',
        fit: BoxFit.fill,
      );
    }
    late final double padding;
    bool changePadding = false;
    switch(imageName){
      case 'natural0':
        padding = 122;
        changePadding = true;
        break;
        case 'natural1':
          changePadding= true;
        padding = 0;
        break;
        case 'lavend2':
          changePadding=true;
        padding = 64;
        break;
    }
    if (changePadding) {
      return Padding(
        padding: imageName == 'natural1' ? EdgeInsets.only(right: padding): EdgeInsets.only(left: padding),
        child: image,
      );
    }
    return image;
  }
}
