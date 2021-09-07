import 'package:carousel_slider/carousel_slider.dart';
import 'package:flippy/common/styles.dart';
import 'package:flippy/features/presentation/screens/login/login_screen.dart';
import 'package:flippy/features/presentation/widgets/primary_button.dart';
import 'package:flippy/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'step_tutorial.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late final items = [
    _buildStepOne(),
    _buildStepTwo(),
    _buildStepThree(),
  ];

  int _current = 0;

  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildCarousel(context, _controller),
        _buildCarouselNav(context, _controller),
      ],
    );
  }

  Widget _buildCarousel(BuildContext context, _controller) {
    final size = MediaQuery.of(context).size;
    return CarouselSlider(
      carouselController: _controller,
      items: items,
      options: CarouselOptions(
        viewportFraction: 1,
        height: size.height - 80,
        enableInfiniteScroll: false,
        initialPage: 0,
        onPageChanged: (index, reason) {
          setState(() {
            _current = index;
          });
        },
      ),
    );
  }

  Widget _buildCarouselNav(BuildContext context, controller) {
    final s = S.of(context);
    return SizedBox(
      height: 80,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Styles.paddingDefault),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                _goToDoneTutorial(context);
              },
              child: Text(
                s.SKIP.toUpperCase(),
                style: TextStyle(
                  color: Styles.colorLightText,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: items.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 8.0,
                    height: 8.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black)
                            .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                  ),
                );
              }).toList(),
            ),
            _current < items.length - 1
                ? TextButton(
                    onPressed: () {
                      _controller.nextPage();
                    },
                    child: Text(
                      s.NEXT.toUpperCase(),
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : TextButton(
                    onPressed: () {
                      _goToDoneTutorial(context);
                    },
                    child: Text(
                      s.DONE.toUpperCase(),
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepOne() {
    final s = S.current;
    return StepTutorial(
      title: s.STEP_1_TITLE,
      picture: "assets/images/step_1.svg",
      description: s.STEP_1_DESCRIPTION,
    );
  }

  Widget _buildStepTwo() {
    final s = S.current;
    return StepTutorial(
      title: s.STEP_2_TITLE,
      picture: "assets/images/step_2.svg",
      description: s.STEP_2_DESCRIPTION,
    );
  }

  Widget _buildStepThree() {
    final s = S.current;
    return StepTutorial(
      title: s.STEP_3_TITLE,
      picture: "assets/images/step_3.svg",
      description: s.STEP_3_DESCRIPTION,
      button: PrimaryButton(
        text: "Get started",
        onPress: () {
          _goToDoneTutorial(context);
        },
      ),
    );
  }

  _goToDoneTutorial(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => LoginScreen()),
    );
  }
}
