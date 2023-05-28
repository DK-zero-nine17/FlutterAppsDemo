import 'dart:io';

import 'package:date_format/date_format.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mini_do_an/Database/query_data.dart';
import 'package:mini_do_an/Model/post.dart';
import 'package:mini_do_an/UI/detail_screens/notifi_detail/detail_one_comment.dart';

import '../notifi_layout_picture/five_pictures.dart';
import '../notifi_layout_picture/four_pictures.dart';
import '../notifi_layout_picture/more_five_pictures.dart';
import '../notifi_layout_picture/one_picture.dart';
import '../notifi_layout_picture/three_pictures.dart';
import '../notifi_layout_picture/two_pictures.dart';

class DetailItemOfNotify extends StatefulWidget {
  DetailItemOfNotify({
    super.key,
    required this.newPost,
  });
  Post newPost;

  @override
  State<DetailItemOfNotify> createState() => _DetailItemOfNotifyState();
}

class _DetailItemOfNotifyState extends State<DetailItemOfNotify> {
  String converStringToDate(String _date) {
    DateTime now = DateTime.now();
    String formattedDateNow = DateFormat('dd-MM-yyyy ').format(now);
    return formattedDateNow;
    // DateTime dateTime = dateFormat.parse(_date);
    // String formattedOld = DateFormat('dd - MM - yyyy ').format(dateTime);
    // return formattedOld;
  }

  List<String> listImageFromData = [];
  List<Widget> listLayoutPictures = [];
  var _lengthListImage;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listImageFromData = widget.newPost.picturesPost!.split(',');
    _lengthListImage = listImageFromData.length;

    listLayoutPictures = [
      OnePicture(link: listImageFromData),
      TwoPictures(link: listImageFromData),
      ThreePictures(link: listImageFromData),
      FourPictures(
        link: listImageFromData,
      ),
      FivePictures(link: listImageFromData),
      MoreFivePictures(
        link: listImageFromData,
      ),
    ];
  }

  bool isComment = false;

  // late File imageFile;

  // File extractImageFromFile(String? imagePath) {
  //   if (widget.newPost.picturesPost == null) {
  //     return imageFile;
  //   }
  //   return File(imagePath!);
  // }

  Widget getWidget() {
    if (_lengthListImage == 0) {
      return SizedBox(
        height: 10,
      );
    } else if (_lengthListImage < 6) {
      return listLayoutPictures[_lengthListImage - 1];
    }
    return listLayoutPictures[5];
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    void goPageDetailPicture(Post newPost) {
      showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        builder: (BuildContext context) {
          return SizedBox(
            height: size.height,
            child: Center(
              child: DetailItemOfNotify(
                newPost: newPost,
              ),
            ),
          );
        },
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: size.width * .1,
                child: Icon(
                  Icons.arrow_back_outlined,
                  color: Colors.black,
                  size: 25,
                ),
              ),
            ),
            Container(
              width: size.width * .4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      print('delete');
                    },
                    child: Icon(
                      Icons.delete_rounded,
                      color: Colors.black,
                      size: 25,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print('chua doc thu');
                    },
                    child: Container(
                        width: 25,
                        child: Image.asset(
                          'assets/icons/letter.png',
                          color: Colors.black,
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      print('chinh sua');
                    },
                    child: Container(
                        width: 50,
                        child: Image.asset(
                          'assets/icons/three-dots.png',
                          color: Colors.black,
                        )),
                  ),
                ],
              ),
            )
          ]),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                margin: isComment
                    ? EdgeInsets.only(bottom: 60)
                    : EdgeInsets.only(bottom: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: Text(
                        //'Title of Notification: Do you like to have flowers in your home? ',
                        "${widget.newPost.tieudePost}",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              //'Khanh Herry', // tac gia cua bai viet
                              "${widget.newPost.nguoiguiPost}",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Container(
                              child: Text(
                                converStringToDate(
                                    "${widget.newPost.datePost}"),
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 57, 55, 55)
                                      .withOpacity(.8),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${widget.newPost.trangThai}",
                          ),
                          Icon(
                            Icons.star,
                          ),
                        ],
                      ),
                      leading: Container(
                        width: size.width * .1,
                        height: 50,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                            'http://m-grac.bsp.vn:8002/images/app-user-images/avatar-168233194564465929ab446-the_death.png',
                          ),
                          radius: 50,
                        ),
                        decoration: BoxDecoration(shape: BoxShape.circle),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: ExpandableText(
                        //  'Yes, I do like to have flowers in my home because it helps the atmosphere of my home to become more lively with a touch of nature. Besides, having flowers in the home allows us to refresh our mind and body with its flowery fragrance. It is an important tradition for the people in my country to have some sort of flowers at their home whenever there is a special occasion or festival.',
                        "${widget.newPost.noidungPost}",
                        expandText: 'Xem thêm',
                        expandOnTextTap: true,
                        collapseOnTextTap: true,
                        animation: true,
                        maxLines: 4,
                        linkColor: Colors.black,
                        style: TextStyle(
                            fontSize: 18, color: Colors.black.withOpacity(.8)),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Mức độ hư hỏng: "${widget.newPost.mdHuHong}"',
                      style: TextStyle(
                          fontSize: 16, color: Colors.black.withOpacity(.8)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Mức độ cần thiết: "${widget.newPost.mdCanThiet}"',
                      style: TextStyle(
                          fontSize: 16, color: Colors.black.withOpacity(.8)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Thiết Bị: "${widget.newPost.thietBi}"',
                      style: TextStyle(
                          fontSize: 16, color: Colors.black.withOpacity(.8)),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    getWidget(),
                    Divider(
                      height: 1,
                      thickness: 1,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isComment = !isComment;
                        });
                      },
                      child: Container(
                        height: 60,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.comment_rounded),
                              Text(
                                'Comment',
                                style: TextStyle(fontSize: 20),
                              )
                            ]),
                      ),
                    ),
                    DetailOfComment(),
                    DetailOfComment(),
                    Divider(
                      height: 2,
                      thickness: 2,
                    ),
                    Text(
                      'Danh sách các bài viết tương tự: ',
                      style: TextStyle(fontSize: 22),
                    ),
                    Container(
                      height: 200,
                      width: size.width,
                      child: FutureBuilder(
                          future: DBProvider.db.getInforListLienQuanPost(
                              widget.newPost.id,
                              "${widget.newPost.thietBi}",
                              "${widget.newPost.diachi}"),
                          builder: ((context, snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                  itemCount: snapshot.data?.length,
                                  itemBuilder: ((context, index) {
                                    Post item = snapshot.data![index];
                                    return InkWell(
                                      onTap: () {
                                        //Post _newPost = snapshot.data![index];
                                        goPageDetailPicture(item);
                                      },
                                      child: Card(
                                        child: ListTile(
                                          title: Container(
                                            padding: EdgeInsets.only(top: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '${item.nguoiguiPost}', // tac gia cua bai viet
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black),
                                                ),
                                                Container(
                                                  child: Text(
                                                    converStringToDate(
                                                        "${item.datePost}"),
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color: Color.fromARGB(
                                                              255, 57, 55, 55)
                                                          .withOpacity(.8),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          subtitle: Row(
                                            children: [
                                              Expanded(
                                                flex: 7,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                        child: ExpandableText(
                                                      '${item.tieudePost}'
                                                      // 'Title of Notification. In there, i have a lot of things.'
                                                      ,
                                                      expandText: '',
                                                      expandOnTextTap: false,
                                                      collapseOnTextTap: false,
                                                      animation: false,
                                                      maxLines: 1,
                                                      linkColor: Colors.black,
                                                      style: TextStyle(
                                                          fontSize: 17,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      textAlign:
                                                          TextAlign.justify,
                                                    )),
                                                    Container(
                                                        child: ExpandableText(
                                                      // 'Content: I would say that my parents managed to spend a good amount of time with me during my childhood, especially my mother who was a housewife and stayed at home all the time.',
                                                      "${item.noidungPost}",
                                                      expandText: '',
                                                      expandOnTextTap: false,
                                                      collapseOnTextTap: false,
                                                      animation: false,
                                                      maxLines: 1,
                                                      linkColor: Colors.black,
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.black),
                                                      // textAlign: TextAlign.justify,
                                                    )),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Icon(
                                                  Icons.star,
                                                ),
                                              ),
                                            ],
                                          ),
                                          leading: Container(
                                            width: size.width * .1,
                                            height: 50,
                                            child: CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                'http://m-grac.bsp.vn:8002/images/app-user-images/avatar-168233194564465929ab446-the_death.png',
                                              ),
                                              radius: 50,
                                            ),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle),
                                          ),
                                        ),
                                      ),
                                    );
                                  }));
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                          })),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 2,
              left: 0,
              right: 0,
              child: !isComment
                  ? SizedBox(
                      height: 5,
                    )
                  : Container(
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
                              // controller: _editingController,
                              // focusNode: _focusNode,
                              decoration: InputDecoration(
                                hintText: 'Nhập bình luận...',
                              ),
                            ),
                          ),
                          IconButton(
                              onPressed: (() {
                                setState(() {
                                  // addComment(context);
                                });
                              }),
                              icon: Image.asset('assets/icons/right-arrow.png'))
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
