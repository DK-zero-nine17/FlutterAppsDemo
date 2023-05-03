import 'package:flutter/material.dart';

class ZingchatPage extends StatelessWidget {
  const ZingchatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Center(
        child: Text(
          "ZingchatPage",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      )),
    );
  }
}
