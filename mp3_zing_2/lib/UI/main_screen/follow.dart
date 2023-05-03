import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mp3_zing_2/controller/todo_controller.dart';

import '../../model/check_todo.dart';
import '../../model/todo.dart';
import '../../model/video_data.dart';
import '../../reponsitory/data_reponsitory.dart';
import '../detail__follow_screen/arrange_layout_pictures/reload_quayquay.dart';
import '../detail__follow_screen/card_story.dart';
import '../detail__follow_screen/divider_gachke.dart';
import '../detail__follow_screen/post_detail.dart';
import '../detail__follow_screen/sliver_appbar.dart';
import '../detail__follow_screen/story_detail.dart';

class FollowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyScaffold(),
    );
  }
}

class MyScaffold extends StatefulWidget {
  const MyScaffold({
    Key? key,
  }) : super(key: key);

  @override
  State<MyScaffold> createState() => _MyScaffoldState();
}

class _MyScaffoldState extends State<MyScaffold>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  List<String> ListNameDetail = [
    'assets/images/nature1.png',
    'assets/images/nature2.png',
    'assets/images/nature3.png',
    'assets/images/nature4.png',
    'assets/images/nature5.png',
    'assets/images/nature6.png',
  ];

  var todoController = TodoController(DataReponsitory());

  final ScrollController _scrollController = ScrollController();
  Future<List<Todo>> todoList = Future.value([]);

  //bool islike =
  late Check check;
  int valueInitState = 0;
  int currentPageA = 1;
  bool checkTodoList = false;

  Future<void> _loadMoreData() async {
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        currentPageA++;

        check = Check(
            orderBy: "DESC",
            currentPage: '$currentPageA',
            numberOfRecord: "10",
            secretKey: "");
        // todoList = addTodoToList(check, todoList);

        todoList.then((list) async {
          List<Todo> afterList = await todoController.PostTodoList(check);
          list.addAll(afterList);
          return list;
        });
      });
    });
  }

  @override
  void initState() {
    super.initState();
    check = Check(
      orderBy: "DESC",
      currentPage: '$currentPageA',
      numberOfRecord: "5",
      secretKey: "",
    );
    todoList = todoController.PostTodoList(check);
    _scrollController.addListener(_handleScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _handleScroll() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      _loadMoreData();
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    Size size = MediaQuery.of(context).size;
    // check url image have be error or not

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        backgroundColor: Colors.white70,
      ),
      body: RefreshIndicator(
        onRefresh: () {
          setState(() {
            todoList = todoController.PostTodoList(check);
            currentPageA = 1;
            valueInitState = 0;
          });
          return Future<void>.delayed(const Duration(seconds: 3));
        },
        child: ListView(
          controller: _scrollController,
          scrollDirection: Axis.vertical,
          //  padding: EdgeInsets.only(top: 30),
          physics: ClampingScrollPhysics(),
          children: [
            SliverAppBarFL(),
            DividerGachKe(),
            // describe detail about the Story

            card_story(todoController: todoController, check: check),

            // Card(
            //   child: SingleChildScrollView(
            //     scrollDirection: Axis.horizontal,
            //     child: Row(
            //       children:
            //           ListNameDetail.map((item) => StoryFollow(item: item))
            //               .toList(),
            //     ),
            //   ),
            // ),

            DividerGachKe(),

            FutureBuilder<List<Todo>>(
                // future: valueInitState == 0
                //     ? todoController.PostTodoList(check)
                //     : todoList,
                future: todoList,
                builder: ((BuildContext context,
                    AsyncSnapshot<List<Todo>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        itemBuilder: ((context, index) {
                          // if (valueInitState == 0) {
                          //   todoList = todoController.PostTodoList(check);
                          // }

                          print(
                              'vi tri ptu: $index va do dai cua list post ${snapshot.data!.length} ');

                          if ((index + 1) == snapshot.data!.length) {
                            return const Padding(
                              padding: EdgeInsets.only(bottom: 10.0),
                              child: CupertinoActivityIndicator(),
                            );
                          }

                          var todo = snapshot.data![index];

                          void updateLikeOfPost(bool _islike, int _index) {
                            // setState(() {
                            //   var updateTodo = snapshot.data![_index];
                            //   updateTodo.isUserLike = _islike;
                            // });
                          }

                          List<String> _imageListBefore =
                              snapshot.data![index].pictures!;

                          //parameter into PostOfPage
                          String id_user = '${todo.userId}';
                          String name_user = '${todo.nguoiDang}';

                          String avatar_user = '${todo.avatarNguoiDang}';
                          String title_Post = '${todo.moTa}';
                          String quantityComment = '${todo.tongSoLuotComment}';
                          bool? islike = todo.isUserLike;

                          String numberLike = '${todo.tongSoLuotLike}';

                          return PostOfPage(
                            idUser: id_user,
                            nameUser: name_user,
                            avatarUser: avatar_user,
                            titlePost: title_Post,
                            quantityComment: quantityComment,
                            imageList: _imageListBefore,
                            islike: islike,
                            numberLike: numberLike,
                            updateLike: updateLikeOfPost,
                            index: index,
                          );
                        }));
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text("Error: ${snapshot.error}"),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                })),
          ],
        ),
      ),
    );
  }
}
