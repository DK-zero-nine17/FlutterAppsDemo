import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mp3_zing_2/root.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "App Zing-MP3",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeAnnotatedRegion(),
    );
  }
}

class ChangeAnnotatedRegion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Color.fromARGB(255, 243, 239, 239).withOpacity(.2)),
      child: MainSacffold(),
    );
  }
}
