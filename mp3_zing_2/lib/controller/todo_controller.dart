import '../model/check_todo.dart';
import '../model/todo.dart';
import '../model/video_data.dart';
import '../reponsitory/reponsitory.dart';

class TodoController {
  final Reponsitory _reponsitory;
  TodoController(this._reponsitory);

  Future<List<Todo>> PostTodoList(Check check) async {
    return _reponsitory.postData(check);
  }

  Future<List<VideoData>> PostVideoList(Check check) async {
    return _reponsitory.postVideo(check);
  }
}
