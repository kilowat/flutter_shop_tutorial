import 'package:flippy/features/presentation/widgets/bottom_nav_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'body.dart';

class SearchScreen extends StatelessWidget {
  static const route = "/search";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: Body(),
      bottomNavigationBar: BottomNavBar(index: 1),
    );
  }
}
