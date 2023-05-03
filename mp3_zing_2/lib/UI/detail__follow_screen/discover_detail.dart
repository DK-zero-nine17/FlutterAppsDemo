import 'package:flutter/material.dart';

class DiscoverDetailChoose extends StatelessWidget {
  DiscoverDetailChoose({
    Key? key,
    required this.title,
    required this.icon,
    required this.iconcolor,
  }) : super(key: key);

  var title;
  String icon;
  Color iconcolor;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: EdgeInsets.only(left: 5, right: 30),
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(.4),
            borderRadius: BorderRadius.circular(20)),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 30,
                padding: EdgeInsets.all(5),
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: iconcolor),
                child: Image.asset(
                  icon,
                  fit: BoxFit.scaleDown,
                  color: Colors.white,
                  width: 15,
                  height: 15,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ]));
  }
}
