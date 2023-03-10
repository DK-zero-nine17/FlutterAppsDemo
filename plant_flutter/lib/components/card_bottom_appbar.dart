
import 'package:flutter/material.dart';

class MyBottomAppBar extends StatelessWidget {
  const MyBottomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        child: Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 50,
      color: Colors.grey,
      child:
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Image.asset(
          'assets/icons/flower.png',
          height: 30,
        ),
        Image.asset(
          'assets/icons/heart-icon.png',
          height: 30,
        ),
        Image.asset(
          'assets/icons/user-icon.png',
          height: 30,
        ),
      ]),
    ));
  }
}
