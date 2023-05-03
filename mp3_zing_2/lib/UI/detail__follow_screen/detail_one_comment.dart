import 'package:flutter/material.dart';

class CommentDetailOfPost extends StatefulWidget {
  CommentDetailOfPost({
    super.key,
    required this.id,
    required this.urlAvatar,
    required this.nameUser,
    required this.date,
    required this.content,
    required this.numberLike,
    required this.islike,
    required this.index,
    required this.updateLike,
  });
  String id;
  String urlAvatar;
  String nameUser;
  String date;
  String content;
  int numberLike;
  bool islike;
  var index;
  Function updateLike;

  @override
  State<CommentDetailOfPost> createState() => _CommentDetailOfPostState();
}

class _CommentDetailOfPostState extends State<CommentDetailOfPost> {
  int demLike = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListTile(
      title: Container(
        padding: EdgeInsets.only(top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.nameUser, // tac gia cua bai viet
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black.withOpacity(.7)),
            ),
            Container(
              width: 30,
              child: Image.asset('assets/icons/dot.png'),
            ),
            Text(
              widget.date,
              style: TextStyle(
                fontSize: 15,
                color: Color.fromARGB(255, 57, 55, 55).withOpacity(.8),
              ),
            )
          ],
        ),
      ),
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.content,
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: (() {
                  setState(() {
                    if (widget.islike) {
                      demLike -= 1;
                      widget.updateLike(false, widget.id);
                    } else {
                      demLike += 1;

                      widget.updateLike(true, widget.id);
                    }
                  });
                }),
                icon: widget.islike == true
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
              ),
              InkWell(
                onTap: () {},
                child: demLike == 0 && widget.numberLike == 0
                    ? Text(
                        '   \t |',
                        style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 57, 55, 55)),
                      )
                    : Text(
                        '${demLike + widget.numberLike} \t |',
                        style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 57, 55, 55)),
                      ),
              ),
              SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  'Trả lời',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 57, 55, 55).withOpacity(.8)),
                ),
              )
            ],
          )
        ],
      ), // subtitle
      trailing: Container(
        width: 40,
        child: Image.asset(
          'assets/icons/three-dots.png',
        ),
      ),
      leading: Container(
        width: size.width * .1,
        height: 50,
        margin: EdgeInsets.only(right: 8),
        child: CircleAvatar(
          backgroundImage: ExactAssetImage(widget.urlAvatar),
          radius: 50,
        ),
        decoration: BoxDecoration(shape: BoxShape.circle),
      ),
    );
  }
}
