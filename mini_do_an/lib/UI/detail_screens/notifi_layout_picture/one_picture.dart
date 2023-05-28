import 'dart:io';

import 'package:flutter/material.dart';

import 'detai_after_choose_image.dart';

class OnePicture extends StatefulWidget {
  OnePicture({
    Key? key,
    required this.link,
  }) : super(key: key);
  List<String> link;

  @override
  State<OnePicture> createState() => _OnePictureState();
}

class _OnePictureState extends State<OnePicture> {
  void goPageDetailPicture(int index, List<String> _listImage) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      builder: (BuildContext context) {
        return SizedBox(
          height: double.infinity,
          child: Center(
            child: DetailAfterChoose(
              list: _listImage,
              index: index,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        goPageDetailPicture(0, widget.link);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: size.height * .3,
        width: size.width,
        child: ClipRRect(
            // borderRadius: BorderRadius.circular(10.0),
            child: Image.file(
          File.fromUri(Uri.parse(widget.link[0])),
          // height: size.height * .3,
          // width: double.infinity,
          fit: BoxFit.cover,
        )),
      ),
    );
  }
}
