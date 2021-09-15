import 'package:flippy/features/presentation/widgets/fade_indexed_stack.dart';
import 'package:flippy/features/presentation/widgets/tab_navigation_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: FadeIndexedStack(
        index: _currentIndex,
        children: [
          for (final tabItem in TabNavigationItem.items) tabItem.screen,
        ],
      ),
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
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (int index) => setState(() => _currentIndex = index),
          items: [
            for (var tabItem in TabNavigationItem.items) tabItem.item,
          ],
        ),
      ),
    );
  }
}
