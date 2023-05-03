import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatefulWidget {
  MyBottomNavigationBar(
      {super.key,
      required this.bottomNaviVisible,
      required this.listIconPage,
      required this.bottomNavIndex});

  bool bottomNaviVisible;
  List<IconData> listIconPage;
  int bottomNavIndex;
  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.bottomNaviVisible,
      child: AnimatedBottomNavigationBar(
        activeColor: Colors.purple,
        splashColor: Colors.black.withOpacity(.8),
        inactiveColor: Colors.black.withOpacity(.4),
        gapLocation: GapLocation.none,
        notchSmoothness: NotchSmoothness.softEdge,
        icons: widget.listIconPage,
        activeIndex: widget.bottomNavIndex,
        onTap: ((index) {
          setState(() {
            widget.bottomNavIndex = index;
          });
        }),
      ),
    );
  }
}
