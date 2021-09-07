import 'package:flippy/features/presentation/widgets/bottom_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'body.dart';

class CategoriesScreen extends StatelessWidget {
  static const route = "/categories";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Categories"),
      ),
      body: Body(),
      bottomNavigationBar: BottomNavBar(
        index: 2,
      ),
    );
  }
}
