import 'dart:convert';
import '../model/check_todo.dart';
import '../model/todo.dart';
import '../model/video_data.dart';
import 'reponsitory.dart';
import 'package:http/http.dart' as http;

class DataReponsitory implements Reponsitory {
  String url =
      'http://m-grac.bsp.vn:8002/api/grac-mobile-app/v1.0.1/getPostList';
  String urlVideo =
      'http://m-grac.bsp.vn:8002/api/grac-mobile-app/v1.0.1/getVideoPostList';

  @override
  Future<List<Todo>> postData(Check check) async {
    List<Todo> _listData = [];

    var response = await http.post(Uri.parse(url), body: check.toJson());
    // print('state code: ${response.statusCode}');
    // print('Show result: ${response.body}');
    var _listJson = json.decode(response.body);
    // print('value of listJson:  $_listJson');
    var jsonMap = _listJson['data'];
    for (var i = 0; i < jsonMap.length; i++) {
      // print('gia tri cua moi lan lap: ${jsonMap[i]}');
      _listData.add(Todo.fromJson(jsonMap[i]));
    }

    return _listData;
  }

  @override
  Future<List<VideoData>> postVideo(Check check) async {
    List<VideoData> _listVideoData = [];

    var response = await http.post(Uri.parse(urlVideo), body: check.toJson());
    print('state code: ${response.statusCode}');
    print('Show result: ${response.body}');
    var _listJson = json.decode(response.body);
    print('value of listJson:  $_listJson');
    var jsonMap = _listJson['data'];
    for (var i = 0; i < jsonMap.length; i++) {
      print('gia tri cua moi lan lap: ${jsonMap[i]}');
      _listVideoData.add(VideoData.fromJson(jsonMap[i]));
    }

    return _listVideoData;
  }
}
