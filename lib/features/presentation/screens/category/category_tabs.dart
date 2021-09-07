import 'package:flippy/features/domain/entities/category_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryTabs extends StatelessWidget {
  final CategoryEntity category;

  const CategoryTabs({Key? key, required this.category}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (category.child.length > 0) {
      final List<dynamic> child = category.child;
      final List<Text> tabs = child.map((e) => Text(e['name'])).toList();

      return DefaultTabController(
        length: category.child.length + 1,
        child: Container(
          padding: EdgeInsets.only(bottom: 18),
          child: Stack(
            children: [
              Positioned(
                top: 34,
                left: 0,
                child: Container(
                  color: Colors.white,
                  height: 0.6,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              TabBar(
                isScrollable: true,
                labelPadding: EdgeInsets.all(8),
                tabs: [
                  Text("All"),
                  ...tabs,
                ],
              ),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
