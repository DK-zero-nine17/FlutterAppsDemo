import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mini_do_an/Model/post.dart';

import '../../../Database/query_data.dart';
import 'detail_of_item_notifi.dart';

class ItemOfNotifi extends StatefulWidget {
  ItemOfNotifi({super.key});

  @override
  State<ItemOfNotifi> createState() => _ItemOfNotifiState();
}

class _ItemOfNotifiState extends State<ItemOfNotifi> {
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

    DateFormat dateFormat = DateFormat("yyyy-MM-dd ");

    String converStringToDate(String _date) {
      DateTime now = DateTime.now();
      String formattedDateNow = DateFormat('dd-MM-yyyy ').format(now);
      return formattedDateNow;
      // DateTime dateTime = dateFormat.parse(_date);
      // String formattedOld = DateFormat('dd - MM - yyyy ').format(dateTime);
      // return formattedOld;
    }

    return FutureBuilder<List<Post>>(
      // future: DBProvider.db.getAllPost(),
      future: DBProvider.db.getAllPost(),
      builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (BuildContext context, int index) {
              Post item = snapshot.data![index];
              return Dismissible(
                key: UniqueKey(),
                //
                confirmDismiss: (DismissDirection direction) async {
                  return await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Thông Báo:"),
                        content: const Text(
                            "Bạn có thật sự muốn xóa tin này không?"),
                        actions: <Widget>[
                          ElevatedButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: const Text("Có")),
                          ElevatedButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: const Text("Không"),
                          ),
                        ],
                      );
                    },
                  );
                },
                //

                background: Container(
                  color: Colors.black,
                  alignment: Alignment.centerLeft,
                  child: Center(
                    child: Icon(
                      Icons.delete,
                      color: Colors.amber,
                      size: 35,
                    ),
                    // child: Text(
                    //   'Delete',
                    //   style: TextStyle(
                    //       color: Colors.amber,
                    //       fontSize: 30,
                    //       fontWeight: FontWeight.bold),
                    // ),
                  ),
                ),
                onDismissed: (direction) {
                  DBProvider.db.deletePost(item.id);
                },
                child: InkWell(
                  onTap: () {
                    Post _newPost = snapshot.data![index];
                    goPageDetailPicture(_newPost);
                  },
                  child: Card(
                    child: ListTile(
                      title: Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '${item.nguoiguiPost}', // tac gia cua bai viet
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Container(
                              child: Text(
                                converStringToDate("${item.datePost}"),
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
                        children: [
                          Expanded(
                            flex: 7,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.justify,
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
                                      fontSize: 16, color: Colors.black),
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
                        decoration: BoxDecoration(shape: BoxShape.circle),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
