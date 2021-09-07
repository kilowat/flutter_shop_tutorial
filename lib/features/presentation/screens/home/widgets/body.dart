import 'package:flippy/features/presentation/screens/home/widgets/main_slider.dart';
import 'package:flippy/features/presentation/screens/home/widgets/product_top.dart';
import 'package:flutter/cupertino.dart';

import 'categories.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 18),
          child: Column(
            children: [
              MainSlider(),
              Categories(),
              BestSellersTop(),
              FruitsTop(),
            ],
          ),
        ),
      ),
    );
  }
}
