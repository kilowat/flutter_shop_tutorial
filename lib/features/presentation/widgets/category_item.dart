import 'package:auto_size_text/auto_size_text.dart';
import 'package:flippy/common/styles.dart';
import 'package:flippy/features/presentation/screens/category/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoryItem extends StatelessWidget {
  final int id;
  final String image;
  final String name;
  const CategoryItem({
    Key? key,
    required this.id,
    required this.image,
    required this.name,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CategoryScreen(name: name, id: id)));
      },
      child: Container(
        width: calcSize(context),
        margin: EdgeInsets.all(Styles.paddingDefault / 2),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                child: Center(
                  child: FractionallySizedBox(
                    widthFactor: 0.5,
                    heightFactor: 0.5,
                    child: SvgPicture.asset(image),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: Offset(0, 4),
                      blurRadius: 10,
                      spreadRadius: 0.1,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            AutoSizeText(
              name,
              maxLines: 1,
            ),
          ],
        ), // add margin
      ),
    );
  }

  double calcSize(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double multiply = 0.25;
    if (size.width > 680 && size.width < 1000) {
      multiply = 0.2;
    } else if (size.width > 1000) {
      multiply = 0.1;
    }
    final width =
        (size.width - Styles.paddingDefault) * multiply - Styles.paddingDefault;
    return width;
  }
}

class CategoryPlaceHolder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: calcSize(context),
      margin: EdgeInsets.all(Styles.paddingDefault / 2),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              child: Center(
                child: FractionallySizedBox(
                  widthFactor: 0.5,
                  heightFactor: 0.5,
                  child: Container(),
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: Offset(0, 4),
                    blurRadius: 10,
                    spreadRadius: 0.1,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            color: Colors.grey,
            child: AutoSizeText(
              "empty",
              style: TextStyle(color: Colors.transparent),
              maxLines: 1,
            ),
          ),
        ],
      ), // add margin
    );
  }

  double calcSize(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double multiply = 0.25;
    if (size.width > 680 && size.width < 1000) {
      multiply = 0.2;
    } else if (size.width > 1000) {
      multiply = 0.1;
    }
    final width =
        (size.width - Styles.paddingDefault) * multiply - Styles.paddingDefault;
    return width;
  }
}
