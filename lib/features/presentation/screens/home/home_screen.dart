import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/body.dart';

class HomeScreen extends StatelessWidget {
  static const route = "/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
