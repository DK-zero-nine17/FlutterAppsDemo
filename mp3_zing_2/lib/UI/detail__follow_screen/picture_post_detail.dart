import 'package:flutter/material.dart';

class PicturesOfPost extends StatelessWidget {
  PicturesOfPost({
    Key? key,
    required this.link,
  }) : super(key: key);
  var link;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      height: size.height * .3,
      width: size.width,
      child: Image.network(
        link,
        fit: BoxFit.cover,
      ),
    );
  }
}
