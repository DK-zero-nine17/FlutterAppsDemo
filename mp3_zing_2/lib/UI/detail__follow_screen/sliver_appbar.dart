import 'package:flutter/material.dart';

import 'discover_detail.dart';

class SliverAppBarFL extends StatelessWidget {
  const SliverAppBarFL({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  width: size.width * .1,
                  height: 50,
                  margin: EdgeInsets.only(right: 8, left: 4),
                  child: CircleAvatar(
                    backgroundImage:
                        ExactAssetImage('assets/images/profile2.png'),
                    radius: 50,
                  ),
                  decoration: BoxDecoration(shape: BoxShape.circle),
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  height: 40,
                  width: size.width * .6 + 20,
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(.2),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 5,
                        child: SizedBox(
                          height: 35,
                          width: size.width * .4,
                          child: TextFormField(
                              decoration: InputDecoration(
                                  hintText: 'Tìm kiếm bài hát, nghệ sĩ...',
                                  icon: Icon(Icons.search))),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: IconButton(
                            onPressed: (() {}),
                            icon: Icon(
                              Icons.mic,
                            ),
                            color: Colors.blue,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: size.width * .1,
                  child: IconButton(
                    onPressed: (() {}),
                    icon: Icon(
                      Icons.notifications_none_outlined,
                      size: 28,
                      color: Colors.black.withOpacity(.7),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 60.0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                DiscoverDetailChoose(
                    title: 'Khám phá',
                    icon: 'assets/icons/apps.png',
                    iconcolor: Colors.purple),
                DiscoverDetailChoose(
                    title: 'Video',
                    icon: 'assets/icons/yoube.png',
                    iconcolor: Colors.blue),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
