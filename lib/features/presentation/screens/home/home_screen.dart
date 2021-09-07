import 'package:badges/badges.dart';
import 'package:flippy/features/presentation/widgets/bottom_nav_bar.dart';
import 'package:flippy/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/body.dart';

class HomeScreen extends StatelessWidget {
  static const route = "/";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Badge(
            position: BadgePosition.topEnd(top: 0, end: 3),
            animationDuration: Duration(milliseconds: 300),
            animationType: BadgeAnimationType.slide,
            badgeContent: Text(
              '1',
              style: TextStyle(color: Colors.white),
            ),
            child: IconButton(icon: Icon(Icons.add_alert), onPressed: () {}),
          ),
        ],
        title: Text(S.of(context).HOME),
      ),
      body: Body(),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: Offset(0, 0),
              blurRadius: 6,
              spreadRadius: 2,
            ),
          ],
        ),
        child: BottomNavBar(),
      ),
    );
  }
}
