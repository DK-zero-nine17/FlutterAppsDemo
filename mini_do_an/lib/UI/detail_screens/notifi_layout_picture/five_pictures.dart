import 'package:flutter/material.dart';

import 'detai_after_choose_image.dart';
import 'show_detail_one_image.dart';

class FivePictures extends StatefulWidget {
  FivePictures({
    Key? key,
    required this.link,
  }) : super(key: key);
  List<String> link;

  @override
  State<FivePictures> createState() => _FivePicturesState();
}

class _FivePicturesState extends State<FivePictures> {
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
              height: size.height * .2 + 40,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.only(right: 1),
                      height: size.height * .2 + 50,
                      child: InkWell(
                        onTap: () {
                          goPageDetailPicture(0, widget.link);
                        },
                        child: ShowDetailOneImage(item: widget.link[0]),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.only(left: 1),
                      height: size.height * .2 + 50,
                      child: InkWell(
                        onTap: () {
                          goPageDetailPicture(1, widget.link);
                        },
                        child: ShowDetailOneImage(item: widget.link[1]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            height: 2,
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: size.height * .2 - 10,
              // padding: EdgeInsets.only(top: 2),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: size.height * .2 - 10,
                      padding: const EdgeInsets.only(right: 3),
                      child: InkWell(
                        onTap: () {
                          goPageDetailPicture(2, widget.link);
                        },
                        child: ShowDetailOneImage(item: widget.link[2]),

                        // ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: size.height * .2 - 10,
                      padding: const EdgeInsets.only(right: 3),
                      child: InkWell(
                        onTap: () {
                          goPageDetailPicture(3, widget.link);
                        },
                        child: ShowDetailOneImage(item: widget.link[3]),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: size.height * .2 - 10,
                      child: InkWell(
                        onTap: () {
                          goPageDetailPicture(4, widget.link);
                        },
                        child: ShowDetailOneImage(item: widget.link[4]),
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
