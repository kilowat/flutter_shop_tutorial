import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'body.dart';

class CategoriesScreen extends StatelessWidget {
  static const route = "/categories";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Body()),
    );
  }
}
