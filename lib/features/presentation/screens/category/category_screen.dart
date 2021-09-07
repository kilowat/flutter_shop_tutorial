import 'package:flippy/features/presentation/widgets/bottom_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'body.dart';

class CategoryScreen extends StatelessWidget {
  static const route = "/category";
  final String name;
  final int id;
  const CategoryScreen({Key? key, required this.name, required this.id})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        centerTitle: true,
        title: Text(name),
        actions: [
          IconButton(
            visualDensity: VisualDensity(horizontal: 0, vertical: 0),
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: SvgPicture.asset('assets/icons/Arrow.svg'),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/icons/filter.svg'),
          ),
        ],
      ),
      body: Body(
        id: id,
      ),
      bottomNavigationBar: BottomNavBar(
        index: 2,
      ),
    );
  }
}
