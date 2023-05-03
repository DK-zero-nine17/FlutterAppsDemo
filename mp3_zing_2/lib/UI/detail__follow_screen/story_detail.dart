import 'package:flutter/material.dart';

import 'check_url_api.dart';
import 'check_url_avatar_post.dart';
import 'detail_video_of_post.dart';

class StoryFollow extends StatefulWidget {
  StoryFollow({
    Key? key,
    //required this.item,
    required this.avatarUser,
    required this.videoUrl,
    required this.mota,
    required this.videoPicture,
    required this.nguoidang,
    required this.index,
  }) : super(key: key);
  //var item;
  var avatarUser, videoUrl, mota, videoPicture, nguoidang;
  var index;

  @override
  State<StoryFollow> createState() => _StoryFollowState();
}

class _StoryFollowState extends State<StoryFollow> {
  String _avatar = '';
  String checkLinkImage(String lt) {
    setState(() {
      print('urlviewoooooooooooooooooooooooooooo ${widget.videoUrl}');
      _avatar = lt.replaceAll('"', '');
    });
    return _avatar;
  }

  void goPageDetailPicture(
      int index, String urlVideo, String nguoidang, avataruser) {
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
            child: DetailVideoAfterChoose(
              index: index,
              urlVideo: urlVideo,
              nguoidang: nguoidang,
              avataruser: avataruser,
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
        goPageDetailPicture(
            widget.index, widget.videoUrl, widget.nguoidang, widget.avatarUser);
      },
      child: Container(
        height: 150,
        width: 120,
        margin: EdgeInsets.symmetric(horizontal: 4, vertical: 10),
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(8)),
        child: Stack(children: [
          Container(
            width: size.width,
            height: size.height,
            //child: Image.asset('${widget.item}'),
            child:
                CheckUrlOfImage(imageUrl: checkLinkImage(widget.videoPicture)),
          ),
          Positioned(
            left: 10,
            top: 10,
            child: Container(
              width: 40,
              height: 40,
              margin: EdgeInsets.only(right: 8),
              child: CheckAvatarUrl(
                imageUrl: checkLinkImage('${widget.avatarUser}'),
              ),
              // child: CircleAvatar(
              //   backgroundImage: ExactAssetImage('assets/images/profile2.png'),
              //   //backgroundImage: ExactAssetImage('${widget.avatarUser}'),
              //   radius: 50,
              // ),
              decoration: BoxDecoration(shape: BoxShape.circle),
            ),
          ),
          Positioned(
            bottom: 22,
            right: 5,
            left: 5,
            child: Text(
              // 'Harry',
              '${widget.nguoidang}',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ]),
      ),
    );
  }
}
