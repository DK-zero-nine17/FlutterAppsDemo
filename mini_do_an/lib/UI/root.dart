import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mini_do_an/UI/main_screens/history_screen.dart';
import 'package:mini_do_an/UI/main_screens/notification_screen.dart';
import 'package:mini_do_an/UI/main_screens/user_screen.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _bottomNavIndex = 0;

  List<Widget> _widgetOptions() {
    return [
      NotificationScreen(),
      HistoryScreen(),
      UserScreen(),
    ];
  }

  List<IconData> iconList = [
    Icons.home,
    Icons.chrome_reader_mode_rounded,
    Icons.person,
    //Icons.history_edu_outlined,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _bottomNavIndex,
        children: _widgetOptions(),
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        activeColor: const Color(0xff296e48),
        splashColor: Colors.black54,
        inactiveColor: Colors.black.withOpacity(.5),
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.none,
        notchSmoothness: NotchSmoothness.softEdge,
        onTap: ((index) {
          setState(() {
            _bottomNavIndex = index;
          });
        }),
      ),
    );
  }
}
