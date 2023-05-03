import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'UI/main_screen/discover.dart';
import 'UI/main_screen/follow.dart';
import 'UI/main_screen/individual.dart';
import 'UI/main_screen/radio.dart';
import 'UI/main_screen/zingchat.dart';

class MainSacffold extends StatefulWidget {
  const MainSacffold({
    Key? key,
  }) : super(key: key);

  @override
  State<MainSacffold> createState() => _MainSacffoldState();
}

class _MainSacffoldState extends State<MainSacffold> {
  int _bottomNavIndex = 0;

  // ẩn đi bottomNavigationBar
  bool _bottomNaviVisible = true;

  List<Widget> _listPageOption() {
    return [
      IndividualPage(),
      DiscoverPage(),
      ZingchatPage(),
      RadioPage(),
      FollowPage(),
    ];
  }

  List<IconData> _listIconPage = [
    Icons.music_note_outlined,
    Icons.circle_outlined,
    Icons.zoom_in_map,
    Icons.radio_outlined,
    Icons.list_alt_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _bottomNavIndex,
        children: _listPageOption(),
      ),
      bottomNavigationBar: Visibility(
        visible: _bottomNaviVisible,
        child: AnimatedBottomNavigationBar(
          activeColor: Colors.purple,
          splashColor: Colors.black.withOpacity(.8),
          inactiveColor: Colors.black.withOpacity(.4),
          gapLocation: GapLocation.none,
          notchSmoothness: NotchSmoothness.softEdge,
          icons: _listIconPage,
          activeIndex: _bottomNavIndex,
          onTap: ((index) {
            setState(() {
              _bottomNavIndex = index;
            });
          }),
        ),
      ),
    );
  }
}
