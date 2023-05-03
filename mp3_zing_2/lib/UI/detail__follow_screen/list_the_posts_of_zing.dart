import 'package:flutter/material.dart';
import 'package:mp3_zing_2/UI/detail__follow_screen/post_detail.dart';

import '../../model/check_todo.dart';
import '../../model/todo.dart';

class ListPostOfZing extends StatelessWidget {
  ListPostOfZing({
    super.key,
    required this.valueInitState,
    required this.todoController,
    required this.check,
    required this.todoList,
    required this.isLoadingMore,
  });
  int valueInitState;
  var todoController;
  Check check;
  Future<List<Todo>> todoList;
  bool isLoadingMore;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Todo>>(
        future:
            valueInitState == 0 ? todoController.PostTodoList(check) : todoList,
        builder: ((BuildContext context, AsyncSnapshot<List<Todo>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: ((context, index) {
                  if (valueInitState == 0) {
                    todoList = todoController.PostTodoList(check);
                  }

                  print(
                      'vi tri ptu: $index va do dai cua list post ${snapshot.data!.length} ');

                  if ((index + 1) == snapshot.data!.length) {
                    if (isLoadingMore) {
                      return Center(child: CircularProgressIndicator());
                    }
                  }
                  //else {
                  valueInitState++;
                  //
                  //

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
        }));
  }
}
