import 'package:flutter/material.dart';

import 'check_url_api.dart';

class DetailAfterChoose extends StatefulWidget {
  DetailAfterChoose({
    super.key,
    required this.list,
    required this.index,
  });
  List<String> list;
  final int index;

  @override
  State<DetailAfterChoose> createState() => _DetailAfterChooseState();
}

class _DetailAfterChooseState extends State<DetailAfterChoose> {
  String _avatar = '';

  String checkLinkImage(String lt) {
    setState(() {
      _avatar = lt.replaceAll('"', '');
    });
    return _avatar;
  }

  final PageController _pageController = PageController(initialPage: 0);

  int currentIndex = 0;

// this function help me get into Page That I want to show
  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_pageController.hasClients) _pageController.jumpToPage(widget.index);
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey,
      body: Stack(children: [
        PageView(
          controller: _pageController,
          onPageChanged: (value) {
            currentIndex = value;
          },
          children: widget.list
              .map(
                (e) => DetailImageAfterChoose(size, checkLinkImage(e)),
              )
              .toList(),
        ),
        InkWell(
          onTap: (() {
            Navigator.pop(context);
          }),
          child: Positioned(
            top: 0,
            left: 0,
            width: double.infinity,
            child: Container(
              height: 60,
              margin: EdgeInsets.only(top: 50),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
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
                  Expanded(
                    flex: 6,
                    child: Container(
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Container DetailImageAfterChoose(Size size, String e) {
    return Container(
      margin: EdgeInsets.only(top: 120, bottom: 100),
      child: CheckUrlOfImage(imageUrl: e),
      // Image.network(
      //   checkLinkImage(e),
      //   fit: BoxFit.fill,
      // ),
    );
  }
}
