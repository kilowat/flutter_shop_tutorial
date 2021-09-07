import 'package:carousel_slider/carousel_slider.dart';
import 'package:flippy/common/styles.dart';
import 'package:flutter/cupertino.dart';

class MainSlider extends StatefulWidget {
  @override
  _MainSliderState createState() => _MainSliderState();
}

class _MainSliderState extends State<MainSlider> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: _generateItems(),
      options: CarouselOptions(
        aspectRatio: 44 / 14,
        viewportFraction: 1,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        onPageChanged: (index, reason) {},
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  List<Widget> _generateItems() {
    return [
      Slide(image: 'assets/dummy/slide.png'),
      Slide(image: 'assets/dummy/slide.png'),
      Slide(image: 'assets/dummy/slide.png'),
      Slide(image: 'assets/dummy/slide.png'),
    ];
  }
}

class Slide extends StatelessWidget {
  final String image;

  const Slide({Key? key, required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Styles.paddingDefault),
      child: Image.asset(
        image,
        width: 800,
        height: 800,
        fit: BoxFit.cover,
      ),
    );
  }
}
