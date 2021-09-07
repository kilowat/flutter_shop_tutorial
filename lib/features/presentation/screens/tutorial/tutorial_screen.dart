import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/body.dart';

class TutorialScreen extends StatelessWidget {
  static const route = "/tutorial";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
