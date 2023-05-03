import 'package:flutter/material.dart';
import 'package:expandable_text/expandable_text.dart';
import 'arrange_layout_pictures/five_pictures.dart';
import 'arrange_layout_pictures/four_pictures.dart';
import 'arrange_layout_pictures/more_five_pictures.dart';
import 'arrange_layout_pictures/one_picture.dart';
import 'arrange_layout_pictures/three_pictures.dart';
import 'arrange_layout_pictures/two_pictures.dart';
import 'check_url_avatar_post.dart';
import 'de_comment_of_post.dart';
import 'islike_of_post.dart';

class PostOfPage extends StatefulWidget {
  PostOfPage({
    Key? key,
    required this.idUser,
    required this.nameUser,
    required this.avatarUser,
    required this.titlePost,
    required this.quantityComment,
    required this.imageList,
    required this.islike,
    required this.numberLike,
    required this.updateLike,
    required this.index,
  }) : super(key: key);

  var idUser;
  var nameUser;
  var avatarUser, titlePost, quantityComment;
  List<String> imageList;
  bool? islike;
  //List<bool?> islike;
  var numberLike;
  Function updateLike;
  int index;

  @override
  State<PostOfPage> createState() => _PostOfPageState();
}

class _PostOfPageState extends State<PostOfPage> {
  bool _likePost = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // _likePost = widget.islike;
  }

  String _avatar = '';
  String checkLinkImage(String lt) {
    setState(() {
      _avatar = lt.replaceAll('"', '');
    });
    return _avatar;
  }

  int demLike = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final _lengthListImage = widget.imageList.length;

    List<Widget> ListLayoutPictures = [
      OnePicture(link: widget.imageList),
      TwoPictures(link: widget.imageList),
      ThreePictures(link: widget.imageList),
      FourPictures(
        link: widget.imageList,
      ),
      FivePictures(link: widget.imageList),
      MoreFivePictures(
        link: widget.imageList,
        lengthPic: _lengthListImage,
      ),
    ];

    Widget getWidget() {
      if (_lengthListImage == 0) {
        return SizedBox(
          height: 10,
        );
      } else if (_lengthListImage < 6) {
        return ListLayoutPictures[_lengthListImage - 1];
      }
      return ListLayoutPictures[5];
    }

    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    '${widget.nameUser}', // tac gia cua bai viet
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: 30,
                    child: Image.asset('assets/icons/dot.png'),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Quan Tâm',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.purple,
                    ),
                  ),
                )
              ],
            ),
            subtitle: Text('Đề xuất cho bạn'), // subtitle
            trailing: Container(
              width: 40,
              child: Image.asset(
                'assets/icons/three-dots.png',
              ),
            ),
            leading: Container(
              width: size.width * .1,
              height: size.height * .1,

              child: CheckAvatarUrl(
                imageUrl: checkLinkImage('${widget.avatarUser}'),
              ),

              // child: CircleAvatar(
              //   backgroundImage: NetworkImage(
              //     '${widget.avatarUser}',
              //   ),
              //   //ExactAssetImage('assets/images/profile2.png'),
              //   radius: 50,
              // ),
              //--
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
            ),
          ),

          Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ExpandableText(
                '${widget.titlePost}',
                expandText: ' Xem thêm',
                expandOnTextTap: true,
                collapseOnTextTap: true,
                animation: true,
                maxLines: 4,
                linkColor: Colors.black.withOpacity(.7),
                style: TextStyle(
                  fontSize: 18,
                ),
              )
              //  Text(
              //   // 'Ngắm hoàng hôn tôi quên cả trời tối \nNgắm em cười tôi quên cả thanh xuân.',
              //   '${widget.titlePost}',
              //   style: TextStyle(fontSize: 16),
              // ),
              ),
          // Images of Post
          Card(
            child: getWidget(),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 20,
                      width: 20,
                      child: Image.asset(
                        'assets/icons/heart.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                      height: 20,
                      width: 20,
                      child: Image.asset(
                        'assets/icons/haha.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    SizedBox(
                      height: 18,
                      width: 18,
                      child: Image.asset(
                        'assets/icons/laughing.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 20,
                      child: demLike == 0 && int.parse(widget.numberLike) == 0
                          ? Text(
                              '   \t ',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 57, 55, 55)),
                            )
                          : Text(
                              '${demLike + int.parse(widget.numberLike)}  \t ',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 57, 55, 55)),
                            ),
                    )
                  ],
                ),
                Text(
                  '${widget.quantityComment} bình luận',
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
          ),
          // Chua cac muc like, comment, share
          ///////////////////////////iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii
          LikeOfPost(),
        ],
      ),
    );
  }
}
