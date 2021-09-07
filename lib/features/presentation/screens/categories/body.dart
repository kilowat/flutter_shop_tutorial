import 'package:flippy/common/styles.dart';
import 'package:flippy/features/presentation/widgets/category_item.dart';
import 'package:flutter/cupertino.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(Styles.paddingDefault / 2),
        child: Wrap(
          children: [
            CategoryItem(
                id: 1, image: "assets/dummy/section_grocery.svg", name: "Name"),
            CategoryItem(id: 2, image: "assets/dummy/water.svg", name: "Name"),
            CategoryItem(
                id: 3, image: "assets/dummy/vegetable.svg", name: "Name"),
            CategoryItem(
                id: 4, image: "assets/dummy/viburnum-fruit.svg", name: "Name"),
            CategoryItem(
                id: 5, image: "assets/dummy/section_grocery.svg", name: "Name"),
            CategoryItem(id: 6, image: "assets/dummy/water.svg", name: "Name"),
            CategoryItem(
                id: 7, image: "assets/dummy/vegetable.svg", name: "Name"),
            CategoryItem(
                id: 8, image: "assets/dummy/viburnum-fruit.svg", name: "Name"),
            CategoryItem(
                id: 1, image: "assets/dummy/section_grocery.svg", name: "Name"),
            CategoryItem(id: 2, image: "assets/dummy/water.svg", name: "Name"),
            CategoryItem(
                id: 3, image: "assets/dummy/vegetable.svg", name: "Name"),
            CategoryItem(
                id: 4, image: "assets/dummy/viburnum-fruit.svg", name: "Name"),
            CategoryItem(
                id: 5, image: "assets/dummy/section_grocery.svg", name: "Name"),
            CategoryItem(id: 6, image: "assets/dummy/water.svg", name: "Name"),
            CategoryItem(
                id: 7, image: "assets/dummy/vegetable.svg", name: "Name"),
            CategoryItem(
                id: 8, image: "assets/dummy/viburnum-fruit.svg", name: "Name"),
          ],
        ),
      ),
    );
  }
}
