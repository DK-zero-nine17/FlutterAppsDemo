import 'dart:io';

import 'package:flutter/material.dart';

import 'show_detail_one_image.dart';

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
      backgroundColor: Colors.black,
      body: Stack(children: [
        PageView(
          controller: _pageController,
          onPageChanged: (value) {
            currentIndex = value;
          },
          children: widget.list
              .map(
                (item) => Container(
                  margin: EdgeInsets.only(top: 120, bottom: 100),
                  child: ClipRRect(
                      // borderRadius: BorderRadius.circular(10.0),
                      child: Image.file(
                    File.fromUri(Uri.parse(item)),
                    // height: 300.0,
                    // width: double.infinity,
                    fit: BoxFit.cover,
                  )),
                ),
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
                        color: Colors.white.withOpacity(.6),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Container(
                      color: Colors.black,
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
}
