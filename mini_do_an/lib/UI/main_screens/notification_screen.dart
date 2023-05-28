import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mini_do_an/Database/query_data.dart';
import 'package:mini_do_an/Model/account.dart';
import 'package:mini_do_an/Model/post.dart';
import 'package:mini_do_an/Model/user.dart';

import 'package:permission_handler/permission_handler.dart';

import '../detail_screens/notifi_detail/add_notify.dart';
import '../detail_screens/notifi_detail/carouse_slider.dart';
import '../detail_screens/notifi_detail/item_of_notifi.dart';
import '../detail_screens/notifi_detail/seleted_Image.dart';

class NotificationScreen extends StatefulWidget {
  NotificationScreen({
    super.key,

    // required this.itemPost
  });
//  Post itemPost;

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Account _accountMau =
    //     Account(id: 1, tenDNhap: 'a', matKhau: '1', email: 'st@utc');
    // User _userMau = User(
    //     id: 1,
    //     idAccount: 1,
    //     nameUser: 'Harry',
    //     lopUser: 'IT',
    //     sdtUser: '033',
    //     dateUser: '17-09-2022',
    //     diachiUser: 'Thu Duc',
    //     avatarUser: 'avatarUser');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        backgroundColor: Colors.white70,
      ),
      body: RefreshIndicator(
        onRefresh: () {
          setState(() {});
          return Future<void>.delayed(const Duration(seconds: 3));
        },
        child: CustomScrollView(
          physics: ClampingScrollPhysics(),
          shrinkWrap: true,
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              brightness: Brightness.light,
              title: SizedBox(height: 80),
              floating: true,
              pinned: false,
              snap: false,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(0),
                child: SizedBox(
                  child: Row(
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
                                ExactAssetImage('assets/icons/utc2.png'),
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
                                          hintText: 'Tìm kiếm thông tin',
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
                ),
              ),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
              return Carouse_Slider();
            }, childCount: 1)),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                // addAutomaticKeepAlives: false,
                (BuildContext context, int index) {
                  return
                      //ItemOfNotifi();

                      Container(
                          height: size.height * .6,
                          color: Colors.grey.withOpacity(.2),
                          padding: EdgeInsets.only(bottom: 30, top: 5),
                          child: ItemOfNotifi());
                },
                childCount: 1,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => AddOneNotify())));
        },
        child: Icon(
          Icons.add,
          size: 30,
        ),
        splashColor: Colors.grey,
        elevation: 1,
        hoverColor: Colors.yellow,
        tooltip: 'Add Notification',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
