import 'package:flutter/material.dart';

import 'de_comment_of_post.dart';

class LikeOfPost extends StatefulWidget {
  const LikeOfPost({super.key});

  @override
  State<LikeOfPost> createState() => _LikeOfPostState();
}

class _LikeOfPostState extends State<LikeOfPost> {
  bool _likePost = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                if (_likePost == true) {
                  //demLike -= 1;
                  // setState(() {
                  _likePost = false;
                  // });
                  // widget.updateLike(false, widget.index);
                } else {
                  //demLike += 1;
                  // setState(() {
                  _likePost = true;
                  // });
                  // widget.updateLike(true, widget.index);
                }
              });
            },
            child: Container(
              child: Row(
                children: [
                  SizedBox(
                    width: 4,
                  ),
                  _likePost == true
                      ? Image.asset(
                          'assets/icons/heart.png',
                          color: Colors.red,
                          width: 20,
                        )
                      : Image.asset(
                          'assets/icons/heart_outline.png',
                          color: Colors.black,
                          width: 20,
                        ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Thích',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
          // Function Comment
          InkWell(
            onTap: () {
              showModalBottomSheet<void>(
                context: context,
                isScrollControlled: false,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                builder: (BuildContext context) {
                  return SizedBox(
                    height: size.height * .7,
                    child: Center(
                      child: CommentOfPost(),
                    ),
                  );
                },
              );
            },
            child: Container(
              child: Row(
                children: [
                  Container(
                      width: 30,
                      child: Image.asset('assets/icons/comment_outline.png')),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    'Bình luận',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Row(
              children: [
                Image.asset(
                  'assets/icons/share.png',
                  width: 20,
                  color: Colors.black.withOpacity(.7),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  'Chia sẻ',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
