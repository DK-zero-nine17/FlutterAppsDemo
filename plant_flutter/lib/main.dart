import 'package:flutter/material.dart';

import 'components/card_bottom_appbar.dart';
import 'components/card_detail_body_header.dart';
import 'components/card_detail_body_scroll.dart';
import 'components/card_detail_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Plant Demo',
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text(
            'Plant Shop',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Color.fromARGB(255, 255, 184, 31),
          centerTitle: true,
          leading: IconButton(
            icon: Image.asset(
              'assets/icons/menu.png',
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            body_header_detail(),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                card_body_scroll(
                  typeTitle: 'Recomended',
                ),
                card_body_scroll(
                  typeTitle: 'Featured Plants',
                ),
                card_body_scroll(
                  typeTitle: 'Featured Plants',
                )
              ]),
            ),
          ]),
        ),
        bottomNavigationBar: MyBottomAppBar(),
      ),
    );
  }
}
