import 'package:flutter/material.dart';

import 'detai_after_choose_image.dart';
import 'show_detail_one_image.dart';

class TwoPictures extends StatefulWidget {
  TwoPictures({
    Key? key,
    required this.link,
  }) : super(key: key);
  List<String> link;

  @override
  State<TwoPictures> createState() => _TwoPicturesState();
}

class _TwoPicturesState extends State<TwoPictures> {
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
      //  height: size.height * .4,
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(right: 2),
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
            child: Padding(
              padding: const EdgeInsets.only(left: 2),
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
    );
  }
}
