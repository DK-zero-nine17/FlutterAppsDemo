import 'package:flutter/material.dart';
import 'package:mp3_zing_2/UI/detail__follow_screen/story_detail.dart';

import '../../controller/todo_controller.dart';
import '../../model/check_todo.dart';
import '../../model/video_data.dart';

class card_story extends StatefulWidget {
  card_story({
    Key? key,
    required this.todoController,
    required this.check,
  }) : super(key: key);

  final TodoController todoController;
  final Check check;

  @override
  State<card_story> createState() => _card_storyState();
}

class _card_storyState extends State<card_story>
    with AutomaticKeepAliveClientMixin {
  Future<List<VideoData>> videoList = Future.value([]);

  @override
  void initState() {
    super.initState();
    videoList = widget.todoController.PostVideoList(widget.check);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        height: 200,
        child: FutureBuilder<List<VideoData>>(
          future: videoList,
          builder:
              (BuildContext context, AsyncSnapshot<List<VideoData>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: ((context, index) {
                  var videodata = snapshot.data![index];
                  List<String> imageList = snapshot.data![index].pictures!;

                  //parameter into VideoOfPage

                  String avatarUser = '${videodata.avatarNguoiDang}';
                  String videoUrl = '${videodata.videoUrl}';
                  String mota = '${videodata.moTa}';
                  String videoPicture = '${videodata.thumbnail}';
                  String nguoidang = '${videodata.nguoiDang}';
                  // //
                  print(
                      'videooooooooooooooooooooooooooooooooooooooooooooooooooooo   $videoUrl ');
                  return StoryFollow(
                    avatarUser: avatarUser,
                    videoUrl: videoUrl,
                    mota: mota,
                    videoPicture: videoPicture,
                    nguoidang: nguoidang,
                    index: index,
                  );
                }),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
