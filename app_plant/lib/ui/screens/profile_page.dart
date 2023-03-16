import 'package:flutter/material.dart';

import 'widgets/profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: ProfileWidget(
              icon: Icons.person,
              title: 'My Profile',
            )));
  }
}
