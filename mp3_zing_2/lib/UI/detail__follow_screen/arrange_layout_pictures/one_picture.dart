import 'package:flutter/material.dart';

import '../check_url_api.dart';
import '../detail_afterchoose_picture.dart';

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
  String _pic = '';

  String checkLinkImage(String lt) {
    setState(() {
      _pic = lt.replaceAll('"', '');
    });
    return _pic;
  }

  List<String> getListChoose(int index, List<String> _listA) {
    _listA.insert(0, _listA[index]);
    _listA.removeAt(index + 1);
    return _listA;
  }

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
        child: CheckUrlOfImage(imageUrl: checkLinkImage(widget.link[0])),
      ),
    );
  }
}
