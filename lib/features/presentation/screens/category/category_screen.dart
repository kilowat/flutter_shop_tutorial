import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      body: Body(
        id: id,
        name: name,
      ),
    );
  }
}
