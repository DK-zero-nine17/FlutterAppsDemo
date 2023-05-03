import 'package:flutter/material.dart';

import '../check_url_api.dart';
import '../detail_afterchoose_picture.dart';

class ThreePictures extends StatefulWidget {
  ThreePictures({
    Key? key,
    required this.link,
  }) : super(key: key);
  List<String> link;

  @override
  State<ThreePictures> createState() => _ThreePicturesState();
}

class _ThreePicturesState extends State<ThreePictures> {
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
    return Container(
      height: size.height * .4,
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: size.height * .4,
            width: size.width * .6 - 20,
            padding: const EdgeInsets.only(right: 1),
            child: InkWell(
              onTap: () {
                goPageDetailPicture(0, widget.link);
              },
              child: CheckUrlOfImage(imageUrl: checkLinkImage(widget.link[0])),
            ),
          ),
          Container(
            height: size.height * .4,
            width: size.width * .4,
            padding: const EdgeInsets.only(left: 1),
            child: Column(
              children: [
                Container(
                  height: size.height * .2,
                  width: size.width * .4,
                  padding: const EdgeInsets.only(bottom: 1),
                  child: InkWell(
                    onTap: () {
                      goPageDetailPicture(1, widget.link);
                    },
                    child: CheckUrlOfImage(
                        imageUrl: checkLinkImage(widget.link[1])),
                  ),
                ),
                Container(
                  height: size.height * .2,
                  width: size.width * .4,
                  padding: const EdgeInsets.only(top: 1),
                  child: InkWell(
                    onTap: () {
                      goPageDetailPicture(2, widget.link);
                    },
                    child: CheckUrlOfImage(
                        imageUrl: checkLinkImage(widget.link[2])),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
