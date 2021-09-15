import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'body.dart';

class SearchScreen extends StatelessWidget {
  static const route = "/search";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
