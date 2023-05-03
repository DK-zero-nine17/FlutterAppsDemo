import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'check_url_api.dart';
import 'check_url_avatar_post.dart';

class DetailVideoAfterChoose extends StatefulWidget {
  DetailVideoAfterChoose({
    super.key,
    required this.index,
    required this.urlVideo,
    required this.nguoidang,
    required this.avataruser,
  });
  String urlVideo;
  final int index;
  String nguoidang, avataruser;

  @override
  State<DetailVideoAfterChoose> createState() => _DetailVideoAfterChooseState();
}

class _DetailVideoAfterChooseState extends State<DetailVideoAfterChoose> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;
  //bool _isPlaying = true;

  String _avatar = '';

  String checkLinkImage(String lt) {
    setState(() {
      _avatar = lt.replaceAll('"', '');
    });
    return _avatar;
  }

  // controller of Page
  final PageController _pageController = PageController(initialPage: 0);

  int currentIndex = 0;

  //initState of Video
  @override
  void initState() {
    super.initState();

    // _controller = VideoPlayerController.network('${widget.urlVideo}')
    //   ..initialize().then((_) {
    //     setState(() {});
    //   });
    _controller = VideoPlayerController.network(checkLinkImage(
        'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4'))
      ..initialize().then((_) {
        setState(() {});
      });
    //
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey,
      body: Container(
        child: Stack(children: [
          // PageView(
          //   controller: _pageController,
          //   onPageChanged: (value) {
          //     currentIndex = value;
          //   },
          //   children: widget.list
          //       .map(
          //         (e) => DetailImageAfterChoose(size, checkLinkImage(e)),
          //       )
          //       .toList(),
          // ),
          Center(
            child: _controller.value.isInitialized
                ? Stack(
                    children: [
                      AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      ),
                      Positioned.fill(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _isPlaying = !_isPlaying;
                              _isPlaying
                                  ? _controller.play()
                                  : _controller.pause();
                            });
                          },
                          child: _isPlaying
                              ? Container()
                              : Icon(
                                  Icons.play_arrow,
                                  size: 50,
                                  color: Colors.white,
                                ),
                        ),
                      ),
                    ],
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
          InkWell(
            onTap: (() {
              Navigator.pop(context);
            }),
            child: Positioned(
              top: 35,
              left: 20,
              child: Container(
                height: 25,
                width: 10,
                child: Image.asset(
                  'assets/icons/arrow.png',
                  width: 15,
                  color: Colors.black.withOpacity(.6),
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 70,
              right: 20,
              child: Container(
                child: Column(children: [
                  IconButton(
                      onPressed: (() {}),
                      icon: Image.asset(
                        'assets/icons/heart_outline.png',
                        width: 25,
                      )),
                  Text('0'),
                  IconButton(
                      onPressed: (() {}),
                      icon: Image.asset(
                        'assets/icons/comment_outline.png',
                        width: 38,
                      )),
                  Text('0'),
                  IconButton(
                      onPressed: (() {}),
                      icon: Image.asset(
                        'assets/icons/share_outline.png',
                        width: 22,
                      )),
                  Text('Chia sẻ'),
                ]),
              )),
          Positioned(
              bottom: 40,
              left: 20,
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    margin: EdgeInsets.only(right: 8),
                    child: CheckAvatarUrl(
                      imageUrl: checkLinkImage('${widget.avataruser}'),
                    ),
                  ),
                  Text('${widget.nguoidang}'),
                ],
              ))
        ]),
      ),
    );
  }

  Container DetailImageAfterChoose(Size size, String e) {
    return Container(
      child: CheckUrlOfImage(imageUrl: e),
      // Image.network(
      //   checkLinkImage(e),
      //   fit: BoxFit.fill,
      // ),
    );
  }
}
