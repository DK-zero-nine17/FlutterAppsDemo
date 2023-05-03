import '../model/check_todo.dart';
import '../model/todo.dart';
import '../model/video_data.dart';

abstract class Reponsitory {
  Future<List<Todo>> postData(Check check);
  Future<List<VideoData>> postVideo(Check check);
}
