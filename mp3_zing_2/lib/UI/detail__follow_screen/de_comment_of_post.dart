import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../model/commentdb.dart';
import 'detail_one_comment.dart';

class CommentOfPost extends StatefulWidget {
  CommentOfPost({super.key});

  @override
  State<CommentOfPost> createState() => _CommentOfPostState();
}

class _CommentOfPostState extends State<CommentOfPost> {
  bool checkColorLike = false;

  bool _islike = false;
  late FocusNode _focusNode = FocusNode();
  TextEditingController _editingController = new TextEditingController();
  List<CommentDB> _listComment = [
    CommentDB(
        id: '0',
        urlAvatar: 'assets/images/profile2.png',
        nameUser: 'Alice',
        content: 'Todo is a beautifull day',
        date: '17-05-2022',
        numberLike: 5,
        isLike: false),
    CommentDB(
        id: '1',
        urlAvatar: 'assets/images/person2.png',
        nameUser: 'Locas',
        content: 'Amazing, good job!',
        date: '22-10-2022',
        numberLike: 7,
        isLike: false),
    CommentDB(
        id: '2',
        urlAvatar: 'assets/images/person3.png',
        nameUser: 'Harry',
        content: 'Bánh mì giỏi tất cả các môn ở đây _Doremon',
        date: '17-03-2022',
        numberLike: 10,
        isLike: true),
    CommentDB(
        id: '3',
        urlAvatar: 'assets/images/person4.png',
        nameUser: 'Fiora',
        content:
            'có bánh mì đầu thai sang kiếp khác kh vậy. Kiếp này môn nào cx sợ hết trơn á =)',
        date: '25-05-2022',
        numberLike: 25,
        isLike: false),
    CommentDB(
        id: '4',
        urlAvatar: 'assets/images/person5.png',
        nameUser: 'Viktor',
        content: 'Mỗi khi nghe lại bài này cảm xúc từ bao nhiêu năm lại ùa về',
        date: '27-08-2022',
        numberLike: 98,
        isLike: true),
    CommentDB(
        id: '5',
        urlAvatar: 'assets/images/person6.png',
        nameUser: 'Frant Kit',
        content: 'Hôm nay thật là một ngày đẹp trời. ',
        date: '11-11-2022',
        numberLike: 4,
        isLike: false),
  ];

  void addComment(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDateNow = DateFormat('dd - MM - yyyy ').format(now);
    final _dataComment = _editingController.text;
    if (_dataComment.isEmpty) {
      return;
    }
    CommentDB _newComment = new CommentDB(
        id: '${_listComment.length}',
        urlAvatar: 'assets/images/profile2.png',
        nameUser: 'Duy Khánh',
        content: '$_dataComment',
        date: formattedDateNow,
        numberLike: 0,
        isLike: false);
    _listComment.add(_newComment);
    _editingController.clear();
    _focusNode.unfocus();
  }

  void updateLike(bool _islike, String id) {
    setState(() {
      _listComment[int.parse(id)].isLike = _islike;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    DateFormat dateFormat = DateFormat("yyyy-MM-dd ");

    String converStringToDate(String _date) {
      DateTime dateTime = dateFormat.parse(_date);
      String formattedOld = DateFormat('dd - MM - yyyy ').format(dateTime);
      return formattedOld;
    }

    return SizedBox(
      height: size.height,
      width: size.width,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 60, top: 15),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                // show list Comment of the Post
                children: _listComment
                    .map(
                      (item) => CommentDetailOfPost(
                        id: item.id,
                        urlAvatar: item.urlAvatar,
                        nameUser: item.nameUser,
                        date: item.date,
                        content: item.content,
                        numberLike: item.numberLike,
                        islike: item.isLike,
                        index: _listComment.indexOf(item),
                        updateLike: updateLike,
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          // Input Comment of The Post
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Container(
              height: 50,
              width: size.width,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: size.width * .1,
                    height: 50,
                    margin: EdgeInsets.only(right: 8, left: 8),
                    child: CircleAvatar(
                      backgroundImage:
                          ExactAssetImage('assets/images/profile2.png'),
                      radius: 50,
                    ),
                    decoration: BoxDecoration(shape: BoxShape.circle),
                  ),
                  Container(
                    height: 40,
                    width: size.width * .7,
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(.2),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: TextFormField(
                      controller: _editingController,
                      focusNode: _focusNode,
                      decoration: InputDecoration(
                        hintText: 'Nhập bình luận...',
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: (() {
                        setState(() {
                          addComment(context);
                        });
                      }),
                      icon: Image.asset('assets/icons/right-arrow.png'))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
