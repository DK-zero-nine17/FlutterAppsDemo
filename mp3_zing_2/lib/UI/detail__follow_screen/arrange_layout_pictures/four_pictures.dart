import 'package:flutter/material.dart';

import '../check_url_api.dart';
import '../detail_afterchoose_picture.dart';

class FourPictures extends StatefulWidget {
  FourPictures({
    Key? key,
    required this.link,
  }) : super(key: key);
  List<String> link;

  @override
  State<FourPictures> createState() => _FourPicturesState();
}

class _FourPicturesState extends State<FourPictures> {
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              height: size.height * .2 + 30,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 1),
                      child: InkWell(
                        onTap: () {
                          goPageDetailPicture(0, widget.link);
                        },
                        child: CheckUrlOfImage(
                            imageUrl: checkLinkImage(widget.link[0])),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: size.height * .2 - 30,
              padding: EdgeInsets.only(top: 2),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.only(right: 2),
                      height: size.height * .2 - 30,
                      child: InkWell(
                        onTap: () {
                          goPageDetailPicture(1, widget.link);
                        },
                        child: CheckUrlOfImage(
                            imageUrl: checkLinkImage(widget.link[1])),

                        // ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: size.height * .2 - 30,
                      padding: const EdgeInsets.only(right: 2),
                      child: InkWell(
                        onTap: () {
                          goPageDetailPicture(2, widget.link);
                        },
                        child: CheckUrlOfImage(
                            imageUrl: checkLinkImage(widget.link[2])),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: size.height * .2 - 30,
                      child: InkWell(
                        onTap: () {
                          goPageDetailPicture(3, widget.link);
                        },
                        child: CheckUrlOfImage(
                            imageUrl: checkLinkImage(widget.link[3])),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
